this addaction ["<t color=""#FF8C00"">" +"3x M16 Optic", "7R\Loadouts\7R_EQ.sqf",["7r_m16_optic"]];
this addaction ["<t color=""#FF0000"">" +"DMR Sight", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_LEUPOLDMK4"]];

// Support items
[this, 4] call fw_fnc_addEquipmentItems;

// Radios
[this] call fw_fnc_addEquipmentRadios;