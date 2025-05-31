// Parameter Init
params ["_newUnit","_oldUnit"];

// Transfer Class
private _class = _oldUnit getVariable ["SR_Class","R"];
_newUnit setVariable ["SR_Class", _class, true];

// Transfer Loadout
private _loadout = _oldUnit getVariable ["SR_Loadout",[]];
_newUnit setUnitLoadout _loadout;

// Transfer Night Adjustment
if (SR_Night) then {
	switch (_class) do {
	    case "Sniper": {};
		case "Spotter": {};
		default {_newUnit setUnitTrait ["camouflageCoef",SR_Camo_Coef];};
	};
};

// Height Adjustment for Carrier (check height in editor with: hint format ["%1", getPosASL player]. The third value in the array is the height. Change the height accordingly.)
if (SR_Spawn_Height > 0) then {
	private _currentPos = getPosASL _newUnit;
	_newUnit setPosASL [_currentPos select 0, _currentPos select 1, SR_Spawn_Height];
	["","Height Adjusted"] spawn sr_support_fnc_infoMessage;
};

// End Spectator
[false] call acre_api_fnc_setSpectator;
["Terminate"] call BIS_fnc_EGSpectator;
["ace_common_hideObjectGlobal", [_newUnit,false]] call CBA_fnc_serverEvent;

// Reset FTL Rank
 if (count (_oldUnit getVariable ["ACE_FTL",""]) > 0) then {
	 _newUnit setUnitRank "PRIVATE";
 };
 
// Combat Log Entry
if (!isNull _oldUnit) then {
	_str = (name _newUnit) + " has rejoined the Action.";
	["CombatLog", ["REINF", _str]] call CBA_fnc_globalEvent; 
};

// Check Wave Condition and send wave spawn message
private _pilot = (_newUnit getVariable ["SR_Class","Rifleman"]) isEqualTo "Pilot";
private _hasDied = _oldUnit getVariable ["SR_HasDied",false];
if ((!SR_RespawnLock && !_pilot) && _hasDied) then {
	SR_SpawnCount = SR_SpawnCount + 1;
	publicVariable "SR_SpawnCount";
};
