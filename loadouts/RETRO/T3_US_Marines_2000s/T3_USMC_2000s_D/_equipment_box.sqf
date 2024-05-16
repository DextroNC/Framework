this addaction ["<t color=""#00FF00"">" +"EOT552", "7R\Loadouts\7R_EQ.sqf",["RKSL_optic_EOT552"]];
this addaction ["<t color=""#00FF00"">" +"M68 CCO", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_compm4"]];
this addaction ["<t color=""#FF8C00"">" +"ACOG", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_ACOG3_USMC"]];
this addaction ["<t color=""#FF8C00"">" +"AR/MMG sight - M145", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_ELCAN"]];
this addaction ["<t color=""#FF0000"">" +"DMR Sight", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_M8541_low"]];
this addaction ["<t color=""#0000FF"">" +"x4 Night sight - ACOG", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_ACOG_anpvs27"]];
this addaction ["<t color=""#0000FF"">" +"x8 Night sight - DMR Sight", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_premier_anpvs27"]];

// Support items
[this, 4] call fw_fnc_addEquipmentItems;

// Radios
[this] call fw_fnc_addEquipmentRadios;