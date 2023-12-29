/*

	Parameters:
		<-- none
	
	Description:
		System Init, both static variables and EventHandlers as preInit
*/

// Global Variable Init
SR_Side = west;
AI_ART_Units = [];
if (isServer) then {
	SR_CC = "Civilian Casulties:";
	publicVariable "SR_CC";
	SR_KIA = "Those we lost in battle: ";
	publicVariable "SR_KIA";
	SR_WC = "Alleged War Criminals:";
	publicVariable "SR_WC";
	SR_FF = "Friendly Fire:";
	publicVariable "SR_FF";
};
SR_InstigatorDistance = 20;
SR_ReleaseDistance = 50;
SR_MaxRatio = 0.67;
SR_ReleaseProb = 0.4;
SR_SuspicionValue = 0;
SR_SuspicionSpotted = -60;
ArtilleryCallAmmo = 60;
ArtilleryFireMissionReady = 0;
CASCallAmmo = 30;
CASFireMissionLock = false;
UAVCallAmmo = 5;
UAVFireMissionLock = false;
ExfilReady = 0;
ReifLock = false;
SR_RespawnWave = false;
SR_RespawnForce = false;
SR_RespawnLock = false;
phase = 0;

SR_lockBlacklist = [ 
	"Land_Ammostore2", 
	"Land_Garaz_s_tankem", 
	"Land_Garaz_bez_tanku", 
	"Land_Cargo_House_V4_F", 
	"Land_Cargo_Tower_V1_F", 
	"Land_Cargo_HQ_V4_F", 
	"Land_Cargo_Tower_V1_No4_F", 
	"Land_Cargo_Tower_V1_No5_F", 
	"Land_Cargo_Tower_V1_No7_F", 
	"Land_Cargo_Tower_V4_F", 
	"Land_Cargo_Tower_V1_No2_F", 
	"Land_Cargo_Tower_V2_F", 
	"Land_Cargo_Tower_V3_F", 
	"Land_Cargo_Tower_V1_No1_F", 
	"Land_Cargo_Tower_V1_No3_F", 
	"Land_Cargo_HQ_V2_F", 
	"Land_Medevac_HQ_V1_F", 
	"Land_Cargo_HQ_V1_F", 
	"Land_Cargo_House_V2_F", 
	"Land_Medevac_house_V1_F", 
	"Land_Cargo_Tower_V1_No6_F", 
	"Land_Cargo_House_V1_F", 
	"Land_Cargo_HQ_V3_F", 
	"Land_Cargo_House_V3_F" 
];
