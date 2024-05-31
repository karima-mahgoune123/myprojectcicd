#include <stdint.h>
#include <stdbool.h>

uint8_t Windshield_washer(uint8_t Windshield_washer_switch,
							bool Windshield_washer_switch_failure,
							bool Ignition_Key,
							bool Ignition_Key_failure,
							uint8_t Rain_sensor,
							bool Rain_sensor_failure,
							bool Rain_Sensor_presence
);

uint8_t Headlight_washer(bool Headlight_washer_switch,
bool Headlight_washer_switch_failure,
bool Ignition_Key,
bool Ignition_Key_failure
);

//int maxi(int i1, int i2);