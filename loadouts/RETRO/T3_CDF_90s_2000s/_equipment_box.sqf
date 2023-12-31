
this addaction ["<t color=""#00FF00"">" +"NIT-A (AK-Mount)", "7R\Loadouts\7R_EQ.sqf",["rhs_acc_nita"]];
this addaction ["<t color=""#FF8C00"">" +"1p29 (AK-Mount)", "7R\Loadouts\7R_EQ.sqf",["rhs_acc_1p29"]];
this addaction ["<t color=""#FF8C00"">" +"1p78 (AK-Mount)", "7R\Loadouts\7R_EQ.sqf",["rhs_acc_1p78"]];
this addaction ["<t color=""#FF8C00"">" +"AR sight - 1p78", "7R\Loadouts\7R_EQ.sqf",["rhs_acc_1p78"]];
this addaction ["<t color=""#FF0000"">" +"DMR Sight", "7R\Loadouts\7R_EQ.sqf",["rhs_acc_pso1m2"]];
this addaction ["<t color=""#0000FF"">" +"x2 Night sight - 1pn93-1", "7R\Loadouts\7R_EQ.sqf",["rhs_acc_1pn93_1"]];
this addaction ["<t color=""#0000FF"">" +"x3 Night sight - 1pn93-2", "7R\Loadouts\7R_EQ.sqf",["rhs_acc_1pn93_2"]];

// Support items
[this, 3] call fw_fnc_addEquipmentItems;

// Radios
[this] call fw_fnc_addEquipmentRadios;