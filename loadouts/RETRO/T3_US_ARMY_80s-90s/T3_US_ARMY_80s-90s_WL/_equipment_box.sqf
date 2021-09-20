this addaction ["<t color=""#FF8C00"">" +"RIFLE scope", "7R\Loadouts\7R_EQ.sqf",["KA_M16A2_Scope"]];
this addaction ["<t color=""#FF0000"">" +"DMR Sight - M8541", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_M8541"]];
this addaction ["<t color=""#0000FF"">" +"x8 Night sight - ANPVS4", "7R\Loadouts\7R_EQ.sqf",["RH_anpvs4"]];

// Support items
[this, 4] call fw_fnc_addEquipmentItems;

// Radios
[this] call fw_fnc_addEquipmentRadios;
