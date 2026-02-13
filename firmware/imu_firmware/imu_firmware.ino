// ============================================================
// IMU Firmware for Arduino Uno WiFi Rev2
// Reads LSM6DS3 via SPI, runs Madgwick fusion, EMA smoothing,
// outputs 9-value CSV over USB serial at 57600 baud.
// Version 1.0
// ============================================================

#include "SparkFunLSM6DS3.h"
#include "SPI.h"
#include <MadgwickAHRS.h>

// ---- Configuration Constants ----
const long BAUD_RATE = 57600;
const int WARMUP_ITERATIONS = 200;    // ~2 seconds at ~100 Hz computation rate
const float SMOOTH_ALPHA = 0.15;      // EMA smoothing coefficient (light smoothing)
const char FIRMWARE_VERSION[] = "1.0";

// ---- Global Objects ----
LSM6DS3 myIMU(SPI_MODE, SPIIMU_SS);   // SPI mode with board chip select
Madgwick filter;

// ---- Smoothing State ----
float smoothPitch = 0;
float smoothRoll = 0;
float smoothYaw = 0;

// ---- Timing State ----
unsigned long lastMicros = 0;
float measuredRate = 80.0;             // Initial estimate, measured during warmup

// ============================================================
// Warmup: measure actual loop rate and let filter converge
// ============================================================
void performWarmup() {
  float ax, ay, az, gx, gy, gz;

  // --- First pass: measure computation rate ---
  unsigned long startTime = micros();

  for (int i = 0; i < WARMUP_ITERATIONS; i++) {
    ax = myIMU.readFloatAccelX();
    ay = myIMU.readFloatAccelY();
    az = myIMU.readFloatAccelZ();
    gx = myIMU.readFloatGyroX();
    gy = myIMU.readFloatGyroY();
    gz = myIMU.readFloatGyroZ();
    filter.updateIMU(gx, gy, gz, ax, ay, az);
  }

  unsigned long elapsed = micros() - startTime;
  measuredRate = (float)WARMUP_ITERATIONS / (elapsed / 1000000.0f);

  // --- Reinitialize filter with measured rate ---
  filter.begin(measuredRate);

  // --- Second pass: converge quaternion at correct rate ---
  for (int i = 0; i < WARMUP_ITERATIONS; i++) {
    ax = myIMU.readFloatAccelX();
    ay = myIMU.readFloatAccelY();
    az = myIMU.readFloatAccelZ();
    gx = myIMU.readFloatGyroX();
    gy = myIMU.readFloatGyroY();
    gz = myIMU.readFloatGyroZ();
    filter.updateIMU(gx, gy, gz, ax, ay, az);
  }

  // --- Initialize smoothing state from converged filter ---
  smoothPitch = filter.getPitch();
  smoothRoll = filter.getRoll();
  smoothYaw = filter.getYaw();
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

  // ---- Warmup: measure rate and converge filter ----
  performWarmup();

  // ---- Print startup header ----
  Serial.print("STARTUP,device=ARUIDO_IMU,version=");
  Serial.print(FIRMWARE_VERSION);
  Serial.print(",rate_hz=");
  Serial.print(measuredRate, 1);
  Serial.println(",format=ax,ay,az,gx,gy,gz,pitch,roll,yaw");

  // ---- Initialize loop timing ----
  lastMicros = micros();
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

  // ---- Output CSV: raw accel, raw gyro, smoothed orientation ----
  // ~63 bytes per line at 2 decimal places
  Serial.print(ax, 2); Serial.print(',');
  Serial.print(ay, 2); Serial.print(',');
  Serial.print(az, 2); Serial.print(',');
  Serial.print(gx, 2); Serial.print(',');
  Serial.print(gy, 2); Serial.print(',');
  Serial.print(gz, 2); Serial.print(',');
  Serial.print(smoothPitch, 2); Serial.print(',');
  Serial.print(smoothRoll, 2); Serial.print(',');
  Serial.println(smoothYaw, 2);

  // ---- Check for incoming reset command ----
  if (Serial.available() && Serial.read() == 'R') {
    performWarmup();
  }
}
