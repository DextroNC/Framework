
this addaction ["<t color=""#00FF00"">" +"rakursPM", "7R\Loadouts\7R_EQ.sqf",["rhs_acc_rakursPM"]];
this addaction ["<t color=""#00FF00"">" +"1p87", "7R\Loadouts\7R_EQ.sqf",["rhs_acc_1p87"]];
this addaction ["<t color=""#00FF00"">" +"ekp8_18", "7R\Loadouts\7R_EQ.sqf",["rhs_acc_ekp8_18"]];
this addaction ["<t color=""#00FF00"">" +"okp7", "7R\Loadouts\7R_EQ.sqf",["rhs_acc_okp7_picatinny"]];
this addaction ["<t color=""#FF0000"">" +"RM: MRCO", "7R\Loadouts\7R_EQ.sqf",["optic_MRCO"]];
this addaction ["<t color=""#FF0000"">" +"PL DMR: DMS", "7R\Loadouts\7R_EQ.sqf",["optic_DMS"]];

// Support items
[this, 3] call fw_fnc_addEquipmentItems;

// Radios
[this] call fw_fnc_addEquipmentRadios;