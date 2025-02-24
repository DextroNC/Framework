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
private _class = (_this select 3) select 0;

// Checks if item is attachment/terminal/nvg
private _linkable = getNumber(configFile >> "CfgWeapons" >> _class >> "itemInfo" >> "type") in [101, 201, 301, 302, 621, 616];

//Checks unit side
private _side = (side _unit) call BIS_fnc_sideID;

// Local only execute
if(!local _unit) exitWith {};

if (_class == "B_Parachute") exitWith {
  _unit addBackpack _class;
};

if (_class isKindOf ["Binocular", configFile >> "CfgWeapons"] && (_class != "Laserdesignator")) exitWith {
  _unit addWeapon _class;
};

if (!(_unit canAdd _class) && !_linkable) exitWith {
  ["","Not enough space"] spawn fw_fnc_info;
};

// Switch-Do-Loop (Default Weapon Sight)
switch (_class) do {
    case "ACRE_PRC343": {_unit addItem _class;};
    case "ACRE_PRC152": {
      [_unit,_class,3] spawn fw_fnc_conditionEquipment;
    };
    case "ACRE_PRC148": {
      [_unit,_class,3] spawn fw_fnc_conditionEquipment;
    };
    case "ACRE_PRC117F": {
      [_unit,_class,3] spawn fw_fnc_conditionEquipment;
    };
    case "rhsusf_ANPVS_14": {_unit linkItem _class;};
    case "rhsusf_ANPVS_15": {_unit linkItem _class;};
    case "rhs_1PN138": {_unit linkItem _class;};
    case "ACE_key_lockpick": {_unit addItem _class;};
    case "ACE_wirecutter": {_unit addItem _class;};
    case "Laserdesignator": {_unit addWeapon "UK3CB_BAF_Soflam_Laserdesignator"; _unit addItem "Laserbatteries";};
    case "ACE_Vector": {_unit addWeapon _class;};
    case "Binocular": {_unit addWeapon _class;};
    case "B_UavTerminal": {_unit linkItem (["O_UavTerminal","B_UavTerminal","I_UavTerminal","C_UavTerminal"] select _side);};
    case "O_UavTerminal": {_unit linkItem (["O_UavTerminal","B_UavTerminal","I_UavTerminal","C_UavTerminal"] select _side);};
    case "I_UavTerminal": {_unit linkItem (["O_UavTerminal","B_UavTerminal","I_UavTerminal","C_UavTerminal"] select _side);};
    case "C_UavTerminal": {_unit linkItem (["O_UavTerminal","B_UavTerminal","I_UavTerminal","C_UavTerminal"] select _side);};
    case "ItemGPS": {_unit linkItem _class;};
    case "ACE_EntrenchingTool": {
      [_unit,_class] spawn fw_fnc_conditionEquipment;
	  };
    case "MineDetector": {
      [_unit,_class] spawn fw_fnc_conditionEquipment;
	  };
    case "7r_compact_drone": {
      if ([_unit,_class,1,false,["7r_mag_compact_drone"]] spawn fw_fnc_conditionEquipment) then {
        _unit linkItem (["O_UavTerminal","B_UavTerminal","I_UavTerminal","C_UavTerminal"] select _side);
        _unit addItem "ACE_UAVBattery";
      };
	  };
    default {_unit addPrimaryWeaponItem _class;};
};

// Save Loadout (not when Parachute)
_unit setVariable ["SR_Loadout",getUnitLoadout _unit];

