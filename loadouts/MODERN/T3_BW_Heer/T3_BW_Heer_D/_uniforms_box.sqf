_uniforms = [

	["Platoon", "#ffff00", "a3\ui_f\data\Map\Markers\NATO\b_hq.paa",
		[["Platoon Leader", "loadouts\bw_p_pl.sqf"],
		["Platoon Forward Observer", "loadouts\bw_p_fac.sqf"],
		["Platoon Engineer (Demo)", "loadouts\bw_p_e_demo.sqf"],
		["Platoon Engineer (EOD)", "loadouts\bw_p_e_eod.sqf"],
		["Platoon Engineer (Fortification)", "loadouts\bw_p_e_fort.sqf"],
		["Platoon Engineer (Repair)", "loadouts\bw_p_e_repair.sqf"],
		["Platoon DMR", "loadouts\bw_p_dmr.sqf"],
		["Platoon Driver", "loadouts\bw_p_driver.sqf"],
		["Platoon AR", "loadouts\bw_p_ar.sqf"],
		["Platoon Medic", "loadouts\bw_p_medic.sqf"]
	]],

	["Infantry", "#00ff00", "a3\ui_f\data\Map\Markers\NATO\b_inf.paa",
		[["Squad Leader", "loadouts\bw_o_sl.sqf"],
		["Combat Medic", "loadouts\bw_o_medic.sqf"],
		["Operator Rifleman", "loadouts\bw_o_rifleman.sqf"],
		["Operator AR", "loadouts\bw_o_ar.sqf"],
		["Operator LAT", "loadouts\bw_o_lat.sqf"],
		["Operator MMG", "loadouts\bw_o_mmg.sqf"],
		["Operator Asst. MMG", "loadouts\bw_o_mmgAsst.sqf"],
		["Operator MAT", "loadouts\bw_o_mat.sqf"],
		["Operator Asst. MAT", "loadouts\bw_o_matAsst.sqf"]
	]],

	["Specialists", "#00ff00", "a3\ui_f\data\Map\Markers\NATO\b_inf.paa",
		[["Operator Grenadier", "loadouts\bw_o_Grenadier.sqf"],
		["Operator DMR", "loadouts\bw_o_dmr.sqf"],
		["Operator Battlerifle", "loadouts\bw_o_br.sqf"],
		["Operator Specialist (HK416 D10)", "loadouts\bw_o_spec.sqf"],
		["Operator Breacher", "loadouts\bw_o_breacher.sqf"],
		["Operator Engineer (Demo)", "loadouts\bw_o_e_demo.sqf"],
		["Operator Engineer (EOD)", "loadouts\bw_o_e_eod.sqf"],
		["Operator Engineer (Fortification)", "loadouts\bw_o_e_fort.sqf"],
		["Operator Engineer (Repair)", "loadouts\bw_o_e_repair.sqf"]
	]],

	["Echo", "#ff8c00", "a3\ui_f\data\Map\Markers\NATO\b_maint.paa",
		[["Echo Rifleman", "loadouts\bw_e_rifleman.sqf"],
		["Echo AR", "loadouts\bw_e_ar.sqf"],
		["Echo Engineer (Demo)", "loadouts\bw_e_e_demo.sqf"],
		["Echo Engineer (EOD)", "loadouts\bw_e_e_eod.sqf"],
		["Echo Engineer (Fortification)", "loadouts\bw_e_e_fort.sqf"],
		["Echo Engineer (Repair)", "loadouts\bw_e_e_repair.sqf"],
		["Echo Heavy Weapons (Mortar)", "loadouts\bw_e_mor.sqf"],
		["Echo Asst. Heavy Weapons (Mortar)", "loadouts\bw_e_morAsst.sqf"],
		["Echo Heavy Weapons (HAT)", "loadouts\bw_e_hat.sqf"],
		["Echo Asst. Heavy Weapons (HAT)", "loadouts\bw_e_hatAsst.sqf"],
		["Echo Driver", "loadouts\bw_e_driver.sqf"]
	]],

	["Foxtrot", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_armor.paa",
		[["Fox Commander", "loadouts\bw_f_com.sqf"],
		["Fox Crewman", "loadouts\bw_f_crew.sqf"],
		["Fox Technician", "loadouts\bw_f_tech.sqf"]
	]],

	["Sierra", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_recon.paa",
		[["Sierra Spotter", "loadouts\bw_s_spotter.sqf"],
		["Sierra Sniper", "loadouts\bw_s_sniper.sqf"],
		["Sierra Sniper (M82A1)", "loadouts\bw_s_sniper2.sqf"],
		["Sierra Recon", "loadouts\bw_s_recon.sqf"]
	]],

	["Air", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_air.paa",
		[["Rodeo Pilot", "loadouts\pilot_rotaryPilot.sqf"],
		["Rodeo Co-Pilot (Crewman)", "loadouts\pilot_rotaryCrew.sqf"],
		["Whiskey Pilot", "loadouts\pilot_fixedWing.sqf"]
	]],

	["Lima", "#ff8c00", "a3\ui_f\data\Map\Markers\NATO\b_support.paa",
		[["Lima Technician", "loadouts\bw_e_e_repair.sqf"],
		["Lima Operator", "loadouts\bw_e_rifleman.sqf"]
	]]
];
					
[this, _uniforms] call fw_fnc_addUniformsToBox;