this addaction ["<t color=""#FFFF00"">" +"Suppressor - 5.56mm", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_nt4_black"]];
this addaction ["<t color=""#FFFF00"">" +"Suppressor - 7.62mm", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_aac_762sdn6_silencer"]];
this addaction ["<t color=""#00FF00"">" +"EOT552", "7R\Loadouts\7R_EQ.sqf",["RKSL_optic_EOT552"]];
this addaction ["<t color=""#00FF00"">" +"SU278", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_t1_high"]];
this addaction ["<t color=""#00FF00"">" +"RX01", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_rx01_nofilter"]];
this addaction ["<t color=""#00FF00"">" +"M68 CCO", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_compm4"]];
this addaction ["<t color=""#FF8C00"">" +"ACOG", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_ACOG_USMC"]];
this addaction ["<t color=""#FF8C00"">" +"L9A1 SUSAT", "7R\Loadouts\7R_EQ.sqf",["UK3CB_BAF_SUSAT"]];
this addaction ["<t color=""#FF8C00"">" +"L2A2 SUIT", "7R\Loadouts\7R_EQ.sqf",["rhsgref_acc_l1a1_l2a2"]];
this addaction ["<t color=""#FF0000"">" +"DMR Sight", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_LEUPOLDMK4_2"]];

private _tier = 4;

// Support items
[this, _tier] call fw_fnc_addEquipmentItems;

// Radios
[this, _tier] call fw_fnc_addEquipmentRadios;