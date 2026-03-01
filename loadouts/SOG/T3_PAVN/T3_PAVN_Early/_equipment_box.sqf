this addaction ["<t color=""#FF0000"">" +"DMR Sight", "7R\Loadouts\7R_EQ.sqf",["vn_o_3x_m9130"]];

private _tier = 5;

// Support items
[this, _tier] call fw_fnc_addEquipmentItems;

// Radios
[this, _tier] call fw_fnc_addEquipmentRadios;