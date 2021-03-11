this addaction ["<t color=""#00FF00"">" +"XPS3", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_eotech_xps3"]];
this addaction ["<t color=""#00FF00"">" +"M552", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_eotech_552"]];
this addaction ["<t color=""#00FF00"">" +"M68 CCO", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_compm4"]];
this addaction ["<t color=""#00FF00"">" +"Comp M4", "7R\Loadouts\7R_EQ.sqf",["RH_compm4s"]];
this addaction ["<t color=""#FF8C00"">" +"TA31RMR", "7R\Loadouts\7R_EQ.sqf",["RH_ta31rmr"]];
this addaction ["<t color=""#FF8C00"">" +"TA31RCO", "7R\Loadouts\7R_EQ.sqf",["RH_ta31rco"]];
this addaction ["<t color=""#FF8C00"">" +"LDS", "7R\Loadouts\7R_EQ.sqf",["RKSL_optic_LDS"]];
this addaction ["<t color=""#FF0000"">" +"TA648 (5.56) - DMR ", "7R\Loadouts\7R_EQ.sqf",["UK3CB_BAF_TA648"]];
this addaction ["<t color=""#FF0000"">" +"TA648 (7.62) - DMR ", "7R\Loadouts\7R_EQ.sqf",["UK3CB_BAF_TA648_308"]];
this addaction ["<t color=""#ffff00"">" +"suppressor - L119A1", "7R\Loadouts\7R_EQ.sqf",["UK3CB_BAF_Silencer_L85"]];
this addaction ["<t color=""#ffff00"">" +"suppressor - HK417", "7R\Loadouts\7R_EQ.sqf",["RH_Saker762"]];
this addaction ["<t color=""#ffff00"">" +"suppressor - HK416", "7R\Loadouts\7R_EQ.sqf",["BWA3_muzzle_snds_QDSS"]];
this addaction ["<t color=""#ffff00"">" +"suppressor - L115A3/L129A1", "7R\Loadouts\7R_EQ.sqf",["UK3CB_BAF_Silencer_L115A3"]];
this addaction ["<t color=""#ffff00"">" +"suppressor - Side arm", "7R\Loadouts\7R_EQ.sqf",["hlc_muzzle_Octane9"]];
this addaction ["<t color=""#0000FF"">" +"x4 Night sight - Kite", "7R\Loadouts\7R_EQ.sqf",["UK3CB_BAF_Kite"]];
this addaction ["<t color=""#0000FF"">" +"x6 Night sight - MaxiKite", "7R\Loadouts\7R_EQ.sqf",["UK3CB_BAF_MaxiKite"]];

// Support items
[this, 2] call fw_fnc_addEquipmentItems;

// Radios
[this] call fw_fnc_addEquipmentRadios;