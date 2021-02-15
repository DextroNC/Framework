this addaction ["<t color=""#00FF00"">" +"ACO", "7R\Loadouts\7R_EQ.sqf",["optic_ACO_grn"]];
this addaction ["<t color=""#00FF00"">" +"MARS", "7R\Loadouts\7R_EQ.sqf",["FHQ_optic_MARS"]];
this addaction ["<t color=""#00FF00"">" +"AIM", "7R\Loadouts\7R_EQ.sqf",["FHQ_optic_AIM"]];
this addaction ["<t color=""#00FF00"">" +"MicroCCO", "7R\Loadouts\7R_EQ.sqf",["FHQ_optic_MicroCCO"]];
this addaction ["<t color=""#00FF00"">" +"MicroCCO low", "7R\Loadouts\7R_EQ.sqf",["FHQ_optic_MicroCCO_low"]];
this addaction ["<t color=""#FF8C00"">" +"VCOG", "7R\Loadouts\7R_EQ.sqf",["FHQ_optic_VCOG"]];
this addaction ["<t color=""#FF8C00"">" +"shortdot", "7R\Loadouts\7R_EQ.sqf",["RH_shortdot"]];
this addaction ["<t color=""#FF8C00"">" +"RSAS - AR", "7R\Loadouts\7R_EQ.sqf",["BWA3_optic_ZO4x30_RSAS"]];
this addaction ["<t color=""#FF0000"">" +"DMR Sight - PMII", "7R\Loadouts\7R_EQ.sqf",["RKSL_optic_PMII_312_sunshade"]];
this addaction ["<t color=""#0000FF"">" +"x4 Night sight - Kite", "7R\Loadouts\7R_EQ.sqf",["UK3CB_BAF_Kite"]];
this addaction ["<t color=""#0000FF"">" +"x6 Night sight - MaxiKite", "7R\Loadouts\7R_EQ.sqf",["UK3CB_BAF_MaxiKite"]];

// Support items
[this, 2] call fw_fnc_addEquipmentItems;

// Radios
[this] call fw_fnc_addEquipmentRadios;
