
//Init UPSMON script
call compile preprocessFileLineNumbers "scripts\Init_UPSMON.sqf";

// ASR Radio Distance Adjustment
asr_ai3_main_radiorange = 350; 

// ACE Gear Save Disable
ace_respawn_savePreDeathGear = false;