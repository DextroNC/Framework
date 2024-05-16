this addaction ["<t color=""#FF8C00"">" +"AR/MMG sight - M145", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_ELCAN"]];
this addaction ["<t color=""#FF0000"">" +"DMR Sight", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_premier_low"]];
this addaction ["<t color=""#0000FF"">" +"x4 Night sight - ACOG", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_ACOG_anpvs27"]];
this addaction ["<t color=""#0000FF"">" +"x8 Night sight - DMR Sight", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_premier_anpvs27"]];

// Support items
[this, 4] call fw_fnc_addEquipmentItems;

// Radios
[this] call fw_fnc_addEquipmentRadios;