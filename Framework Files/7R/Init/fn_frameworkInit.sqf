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
SR_ReleaseProbability = 0.33;
SR_SuspicionValue = 0;
SR_SuspicionSpotted = -60;
ArtilleryCallAmmo = 60;
ArtilleryFireMissionReady = 0;
ExfilReady = 0;
ReifLock = false;
SR_RespawnWave = false;
SR_RespawnForce = false;
SR_RespawnLock = false;
phase = 0;
