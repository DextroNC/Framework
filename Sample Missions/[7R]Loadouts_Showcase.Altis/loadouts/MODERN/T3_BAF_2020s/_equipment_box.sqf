eqBox addaction ["<t color=""#00FF00"">" +"C-More", "7R\Loadouts\7R_EQ.sqf",["optic_ACO"]];
eqBox addaction ["<t color=""#00FF00"">" +"EOT552", "7R\Loadouts\7R_EQ.sqf",["RKSL_optic_EOT552"]];
eqBox addaction ["<t color=""#00FF00"">" +"EXPS3", "7R\Loadouts\7R_EQ.sqf",["optic_holosight_blk_f"]];
eqBox addaction ["<t color=""#00FF00"">" +"EXPS3 (Tan)", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_eotech"]];
eqBox addaction ["<t color=""#00FF00"">" +"XPS3", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_eotech_xps3"]];
eqBox addaction ["<t color=""#00FF00"">" +"MRDS", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_mrds"]];
eqBox addaction ["<t color=""#00FF00"">" +"MRDS (Tan)", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_mrds_c"]];
eqBox addaction ["<t color=""#00FF00"">" +"SU278", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_t1_high"]];
eqBox addaction ["<t color=""#00FF00"">" +"RX01", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_rx01_nofilter"]];
eqBox addaction ["<t color=""#00FF00"">" +"M68 CCO", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_compm4"]];
eqBox addaction ["<t color=""#FF8C00"">" +"Elcan LDS", "7R\Loadouts\7R_EQ.sqf",["rksl_optic_lds"]];
eqBox addaction ["<t color=""#FF8C00"">" +"ACOG", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_ACOG3_USMC"]];
eqBox addaction ["<t color=""#FF8C00"">" +"ACOG RMR", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_ACOG_RMR"]];
eqBox addaction ["<t color=""#FF8C00"">" +"EXPS3 + G33", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_g33_xps3"]];
eqBox addaction ["<t color=""#FF8C00"">" +"SU278 + G33", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_g33_t1"]];
eqBox addaction ["<t color=""#FF0000"">" +"DMR Sight", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_premier_mrds"]];
eqBox addaction ["<t color=""#0000FF"">" +"x4 Night sight - KITE", "7R\Loadouts\7R_EQ.sqf",["uk3cb_baf_kite"]];
eqBox addaction ["<t color=""#0000FF"">" +"x8 Night sight - DMR Sight", "7R\Loadouts\7R_EQ.sqf",["uk3cb_baf_maxikite"]];

// Support items
[eqBox, 3] call fw_fnc_addEquipmentItems;

// Radios
[eqBox] call fw_fnc_addEquipmentRadios;