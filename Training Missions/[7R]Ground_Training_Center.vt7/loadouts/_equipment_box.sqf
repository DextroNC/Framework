this addaction ["<t color=""#00FF00"">" +"XPS3", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_eotech_xps3"]];
this addaction ["<t color=""#00FF00"">" +"M552", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_eotech_552"]];
this addaction ["<t color=""#00FF00"">" +"M68 CCO", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_compm4"]];
this addaction ["<t color=""#00FF00"">" +"Aimpoint", "7R\Loadouts\7R_EQ.sqf",["FHQ_optic_AIM"]];
this addaction ["<t color=""#00FF00"">" +"Comp M2", "7R\Loadouts\7R_EQ.sqf",["RH_compm2"]];
this addaction ["<t color=""#00FF00"">" +"Comp M2 low", "7R\Loadouts\7R_EQ.sqf",["RH_compm2l"]];
this addaction ["<t color=""#00FF00"">" +"Comp M4", "7R\Loadouts\7R_EQ.sqf",["RH_compm4s"]];
this addaction ["<t color=""#00FF00"">" +"Comp M4", "7R\Loadouts\7R_EQ.sqf",["RH_compm4s"]];
this addaction ["<t color=""#00FF00"">" +"Aimpoint T1", "7R\Loadouts\7R_EQ.sqf",["RH_t1"]];
this addaction ["<t color=""#00FF00"">" +"Aimpoint T1 high", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_T1_high"]];
this addaction ["<t color=""#00FF00"">" +"Aimpoint T1 low", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_T1_low"]];
this addaction ["<t color=""#00FF00"">" +"C-more", "7R\Loadouts\7R_EQ.sqf",["RH_cmore"]];
this addaction ["<t color=""#00FF00"">" +"RX01 no filter", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_RX01_noFilter"]];
this addaction ["<t color=""#00FF00"">" +"RX01", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_RX01"]];
this addaction ["<t color=""#FF8C00"">" +"TA01nsn", "7R\Loadouts\7R_EQ.sqf",["RH_ta01nsn"]];
this addaction ["<t color=""#FF8C00"">" +"ACOG3", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_ACOG3_USMC"]];
this addaction ["<t color=""#FF8C00"">" +"ACOG3 RMR", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_ACOG_RMR"]];
this addaction ["<t color=""#FF8C00"">" +"C79", "7R\Loadouts\7R_EQ.sqf",["RH_c79"]];
this addaction ["<t color=""#FF8C00"">" +"EXPS3 + G33", "7R\Loadouts\7R_EQ.sqf",["RH_eothhs1"]];
this addaction ["<t color=""#FF8C00"">" +"M145", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_ELCAN"]];
this addaction ["<t color=""#FF8C00"">" +"M150", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_ACOG"]];
this addaction ["<t color=""#FF8C00"">" +"SU-230", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_su230"]];
this addaction ["<t color=""#FF8C00"">" +"SU-230 MRDS", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_su230_mrds"]];
this addaction ["<t color=""#FF0000"">" +"DMR Sight - ACOG MDO", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_ACOG_MDO"]];
this addaction ["<t color=""#FF0000"">" +"DMR Sight - MOS", "7R\Loadouts\7R_EQ.sqf",["optic_SOS"]];
this addaction ["<t color=""#FF0000"">" +"DMR Sight - PMII", "7R\Loadouts\7R_EQ.sqf",["RKSL_optic_PMII_312"]];

private _tier = 3;

// Support items
[this, _tier] call fw_fnc_addEquipmentItems;

// Radios
[this, _tier] call fw_fnc_addEquipmentRadios;
