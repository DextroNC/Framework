_uniforms = [

	["Platoon", "#ffff00", "a3\ui_f\data\Map\Markers\NATO\b_hq.paa",
		[["Platoon Leader", "loadouts\aus_p_pl.sqf"],
		[Platoon Forward Observer, "loadouts\aus_p_fac.sqf"],
		["Platoon Engineer (Demo)", "loadouts\aus_p_e_demo.sqf"],
		["Platoon Engineer (EOD)", "loadouts\aus_p_e_eod.sqf"],
		["Platoon Engineer (Fortification)", "loadouts\aus_p_e_fort.sqf"],
		["Platoon Engineer (Repair)", "loadouts\aus_p_e_repair.sqf"],
		["Platoon DMR", "loadouts\aus_p_dmr.sqf"],
		["Platoon Driver", "loadouts\aus_p_driver.sqf"],
		["Platoon AR", "loadouts\aus_p_ar.sqf"],
		["Platoon Medic", "loadouts\aus_p_medic.sqf"]
	]],

	["Infantry", "#00ff00", "a3\ui_f\data\Map\Markers\NATO\b_inf.paa",
		[["Squad Leader", "loadouts\aus_o_sl.sqf"],
		["Combat Medic", "loadouts\aus_o_medic.sqf"],
		["Operator Rifleman", "loadouts\aus_o_rifleman.sqf"],
		["Operator AR", "loadouts\aus_o_ar.sqf"],
		["Operator LAT", "loadouts\aus_o_lat.sqf"],
		["Operator MMG", "loadouts\aus_o_mmg.sqf"],
		["Operator Asst. MMG", "loadouts\aus_o_mmgAsst.sqf"],
		["Operator MAT", "loadouts\aus_o_mat.sqf"],
		["Operator Asst. MAT", "loadouts\aus_o_matAsst.sqf"]
	]],

	["Specialists", "#00ff00", "a3\ui_f\data\Map\Markers\NATO\b_inf.paa",
		[["Operator Grenadier", "loadouts\aus_o_Grenadier.sqf"],
		["Operator DMR", "loadouts\aus_o_dmr.sqf"],
		["Operator Battlerifle", "loadouts\aus_o_br.sqf"],
		["Operator Specialist (M4A1)", "loadouts\aus_o_spec.sqf"],
		["Operator Breacher", "loadouts\aus_o_breacher.sqf"],
		["Operator Engineer (Demo)", "loadouts\aus_o_e_demo.sqf"],
		["Operator Engineer (EOD)", "loadouts\aus_o_e_eod.sqf"],
		["Operator Engineer (Fortification)", "loadouts\aus_o_e_fort.sqf"],
		["Operator Engineer (Repair)", "loadouts\aus_o_e_repair.sqf"]
	]],

	["Echo", "#ff8c00", "a3\ui_f\data\Map\Markers\NATO\b_maint.paa",
		[["Echo Rifleman", "loadouts\aus_e_rifleman.sqf"],
		["Echo AR", "loadouts\aus_e_ar.sqf"],
		["Echo Engineer (Demo)", "loadouts\aus_e_e_demo.sqf"],
		["Echo Engineer (EOD)", "loadouts\aus_e_e_eod.sqf"],
		["Echo Engineer (Fortification)", "loadouts\aus_e_e_fort.sqf"],
		["Echo Engineer (Repair)", "loadouts\aus_e_e_repair.sqf"],
		["Echo Heavy Weapons (Mortar)", "loadouts\aus_e_mor.sqf"],
		["Echo Asst. Heavy Weapons (Mortar)", "loadouts\aus_e_morAsst.sqf"],
		["Echo Heavy Weapons (HAT)", "loadouts\aus_e_hat.sqf"],
		["Echo Asst. Heavy Weapons (HAT)", "loadouts\aus_e_hatAsst.sqf"],
		["Echo Driver", "loadouts\aus_e_driver.sqf"]
	]],

	["Foxtrot", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_armor.paa",
		[["Fox Commander", "loadouts\aus_f_com.sqf"],
		["Fox Crewman", "loadouts\aus_f_crew.sqf"],
		["Fox Technician", "loadouts\aus_f_tech.sqf"]
	]],

	["Sierra", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_recon.paa",
		[["Sierra Spotter", "loadouts\aus_s_spotter.sqf"],
		["Sierra Sniper", "loadouts\aus_s_sniper.sqf"],
		["Sierra Sniper (M82A1)", "loadouts\aus_s_sniper2.sqf"],
		["Sierra Recon", "loadouts\aus_s_recon.sqf"]
	]],

	["Air", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_air.paa",
		[["Rodeo Pilot", "loadouts\pilot_rotaryPilot.sqf"],
		["Rodeo Co-Pilot (Crewman)", "loadouts\pilot_rotaryCrew.sqf"],
		["Whiskey Pilot", "loadouts\pilot_fixedWing.sqf"]
	]],

	["Lima", "#ff8c00", "a3\ui_f\data\Map\Markers\NATO\b_support.paa",
		[["Lima Technician", "loadouts\aus_e_e_repair.sqf"],
		["Lima Operator", "loadouts\aus_e_rifleman.sqf"]
	]]
];
					
[this, _uniforms] call fw_fnc_addUniformsToBox;