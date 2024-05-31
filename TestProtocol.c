#include <CUnit/CUnit.h>
#include <CUnit/Basic.h>
#include "SWC.h"
#include <stdint.h>
#include <stdbool.h>



/* function definition 
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

// declaration of values
uint8_t Windshield_washer_cmd;
uint8_t Level_1 = 1;
uint8_t Level_2 = 2 ;
uint8_t Level_3 = 3;
uint8_t Off = 0;
uint8_t On = 1;
uint8_t Ignition_ON = 1;
uint8_t Ignition_OFF = 0;
uint8_t Present = 1;
uint8_t Absent = 0;
uint8_t Rain_Not_Detected = 0;
uint8_t Not_Active = 0;
uint8_t Active = 1;
uint8_t Not_active =0;
*/

// Creat test function here

void test_case_1(void)
{
    CU_ASSERT(Windshield_washer(1, 0, 1, 0, 0, 0, 1) == 1);

}

void test_case_2(void)
{
    CU_ASSERT(Headlight_washer(1, 0, 1, 0) == 1);

}

int main() {
    CU_initialize_registry();
    CU_pSuite suite = CU_add_suite("WiperWasher Test Protocol", 0, 0);
	
	
//  add test case here 
    CU_add_test(suite, "Test1", test_case_1);
    CU_add_test(suite, "Test2", test_case_2);
	
    CU_basic_set_mode(CU_BRM_VERBOSE);
    CU_basic_run_tests();
    CU_cleanup_registry();

    return 0;
}