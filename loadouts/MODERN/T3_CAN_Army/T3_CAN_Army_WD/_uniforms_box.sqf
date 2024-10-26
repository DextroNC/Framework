_uniforms = [

	["Platoon", "#ffff00", "a3\ui_f\data\Map\Markers\NATO\b_hq.paa",
		[["Platoon Leader", "loadouts\can_p_pl.sqf"],
		["Platoon FAC", "loadouts\can_p_fac.sqf"],
		["Platoon Engineer (Demo)", "loadouts\can_p_e_demo.sqf"],
		["Platoon Engineer (EOD)", "loadouts\can_p_e_eod.sqf"],
		["Platoon Engineer (Fortification)", "loadouts\can_p_e_fort.sqf"],
		["Platoon Engineer (Repair)", "loadouts\can_p_e_repair.sqf"],
		["Platoon DMR", "loadouts\can_p_dmr.sqf"],
		["Platoon Driver", "loadouts\can_p_driver.sqf"],
		["Platoon AR", "loadouts\can_p_ar.sqf"],
		["Platoon Medic", "loadouts\can_p_medic.sqf"]
	]],

	["Infantry", "#00ff00", "a3\ui_f\data\Map\Markers\NATO\b_inf.paa",
		[["Squad Leader", "loadouts\can_o_sl.sqf"],
		["Combat Medic", "loadouts\can_o_medic.sqf"],
		["Operator Rifleman", "loadouts\can_o_rifleman.sqf"],
		["Operator AR", "loadouts\can_o_ar.sqf"],
		["Operator LAT", "loadouts\can_o_lat.sqf"],
		["Operator MMG", "loadouts\can_o_mmg.sqf"],
		["Operator Asst. MMG", "loadouts\can_o_mmgAsst.sqf"],
		["Operator MAT", "loadouts\can_o_mat.sqf"],
		["Operator Asst. MAT", "loadouts\can_o_matAsst.sqf"]
	]],

	["Specialists", "#00ff00", "a3\ui_f\data\Map\Markers\NATO\b_inf.paa",
		[["Operator Grenadier", "loadouts\can_o_Grenadier.sqf"],
		["Operator DMR", "loadouts\can_o_dmr.sqf"],
		["Operator Battlerifle", "loadouts\can_o_br.sqf"],
		["Operator Specialist (HK416)", "loadouts\can_o_spec.sqf"],
		["Operator Breacher", "loadouts\can_o_breacher.sqf"],
		["Operator Engineer (Demo)", "loadouts\can_o_e_demo.sqf"],
		["Operator Engineer (EOD)", "loadouts\can_o_e_eod.sqf"],
		["Operator Engineer (Fortification)", "loadouts\can_o_e_fort.sqf"],
		["Operator Engineer (Repair)", "loadouts\can_o_e_repair.sqf"]
	]],

	["Echo", "#ff8c00", "a3\ui_f\data\Map\Markers\NATO\b_maint.paa",
		[["Echo Rifleman", "loadouts\can_e_rifleman.sqf"],
		["Echo AR", "loadouts\can_e_ar.sqf"],
		["Echo Engineer (Demo)", "loadouts\can_e_e_demo.sqf"],
		["Echo Engineer (EOD)", "loadouts\can_e_e_eod.sqf"],
		["Echo Engineer (Fortification)", "loadouts\can_e_e_fort.sqf"],
		["Echo Engineer (Repair)", "loadouts\can_e_e_repair.sqf"],
		["Echo Heavy Weapons (Mortar)", "loadouts\can_e_mor.sqf"],
		["Echo Asst. Heavy Weapons (Mortar)", "loadouts\can_e_morAsst.sqf"],
		["Echo Heavy Weapons (HAT)", "loadouts\can_e_hat.sqf"],
		["Echo Asst. Heavy Weapons (HAT)", "loadouts\can_e_hatAsst.sqf"],
		["Echo Driver", "loadouts\can_e_driver.sqf"]
	]],

	["Foxtrot", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_armor.paa",
		[["Fox Commander", "loadouts\can_f_com.sqf"],
		["Fox Crewman", "loadouts\can_f_crew.sqf"],
		["Fox Technician", "loadouts\can_f_tech.sqf"]
	]],

	["Sierra", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_recon.paa",
		[["Sierra Spotter", "loadouts\can_s_spotter.sqf"],
		["Sierra Sniper", "loadouts\can_s_sniper.sqf"],
		["Sierra Sniper (M82A1)", "loadouts\can_s_sniper2.sqf"],
		["Sierra Recon", "loadouts\can_s_recon.sqf"]
	]],

	["Air", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_air.paa",
		[["Rodeo Pilot", "loadouts\pilot_rotaryPilot.sqf"],
		["Rodeo Co-Pilot (Crewman)", "loadouts\pilot_rotaryCrew.sqf"],
		["Whiskey Pilot", "loadouts\pilot_fixedWing.sqf"]
	]],

	["Lima", "#ff8c00", "a3\ui_f\data\Map\Markers\NATO\b_support.paa",
		[["Lima Technician", "loadouts\can_e_e_repair.sqf"],
		["Lima Operator", "loadouts\can_e_rifleman.sqf"]
	]]
];
					
[this, _uniforms] call fw_fnc_addUniformsToBox;