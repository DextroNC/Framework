eqBox addaction ["<t color=""#00FF00"">" +"EOT552", "7R\Loadouts\7R_EQ.sqf",["RKSL_optic_EOT552"]];
eqBox addaction ["<t color=""#00FF00"">" +"M68 CCO", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_compm4"]];
eqBox addaction ["<t color=""#FF8C00"">" +"ACOG", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_ACOG3_USMC"]];
eqBox addaction ["<t color=""#FF8C00"">" +"SUSAT", "7R\Loadouts\7R_EQ.sqf",["UK3CB_BAF_SUSAT"]];
eqBox addaction ["<t color=""#FF0000"">" +"DMR Sight", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_premier_mrds"]];
eqBox addaction ["<t color=""#0000FF"">" +"x4 Night sight - KITE", "7R\Loadouts\7R_EQ.sqf",["uk3cb_baf_kite"]];
eqBox addaction ["<t color=""#0000FF"">" +"x8 Night sight - DMR Sight", "7R\Loadouts\7R_EQ.sqf",["uk3cb_baf_maxikite"]];

// Support items
[eqBox, 3] call fw_fnc_addEquipmentItems;

// Radios
[eqBox] call fw_fnc_addEquipmentRadios;