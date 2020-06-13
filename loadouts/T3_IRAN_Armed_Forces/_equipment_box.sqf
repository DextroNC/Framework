this addaction ["<t color=""#FF0000"">" +"RM: 1p78", "7R\Loadouts\7R_EQ.sqf",["rhs_acc_1p78"]];
this addaction ["<t color=""#FF0000"">" +"RM: nita", "7R\Loadouts\7R_EQ.sqf",["rhs_acc_nita"]];
this addaction ["<t color=""#FF0000"">" +"PL DMR: pso1m2", "7R\Loadouts\7R_EQ.sqf",["rhs_acc_pso1m2"]];
this addaction ["<t color=""#FF0000"">" +"PL DMR: pso1m21", "7R\Loadouts\7R_EQ.sqf",["rhs_acc_pso1m21"]];

// Support items
[this, 3] call fw_fnc_addEquipmentItems;

// Radios
[this] call fw_fnc_addEquipmentRadios;
