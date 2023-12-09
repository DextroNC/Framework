eqBox addaction ["<t color=""#FF8C00"">" +"NIT-A", "7R\Loadouts\7R_EQ.sqf",["rhs_acc_nita"]];
eqBox addaction ["<t color=""#FF8C00"">" +"1p78", "7R\Loadouts\7R_EQ.sqf",["rhs_acc_1p78"]];
eqBox addaction ["<t color=""#FF8C00"">" +"1p29", "7R\Loadouts\7R_EQ.sqf",["rhs_acc_1p29"]];
eqBox addaction ["<t color=""#FF0000"">" +"DMR Sight", "7R\Loadouts\7R_EQ.sqf",["rhs_acc_pso1m21"]];
eqBox addaction ["<t color=""#0000FF"">" +"x4 Night sight - 1pn93", "7R\Loadouts\7R_EQ.sqf",["rhs_acc_1pn93_1"]];

// Support items
[eqBox, 4] call fw_fnc_addEquipmentItems;

// Radios
[eqBox] call fw_fnc_addEquipmentRadios;
