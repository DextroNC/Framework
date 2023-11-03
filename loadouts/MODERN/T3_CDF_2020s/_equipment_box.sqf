this addaction ["<t color=""#ffff00"">" +"Switch Optics Mount", "Loadouts\optic_switch.sqf"];
this addaction ["<t color=""#00FF00"">" +"PKAS (AK-Mount)", "7R\Loadouts\7R_EQ.sqf",["rhs_acc_pkas"]];
this addaction ["<t color=""#00FF00"">" +"1P63 (AK-Mount)", "7R\Loadouts\7R_EQ.sqf",["rhs_acc_1p63"]];
this addaction ["<t color=""#00FF00"">" +"EKP1 (AK-Mount)", "7R\Loadouts\7R_EQ.sqf",["rhs_acc_ekp1"]];
this addaction ["<t color=""#00FF00"">" +"EKP8 (AK-Mount)", "7R\Loadouts\7R_EQ.sqf",["rhs_acc_ekp8_02"]];
this addaction ["<t color=""#00FF00"">" +"OKP7 (AK-Mount)", "7R\Loadouts\7R_EQ.sqf",["rhs_acc_okp7_dovetail"]];
this addaction ["<t color=""#00FF00"">" +"C-More", "7R\Loadouts\7R_EQ.sqf",["optic_ACO"]];
this addaction ["<t color=""#00FF00"">" +"EOT552", "7R\Loadouts\7R_EQ.sqf",["RKSL_optic_EOT552"]];
this addaction ["<t color=""#00FF00"">" +"EXPS3", "7R\Loadouts\7R_EQ.sqf",["optic_holosight_blk_f"]];
this addaction ["<t color=""#00FF00"">" +"SU278", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_t1_high"]];
this addaction ["<t color=""#00FF00"">" +"RX01", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_rx01_nofilter"]];
this addaction ["<t color=""#00FF00"">" +"M68 CCO", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_compm4"]];
this addaction ["<t color=""#00FF00"">" +"EKP8", "7R\Loadouts\7R_EQ.sqf",["rhs_acc_ekp8_18"]];
this addaction ["<t color=""#00FF00"">" +"OKP-7", "7R\Loadouts\7R_EQ.sqf",["rhs_acc_okp7_picatinny"]];
this addaction ["<t color=""#FF8C00"">" +"1p29 (AK-Mount)", "7R\Loadouts\7R_EQ.sqf",["rhs_acc_1p29"]];
this addaction ["<t color=""#FF8C00"">" +"1p78 (AK-Mount)", "7R\Loadouts\7R_EQ.sqf",["rhs_acc_1p78"]];
this addaction ["<t color=""#FF8C00"">" +"NIT-A (AK-Mount)", "7R\Loadouts\7R_EQ.sqf",["rhs_acc_nita"]];
this addaction ["<t color=""#FF8C00"">" +"HAMR", "7R\Loadouts\7R_EQ.sqf",["optic_Hamr"]];
this addaction ["<t color=""#FF8C00"">" +"ACOG3", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_ACOG3_USMC"]];
this addaction ["<t color=""#FF8C00"">" +"ACOG3 RMR", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_ACOG_RMR"]];
this addaction ["<t color=""#FF8C00"">" +"EXPS3 + G33", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_g33_xps3"]];
this addaction ["<t color=""#FF8C00"">" +"SU278 + G33", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_g33_t1"]];
this addaction ["<t color=""#FF8C00"">" +"ELCAN SpecterOS", "7R\Loadouts\7R_EQ.sqf",["optic_arco_ak_blk_f"]];
this addaction ["<t color=""#FF8C00"">" +"AR/MMG sight - 1p78", "7R\Loadouts\7R_EQ.sqf",["rhs_acc_1p78"]];
this addaction ["<t color=""#FF8C00"">" +"AR sight - M145", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_ELCAN"]];
this addaction ["<t color=""#FF0000"">" +"DMR Sight", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_m8541_mrds"]];
this addaction ["<t color=""#0000FF"">" +"x4 Night sight - KITE", "7R\Loadouts\7R_EQ.sqf",["uk3cb_baf_kite"]];
this addaction ["<t color=""#0000FF"">" +"x8 Night sight - MAXIKITE", "7R\Loadouts\7R_EQ.sqf",["uk3cb_baf_maxikite"]];

// Support items
[this, 2] call fw_fnc_addEquipmentItems;

// Radios
[this] call fw_fnc_addEquipmentRadios;