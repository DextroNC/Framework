_uniforms = [

	["Platoon", "#ffff00", "a3\ui_f\data\Map\Markers\NATO\b_hq.paa",
		[["Platoon Leader", "loadouts\us_p_pl.sqf"],
		["Platoon Forward Observer", "loadouts\us_p_fac.sqf"],
		["Platoon Engineer (Demo)", "loadouts\us_p_e_demo.sqf"],
		["Platoon Engineer (EOD)", "loadouts\us_p_e_eod.sqf"],
		["Platoon Engineer (Fortification)", "loadouts\us_p_e_fort.sqf"],
		["Platoon Engineer (Repair)", "loadouts\us_p_e_repair.sqf"],
		["Platoon DMR", "loadouts\us_p_dmr.sqf"],
		["Platoon Driver", "loadouts\us_p_driver.sqf"],
		["Platoon AR", "loadouts\us_p_ar.sqf"],
		["Platoon Medic", "loadouts\us_p_medic.sqf"]
	]],

	["Infantry", "#00ff00", "a3\ui_f\data\Map\Markers\NATO\b_inf.paa",
		[["Squad Leader", "loadouts\us_o_sl.sqf"],
		["Combat Medic", "loadouts\us_o_medic.sqf"],
		["Operator Rifleman", "loadouts\us_o_rifleman.sqf"],
		["Operator AR", "loadouts\us_o_ar.sqf"],
		["Operator LAT", "loadouts\us_o_lat.sqf"],
		["Operator MMG", "loadouts\us_o_mmg.sqf"],
		["Operator Asst. MMG", "loadouts\us_o_mmgAsst.sqf"],
		["Operator MAT", "loadouts\us_o_mat.sqf"],
		["Operator Asst. MAT", "loadouts\us_o_matAsst.sqf"]
	]],

	["Specialists", "#00ff00", "a3\ui_f\data\Map\Markers\NATO\b_inf.paa",
		[["Operator Grenadier", "loadouts\us_o_Grenadier.sqf"],
		["Operator DMR", "loadouts\us_o_dmr.sqf"],
		["Operator Battlerifle", "loadouts\us_o_br.sqf"],
		["Operator Specialist (Thompson SMG)", "loadouts\us_o_spec.sqf"],
		["Operator Breacher", "loadouts\us_o_breacher.sqf"],
		["Operator Engineer (Demo)", "loadouts\us_o_e_demo.sqf"],
		["Operator Engineer (EOD)", "loadouts\us_o_e_eod.sqf"],
		["Operator Engineer (Fortification)", "loadouts\us_o_e_fort.sqf"],
		["Operator Engineer (Repair)", "loadouts\us_o_e_repair.sqf"]
	]],

	["Echo", "#ff8c00", "a3\ui_f\data\Map\Markers\NATO\b_maint.paa",
		[["Echo Rifleman", "loadouts\us_e_rifleman.sqf"],
		["Echo AR", "loadouts\us_e_ar.sqf"],
		["Echo Engineer (Demo)", "loadouts\us_e_e_demo.sqf"],
		["Echo Engineer (EOD)", "loadouts\us_e_e_eod.sqf"],
		["Echo Engineer (Fortification)", "loadouts\us_e_e_fort.sqf"],
		["Echo Engineer (Repair)", "loadouts\us_e_e_repair.sqf"],
		["Echo Heavy Weapons (Mortar)", "loadouts\us_e_mor.sqf"],
		["Echo Asst. Heavy Weapons (Mortar)", "loadouts\us_e_morAsst.sqf"],
		["Echo Heavy Weapons (HAT)", "loadouts\us_e_hat.sqf"],
		["Echo Asst. Heavy Weapons (HAT)", "loadouts\us_e_hatAsst.sqf"],
		["Echo Driver", "loadouts\us_e_driver.sqf"]
	]],

	["Foxtrot", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_armor.paa",
		[["Fox Commander", "loadouts\us_f_com.sqf"],
		["Fox Crewman", "loadouts\us_f_crew.sqf"],
		["Fox Technician", "loadouts\us_f_tech.sqf"]
	]],

	["Sierra", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_recon.paa",
		[["Sierra Spotter", "loadouts\us_s_spotter.sqf"],
		["Sierra Sniper", "loadouts\us_s_sniper.sqf"]
	]],

	["Air", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_air.paa",
		[["Rodeo Pilot", "loadouts\pilot_rotaryPilot.sqf"],
		["Rodeo Co-Pilot (Crewman)", "loadouts\pilot_rotaryCrew.sqf"],
		["Whiskey Pilot", "loadouts\pilot_fixedWing.sqf"]
	]],

	["Lima", "#ff8c00", "a3\ui_f\data\Map\Markers\NATO\b_support.paa",
		[["Lima Technician", "loadouts\us_e_e_repair.sqf"],
		["Lima Operator", "loadouts\us_e_rifleman.sqf"]
	]]
];
					
[this, _uniforms] call fw_fnc_addUniformsToBox;