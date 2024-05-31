#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>



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



// declaration the input of Windshield washer
uint8_t Windshield_washer(uint8_t Windshield_washer_switch,
							bool Windshield_washer_switch_failure,
							bool Ignition_Key,
							bool Ignition_Key_failure,
							uint8_t Rain_sensor,
							bool Rain_sensor_failure,
							bool Rain_Sensor_presence
)

{
    

if (Ignition_Key == Ignition_ON )
{
    
//Req_WS_01 - 01
  if (Windshield_washer_switch  == Level_1){ 
      
      Windshield_washer_cmd = Level_1;
   
   
}

//Req_WS_02 - 01

 if (Windshield_washer_switch  == Level_2){ 
      
      Windshield_washer_cmd = Level_2;
   
   
}

//Req_WS_03 - 01

 if (Windshield_washer_switch  == Level_3){ 
      
      Windshield_washer_cmd = Level_3;
   
   
}

//Req_WS_04 - 01

 if (Rain_Sensor_presence == Present && Rain_Sensor_presence == Level_1){ 
      
      Windshield_washer_cmd = Level_1;
   
}

//Req_WS_05 - 01

 if (Rain_Sensor_presence == Present && Rain_Sensor_presence == Level_2){ 
      
      Windshield_washer_cmd = Level_2;
   
}
//Req_WS_06 - 01

 if (Rain_Sensor_presence == Present && Rain_Sensor_presence == Level_3){ 
      
      Windshield_washer_cmd = Level_3;
   
}

//Req_WS_08 - 01

 if ((Rain_Sensor_presence == Present && (Rain_Sensor_presence == Rain_Not_Detected||Rain_sensor_failure  == Present)) || Windshield_washer_switch  == Not_Active){ 
      
      Windshield_washer_cmd = Off;
   
}

}

//Req_WS_07 - 01
else if(Ignition_Key == Ignition_OFF ) {
        Windshield_washer_cmd  = Not_active;
}

//Req_WS_Diag_02 - 01

  if (Windshield_washer_switch_failure   == Present ){ 
      
      Windshield_washer_cmd  = Not_active;
   
   
}
return Windshield_washer_cmd;
}



// declaration the input ofHeadlight washer

uint8_t Headlight_washer(bool Headlight_washer_switch,
bool Headlight_washer_switch_failure,
bool Ignition_Key,
bool Ignition_Key_failure

)

{
    
// declaration the output of Headlight washer

bool Headlight_washer_cmd;


if (Ignition_Key  == Ignition_ON)
{
    
//Req_HL_02 - 01

 if (Headlight_washer_switch  == Active){ 
      
      Headlight_washer_cmd  = On;
   
}
   
   
}

//Req_HL_01 - 01  and Req_WS_Diag_01 - 01

if (Ignition_Key  == Ignition_OFF || Ignition_Key_failure == Present){

      Headlight_washer_cmd  = Off;
}

//Req_WS_Diag_04 - 01

if (Headlight_washer_switch_failure   == Present){

      Headlight_washer_cmd   = Not_active;
}


return  Headlight_washer_cmd;
}