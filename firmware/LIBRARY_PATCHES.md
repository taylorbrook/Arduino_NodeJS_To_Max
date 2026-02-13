# Arduino Library Patches

Required patches to third-party Arduino libraries for the Arduino Uno WiFi Rev2.

## SparkFun LSM6DS3 Breakout v1.0.3

Library path: `~/Documents/Arduino/libraries/SparkFun_LSM6DS3_Breakout/`

File: `src/SparkFunLSM6DS3.cpp`

### Patch 1: MSB_FIRST -> MSBFIRST (Plan 01-01)

The library uses `MSB_FIRST` which is not defined on megaAVR boards. Change all
3 occurrences to `MSBFIRST`.

### Patch 2: SPI_MODE1 -> SPI_MODE3 for AVR (Plan 01-02)

Line ~78: The `__AVR__` SPI settings use `SPI_MODE1`, but the LSM6DS3 datasheet
specifies MODE0 or MODE3. MODE1 causes all-zero reads on the ATmega4809.

```diff
-    mySpiSettings = SPISettings(spiPortSpeed, MSBFIRST, SPI_MODE1);
+    mySpiSettings = SPISettings(spiPortSpeed, MSBFIRST, SPI_MODE3);
```

### Patch 3: Add missing SPI.beginTransaction/endTransaction (Plan 01-02)

The library's `writeRegister()` calls `SPI.beginTransaction()` but never calls
`SPI.endTransaction()`, leaving the SPI peripheral stuck in the wrong mode.
Additionally, `readRegister()` and `readRegisterRegion()` never call
`beginTransaction/endTransaction` at all, making them dependent on whatever SPI
state was last set.

Fix: Add `SPI.beginTransaction(mySpiSettings)` and `SPI.endTransaction()` to all
three SPI functions: `readRegisterRegion()`, `readRegister()`, and `writeRegister()`.

#### readRegisterRegion (around line 163):
```diff
 	case SPI_MODE:
-		digitalWrite(chipSelectPin, LOW);
+		SPI.beginTransaction(mySpiSettings);
+		digitalWrite(chipSelectPin, LOW);
 		SPI.transfer(offset | 0x80);
 		...
 		digitalWrite(chipSelectPin, HIGH);
+		SPI.endTransaction();
 		break;
```

#### readRegister (around line 227):
```diff
 	case SPI_MODE:
-		digitalWrite(chipSelectPin, LOW);
+		SPI.beginTransaction(mySpiSettings);
+		digitalWrite(chipSelectPin, LOW);
 		SPI.transfer(offset | 0x80);
 		result = SPI.transfer(0x00);
 		digitalWrite(chipSelectPin, HIGH);
+		SPI.endTransaction();
```

#### writeRegister (around line 294):
```diff
 		SPI.beginTransaction(mySpiSettings);
 		...
 		digitalWrite(chipSelectPin, HIGH);
+		SPI.endTransaction();
 		break;
```
