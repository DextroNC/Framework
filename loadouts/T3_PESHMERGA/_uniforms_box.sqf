this addaction ["Platoon Leader", "loadouts\psm_pl.sqf"];
this addaction ["Platoon FAC", "loadouts\psm_p_fac.sqf"];
this addaction ["Platoon Engineer (Demo)", "loadouts\psm_p_e_demo.sqf"];
this addaction ["Platoon Engineer (EOD)", "loadouts\psm_p_e_eod.sqf"];
this addaction ["Platoon Engineer (Fortification)", "loadouts\psm_p_e_fort.sqf"];
this addaction ["Platoon Engineer (Repair)", "loadouts\psm_p_e_rep.sqf"];
this addaction ["Platoon DMR", "loadouts\psm_p_dmr.sqf"];
this addaction ["Platoon Driver", "loadouts\psm_p_d.sqf"];
this addaction ["Platoon AR", "loadouts\psm_p_ar.sqf"];
this addaction ["Platoon Medic", "loadouts\psm_p_medic.sqf"];
this addaction ["Squad Leader", "loadouts\psm_sl.sqf"];
this addaction ["Combat Medic", "loadouts\psm_medic.sqf"];
this addaction ["Operator Rifle", "loadouts\psm_o_r.sqf"];
this addaction ["Operator AR", "loadouts\psm_o_ar.sqf"];
this addaction ["Operator Light AT", "loadouts\psm_o_lat.sqf"];
this addaction ["Operator MMG", "loadouts\psm_o_mmg.sqf"];
this addaction ["Operator Asst. MMG", "loadouts\psm_o_mmg_ab.sqf"];
this addaction ["Operator Medium AT", "loadouts\psm_o_mat.sqf"];
this addaction ["Operator Asst. Medium AT", "loadouts\psm_o_mat_ab.sqf"];
this addaction ["Operator Grenadier", "loadouts\psm_o_g.sqf"];
this addaction ["Operator DMR (FAL)", "loadouts\psm_o_dmr.sqf"];
this addaction ["Operator Battlerifle (AKM)", "loadouts\psm_o_br.sqf"];
this addaction ["Operator Specialist (G36)", "loadouts\psm_o_spc.sqf"];
this addaction ["Operator Breacher", "loadouts\psm_o_breacher.sqf"];
this addaction ["Operator Engineer (Demo)", "loadouts\psm_o_e_demo.sqf"];
this addaction ["Operator Engineer (EOD)", "loadouts\psm_o_e_eod.sqf"];
this addaction ["Operator Engineer (Fortification)", "loadouts\psm_o_e_fort.sqf"];
this addaction ["Operator Engineer (Repair)", "loadouts\psm_o_e_rep.sqf"];
this addaction ["Echo Rifleman", "loadouts\psm_e_r.sqf"];
this addaction ["Echo AR", "loadouts\psm_e_ar.sqf"];
this addaction ["Echo Engineer (Demo)", "loadouts\psm_e_e_demo.sqf"];
this addaction ["Echo Engineer (EOD)", "loadouts\psm_e_e_eod.sqf"];
this addaction ["Echo Engineer (Fortification)", "loadouts\psm_e_e_fort.sqf"];
this addaction ["Echo Engineer (Repair)", "loadouts\psm_e_e_rep.sqf"];
this addaction ["Echo Heavy Weapons (Mortar)", "loadouts\psm_e_mor.sqf"];
this addaction ["Echo Asst. Heavy Weapons (Mortar)", "loadouts\psm_e_mor_ab.sqf"];
this addaction ["Echo Heavy Weapons (SPG-9)", "loadouts\psm_e_hat.sqf"];
this addaction ["Echo Asst. Heavy Weapons (SPG-9)", "loadouts\psm_e_hat_ab.sqf"];
this addaction ["Echo Driver", "loadouts\psm_e_d.sqf"];
this addaction ["Fox Commander", "loadouts\psm_f_com.sqf"];
this addaction ["Fox Crewman", "loadouts\psm_f_crew.sqf"];
this addaction ["Fox Technician", "loadouts\psm_f_tech.sqf"];
this addaction ["Sierra Spotter", "loadouts\psm_s_spotter.sqf"];
this addaction ["Sierra Sniper (G29)", "loadouts\psm_s_sniper.sqf"];
this addaction ["Rodeo Pilot", "loadouts\pilot_rotaryPilot.sqf"];
this addaction ["Rodeo Co-Pilot (Crewman)", "loadouts\pilot_rotaryPilot.sqf"];
this addaction ["Whiskey Pilot", "loadouts\pilot_fixedWing.sqf"];
this addaction ["<t color=""#0000FF"">" +"Save Loadout", {(_this select 1) setVariable ["SR_Loadout",getUnitLoadout (_this select 1)];}];
this addaction ["<t color=""#0000FF"">" +"Load Loadout", {(_this select 1)  setUnitLoadout ((_this select 1)  getVariable ["SR_Loadout",[]]);}];