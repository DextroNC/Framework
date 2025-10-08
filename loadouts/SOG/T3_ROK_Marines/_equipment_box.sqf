this addaction ["<t color=""#FF8C00"">" +"4x M16 Optic", "7R\Loadouts\7R_EQ.sqf",["vn_o_4x_m16"]];
this addaction ["<t color=""#FF8C00"">" +"3x Garand Optic", "7R\Loadouts\7R_EQ.sqf",["vn_o_3x_m84"]];
this addaction ["<t color=""#FF8C00"">" +"3x M2 Carbine Optic", "7R\Loadouts\7R_EQ.sqf",["vn_o_3x_m84"]];
this addaction ["<t color=""#FF0000"">" +"DMR Sight", "7R\Loadouts\7R_EQ.sqf",["vn_o_8x_m1903"]];

private _tier = 5;

// Support items
[this, _tier] call fw_fnc_addEquipmentItems;

// Radios
[this, _tier] call fw_fnc_addEquipmentRadios;