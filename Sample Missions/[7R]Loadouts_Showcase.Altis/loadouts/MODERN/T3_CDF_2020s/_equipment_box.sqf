eqBox addaction ["<t color=""#00FFFF"">" +"Switch Optics Mount", "loadouts\MODERN\T3_CDF_2020s\optic_switch.sqf"];
eqBox addaction ["<t color=""#00FF00"">" +"PKAS (AK-Mount)", "7R\loadouts\7R_EQ.sqf",["rhs_acc_pkas"]];
eqBox addaction ["<t color=""#00FF00"">" +"1P63 (AK-Mount)", "7R\loadouts\7R_EQ.sqf",["rhs_acc_1p63"]];
eqBox addaction ["<t color=""#00FF00"">" +"EKP1 (AK-Mount)", "7R\loadouts\7R_EQ.sqf",["rhs_acc_ekp1"]];
eqBox addaction ["<t color=""#00FF00"">" +"EKP8 (AK-Mount)", "7R\loadouts\7R_EQ.sqf",["rhs_acc_ekp8_02"]];
eqBox addaction ["<t color=""#00FF00"">" +"OKP7 (AK-Mount)", "7R\loadouts\7R_EQ.sqf",["rhs_acc_okp7_dovetail"]];
eqBox addaction ["<t color=""#00FF00"">" +"NIT-A (AK-Mount)", "7R\loadouts\7R_EQ.sqf",["rhs_acc_nita"]];
eqBox addaction ["<t color=""#00FF00"">" +"C-More", "7R\loadouts\7R_EQ.sqf",["optic_ACO"]];
eqBox addaction ["<t color=""#00FF00"">" +"EKP8", "7R\loadouts\7R_EQ.sqf",["rhs_acc_ekp8_18"]];
eqBox addaction ["<t color=""#00FF00"">" +"OKP-7", "7R\loadouts\7R_EQ.sqf",["rhs_acc_okp7_picatinny"]];
eqBox addaction ["<t color=""#00FF00"">" +"1p76 Rakurs", "7R\loadouts\7R_EQ.sqf",["rhs_acc_rakursPM"]];
eqBox addaction ["<t color=""#00FF00"">" +"1p87", "7R\loadouts\7R_EQ.sqf",["rhs_acc_1p87"]];
eqBox addaction ["<t color=""#00FF00"">" +"EOT552", "7R\loadouts\7R_EQ.sqf",["RKSL_optic_EOT552"]];
eqBox addaction ["<t color=""#00FF00"">" +"EXPS3", "7R\loadouts\7R_EQ.sqf",["optic_holosight_blk_f"]];
eqBox addaction ["<t color=""#00FF00"">" +"XPS3", "7R\loadouts\7R_EQ.sqf",["rhsusf_acc_eotech_xps3"]];
eqBox addaction ["<t color=""#00FF00"">" +"MRDS", "7R\loadouts\7R_EQ.sqf",["rhsusf_acc_mrds"]];
eqBox addaction ["<t color=""#00FF00"">" +"SU278", "7R\loadouts\7R_EQ.sqf",["rhsusf_acc_t1_high"]];
eqBox addaction ["<t color=""#00FF00"">" +"RX01", "7R\loadouts\7R_EQ.sqf",["rhsusf_acc_rx01_nofilter"]];
eqBox addaction ["<t color=""#00FF00"">" +"M68 CCO", "7R\loadouts\7R_EQ.sqf",["rhsusf_acc_compm4"]];
eqBox addaction ["<t color=""#FF8C00"">" +"1p29 (AK-Mount)", "7R\loadouts\7R_EQ.sqf",["rhs_acc_1p29"]];
eqBox addaction ["<t color=""#FF8C00"">" +"1p78 (AK-Mount)", "7R\loadouts\7R_EQ.sqf",["rhs_acc_1p78"]];
eqBox addaction ["<t color=""#FF8C00"">" +"HAMR", "7R\loadouts\7R_EQ.sqf",["optic_Hamr"]];
eqBox addaction ["<t color=""#FF8C00"">" +"ACOG", "7R\loadouts\7R_EQ.sqf",["rhsusf_acc_ACOG3_USMC"]];
eqBox addaction ["<t color=""#FF8C00"">" +"ACOG RMR", "7R\loadouts\7R_EQ.sqf",["rhsusf_acc_ACOG_RMR"]];
eqBox addaction ["<t color=""#FF8C00"">" +"EXPS3 + G33", "7R\loadouts\7R_EQ.sqf",["rhsusf_acc_g33_xps3"]];
eqBox addaction ["<t color=""#FF8C00"">" +"SU278 + G33", "7R\loadouts\7R_EQ.sqf",["rhsusf_acc_g33_t1"]];
eqBox addaction ["<t color=""#FF8C00"">" +"ELCAN SpecterOS", "7R\loadouts\7R_EQ.sqf",["optic_arco_ak_blk_f"]];
eqBox addaction ["<t color=""#FF8C00"">" +"AR/MMG sight - 1p78", "7R\loadouts\7R_EQ.sqf",["rhs_acc_1p78"]];
eqBox addaction ["<t color=""#FF8C00"">" +"AR sight - M145", "7R\loadouts\7R_EQ.sqf",["rhsusf_acc_ELCAN"]];
eqBox addaction ["<t color=""#FF0000"">" +"DMR Sight", "7R\loadouts\7R_EQ.sqf",["rhsusf_acc_m8541_mrds"]];
eqBox addaction ["<t color=""#0000FF"">" +"x4 Night sight - KITE", "7R\loadouts\7R_EQ.sqf",["uk3cb_baf_kite"]];
eqBox addaction ["<t color=""#0000FF"">" +"x8 Night sight - DMR Sight", "7R\loadouts\7R_EQ.sqf",["uk3cb_baf_maxikite"]];

// Support items
[eqBox, 3] call fw_fnc_addEquipmentItems;

// Radios
[eqBox] call fw_fnc_addEquipmentRadios;