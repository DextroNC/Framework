this addaction ["<t color=""#00FF00"">" +"G36 CompM2", "7R\Loadouts\7R_EQ.sqf",["BWA3_optic_CompM2_green"]];
this addaction ["<t color=""#00FF00"">" +"G36 EOTech552", "7R\Loadouts\7R_EQ.sqf",["BWA3_optic_EOTech552_green"]];
this addaction ["<t color=""#00FF00"">" +"G36 RSAS", "7R\Loadouts\7R_EQ.sqf",["BWA3_optic_RSAS_green"]];
this addaction ["<t color=""#00FF00"">" +"CompM2", "7R\Loadouts\7R_EQ.sqf",["BWA3_optic_CompM2"]];
this addaction ["<t color=""#00FF00"">" +"EOTech552", "7R\Loadouts\7R_EQ.sqf",["BWA3_optic_EOTech552"]];
this addaction ["<t color=""#00FF00"">" +"RSAS", "7R\Loadouts\7R_EQ.sqf",["BWA3_optic_RSAS"]];
this addaction ["<t color=""#00FF00"">" +"MicroT1", "7R\Loadouts\7R_EQ.sqf",["BWA3_optic_MicroT1"]];
this addaction ["<t color=""#00FF00"">" +"MicroT2", "7R\Loadouts\7R_EQ.sqf",["BWA3_optic_MicroT2"]];
this addaction ["<t color=""#FF8C00"">" +"AR - ZO4x30", "7R\Loadouts\7R_EQ.sqf",["BWA3_optic_ZO4x30"]];
this addaction ["<t color=""#FF8C00"">" +"AR - ZO4x30 with MicroT2", "7R\Loadouts\7R_EQ.sqf",["BWA3_optic_ZO4x30_MicroT2"]];
this addaction ["<t color=""#FF8C00"">" +"AR - ZO4x30 with RSAS", "7R\Loadouts\7R_EQ.sqf",["BWA3_optic_ZO4x30_RSAS"]];
this addaction ["<t color=""#FF8C00"">" +"Rifle - ZO4x30i", "7R\Loadouts\7R_EQ.sqf",["BWA3_optic_ZO4x30i"]];
this addaction ["<t color=""#FF8C00"">" +"Rifle - ZO4x30i with MicroT2", "7R\Loadouts\7R_EQ.sqf",["BWA3_optic_ZO4x30i_MicroT2"]];
this addaction ["<t color=""#FF8C00"">" +"Rifle - ZO4x30i with RSAS", "7R\Loadouts\7R_EQ.sqf",["BWA3_optic_ZO4x30i_RSAS"]];
this addaction ["<t color=""#FF0000"">" +"DMR Sight - PMII", "7R\Loadouts\7R_EQ.sqf",["BWA3_optic_PMII_ShortdotCC"]];
this addaction ["<t color=""#FF0000"">" +"DMR Sight - PMII with MicroT1", "7R\Loadouts\7R_EQ.sqf",["BWA3_optic_PMII_DMR_MicroT1_rear"]];
this addaction ["<t color=""#0000FF"">" +"G36 Night sight - NSA80", "7R\Loadouts\7R_EQ.sqf",["BWA3_optic_NSA80"]];
this addaction ["<t color=""#0000FF"">" +"x4 Night sight - Kite", "7R\Loadouts\7R_EQ.sqf",["UK3CB_BAF_Kite"]];
this addaction ["<t color=""#0000FF"">" +"x6 Night sight - MaxiKite", "7R\Loadouts\7R_EQ.sqf",["UK3CB_BAF_MaxiKite"]];


// Support items
[this, 3] call fw_fnc_addEquipmentItems;

// Radios
[this] call fw_fnc_addEquipmentRadios;
