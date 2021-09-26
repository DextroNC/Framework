this addaction ["<t color=""#00FF00"">" +"XPS3", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_eotech_xps3"]];
this addaction ["<t color=""#00FF00"">" +"M552", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_eotech_552"]];
this addaction ["<t color=""#00FF00"">" +"M68 CCO", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_compm4"]];
this addaction ["<t color=""#00FF00"">" +"Comp M4", "7R\Loadouts\7R_EQ.sqf",["RH_compm4s"]];
this addaction ["<t color=""#FF8C00"">" +"ACOG3", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_ACOG3_USMC"]];
this addaction ["<t color=""#FF8C00"">" +"ACOG3 RMR", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_ACOG_RMR"]];
this addaction ["<t color=""#FF8C00"">" +"AR/MMG sight - M145", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_ELCAN"]];
this addaction ["<t color=""#FF0000"">" +"DMR Sight", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_premier_mrds"]];
this addaction ["<t color=""#0000FF"">" +"x4 Night sight - ACOG", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_ACOG_anpvs27"]];
this addaction ["<t color=""#0000FF"">" +"x8 Night sight - DMR Sight", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_premier_anpvs27"]];

// Support items
[this, 3] call fw_fnc_addEquipmentItems;

// Radios
[this] call fw_fnc_addEquipmentRadios;
