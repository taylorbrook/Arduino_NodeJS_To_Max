// ============================================================
// IMU Firmware for Arduino Uno WiFi Rev2
// Reads LSM6DS3 via SPI, runs Madgwick fusion, EMA smoothing,
// outputs 9-value CSV over USB serial at 57600 baud.
// Optionally sends same CSV over WiFi UDP if arduino_secrets.h
// exists with valid WiFi credentials.
// Version 1.1
// ============================================================

#include "SparkFunLSM6DS3.h"
#include "SPI.h"
#include "MadgwickLocal.h"

// ---- WiFi Support (optional) ----
// If arduino_secrets.h exists, WiFi UDP is enabled alongside USB serial.
// If not, firmware compiles and runs USB-only with no WiFi overhead.
#if __has_include("arduino_secrets.h")
  #include "arduino_secrets.h"
  #define WIFI_ENABLED
  #include <WiFiNINA.h>
  #include <WiFiUdp.h>
#else
  #define SECRET_SSID ""
  #define SECRET_PASS ""
#endif

// ---- Configuration Constants ----
const long BAUD_RATE = 57600;
const int WARMUP_ITERATIONS = 200;    // iterations for filter convergence
const int RATE_MEASURE_ITERATIONS = 50; // iterations to measure actual loop rate
const float SMOOTH_ALPHA = 0.15;      // EMA smoothing coefficient (light smoothing)
const float INITIAL_RATE_ESTIMATE = 80.0; // conservative estimate for warmup
const char FIRMWARE_VERSION[] = "1.1";

// ---- Global Objects ----
LSM6DS3 myIMU(SPI_MODE, SPIIMU_SS);   // SPI mode with board chip select
MadgwickLocal filter;

#ifdef WIFI_ENABLED
// ---- WiFi Configuration ----
// NOTE: SPI bus contention -- the LSM6DS3 IMU and NINA WiFi module both use SPI.
// Since the ATmega4809 is single-threaded and calls are sequential
// (IMU read -> Serial print -> UDP send), there is no bus contention.
// The Arduino SPI library manages chip selects via beginTransaction/endTransaction.
// This is a validated assumption for sequential (non-interrupt-driven) SPI access.
const int UDP_PORT = 8888;
IPAddress staticIP(192, 168, 1, 50);
IPAddress destIP(192, 168, 1, 100);
const int DEST_PORT = 8889;

WiFiUDP udp;
bool wifiConnected = false;
char csvBuffer[160];
#endif

// ---- Smoothing State ----
float smoothPitch = 0;
float smoothRoll = 0;
float smoothYaw = 0;

// ---- Timing State ----
unsigned long lastMicros = 0;
float measuredRate = 80.0;             // Updated after live measurement
bool rateMeasured = false;             // Has the live rate been measured?
int loopCount = 0;                     // Counter for rate measurement
unsigned long measureStartMicros = 0;  // Start time for rate measurement

// ============================================================
// WiFi Setup (called once from setup(), blocking)
// WiFi.begin() blocks for up to 10 seconds. This happens once
// at boot, before the main loop starts, so it has zero impact
// on the 114 Hz USB serial data rate.
// ============================================================
#ifdef WIFI_ENABLED
void setupWiFi() {
  WiFi.config(staticIP);
  int status = WiFi.begin(SECRET_SSID, SECRET_PASS);
  if (status == WL_CONNECTED) {
    WiFi.noLowPowerMode();  // Reduces UDP latency from 20ms to 3-5ms
    udp.begin(UDP_PORT);
    wifiConnected = true;
    Serial.println("STARTUP,wifi=connected");
  } else {
    Serial.println("STARTUP,wifi=failed");
  }
}
#endif

// ============================================================
// Warmup: converge filter at estimated rate
// ============================================================
void performWarmup() {
  float ax, ay, az, gx, gy, gz;

  // Initialize filter with conservative rate estimate
  filter.begin(INITIAL_RATE_ESTIMATE);

  // Converge quaternion at estimated rate
  for (int i = 0; i < WARMUP_ITERATIONS; i++) {
    ax = myIMU.readFloatAccelX();
    ay = myIMU.readFloatAccelY();
    az = myIMU.readFloatAccelZ();
    gx = myIMU.readFloatGyroX();
    gy = myIMU.readFloatGyroY();
    gz = myIMU.readFloatGyroZ();
    filter.updateIMU(gx, gy, gz, ax, ay, az);
  }

  // Initialize smoothing state from converged filter
  smoothPitch = filter.getPitch();
  smoothRoll = filter.getRoll();
  smoothYaw = filter.getYaw();

  // Reset rate measurement state
  rateMeasured = false;
  loopCount = 0;
  measureStartMicros = 0;
}

// ============================================================
// Setup
// ============================================================
void setup() {
  Serial.begin(BAUD_RATE);
  while (!Serial);  // Wait for USB serial connection

  pinMode(LED_BUILTIN, OUTPUT);

  // ---- Configure IMU settings BEFORE begin() ----
  myIMU.settings.gyroEnabled = 1;
  myIMU.settings.gyroRange = 2000;        // Max: +/-2000 dps (avoid clipping)
  myIMU.settings.gyroSampleRate = 416;    // Hz (faster than loop = always fresh data)
  myIMU.settings.gyroBandWidth = 100;     // Hz anti-alias filter
  myIMU.settings.accelEnabled = 1;
  myIMU.settings.accelRange = 16;         // Max: +/-16g (avoid clipping)
  myIMU.settings.accelSampleRate = 416;   // Hz (match gyro)
  myIMU.settings.accelBandWidth = 100;    // Hz anti-alias filter

  // ---- Initialize IMU ----
  if (myIMU.begin() != 0) {
    Serial.println("ERROR:IMU_INIT_FAILED");
    while (1) {
      digitalWrite(LED_BUILTIN, !digitalRead(LED_BUILTIN));
      delay(500);
    }
  }

  // ---- Initialize WiFi (blocking, before main loop) ----
#ifdef WIFI_ENABLED
  setupWiFi();
#endif

  // ---- Warmup: converge filter at estimated rate ----
  performWarmup();

  // ---- Initialize loop timing ----
  lastMicros = micros();
}

// ============================================================
// Print startup header (called after live rate is measured)
// ============================================================
void printStartup() {
  Serial.print("STARTUP,device=ARUIDO_IMU,version=");
  Serial.print(FIRMWARE_VERSION);
  Serial.print(",rate_hz=");
  Serial.print(measuredRate, 1);
#ifdef WIFI_ENABLED
  Serial.print(",wifi=");
  Serial.print(wifiConnected ? "connected" : "failed");
#endif
  Serial.println(",format=ax,ay,az,gx,gy,gz,pitch,roll,yaw,qw,qx,qy,qz");
}

// ============================================================
// Main Loop
// ============================================================
void loop() {
  // ---- Read raw sensor data ----
  float ax = myIMU.readFloatAccelX();   // in g
  float ay = myIMU.readFloatAccelY();
  float az = myIMU.readFloatAccelZ();
  float gx = myIMU.readFloatGyroX();    // in degrees/sec
  float gy = myIMU.readFloatGyroY();
  float gz = myIMU.readFloatGyroZ();

  // ---- Update Madgwick filter ----
  // Library converts dps to rad/s internally
  filter.updateIMU(gx, gy, gz, ax, ay, az);

  // ---- Get orientation from filter ----
  float pitch = filter.getPitch();
  float roll = filter.getRoll();
  float yaw = filter.getYaw();

  // ---- Apply EMA smoothing to orientation only ----
  // Standard EMA for pitch and roll
  smoothPitch = SMOOTH_ALPHA * pitch + (1.0 - SMOOTH_ALPHA) * smoothPitch;
  smoothRoll = SMOOTH_ALPHA * roll + (1.0 - SMOOTH_ALPHA) * smoothRoll;

  // Angle-aware EMA for yaw (handles 360/0 boundary wrapping)
  float yawDiff = yaw - smoothYaw;
  if (yawDiff > 180.0) yawDiff -= 360.0;
  if (yawDiff < -180.0) yawDiff += 360.0;
  smoothYaw += SMOOTH_ALPHA * yawDiff;
  if (smoothYaw < 0) smoothYaw += 360.0;
  if (smoothYaw >= 360.0) smoothYaw -= 360.0;

  // ---- Extract quaternion from filter ----
  float qw, qx, qy, qz;
  filter.getQuaternion(&qw, &qx, &qy, &qz);

  // ---- Output CSV: raw accel, raw gyro, smoothed orientation, quaternion ----
  // 13 fields: ax,ay,az,gx,gy,gz,pitch,roll,yaw,qw,qx,qy,qz
  Serial.print(ax, 2); Serial.print(',');
  Serial.print(ay, 2); Serial.print(',');
  Serial.print(az, 2); Serial.print(',');
  Serial.print(gx, 2); Serial.print(',');
  Serial.print(gy, 2); Serial.print(',');
  Serial.print(gz, 2); Serial.print(',');
  Serial.print(smoothPitch, 2); Serial.print(',');
  Serial.print(smoothRoll, 2); Serial.print(',');
  Serial.print(smoothYaw, 2); Serial.print(',');
  Serial.print(qw, 4); Serial.print(',');
  Serial.print(qx, 4); Serial.print(',');
  Serial.print(qy, 4); Serial.print(',');
  Serial.println(qz, 4);

  // ---- Send same CSV over WiFi UDP (additive, does not affect USB serial) ----
#ifdef WIFI_ENABLED
  if (wifiConnected) {
    int len = snprintf(csvBuffer, sizeof(csvBuffer),
      "%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.2f,%.4f,%.4f,%.4f,%.4f",
      ax, ay, az, gx, gy, gz, smoothPitch, smoothRoll, smoothYaw, qw, qx, qy, qz);
    udp.beginPacket(destIP, DEST_PORT);
    udp.write((uint8_t*)csvBuffer, len);
    udp.endPacket();
  }
#endif

  // ---- Measure actual loop rate from live loop (includes serial output) ----
  if (!rateMeasured) {
    if (loopCount == 0) {
      measureStartMicros = micros();
    }
    loopCount++;
    if (loopCount >= RATE_MEASURE_ITERATIONS) {
      unsigned long elapsed = micros() - measureStartMicros;
      measuredRate = (float)RATE_MEASURE_ITERATIONS / (elapsed / 1000000.0f);
      filter.begin(measuredRate);  // Reinitialize filter with accurate rate
      rateMeasured = true;
      printStartup();
    }
  }

  // ---- Check for incoming reset command ----
  if (Serial.available() && Serial.read() == 'R') {
    performWarmup();
  }
}
