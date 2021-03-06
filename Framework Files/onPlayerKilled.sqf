// Parameter Init
params ["_unit"];
private _timeOfDeath = CBA_MissionTime;

// Set Max Respawn Time
if (SR_RespawnLock) then {
	// When locked block respawn
	setPlayerRespawnTime 9999;
} else {
	// When open set max individual respawn time
	setPlayerRespawnTime SR_Respawn_Max;
};

// Pilot excemption to bypass Queue
private _pilot = (_unit getVariable ["SR_Class","Rifleman"]) isEqualTo "Pilot";
if (_pilot && !SR_RespawnLock) then {
	setPlayerRespawnTime 3;
};
	
// Start Spectator
[true] call acre_api_fnc_setSpectator;
["Initialize", [player, [], false,false]] call BIS_fnc_EGSpectator;

// Log Entry
private _nameDead = name _unit;
private _nameGroup = groupId (group _unit);
private _nameKiller = str (_unit getVariable ["ace_medical_lastDamageSource", "unknown"]);
private _entry = "<br/>" + _nameDead + " [" +  _nameGroup + "] has been killed in action by +"  + _nameKiller + ".";
["CombatLog", ["KIA", _entry]] call CBA_fnc_globalEvent; 

// Debrief Entry
SR_KIA = SR_KIA + "<br/>" + _nameDead + " [" + _nameGroup + "]" ;
publicVariable "SR_KIA";

// Check Wave Condition and exec Wave
private _deathCount = ({isPlayer _x} count allDeadMen);
if ((!SR_RespawnLock && _deathCount >= SR_Wave_Size) || (!SR_RespawnLock && _pilot)) then {
	"Reinforcements Wave Started" remoteExec ["systemChat", 0];
	// Start Wave
	SR_RespawnWave = true;
	publicVariable "SR_RespawnWave";
	// Reset Wave
	[{
		SR_RespawnWave = false; 
		publicVariable "SR_RespawnWave"; 
		"Reinforcements Wave Ended" remoteExec ["systemChat", 0];
	}, [], 60] call CBA_fnc_waitAndExecute;
};

// Execute when respawn wave present
while {CBA_MissionTime - _timeOfDeath < playerRespawnTime} do {
	if (SR_RespawnWave || SR_RespawnForce) then {
		setPlayerRespawnTime 3;
	};
};