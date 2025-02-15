this addaction ["<t color=""#00FF00"">" +"C-More", "7R\Loadouts\7R_EQ.sqf",["optic_ACO"]];
this addaction ["<t color=""#00FF00"">" +"EOT552", "7R\Loadouts\7R_EQ.sqf",["RKSL_optic_EOT552"]];
this addaction ["<t color=""#00FF00"">" +"EXPS3", "7R\Loadouts\7R_EQ.sqf",["optic_holosight_blk_f"]];
this addaction ["<t color=""#00FF00"">" +"XPS3", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_eotech_xps3"]];
this addaction ["<t color=""#00FF00"">" +"MRDS", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_mrds"]];
this addaction ["<t color=""#00FF00"">" +"SU278 (High)", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_t1_high"]];
this addaction ["<t color=""#00FF00"">" +"SU278 (Low)", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_t1_low"]];
this addaction ["<t color=""#00FF00"">" +"RX01", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_rx01_nofilter"]];
this addaction ["<t color=""#00FF00"">" +"M68 CCO", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_compm4"]];
this addaction ["<t color=""#FF8C00"">" +"HAMR", "7R\Loadouts\7R_EQ.sqf",["optic_Hamr"]];
this addaction ["<t color=""#FF8C00"">" +"ACOG", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_ACOG3_USMC"]];
this addaction ["<t color=""#FF8C00"">" +"ACOG RMR", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_ACOG_RMR"]];
this addaction ["<t color=""#FF8C00"">" +"MRCO", "7R\Loadouts\7R_EQ.sqf",["optic_MRCO"]];
this addaction ["<t color=""#FF8C00"">" +"EXPS3 + G33", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_g33_xps3"]];
this addaction ["<t color=""#FF8C00"">" +"SU278 + G33", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_g33_t1"]];
this addaction ["<t color=""#FF8C00"">" +"Elcan LDS", "7R\Loadouts\7R_EQ.sqf",["RKSL_optic_LDS"]];
this addaction ["<t color=""#FF8C00"">" +"Elcan C79", "7R\Loadouts\7R_EQ.sqf",["7r_acc_c79_blk"]];
this addaction ["<t color=""#FF8C00"">" +"SU-230 - 5.56mm", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_su230"]];
this addaction ["<t color=""#FF8C00"">" +"SU-230 MRDS - 5.56mm", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_su230_mrds"]];
this addaction ["<t color=""#FF8C00"">" +"SU-230 - 7.62mm", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_su230a"]];
this addaction ["<t color=""#FF8C00"">" +"SU-230 MRDS - 7.62mm", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_su230a_mrds"]];
this addaction ["<t color=""#FF8C00"">" +"AR/MMG sight - M145", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_ELCAN"]];
this addaction ["<t color=""#FF0000"">" +"DMR Sight", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_premier_mrds"]];
this addaction ["<t color=""#0000FF"">" +"x4 Night sight - ACOG", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_ACOG_anpvs27"]];
this addaction ["<t color=""#0000FF"">" +"x8 Night sight - DMR Sight", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_premier_anpvs27"]];


// Support items
[this, 3.5] call fw_fnc_addEquipmentItems;

// Radios
[this] call fw_fnc_addEquipmentRadios;