this addaction ["<t color=""#FFFF00"">" +"Suppressor - 5.56mm", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_nt4_black"]];
this addaction ["<t color=""#FFFF00"">" +"Suppressor - 7.62mm", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_aac_m14dcqd_silencer"]];
this addaction ["<t color=""#00FF00"">" +"EOT552", "7R\Loadouts\7R_EQ.sqf",["RKSL_optic_EOT552"]];
this addaction ["<t color=""#00FF00"">" +"SU278", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_t1_high"]];
this addaction ["<t color=""#00FF00"">" +"RX01", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_rx01_nofilter"]];
this addaction ["<t color=""#00FF00"">" +"M68 CCO", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_compm4"]];
this addaction ["<t color=""#FF8C00"">" +"ACOG", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_ACOG3_USMC"]];
this addaction ["<t color=""#FF8C00"">" +"AR/MMG sight - M145", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_ELCAN"]];
this addaction ["<t color=""#FF0000"">" +"DMR Sight", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_LEUPOLDMK4"]];
this addaction ["<t color=""#0000FF"">" +"x4 Night sight - ACOG", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_ACOG_anpvs27"]];
this addaction ["<t color=""#0000FF"">" +"x8 Night sight - DMR Sight", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_premier_anpvs27"]];

private _tier = 4;

// Support items
[this, _tier] call fw_fnc_addEquipmentItems;

// Radios
[this, _tier] call fw_fnc_addEquipmentRadios;