this addaction ["Diver - Squad/Platoon leader", "loadouts\f_sl_diver.sqf"];
this addaction ["Diver - Medic", "loadouts\f_medic_diver.sqf"];
this addaction ["Diver - Operator", "loadouts\f_o_diver.sqf"];
this addaction ["Diver - Specialist", "loadouts\f_spc_diver.sqf"];
this addaction ["<t color=""#0000FF"">" +"Save Loadout", {(_this select 1) setVariable ["SR_Loadout",getUnitLoadout (_this select 1)];}];
this addaction ["<t color=""#0000FF"">" +"Load Loadout", {(_this select 1)  setUnitLoadout ((_this select 1)  getVariable ["SR_Loadout",[]]);}];