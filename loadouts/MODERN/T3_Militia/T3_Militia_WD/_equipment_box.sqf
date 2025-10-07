this addaction ["<t color=""#FF0000"">" +"DMR Sight", "7R\Loadouts\7R_EQ.sqf",["rhs_acc_pso1m21"]];
this addaction ["<t color=""#0000FF"">" +"x4 Night sight - 1pn93", "7R\Loadouts\7R_EQ.sqf",["rhs_acc_1pn93_1"]];

private _tier = 4;

// Support items
[this, _tier] call fw_fnc_addEquipmentItems;

// Radios
[this, _tier] call fw_fnc_addEquipmentRadios;
