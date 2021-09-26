this addaction ["<t color=""#FF8C00"">" +"SUSAT", "7R\Loadouts\7R_EQ.sqf",["UK3CB_BAF_SUSAT"]];
this addaction ["<t color=""#0000FF"">" +"x4 Night sight - Kite", "7R\Loadouts\7R_EQ.sqf",["UK3CB_BAF_Kite"]];
this addaction ["<t color=""#0000FF"">" +"x6 Night sight - MaxiKite", "7R\Loadouts\7R_EQ.sqf",["UK3CB_BAF_MaxiKite"]];


// Support items
[this, 2] call fw_fnc_addEquipmentItems;

// Radios
[this] call fw_fnc_addEquipmentRadios;
