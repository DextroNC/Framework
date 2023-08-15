_uniforms = [

	["Platoon", "#ffff00", "a3\ui_f\data\Map\Markers\NATO\b_hq.paa",
		[["Platoon Leader", "loadouts\esp_p_pl.sqf"],
		["Platoon FAC", "loadouts\esp_p_fac.sqf"],
		["Platoon Engineer (Demo)", "loadouts\esp_p_e_demo.sqf"],
		["Platoon Engineer (EOD)", "loadouts\esp_p_e_eod.sqf"],
		["Platoon Engineer (Fortification)", "loadouts\esp_p_e_fort.sqf"],
		["Platoon Engineer (Repair)", "loadouts\esp_p_e_repair.sqf"],
		["Platoon DMR", "loadouts\esp_p_dmr.sqf"],
		["Platoon Driver", "loadouts\esp_p_driver.sqf"],
		["Platoon AR", "loadouts\esp_p_ar.sqf"],
		["Platoon Medic", "loadouts\esp_p_medic.sqf"]
	]],

	["Infantry", "#00ff00", "a3\ui_f\data\Map\Markers\NATO\b_inf.paa",
		[["Squad Leader", "loadouts\esp_o_sl.sqf"],
		["Combat Medic", "loadouts\esp_o_medic.sqf"],
		["Operator Rifleman", "loadouts\esp_o_rifleman.sqf"],
		["Operator AR", "loadouts\esp_o_ar.sqf"],
		["Operator LAT", "loadouts\esp_o_lat.sqf"],
		["Operator MMG", "loadouts\esp_o_mmg.sqf"],
		["Operator Asst. MMG", "loadouts\esp_o_mmgAsst.sqf"],
		["Operator MAT", "loadouts\esp_o_mat.sqf"],
		["Operator Asst. MAT", "loadouts\esp_o_matAsst.sqf"]
	]],

	["Specialists", "#00ff00", "a3\ui_f\data\Map\Markers\NATO\b_inf.paa",
		[["Operator Grenadier", "loadouts\esp_o_Grenadier.sqf"],
		["Operator DMR", "loadouts\esp_o_dmr.sqf"],
		["Operator Battlerifle", "loadouts\esp_o_br.sqf"],
		["Operator Specialist (HK416)", "loadouts\esp_o_spec.sqf"],
		["Operator Breacher", "loadouts\esp_o_breacher.sqf"],
		["Operator Engineer (Demo)", "loadouts\esp_o_e_demo.sqf"],
		["Operator Engineer (EOD)", "loadouts\esp_o_e_eod.sqf"],
		["Operator Engineer (Fortification)", "loadouts\esp_o_e_fort.sqf"],
		["Operator Engineer (Repair)", "loadouts\esp_o_e_repair.sqf"]
	]],

	["Echo", "#ff8c00", "a3\ui_f\data\Map\Markers\NATO\b_maint.paa",
		[["Echo Rifleman", "loadouts\esp_e_rifleman.sqf"],
		["Echo AR", "loadouts\esp_e_ar.sqf"],
		["Echo Engineer (Demo)", "loadouts\esp_e_e_demo.sqf"],
		["Echo Engineer (EOD)", "loadouts\esp_e_e_eod.sqf"],
		["Echo Engineer (Fortification)", "loadouts\esp_e_e_fort.sqf"],
		["Echo Engineer (Repair)", "loadouts\esp_e_e_repair.sqf"],
		["Echo Heavy Weapons (Mortar)", "loadouts\esp_e_mor.sqf"],
		["Echo Asst. Heavy Weapons (Mortar)", "loadouts\esp_e_morAsst.sqf"],
		["Echo Heavy Weapons (HAT)", "loadouts\esp_e_hat.sqf"],
		["Echo Asst. Heavy Weapons (HAT)", "loadouts\esp_e_hatAsst.sqf"],
		["Echo Driver", "loadouts\esp_e_driver.sqf"]
	]],

	["Foxtrot", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_armor.paa",
		[["Fox Commander", "loadouts\esp_f_com.sqf"],
		["Fox Crewman", "loadouts\esp_f_crew.sqf"],
		["Fox Technician", "loadouts\esp_f_tech.sqf"]
	]],

	["Sierra", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_recon.paa",
		[["Sierra Spotter", "loadouts\esp_s_spotter.sqf"],
		["Sierra Sniper", "loadouts\esp_s_sniper.sqf"],
		["Sierra Sniper (M82A1)", "loadouts\esp_s_sniper2.sqf"],
		["Sierra Recon", "loadouts\esp_s_recon.sqf"]
	]],

	["Air", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_air.paa",
		[["Rodeo Pilot", "loadouts\pilot_rotaryPilot.sqf"],
		["Rodeo Co-Pilot (Crewman)", "loadouts\pilot_rotaryCrew.sqf"],
		["Whiskey Pilot", "loadouts\pilot_fixedWing.sqf"]
	]],

	["Lima", "#ff8c00", "a3\ui_f\data\Map\Markers\NATO\b_support.paa",
		[["Lima Technician", "loadouts\esp_e_e_repair.sqf"],
		["Lima Operator", "loadouts\esp_e_rifleman.sqf"]
	]]
];
					
[this, _uniforms] call fw_fnc_addUniformsToBox;