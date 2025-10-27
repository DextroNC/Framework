_uniforms = [

	["Platoon", "#ffff00", "a3\ui_f\data\Map\Markers\NATO\b_hq.paa",
		[["Platoon Leader", "loadouts\rok_p_pl.sqf"],
		["Platoon Forward Observer", "loadouts\rok_p_fac.sqf"],
		["Platoon Engineer (Demo)", "loadouts\rok_p_e_demo.sqf"],
		["Platoon Engineer (EOD)", "loadouts\rok_p_e_eod.sqf"],
		["Platoon Engineer (Fortification)", "loadouts\rok_p_e_fort.sqf"],
		["Platoon Engineer (Repair)", "loadouts\rok_p_e_repair.sqf"],
		["Platoon DMR", "loadouts\rok_p_dmr.sqf"],
		["Platoon Driver", "loadouts\rok_p_driver.sqf"],
		["Platoon AR", "loadouts\rok_p_ar.sqf"],
		["Platoon Medic", "loadouts\rok_p_medic.sqf"]
	]],

	["Infantry", "#00ff00", "a3\ui_f\data\Map\Markers\NATO\b_inf.paa",
		[["Squad Leader", "loadouts\rok_o_sl.sqf"],
		["Combat Medic", "loadouts\rok_o_medic.sqf"],
		["Operator Rifleman", "loadouts\rok_o_rifleman.sqf"],
		["Operator AR", "loadouts\rok_o_ar.sqf"],
		["Operator LAT", "loadouts\rok_o_lat.sqf"],
		["Operator MMG", "loadouts\rok_o_mmg.sqf"],
		["Operator Asst. MMG", "loadouts\rok_o_mmgAsst.sqf"],
		["Operator MAT", "loadouts\rok_o_mat.sqf"],
		["Operator Asst. MAT", "loadouts\rok_o_matAsst.sqf"]
	]],

	["Specialists", "#00ff00", "a3\ui_f\data\Map\Markers\NATO\b_inf.paa",
		[["Operator Grenadier", "loadouts\rok_o_Grenadier.sqf"],
		["Operator DMR", "loadouts\rok_o_dmr.sqf"],
		["Operator Specialist (M16A1)", "loadouts\rok_o_spec.sqf"],
		["Operator Breacher", "loadouts\rok_o_breacher.sqf"],
		["Operator Engineer (Demo)", "loadouts\rok_o_e_demo.sqf"],
		["Operator Engineer (EOD)", "loadouts\rok_o_e_eod.sqf"],
		["Operator Engineer (Fortification)", "loadouts\rok_o_e_fort.sqf"],
		["Operator Engineer (Repair)", "loadouts\rok_o_e_repair.sqf"]
	]],

	["Echo", "#ff8c00", "a3\ui_f\data\Map\Markers\NATO\b_maint.paa",
		[["Echo Rifleman", "loadouts\rok_e_rifleman.sqf"],
		["Echo AR", "loadouts\rok_e_ar.sqf"],
		["Echo Engineer (Demo)", "loadouts\rok_e_e_demo.sqf"],
		["Echo Engineer (EOD)", "loadouts\rok_e_e_eod.sqf"],
		["Echo Engineer (Fortification)", "loadouts\rok_e_e_fort.sqf"],
		["Echo Engineer (Repair)", "loadouts\rok_e_e_repair.sqf"],
		["Echo Heavy Weapons (Mortar)", "loadouts\rok_e_mor.sqf"],
		["Echo Asst. Heavy Weapons (Mortar)", "loadouts\rok_e_morAsst.sqf"],
		["Echo Driver", "loadouts\rok_e_driver.sqf"]
	]],

	["Foxtrot", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_armor.paa",
		[["Fox Commander", "loadouts\rok_f_com.sqf"],
		["Fox Crewman", "loadouts\rok_f_crew.sqf"],
		["Fox Technician", "loadouts\rok_f_tech.sqf"]
	]],

	["Sierra", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_recon.paa",
		[["Sierra Spotter", "loadouts\rok_s_spotter.sqf"],
		["Sierra Sniper", "loadouts\rok_s_sniper.sqf"]
	]],

	["Air", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_air.paa",
		[["Rodeo Pilot", "loadouts\pilot_rotaryPilot.sqf"],
		["Rodeo Co-Pilot (Crewman)", "loadouts\pilot_rotaryCrew.sqf"],
		["Whiskey Pilot", "loadouts\pilot_fixedWing.sqf"]
	]],

	["Lima", "#ff8c00", "a3\ui_f\data\Map\Markers\NATO\b_support.paa",
		[["Lima Technician", "loadouts\rok_e_e_repair.sqf"],
		["Lima Operator", "loadouts\rok_e_rifleman.sqf"]
	]]
];
					
[this, _uniforms] call fw_fnc_addUniformsToBox;