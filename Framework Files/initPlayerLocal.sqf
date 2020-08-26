// JIP Teleporter Init

if (_this select 1) then {
	(_this select 0) addAction ["<t color='#FF0000'>JIP Teleporter</t>",fw_fnc_jipTeleport,nil,0,false,true,"","(_target distance2D (markerPos 'respawn_west') < 75)"];   
};
 
// =====================================================================================================================================================

// Briefing Init
nul = execVM "briefing.sqf";

// =====================================================================================================================================================

// Support System Inits
_headerSupport = ["7R_Header","Command Support","a3\ui_f\data\IGUI\Cfg\simpleTasks\types\radio_ca.paa",{},{[_player] call fw_fnc_isLeader}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions"], _headerSupport] call ace_interact_menu_fnc_addActionToClass;

// Header Vehicle
_conditionsVehicle  = {count nearestObjects [vehicle _player,["SR_SupplyPadEmpty","SR_SupplyPad"],15,true] > 0 && vehicle _player != _player && isTouchingGround (vehicle _player) && driver vehicle _player == _player};
_headerSupport = ["7R_VehicleHeader","Vehicle","a3\ui_f\data\IGUI\Cfg\simpleTasks\types\car_ca.paa",{},_conditionsVehicle] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions"], _headerSupport] call ace_interact_menu_fnc_addActionToClass;


// Support Status Report
_SSR = ["7R_StatusRep","Status Report","a3\ui_f\data\IGUI\Cfg\simpleTasks\types\talk_ca.paa",{null =  [] spawn fw_fnc_supplyDropReport},{[_player] call fw_fnc_isLeader}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header"], _SSR] call ace_interact_menu_fnc_addActionToClass;

// Markers
_headerMarker = ["7R_Marker","Marker Designation","a3\ui_f\data\IGUI\Cfg\simpleTasks\types\map_ca.paa",{},{[_player] call fw_fnc_isLeader}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","7R_Header"], _headerMarker] call ace_interact_menu_fnc_addActionToClass;

_RIM = ["7R_REINF","Designate REIN Marker","",{null = ["REINF", "REINF", "ColorBlue", "hd_start", true] spawn fw_fnc_designateMarker},{[_player] call fw_fnc_isLeader}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header", "7R_Marker"], _RIM] call ace_interact_menu_fnc_addActionToClass;
_EZM = ["7R_EZ","Designate Extraction Point","",{null = ["EZ", "EZ", "ColorBlue", "hd_pickup", true] spawn fw_fnc_designateMarker},{[_player] call fw_fnc_isLeader}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header", "7R_Marker"], _EZM] call ace_interact_menu_fnc_addActionToClass;
_SDM = ["7R_SupplyDrop","Mark Supply DZ","",{null = ["SupplyDrop", "Supply DZ", "ColorBlue", "hd_join", false] spawn fw_fnc_designateMarker},{[_player] call fw_fnc_isLeader}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","7R_Header","7R_Marker"], _SDM] call ace_interact_menu_fnc_addActionToClass;

_ATM = ["7R_Artillery","Designate Artillery-Target","",{null = ["ArtilleryTarget", "ORD-T", "ColorRed", "hd_destroy", false, [0.7,0.7]] spawn fw_fnc_designateMarker},{[_player] call fw_fnc_isLeader}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","7R_Header","7R_Marker"], _ATM] call ace_interact_menu_fnc_addActionToClass;

_CTM = ["7R_Artillery","Designate CAS-Target","",{null = ["CASTarget", "CAS-T", "ColorRed", "hd_destroy", false, [0.7,0.7]] spawn fw_fnc_designateMarker},{[_player] call fw_fnc_isLeader}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","7R_Header","7R_Marker"], _CTM] call ace_interact_menu_fnc_addActionToClass;

// Supply Drop
_headerSupply = ["7R_SupplyH","Call Supplies","a3\ui_f\data\IGUI\Cfg\simpleTasks\types\box_ca.paa",{},{[_player] call fw_fnc_isLeader},{[target, _player, _params] call fw_fnc_supplyDropAction;}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","7R_Header"], _headerSupply] call ace_interact_menu_fnc_addActionToClass;


// Extraction
_EZC = ["7R_EZ","Call Extraction","a3\ui_f\data\IGUI\Cfg\simpleTasks\types\heli_ca.paa",{null = ["EZ","STARTSPAWN", "RHS_CH_47F", "Eagle 1-1", 0,"dropoff"] spawn fw_fnc_exfilCall;},{[_player] call fw_fnc_isLeader}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header"], _EZC] call ace_interact_menu_fnc_addActionToClass;

// Vehicle Drop
_CHH =  ["7R_VehicleDropHeader","Vehicle Drop","a3\ui_f\data\IGUI\Cfg\simpleTasks\types\car_ca.paa",{null =  [] spawn fw_fnc_supplyDropReport},{[_player] call fw_fnc_canCallVehicleDrop},{[_target, _player, []] call fw_fnc_vehicleDropAction}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header"], _CHH] call ace_interact_menu_fnc_addActionToClass;

// Artillery
_headerArtillery = ["7R_ArtyH","Call Fire Support","a3\ui_f\data\IGUI\Cfg\simpleTasks\types\destroy_ca.paa",{},{[_player] call fw_fnc_isLeader}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","7R_Header"], _headerArtillery] call ace_interact_menu_fnc_addActionToClass;

_headerArty = ["7R_ArtilleryHeader","Artillery Fire Mission","",{},{[_player] call fw_fnc_isLeader}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header","7R_ArtyH"], _headerArty] call ace_interact_menu_fnc_addActionToClass;

_ACA3 = ["7R_Artillery","Adjust by Fire (1)","",{null = ["ArtilleryTarget","spotting"] spawn fw_fnc_artillery},{[_player] call fw_fnc_isLeader}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header","7R_ArtyH", "7R_ArtilleryHeader"], _ACA3] call ace_interact_menu_fnc_addActionToClass;
_ACA5 = ["7R_Artillery","Medium Barrage (2)","",{null = ["ArtilleryTarget","medium"] spawn fw_fnc_artillery},{[_player] call fw_fnc_isLeader}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header","7R_ArtyH", "7R_ArtilleryHeader"], _ACA5] call ace_interact_menu_fnc_addActionToClass;
_ACA7 = ["7R_Artillery","Heavy Area Barrage (4)","",{null = ["ArtilleryTarget","area"] spawn fw_fnc_artillery},{[_player] call fw_fnc_isLeader}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header","7R_ArtyH", "7R_ArtilleryHeader"], _ACA7] call ace_interact_menu_fnc_addActionToClass;
_ACA6 = ["7R_Artillery","Concentrated Barrage (3)","",{null = ["ArtilleryTarget","concentrated"] spawn fw_fnc_artillery},{[_player] call fw_fnc_isLeader}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header","7R_ArtyH", "7R_ArtilleryHeader"], _ACA6] call ace_interact_menu_fnc_addActionToClass;
_ACA8 = ["7R_Artillery","Cluster Barrage (3)","",{null = ["ArtilleryTarget","cluster"] spawn fw_fnc_artillery},{[_player] call fw_fnc_isLeader}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header","7R_ArtyH", "7R_ArtilleryHeader"], _ACA8] call ace_interact_menu_fnc_addActionToClass;
_ACAS = ["7R_Artillery","Smoke Barrage (0)","",{null = ["ArtilleryTarget","smoke"] spawn fw_fnc_artillery},{[_player] call fw_fnc_isLeader}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header","7R_ArtyH", "7R_ArtilleryHeader"], _ACAS] call ace_interact_menu_fnc_addActionToClass;
_ACAF = ["7R_Artillery","Flare Barrage (0)","",{null = ["ArtilleryTarget","flare"] spawn fw_fnc_artillery},{[_player] call fw_fnc_isLeader}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header","7R_ArtyH", "7R_ArtilleryHeader"], _ACAF] call ace_interact_menu_fnc_addActionToClass;

// CAS
_CAS1 = ["7R_CAS","Call CAS","",{["CASTarget",3,"B_Plane_Fighter_01_F",0,"STARTSPAWN"] remoteExec ["fw_fnc_CAS",0];},{[_player] call fw_fnc_isLeader}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header","7R_ArtyH"], _CAS1] call ace_interact_menu_fnc_addActionToClass;

// Pilot Recall
_CRC = {(player getVariable ["SR_Class","Rifleman"]) in ["Pilot","TC"] && (vehicle player == player)};
_rec = ["7R_SD_SpawnH","Base Recall","a3\ui_f\data\IGUI\Cfg\simpleTasks\types\exit_ca.paa",{nul = [_player,_player] spawn fw_fnc_recall;},_CRC] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","ACE_TeamManagement"], _rec] call ace_interact_menu_fnc_addActionToClass;

// Pilot Supply Spawn
_CSC = {(player getVariable ["SR_Class","Rifleman"]) isEqualTo "Pilot"};
_CSH = ["7R_SD_SpawnH","Sling Load Supply Spawn","a3\ui_f\data\IGUI\Cfg\simpleTasks\types\container_ca.paa",{},_CSC,{[target, _player, _params] call fw_fnc_supplySlingAction;}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","ACE_Equipment"], _CSH] call ace_interact_menu_fnc_addActionToClass;

// Load Supply Spawn
_SLD = ["7R_SD_Load","Load Supplies","a3\ui_f\data\IGUI\Cfg\simpleTasks\types\truck_ca.paa",{},_conditionsVehicle,{[target, _player, _params] call fw_fnc_supplySpawnAction;}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","7R_VehicleHeader"], _SLD] call ace_interact_menu_fnc_addActionToClass;

// Repair
_REP = ["7R_SD_Load","Repair Vehicle","a3\ui_f\data\IGUI\Cfg\simpleTasks\types\repair_ca.paa",{nul = [vehicle _player, _player] spawn fw_fnc_repair;},_conditionsVehicle] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","7R_VehicleHeader"], _REP] call ace_interact_menu_fnc_addActionToClass;

// Undercover
_uc1 = ["7R_UC","Go Undercover","a3\ui_f\data\IGUI\Cfg\simpleTasks\types\scout_ca.paa",{nul = [_player] spawn fw_fnc_goUndercover;},{(CBA_MissionTime - SR_SuspicionSpotted > 60) && _player getVariable ["SR_Class","R"] isEqualto "UC" && !(_player getVariable ["SR_UC",false])}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions"], _uc1] call ace_interact_menu_fnc_addActionToClass;

_uc2 = ["7R_UC","Exit Undercover","a3\ui_f\data\IGUI\Cfg\simpleTasks\types\rifle_ca.paa",{nul = [_player] spawn fw_fnc_exitUndercover;},{_player getVariable ["SR_UC",false]}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions"], _uc2] call ace_interact_menu_fnc_addActionToClass;


// Hacking
SR_Hack_Area = [];
if (count SR_Hack_Area != 0) then {
	_hackC = {({position player inArea _x} count SR_Hack_Area) > 0 && "ARP_Objects_Laptop_M" in items player};
	_hack = ["7R_Hack","Start Hack","a3\ui_f\data\IGUI\Cfg\simpleTasks\types\intel_ca.paa",{[SR_Hack_Area,player] spawn fw_fnc_hackingAction},_hackC] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions","ACE_Equipment"], _hack] call ace_interact_menu_fnc_addActionToClass;
};

// NVG Adjustments (DO NOT TOUCH)
ace_nightvision_fogScaling = 0.5;
ace_nightvision_effectScaling = 0.5;