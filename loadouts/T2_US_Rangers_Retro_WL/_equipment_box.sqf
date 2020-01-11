this addaction ["<t color=""#00FF00"">" +"Reflex", "7R\Loadouts\7R_EQ.sqf",["RH_reflex"]];
this addaction ["<t color=""#00FF00"">" +"Reflex RX01 no Filter", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_RX01_NoFilter"]];
this addaction ["<t color=""#00FF00"">" +"Reflex RX01", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_RX01"]];
this addaction ["<t color=""#00FF00"">" +"Comp M4s", "7R\Loadouts\7R_EQ.sqf",["RH_compm4s"]];
this addaction ["<t color=""#00FF00"">" +"Comp M21", "7R\Loadouts\7R_EQ.sqf",["RH_compM2l"]];
this addaction ["<t color=""#FF0000"">" +"RM: TA01NSN", "7R\Loadouts\7R_EQ.sqf",["RH_ta01nsn"]];
this addaction ["<t color=""#FF0000"">" +"RM: C79", "7R\Loadouts\7R_EQ.sqf",["RH_c79"]];

// Support items
[this, 4] call fw_fnc_addEquipmentItems;

// Radios
[this] call fw_fnc_addEquipmentRadios;
