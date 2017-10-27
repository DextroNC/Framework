// JIP Teleporter Init

_unit = _this select 0;
_jip = _this select 1;

if (_jip) then {
	_unit addAction ["<t color='#FF0000'>JIP Teleporter</t>",fw_fnc_jipTeleport];   
};
 
// =====================================================================================================================================================

// Combat Log
player createDiarySubject ["Combat Log", "Combat Log"];

// Briefing Init
nul = execVM "briefing.sqf";

// =====================================================================================================================================================

// Support System Inits

_isLeader = {(leader player == player)};
_headerSupport = ["7R_Header","Command Support","",{},_isLeader] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions"], _headerSupport] call ace_interact_menu_fnc_addActionToClass;

_SSR = ["7R_StatusRep","Status Report","",{null =  [] spawn fw_fnc_supplyDropReport},_isLeader] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header"], _SSR] call ace_interact_menu_fnc_addActionToClass;

_headerMarker = ["7R_Marker","Marker Designation","",{},_isLeader] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","7R_Header"], _headerMarker] call ace_interact_menu_fnc_addActionToClass;

_RIM = ["7R_REINF","Designate REIN Marker","",{null = ["REINF", "REINF", "ColorBlue", "hd_start", true] spawn fw_fnc_designateMarker},_isLeader] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header", "7R_Marker"], _RIM] call ace_interact_menu_fnc_addActionToClass;
_EZM = ["7R_EZ","Designate Extraction Point","",{null = ["EZ", "EZ", "ColorBlue", "hd_pickup", true] spawn fw_fnc_designateMarker},_isLeader] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header", "7R_Marker"], _EZM] call ace_interact_menu_fnc_addActionToClass;
_SDM = ["7R_SupplyDrop","Mark Supply DZ","",{null = ["SupplyDrop", "Supply DZ", "ColorBlue", "hd_join", false] spawn fw_fnc_designateMarker},_isLeader] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","7R_Header","7R_Marker"], _SDM] call ace_interact_menu_fnc_addActionToClass;
_ATM = ["7R_Artillery","Designate Artillery-Target","",{null = ["ArtilleryTarget", "ORD-T", "ColorRed", "hd_destroy", false, [0.75,0.75]] spawn fw_fnc_designateMarker},_isLeader] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","7R_Header","7R_Marker"], _ATM] call ace_interact_menu_fnc_addActionToClass;

_headerSupply = ["7R_SupplyH","Call Supplies","",{},_isLeader] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","7R_Header"], _headerSupply] call ace_interact_menu_fnc_addActionToClass;

_CVA1 =  ["7R_SupplyDropAir","Call Supply Drop (1 Box)","7R\Supplies\7r_SD.paa",{null = ["SupplyDrop","STARTSPAWN","RHS_C130J","Stallion 5-1", 1, 1] spawn fw_fnc_supplyDropInit},_isLeader] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header", "7R_SupplyH"], _CVA1] call ace_interact_menu_fnc_addActionToClass;

_CVA2 =  ["7R_SupplyDropAir","Call Supply Drop (2 Boxes)","7R\Supplies\7r_SD.paa",{null = ["SupplyDrop","STARTSPAWN","RHS_C130J","Stallion 5-1", 2, 1] spawn fw_fnc_supplyDropInit},_isLeader] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header", "7R_SupplyH"], _CVA2] call ace_interact_menu_fnc_addActionToClass;

_CVA3 =  ["7R_SupplyDropAir","Call Supply Drop (3 Boxes)","7R\Supplies\7r_SD.paa",{null = ["SupplyDrop","STARTSPAWN","RHS_C130J","Stallion 5-1", 3, 1] spawn fw_fnc_supplyDropInit},_isLeader] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header", "7R_SupplyH"], _CVA3] call ace_interact_menu_fnc_addActionToClass;

_CVA4 =  ["7R_SupplyDropAir","Call Vehicle Supply Drop","7R\Supplies\7r_SD.paa",{null = ["SupplyDrop","STARTSPAWN","RHS_C130J","Stallion 5-1", 1, 2] spawn fw_fnc_supplyDropInit},_isLeader] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header", "7R_SupplyH"], _CVA4] call ace_interact_menu_fnc_addActionToClass;

_CVA5 =  ["7R_SupplyDropAir","Call Fortification Supply Drop","7R\Supplies\7r_SD.paa",{null = ["SupplyDrop","STARTSPAWN","RHS_C130J","Stallion 5-1", 1, 3] spawn fw_fnc_supplyDropInit},_isLeader] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header", "7R_SupplyH"], _CVA5] call ace_interact_menu_fnc_addActionToClass;

_CVA6 =  ["7R_SupplyDropAir","Call Special Equipment Supply Drop","7R\Supplies\7r_SD.paa",{null = ["SupplyDrop","STARTSPAWN","RHS_C130J","Stallion 5-1", 1, 4] spawn fw_fnc_supplyDropInit},_isLeader] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header", "7R_SupplyH"], _CVA6] call ace_interact_menu_fnc_addActionToClass;

_EZC = ["7R_EZ","Call Extraction","",{null = ["EZ","STARTSPAWN", "RHS_CH_47F", "Eagle 1-1", 0,"dropoff"] spawn fw_fnc_exfilCall;},_isLeader] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header"], _EZC] call ace_interact_menu_fnc_addActionToClass;

_headerArtillery = ["7R_ArtyH","Call Artillery","",{},_isLeader] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","7R_Header"], _headerArtillery] call ace_interact_menu_fnc_addActionToClass;

_headerArty = ["7R_ArtilleryHeader","Artillery Fire Mission","",{},_isLeader] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header","7R_ArtyH"], _headerArty] call ace_interact_menu_fnc_addActionToClass;

_ACA3 = ["7R_Artillery","3 Rounds","",{null = ["ArtilleryTarget","ModuleOrdnanceMortar_F",3,25,15] spawn fw_fnc_artillery},_isLeader] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header","7R_ArtyH", "7R_ArtilleryHeader"], _ACA3] call ace_interact_menu_fnc_addActionToClass;
_ACA5 = ["7R_Artillery","5 Rounds","",{null = ["ArtilleryTarget","ModuleOrdnanceMortar_F",5,50,15] spawn fw_fnc_artillery},_isLeader] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header","7R_ArtyH", "7R_ArtilleryHeader"], _ACA5] call ace_interact_menu_fnc_addActionToClass;
_ACA7 = ["7R_Artillery","7 Rounds","",{null = ["ArtilleryTarget","ModuleOrdnanceMortar_F",7,75,15] spawn fw_fnc_artillery},_isLeader] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header","7R_ArtyH", "7R_ArtilleryHeader"], _ACA7] call ace_interact_menu_fnc_addActionToClass;

_CSC = {(player getVariable ["SR_Class","Rifleman"]) isEqualTo "Pilot"};
_CSH = ["7R_SD_SpawnH","Sling Load Supply Spawn","",{},_CSC] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","ACE_Equipment"], _CSH] call ace_interact_menu_fnc_addActionToClass;

_CS1 = ["7R_SD_Spawn","Inf Supply Drop","",{nul = [1,slingpad] spawn fw_fnc_cargoSpawn;},_CSC] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","ACE_Equipment","7R_SD_SpawnH"], _CS1] call ace_interact_menu_fnc_addActionToClass;

_CS2 = ["7R_SD_Spawn","Vehicle Supply Drop","",{nul = [2,slingpad] spawn fw_fnc_cargoSpawn;},_CSC] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","ACE_Equipment","7R_SD_SpawnH"], _CS2] call ace_interact_menu_fnc_addActionToClass;

_CS3 = ["7R_SD_Spawn","Fortification Supply Drop","",{nul = [3,slingpad] spawn fw_fnc_cargoSpawn;},_CSC] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","ACE_Equipment","7R_SD_SpawnH"], _CS3] call ace_interact_menu_fnc_addActionToClass;

_CS4 = ["7R_SD_Spawn","Special Supply Drop","",{nul = [4,slingpad] spawn fw_fnc_cargoSpawn;},_CSC] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","ACE_Equipment","7R_SD_SpawnH"], _CS4] call ace_interact_menu_fnc_addActionToClass;