_uniforms = [

	["Platoon", "#ffff00", "a3\ui_f\data\Map\Markers\NATO\b_hq.paa",
		[["Platoon Leader", "loadouts\lpdf_p_pl.sqf"],
		["Platoon FAC", "loadouts\lpdf_p_fac.sqf"],
		["Platoon Engineer (Demo)", "loadouts\lpdf_p_e_demo.sqf"],
		["Platoon Engineer (EOD)", "loadouts\lpdf_p_e_eod.sqf"],
		["Platoon Engineer (Fortification)", "loadouts\lpdf_p_e_fort.sqf"],
		["Platoon Engineer (Repair)", "loadouts\lpdf_p_e_repair.sqf"],
		["Platoon DMR", "loadouts\lpdf_p_dmr.sqf"],
		["Platoon Driver", "loadouts\lpdf_p_driver.sqf"],
		["Platoon AR", "loadouts\lpdf_p_ar.sqf"],
		["Platoon Medic", "loadouts\lpdf_p_medic.sqf"]
	]],

	["Infantry", "#00ff00", "a3\ui_f\data\Map\Markers\NATO\b_inf.paa",
		[["Squad Leader", "loadouts\lpdf_o_sl.sqf"],
		["Combat Medic", "loadouts\lpdf_o_medic.sqf"],
		["Operator Rifleman", "loadouts\lpdf_o_rifleman.sqf"],
		["Operator LAT", "loadouts\lpdf_o_lat.sqf"],
		["Operator AR", "loadouts\lpdf_o_ar.sqf"],
		["Operator MAT", "loadouts\lpdf_o_mat.sqf"],
		["Operator Asst. MAT", "loadouts\lpdf_o_matAsst.sqf"],
		["Operator MMG", "loadouts\lpdf_o_mmg.sqf"],
		["Operator Asst. MMG", "loadouts\lpdf_o_mmgAsst.sqf"]
	]],

	["Specialists", "#00ff00", "a3\ui_f\data\Map\Markers\NATO\b_inf.paa",
		[["Operator Grenadier", "loadouts\lpdf_o_Grenadier.sqf"],
		["Operator DMR", "loadouts\lpdf_o_dmr.sqf"],
		["Operator Battlerifle", "loadouts\lpdf_o_br.sqf"],
		["Operator Specialist (PPSH-41)", "loadouts\lpdf_o_spec.sqf"],
		["Operator Breacher", "loadouts\lpdf_o_breacher.sqf"],
		["Operator Engineer (Demo)", "loadouts\lpdf_o_e_demo.sqf"],
		["Operator Engineer (EOD)", "loadouts\lpdf_o_e_eod.sqf"],
		["Operator Engineer (Fortification)", "loadouts\lpdf_o_e_fort.sqf"],
		["Operator Engineer (Repair)", "loadouts\lpdf_o_e_repair.sqf"]
	]],

	["Echo", "#ff8c00", "a3\ui_f\data\Map\Markers\NATO\b_maint.paa",
		[["Echo Rifleman", "loadouts\lpdf_e_rifleman.sqf"],
		["Echo AR", "loadouts\lpdf_e_ar.sqf"],
		["Echo Engineer (Demo)", "loadouts\lpdf_e_e_demo.sqf"],
		["Echo Engineer (EOD)", "loadouts\lpdf_e_e_eod.sqf"],
		["Echo Engineer (Fortification)", "loadouts\lpdf_e_e_fort.sqf"],
		["Echo Engineer (Repair)", "loadouts\lpdf_e_e_repair.sqf"],
		["Echo Heavy Weapons (Mortar)", "loadouts\lpdf_e_mor.sqf"],
		["Echo Asst. Heavy Weapons (Mortar)", "loadouts\lpdf_e_morAsst.sqf"],
		["Echo Heavy Weapons (HAT)", "loadouts\lpdf_e_hat.sqf"],
		["Echo Asst. Heavy Weapons (HAT)", "loadouts\lpdf_e_hatAsst.sqf"],
		["Echo Driver", "loadouts\lpdf_e_driver.sqf"]
	]],

	["Foxtrot", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_armor.paa",
		[["Fox Commander", "loadouts\lpdf_f_com.sqf"],
		["Fox Crewman", "loadouts\lpdf_f_crew.sqf"],
		["Fox Technician", "loadouts\lpdf_f_tech.sqf"]
	]],

	["Sierra", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_recon.paa",
		[["Sierra Spotter", "loadouts\lpdf_s_spotter.sqf"],
		["Sierra Sniper", "loadouts\lpdf_s_sniper.sqf"]
	]],

	["Air", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_air.paa",
		[["Rodeo Pilot", "loadouts\pilot_rotaryPilot.sqf"],
		["Rodeo Co-Pilot (Crewman)", "loadouts\pilot_rotaryCrew.sqf"],
		["Whiskey Pilot", "loadouts\pilot_fixedWing.sqf"]
	]],

	["Lima", "#ff8c00", "a3\ui_f\data\Map\Markers\NATO\b_support.paa",
		[["Lima Technician", "loadouts\lpdf_e_e_repair.sqf"],
		["Lima Operator", "loadouts\lpdf_e_rifleman.sqf"]
	]]
];
					
[uniBox, _uniforms] call fw_fnc_addUniformsToBox;