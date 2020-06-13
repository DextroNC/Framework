this addaction ["<t color=""#FF8C00"">" +"1P78 Sight - AR", "7R\Loadouts\7R_EQ.sqf",["rhs_acc_1p78"]];
this addaction ["<t color=""#FF8C00"">" +"1PN93 Sight - AR Night", "7R\Loadouts\7R_EQ.sqf",["rhs_acc_1pn93_2"]];
this addaction ["<t color=""#FF0000"">" +"DMR Sight - SVD", "7R\Loadouts\7R_EQ.sqf",["rhs_acc_pso1m21_svd"]];
this addaction ["<t color=""#FF0000"">" +"DMR Sight - SVD Night", "7R\Loadouts\7R_EQ.sqf",["rhs_acc_1pn93_1"]];
this addaction ["<t color=""#FF0000"">" +"DMR Sight - FAL", "7R\Loadouts\7R_EQ.sqf",["rhsgref_acc_l1a1_l2a2"]];
this addaction ["<t color=""#FF0000"">" +"DMR Sight - FAL Night", "7R\Loadouts\7R_EQ.sqf",["rhsgref_acc_l1a1_anpvs2"]];

// Support items
[this, 3] call fw_fnc_addEquipmentItems;

// Radios
[this] call fw_fnc_addEquipmentRadios;
