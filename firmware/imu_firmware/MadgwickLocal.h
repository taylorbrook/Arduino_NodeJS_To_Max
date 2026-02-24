//=============================================================================================
// MadgwickLocal.h
//=============================================================================================
//
// Local fork of MadgwickAHRS with public getQuaternion() method.
// Based on Madgwick's IMU and AHRS algorithms.
// See: http://www.x-io.co.uk/open-source-imu-and-ahrs-algorithms/
//
// From the x-io website "Open-source resources available on this website are
// provided under the GNU General Public Licence unless an alternative licence
// is provided in source."
//
// Date			Author          Notes
// 29/09/2011	SOH Madgwick    Initial release
// 02/10/2011	SOH Madgwick	Optimised for reduced CPU load
// 2026-02-24	Local fork      Added getQuaternion() for DTW gesture recognition
//
//=============================================================================================
#ifndef MadgwickLocal_h
#define MadgwickLocal_h
#include <math.h>

//--------------------------------------------------------------------------------------------
// Variable declaration
class MadgwickLocal{
private:
    static float invSqrt(float x);
    float beta;				// algorithm gain
    float q0;
    float q1;
    float q2;
    float q3;	// quaternion of sensor frame relative to auxiliary frame
    float invSampleFreq;
    float roll;
    float pitch;
    float yaw;
    char anglesComputed;
    void computeAngles();

//-------------------------------------------------------------------------------------------
// Function declarations
public:
    MadgwickLocal(void);
    void begin(float sampleFrequency) { invSampleFreq = 1.0f / sampleFrequency; }
    void update(float gx, float gy, float gz, float ax, float ay, float az, float mx, float my, float mz);
    void updateIMU(float gx, float gy, float gz, float ax, float ay, float az);
    float getRoll() {
        if (!anglesComputed) computeAngles();
        return roll * 57.29578f;
    }
    float getPitch() {
        if (!anglesComputed) computeAngles();
        return pitch * 57.29578f;
    }
    float getYaw() {
        if (!anglesComputed) computeAngles();
        return yaw * 57.29578f + 180.0f;
    }
    float getRollRadians() {
        if (!anglesComputed) computeAngles();
        return roll;
    }
    float getPitchRadians() {
        if (!anglesComputed) computeAngles();
        return pitch;
    }
    float getYawRadians() {
        if (!anglesComputed) computeAngles();
        return yaw;
    }
    void getQuaternion(float *w, float *x, float *y, float *z) {
        *w = q0; *x = q1; *y = q2; *z = q3;
    }
};
#endif
