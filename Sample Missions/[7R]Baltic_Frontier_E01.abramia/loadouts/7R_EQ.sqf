/*
	Parameters:
		<-- Unit as Object
		<-- Item Classname as String
		
	Description:
		Equipment Adjustment 
		
	Execution over addAction (therefor Parameters are different)

*/
// Paramter Init
private _unit = (_this select 1);
private _type = (_this select 3) select 0;
_group = group _unit;

// Local only execute
if( !local _unit ) exitWith {};

// Switch-Do-Loop (Default Weapon Sight)
switch (_type) do {
    case "ACRE_PRC343": {_unit addItem _type;};
    case "ACRE_PRC152": {
        if (({_type in items _x}count (units _group)) < 2 || groupId _group in ["PL","P","P-1","P-2"]) then {
			_unit addItem _type;
		} else {
			"Radio PRC152 limit reached!" remoteExec ["hint", _group]; 
		};
    };
    case "ACRE_PRC148": {
        if (({_type in items _x}count (units _group)) < 2 || groupId _group in ["PL","P","P-1","P-2"]) then {
			_unit addItem _type;
		} else {
			"Radio PRC152 limit reached!" remoteExec ["hint", _group]; 
		};
    };
    case "ACRE_PRC117F": {_unit addItem _type;};
    case "rhsusf_ANPVS_14": {_unit linkItem _type;};
    case "rhsusf_ANPVS_15": {_unit linkItem _type;};
    case "rhs_1PN138": {_unit linkItem _type;};
    case "B_Parachute": {_unit addBackpack _type;};
    case "ACE_key_lockpick": {_unit addItem _type;};
    case "Laserdesignator": {_unit addWeapon "UK3CB_BAF_Soflam_Laserdesignator"; _unit addItem "Laserbatteries";};
    case "ACE_Vector": {_unit addWeapon _type;};
    case "Binocular": {_unit addWeapon _type;};
    case "B_UavTerminal": {_unit linkItem _type;};
    case "O_UavTerminal": {_unit linkItem _type;};
    case "ItemGPS": {_unit linkItem _type;};
    case "ACE_EntrenchingTool": {
		if (({"ACE_EntrenchingTool" in items _x}count (units _group)) < 2 || groupId _group in ["PL","P","P-1","P-2"]) then {
			_unit addItem "ACE_EntrenchingTool";
		} else {
			"Entrenching Tool limit reached!" remoteExec ["hint", _group]; 
		};
	};
    default {_unit addPrimaryWeaponItem _type;};
};

// Save Loadout (not when Parachute)
if (_type isEqualTo "B_Parachute") exitWith {};
_unit setVariable ["SR_Loadout",getUnitLoadout _unit];
