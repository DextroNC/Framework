
this addaction ["<t color=""#FF0000"">" +"SVD: pso1m2", "7R\Loadouts\7R_EQ.sqf",["rhs_acc_pso1m2"]];
this addaction ["<t color=""#0000FF"">" +"SVD Night Sight", "7R\Loadouts\7R_EQ.sqf",["rhs_acc_1pn34"]];
this addaction ["<t color=""#ffff00"">" +"AKM suppressor", "7R\Loadouts\7R_EQ.sqf",["rhs_acc_pbs1"]];
this addaction ["<t color=""#ffff00"">" +"SVD suppressor", "7R\Loadouts\7R_EQ.sqf",["rhs_acc_tgpv"]];

// Support items
[this, 3] call fw_fnc_addEquipmentItems;

// Radios
[this] call fw_fnc_addEquipmentRadios;
