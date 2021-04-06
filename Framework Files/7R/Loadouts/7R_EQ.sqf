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

// Local only execute
if(!local _unit) exitWith {};

if (_type == "B_Parachute") exitWith {
  _unit addBackpack _type;
};

if (!(_unit canAdd _type)) exitWith {
  ["","Not enough space"] spawn fw_fnc_info;
};

// Switch-Do-Loop (Default Weapon Sight)
switch (_type) do {
    case "ACRE_PRC343": {_unit addItem _type;};
    case "ACRE_PRC152": {
      [_unit,_type,3] spawn fw_fnc_conditionEquipment;
    };
    case "ACRE_PRC148": {
      [_unit,_type,3] spawn fw_fnc_conditionEquipment;
    };
    case "ACRE_PRC117F": {
      [_unit,_type,3] spawn fw_fnc_conditionEquipment;
    };
    case "rhsusf_ANPVS_14": {_unit linkItem _type;};
    case "rhsusf_ANPVS_15": {_unit linkItem _type;};
    case "rhs_1PN138": {_unit linkItem _type;};
    case "ACE_key_lockpick": {_unit addItem _type;};
    case "ACE_wirecutter": {_unit addItem _type;};
    case "Laserdesignator": {_unit addWeapon "UK3CB_BAF_Soflam_Laserdesignator"; _unit addItem "Laserbatteries";};
    case "ACE_Vector": {_unit addWeapon _type;};
    case "Binocular": {_unit addWeapon _type;};
    case "B_UavTerminal": {_unit linkItem _type;};
    case "O_UavTerminal": {_unit linkItem _type;};
    case "ItemGPS": {_unit linkItem _type;};
    case "ACE_EntrenchingTool": {
      [_unit,_type] spawn fw_fnc_conditionEquipment;
	  };
    case "MineDetector": {
      [_unit,_type] spawn fw_fnc_conditionEquipment;
	  };
    default {_unit addPrimaryWeaponItem _type;};
};

// Save Loadout (not when Parachute)
_unit setVariable ["SR_Loadout",getUnitLoadout _unit];

