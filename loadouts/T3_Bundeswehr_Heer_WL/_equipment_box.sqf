this addaction ["<t color=""#0000FF"">" +"Eotech 552", "7R\Loadouts\7R_EQ.sqf",["BWA3_optic_EOTech552"]];
this addaction ["<t color=""#0000FF"">" +"Aimpoint", "7R\Loadouts\7R_EQ.sqf",["BWA3_optic_MicroT1"]];
this addaction ["<t color=""#FF8C00"">" +"ACOG3", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_ACOG3_USMC"]];
this addaction ["<t color=""#FF8C00"">" +"M145", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_ELCAN"]];
this addaction ["<t color=""#FF8C00"">" +"M150", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_ACOG"]];
this addaction ["<t color=""#FF0000"">" +"DMR Sight - ACOG MDO", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_ACOG_MDO"]];
this addaction ["<t color=""#FF0000"">" +"DMR Sight - MOS", "7R\Loadouts\7R_EQ.sqf",["optic_SOS"]];
this addaction ["<t color=""#FF0000"">" +"DMR Sight - PMII", "7R\Loadouts\7R_EQ.sqf",["RKSL_optic_PMII_312"]];

// Support items
[this, 3] call fw_fnc_addEquipmentItems;

// Radios
[this] call fw_fnc_addEquipmentRadios;
