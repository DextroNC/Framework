_uniforms = [

	["Platoon", "#ffff00", "a3\ui_f\data\Map\Markers\NATO\b_hq.paa",
		[["Platoon Leader", "loadouts\aaf_p_pl.sqf"],
		["Platoon Forward Observer", "loadouts\aaf_p_fac.sqf"],
		["Platoon Engineer (Demo)", "loadouts\aaf_p_e_demo.sqf"],
		["Platoon Engineer (EOD)", "loadouts\aaf_p_e_eod.sqf"],
		["Platoon Engineer (Fortification)", "loadouts\aaf_p_e_fort.sqf"],
		["Platoon Engineer (Repair)", "loadouts\aaf_p_e_repair.sqf"],
		["Platoon DMR", "loadouts\aaf_p_dmr.sqf"],
		["Platoon Driver", "loadouts\aaf_p_driver.sqf"],
		["Platoon AR", "loadouts\aaf_p_ar.sqf"],
		["Platoon Medic", "loadouts\aaf_p_medic.sqf"]
	]],

	["Infantry", "#00ff00", "a3\ui_f\data\Map\Markers\NATO\b_inf.paa",
		[["Squad Leader", "loadouts\aaf_o_sl.sqf"],
		["Combat Medic", "loadouts\aaf_o_medic.sqf"],
		["Operator Rifleman", "loadouts\aaf_o_rifleman.sqf"],
		["Operator AR", "loadouts\aaf_o_ar.sqf"],
		["Operator LAT", "loadouts\aaf_o_lat.sqf"],
		["Operator MMG", "loadouts\aaf_o_mmg.sqf"],
		["Operator Asst. MMG", "loadouts\aaf_o_mmgAsst.sqf"],
		["Operator MAT", "loadouts\aaf_o_mat.sqf"],
		["Operator Asst. MAT", "loadouts\aaf_o_matAsst.sqf"]
	]],

	["Specialists", "#00ff00", "a3\ui_f\data\Map\Markers\NATO\b_inf.paa",
		[["Operator Grenadier", "loadouts\aaf_o_Grenadier.sqf"],
		["Operator DMR", "loadouts\aaf_o_dmr.sqf"],
		["Operator Battlerifle", "loadouts\aaf_o_br.sqf"],
		["Operator Specialist (QBZ-95)", "loadouts\aaf_o_spec.sqf"],
		["Operator Breacher", "loadouts\aaf_o_breacher.sqf"],
		["Operator Engineer (Demo)", "loadouts\aaf_o_e_demo.sqf"],
		["Operator Engineer (EOD)", "loadouts\aaf_o_e_eod.sqf"],
		["Operator Engineer (Fortification)", "loadouts\aaf_o_e_fort.sqf"],
		["Operator Engineer (Repair)", "loadouts\aaf_o_e_repair.sqf"]
	]],

	["Echo", "#ff8c00", "a3\ui_f\data\Map\Markers\NATO\b_maint.paa",
		[["Echo Rifleman", "loadouts\aaf_e_rifleman.sqf"],
		["Echo AR", "loadouts\aaf_e_ar.sqf"],
		["Echo Engineer (Demo)", "loadouts\aaf_e_e_demo.sqf"],
		["Echo Engineer (EOD)", "loadouts\aaf_e_e_eod.sqf"],
		["Echo Engineer (Fortification)", "loadouts\aaf_e_e_fort.sqf"],
		["Echo Engineer (Repair)", "loadouts\aaf_e_e_repair.sqf"],
		["Echo Heavy Weapons (Mortar)", "loadouts\aaf_e_mor.sqf"],
		["Echo Asst. Heavy Weapons (Mortar)", "loadouts\aaf_e_morAsst.sqf"],
		["Echo Heavy Weapons (HAT)", "loadouts\aaf_e_hat.sqf"],
		["Echo Asst. Heavy Weapons (HAT)", "loadouts\aaf_e_hatAsst.sqf"],
		["Echo Driver", "loadouts\aaf_e_driver.sqf"]
	]],

	["Foxtrot", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_armor.paa",
		[["Fox Commander", "loadouts\aaf_f_com.sqf"],
		["Fox Crewman", "loadouts\aaf_f_crew.sqf"],
		["Fox Technician", "loadouts\aaf_f_tech.sqf"]
	]],

	["Sierra", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_recon.paa",
		[["Sierra Spotter", "loadouts\aaf_s_spotter.sqf"],
		["Sierra Sniper", "loadouts\aaf_s_sniper.sqf"],
		["Sierra Sniper (M82A1)", "loadouts\aaf_s_sniper2.sqf"],
		["Sierra Recon", "loadouts\aaf_s_recon.sqf"]
	]],

	["Air", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_air.paa",
		[["Rodeo Pilot", "loadouts\pilot_rotaryPilot.sqf"],
		["Rodeo Co-Pilot (Crewman)", "loadouts\pilot_rotaryCrew.sqf"],
		["Whiskey Pilot", "loadouts\pilot_fixedWing.sqf"]
	]],

	["Lima", "#ff8c00", "a3\ui_f\data\Map\Markers\NATO\b_support.paa",
		[["Lima Technician", "loadouts\aaf_e_e_repair.sqf"],
		["Lima Operator", "loadouts\aaf_e_rifleman.sqf"]
	]]
];
					
[this, _uniforms] call fw_fnc_addUniformsToBox;