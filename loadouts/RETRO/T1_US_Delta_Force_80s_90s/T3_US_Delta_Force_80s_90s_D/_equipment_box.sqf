this addaction ["<t color=""#FFFF00"">" +"Suppressor - 5.56mm", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_nt4_black"]];
this addaction ["<t color=""#FFFF00"">" +"Suppressor - 7.62mm", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_aac_m14dcqd_silencer"]];
this addaction ["<t color=""#00FF00"">" +"M68 CCO", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_compm4"]];
this addaction ["<t color=""#FF8C00"">" +"ACOG", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_ACOG3_USMC"]];
this addaction ["<t color=""#FF8C00"">" +"3x M16 Optic", "7R\Loadouts\7R_EQ.sqf",["7r_m16_optic"]];
this addaction ["<t color=""#FF0000"">" +"DMR Sight", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_LEUPOLDMK4"]];

// Support items
[this, 4] call fw_fnc_addEquipmentItems;

// Radios
[this] call fw_fnc_addEquipmentRadios;