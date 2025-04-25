_uniforms = [

	["Platoon", "#ffff00", "a3\ui_f\data\Map\Markers\NATO\b_hq.paa",
		[["Platoon Leader", "loadouts\fin_p_pl.sqf"],
		["Platoon Forward Observer", "loadouts\fin_p_fac.sqf"],
		["Platoon Engineer (Demo)", "loadouts\fin_p_e_demo.sqf"],
		["Platoon Engineer (EOD)", "loadouts\fin_p_e_eod.sqf"],
		["Platoon Engineer (Fortification)", "loadouts\fin_p_e_fort.sqf"],
		["Platoon Engineer (Repair)", "loadouts\fin_p_e_repair.sqf"],
		["Platoon DMR", "loadouts\fin_p_dmr.sqf"],
		["Platoon Driver", "loadouts\fin_p_driver.sqf"],
		["Platoon AR", "loadouts\fin_p_ar.sqf"],
		["Platoon Medic", "loadouts\fin_p_medic.sqf"]
	]],

	["Infantry", "#00ff00", "a3\ui_f\data\Map\Markers\NATO\b_inf.paa",
		[["Squad Leader", "loadouts\fin_o_sl.sqf"],
		["Combat Medic", "loadouts\fin_o_medic.sqf"],
		["Operator Rifleman", "loadouts\fin_o_rifleman.sqf"],
		["Operator AR", "loadouts\fin_o_ar.sqf"],
		["Operator LAT", "loadouts\fin_o_lat.sqf"],
		["Operator LA (NLAW)", "loadouts\fin_o_lat2.sqf"],
		["Operator MAT", "loadouts\fin_o_mat.sqf"],
		["Operator Asst. MAT", "loadouts\fin_o_matAsst.sqf"]
	]],

	["Specialists", "#00ff00", "a3\ui_f\data\Map\Markers\NATO\b_inf.paa",
		[["Operator Grenadier", "loadouts\fin_o_Grenadier.sqf"],
		["Operator DMR", "loadouts\fin_o_dmr.sqf"],
		["Operator Battlerifle", "loadouts\fin_o_br.sqf"],
		["Operator Specialist (Sako M23)", "loadouts\fin_o_spec.sqf"],
		["Operator Breacher", "loadouts\fin_o_breacher.sqf"],
		["Operator Engineer (Demo)", "loadouts\fin_o_e_demo.sqf"],
		["Operator Engineer (EOD)", "loadouts\fin_o_e_eod.sqf"],
		["Operator Engineer (Fortification)", "loadouts\fin_o_e_fort.sqf"],
		["Operator Engineer (Repair)", "loadouts\fin_o_e_repair.sqf"]
	]],

	["Echo", "#ff8c00", "a3\ui_f\data\Map\Markers\NATO\b_maint.paa",
		[["Echo Rifleman", "loadouts\fin_e_rifleman.sqf"],
		["Echo AR", "loadouts\fin_e_ar.sqf"],
		["Echo Engineer (Demo)", "loadouts\fin_e_e_demo.sqf"],
		["Echo Engineer (EOD)", "loadouts\fin_e_e_eod.sqf"],
		["Echo Engineer (Fortification)", "loadouts\fin_e_e_fort.sqf"],
		["Echo Engineer (Repair)", "loadouts\fin_e_e_repair.sqf"],
		["Echo Heavy Weapons (Mortar)", "loadouts\fin_e_mor.sqf"],
		["Echo Asst. Heavy Weapons (Mortar)", "loadouts\fin_e_morAsst.sqf"],
		["Echo Heavy Weapons (HAT)", "loadouts\fin_e_hat.sqf"],
		["Echo Asst. Heavy Weapons (HAT)", "loadouts\fin_e_hatAsst.sqf"],
		["Echo Driver", "loadouts\fin_e_driver.sqf"]
	]],

	["Foxtrot", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_armor.paa",
		[["Fox Commander", "loadouts\fin_f_com.sqf"],
		["Fox Crewman", "loadouts\fin_f_crew.sqf"],
		["Fox Technician", "loadouts\fin_f_tech.sqf"]
	]],

	["Sierra", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_recon.paa",
		[["Sierra Spotter", "loadouts\fin_s_spotter.sqf"],
		["Sierra Sniper", "loadouts\fin_s_sniper.sqf"],
		["Sierra Sniper (M82A1)", "loadouts\fin_s_sniper2.sqf"],
		["Sierra Recon", "loadouts\fin_s_recon.sqf"]
	]],

	["Air", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_air.paa",
		[["Rodeo Pilot", "loadouts\pilot_rotaryPilot.sqf"],
		["Rodeo Co-Pilot (Crewman)", "loadouts\pilot_rotaryCrew.sqf"],
		["Whiskey Pilot", "loadouts\pilot_fixedWing.sqf"]
	]],

	["Lima", "#ff8c00", "a3\ui_f\data\Map\Markers\NATO\b_support.paa",
		[["Lima Technician", "loadouts\fin_e_e_repair.sqf"],
		["Lima Operator", "loadouts\fin_e_rifleman.sqf"]
	]]
];
					
[this, _uniforms] call fw_fnc_addUniformsToBox;