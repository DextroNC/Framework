this addaction ["Platoon Leader", "loadouts\aaf_pl.sqf"];
this addaction ["Platoon FAC", "loadouts\aaf_p_fac.sqf"];
this addaction ["Platoon Engineer (Demo)", "loadouts\aaf_p_e_demo.sqf"];
this addaction ["Platoon Engineer (EOD)", "loadouts\aaf_p_e_eod.sqf"];
this addaction ["Platoon Engineer (Fortification)", "loadouts\aaf_p_e_fort.sqf"];
this addaction ["Platoon Engineer (Repair)", "loadouts\aaf_p_e_rep.sqf"];
this addaction ["Platoon DMR", "loadouts\aaf_p_dmr.sqf"];
this addaction ["Platoon Driver", "loadouts\aaf_p_d.sqf"];
this addaction ["Platoon AR", "loadouts\aaf_p_ar.sqf"];
this addaction ["Platoon UAV", "loadouts\aaf_p_uav.sqf"];
this addaction ["Platoon Medic", "loadouts\aaf_p_medic.sqf"];
this addaction ["Squad Leader", "loadouts\aaf_sl.sqf"];
this addaction ["Combat Medic", "loadouts\aaf_medic.sqf"];
this addaction ["Operator Rifle", "loadouts\aaf_o_r.sqf"];
this addaction ["Operator AR", "loadouts\aaf_o_ar.sqf"];
this addaction ["Operator Light AT", "loadouts\aaf_o_lat.sqf"];
this addaction ["Operator Medium AT", "loadouts\aaf_o_mat.sqf"];
this addaction ["Operator Asst. Medium AT", "loadouts\aaf_o_mat_ab.sqf"];
this addaction ["Operator Grenadier", "loadouts\aaf_o_g.sqf"];
this addaction ["Operator DMR (5.56)", "loadouts\aaf_o_dmr.sqf"];
this addaction ["Operator Battlerifle (G3)", "loadouts\aaf_o_br.sqf"];
this addaction ["Operator Specialist (MTAR)", "loadouts\aaf_o_spc.sqf"];
this addaction ["Operator Breacher", "loadouts\aaf_o_breacher.sqf"];
this addaction ["Operator Engineer (Demo)", "loadouts\aaf_o_e_demo.sqf"];
this addaction ["Operator Engineer (EOD)", "loadouts\aaf_o_e_eod.sqf"];
this addaction ["Operator Engineer (Fortification)", "loadouts\aaf_o_e_fort.sqf"];
this addaction ["Operator Engineer (Repair)", "loadouts\aaf_o_e_rep.sqf"];
this addaction ["Echo Rifleman", "loadouts\aaf_e_r.sqf"];
this addaction ["Echo AR", "loadouts\aaf_e_ar.sqf"];
this addaction ["Echo Engineer (Demo)", "loadouts\aaf_e_e_demo.sqf"];
this addaction ["Echo Engineer (EOD)", "loadouts\aaf_e_e_eod.sqf"];
this addaction ["Echo Engineer (Fortification)", "loadouts\aaf_e_e_fort.sqf"];
this addaction ["Echo Engineer (Repair)", "loadouts\aaf_e_e_rep.sqf"];
this addaction ["Echo Heavy Weapons (Mortar)", "loadouts\aaf_e_mor.sqf"];
this addaction ["Echo Asst. Heavy Weapons (Mortar)", "loadouts\aaf_e_mor_ab.sqf"];
this addaction ["Echo Heavy Weapons (HAT)", "loadouts\aaf_e_hat.sqf"];
this addaction ["Echo Asst. Heavy Weapons (HAT)", "loadouts\aaf_e_hat_ab.sqf"];
this addaction ["Echo Driver", "loadouts\aaf_e_d.sqf"];
this addaction ["Fox Commander", "loadouts\aaf_f_com.sqf"];
this addaction ["Fox Crewman", "loadouts\aaf_f_crew.sqf"];
this addaction ["Fox Technician", "loadouts\aaf_f_tech.sqf"];
this addaction ["Sierra Spotter", "loadouts\aaf_s_spotter.sqf"];
this addaction ["Sierra Sniper (G29)", "loadouts\aaf_s_sniper.sqf"];
this addaction ["Sierra Recon", "loadouts\aaf_s_recon.sqf"];
this addaction ["Rodeo Pilot", "loadouts\pilot_rotaryPilot.sqf"];
this addaction ["Rodeo Co-Pilot (Crewman)", "loadouts\pilot_rotaryPilot.sqf"];
this addaction ["Whiskey Pilot", "loadouts\pilot_fixedWing.sqf"];
this addaction ["<t color=""#0000FF"">" +"Save Loadout", {(_this select 1) setVariable ["SR_Loadout",getUnitLoadout (_this select 1)];}];
this addaction ["<t color=""#0000FF"">" +"Load Loadout", {(_this select 1)  setUnitLoadout ((_this select 1)  getVariable ["SR_Loadout",[]]);}];