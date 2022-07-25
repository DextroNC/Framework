this addaction ["<t color=""#00FF00"">" +"M16 Red Dot", "7R\Loadouts\7R_EQ.sqf",["vn_o_1x_sp_m16"]];
this addaction ["<t color=""#00FF00"">" +"M16 Bayonet", "7R\Loadouts\7R_EQ.sqf",["vn_b_m16"]];
this addaction ["<t color=""#00FF00"">" +"M14 Bayonet", "7R\Loadouts\7R_EQ.sqf",["vn_b_m14"]];
this addaction ["<t color=""#00FF00"">" +"M2 Carbine Bayonet", "7R\Loadouts\7R_EQ.sqf",["vn_b_carbine"]];
this addaction ["<t color=""#00FF00"">" +"M552", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_eotech_552"]];
this addaction ["<t color=""#FF8C00"">" +"M16 3-9x", "7R\Loadouts\7R_EQ.sqf",["vn_o_9x_m16"]];
this addaction ["<t color=""#FF8C00"">" +"M2 Carbine 3x", "7R\Loadouts\7R_EQ.sqf",["vn_o_3x_m84"]];
this addaction ["<t color=""#FF8C00"">" +"M16 4x", "7R\Loadouts\7R_EQ.sqf",["vn_o_4x_m16"]];
this addaction ["<t color=""#FF8C00"">" +"M16 AN-PVS2", "7R\Loadouts\7R_EQ.sqf",["vn_o_anpvs2_m16"]];

// Support items
[this, 2] call fw_fnc_addEquipmentItems;

// Radios
[this] call fw_fnc_addEquipmentRadios;
