this addaction ["<t color=""#FF8C00"">" +"TA01NSN", "7R\Loadouts\7R_EQ.sqf",["RH_ta01nsn"]];
this addaction ["<t color=""#0000FF"">" +"x4 Night sight - Kite", "7R\Loadouts\7R_EQ.sqf",["UK3CB_BAF_Kite"]];
this addaction ["<t color=""#0000FF"">" +"x6 Night sight - MaxiKite", "7R\Loadouts\7R_EQ.sqf",["UK3CB_BAF_MaxiKite"]];
this addaction ["<t color=""#ffff00"">" +"suppressor - M16", "7R\Loadouts\7R_EQ.sqf",["RH_spr_mbs"]];
this addaction ["<t color=""#ffff00"">" +"suppressor - L119A1", "7R\Loadouts\7R_EQ.sqf",["UK3CB_BAF_Silencer_L85"]];
this addaction ["<t color=""#ffff00"">" +"suppressor - L115A3", "7R\Loadouts\7R_EQ.sqf",["UK3CB_BAF_Silencer_L115A3"]];


// Support items
[this, 2] call fw_fnc_addEquipmentItems;

// Radios
[this] call fw_fnc_addEquipmentRadios;
