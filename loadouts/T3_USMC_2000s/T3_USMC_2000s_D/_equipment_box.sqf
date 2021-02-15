this addaction ["<t color=""#00FF00"">" +"eotech 552", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_eotech_552"]];
this addaction ["<t color=""#00FF00"">" +"MARS", "7R\Loadouts\7R_EQ.sqf",["FHQ_optic_MARS"]];
this addaction ["<t color=""#00FF00"">" +"Comp M2", "7R\Loadouts\7R_EQ.sqf",["RH_compM2"]];
this addaction ["<t color=""#FF8C00"">" +"RIFLE - ACOG2", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_ACOG2_USMC"]];
this addaction ["<t color=""#FF8C00"">" +"AR - M145", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_ELCAN"]];
this addaction ["<t color=""#FF0000"">" +"DMR Sight - M8541", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_M8541"]];
this addaction ["<t color=""#0000FF"">" +"x8 Night sight - ANPVS10", "7R\Loadouts\7R_EQ.sqf",["RH_anpvs10"]];

// Support items
[this, 4] call fw_fnc_addEquipmentItems;

// Radios
[this] call fw_fnc_addEquipmentRadios;
