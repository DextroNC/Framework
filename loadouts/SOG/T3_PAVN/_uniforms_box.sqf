_uniforms = [

	["Platoon", "#ffff00", "a3\ui_f\data\Map\Markers\NATO\b_hq.paa",
		[["Platoon Leader", "loadouts\pavn_p_pl.sqf"],
		["Platoon Forward Observer", "loadouts\pavn_p_fac.sqf"],
		["Platoon Engineer (Demo)", "loadouts\pavn_p_e_demo.sqf"],
		["Platoon Engineer (EOD)", "loadouts\pavn_p_e_eod.sqf"],
		["Platoon Engineer (Fortification)", "loadouts\pavn_p_e_fort.sqf"],
		["Platoon Engineer (Repair)", "loadouts\pavn_p_e_repair.sqf"],
		["Platoon DMR", "loadouts\pavn_p_dmr.sqf"],
		["Platoon Driver", "loadouts\pavn_p_driver.sqf"],
		["Platoon AR", "loadouts\pavn_p_ar.sqf"],
		["Platoon Medic", "loadouts\pavn_p_medic.sqf"]
	]],

	["Infantry", "#00ff00", "a3\ui_f\data\Map\Markers\NATO\b_inf.paa",
		[["Squad Leader", "loadouts\pavn_o_sl.sqf"],
		["Combat Medic", "loadouts\pavn_o_medic.sqf"],
		["Operator Rifleman", "loadouts\pavn_o_rifleman.sqf"],
		["Operator AR", "loadouts\pavn_o_ar.sqf"],
		["Operator LAT", "loadouts\pavn_o_lat.sqf"],
		["Operator MAT", "loadouts\pavn_o_mat.sqf"],
		["Operator Asst. MAT", "loadouts\pavn_o_matAsst.sqf"]
	]],

	["Specialists", "#00ff00", "a3\ui_f\data\Map\Markers\NATO\b_inf.paa",
		[["Operator Grenadier", "loadouts\pavn_o_Grenadier.sqf"],
		["Operator DMR", "loadouts\pavn_o_dmr.sqf"],
		["Operator Battlerifle", "loadouts\pavn_o_br.sqf"],
		["Operator Specialist (Type-56 AK)", "loadouts\pavn_o_spec.sqf"],
		["Operator Breacher", "loadouts\pavn_o_breacher.sqf"],
		["Operator Engineer (Demo)", "loadouts\pavn_o_e_demo.sqf"],
		["Operator Engineer (EOD)", "loadouts\pavn_o_e_eod.sqf"],
		["Operator Engineer (Fortification)", "loadouts\pavn_o_e_fort.sqf"],
		["Operator Engineer (Repair)", "loadouts\pavn_o_e_repair.sqf"]
	]],

	["Echo", "#ff8c00", "a3\ui_f\data\Map\Markers\NATO\b_maint.paa",
		[["Echo Rifleman", "loadouts\pavn_e_rifleman.sqf"],
		["Echo AR", "loadouts\pavn_e_ar.sqf"],
		["Echo Engineer (Demo)", "loadouts\pavn_e_e_demo.sqf"],
		["Echo Engineer (EOD)", "loadouts\pavn_e_e_eod.sqf"],
		["Echo Engineer (Fortification)", "loadouts\pavn_e_e_fort.sqf"],
		["Echo Engineer (Repair)", "loadouts\pavn_e_e_repair.sqf"],
		["Echo Heavy Weapons (Mortar)", "loadouts\pavn_e_mor.sqf"],
		["Echo Asst. Heavy Weapons (Mortar)", "loadouts\pavn_e_morAsst.sqf"],
		["Echo Driver", "loadouts\pavn_e_driver.sqf"]
	]],

	["Foxtrot", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_armor.paa",
		[["Fox Commander", "loadouts\pavn_f_com.sqf"],
		["Fox Crewman", "loadouts\pavn_f_crew.sqf"],
		["Fox Technician", "loadouts\pavn_f_tech.sqf"]
	]],

	["Sierra", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_recon.paa",
		[["Sierra Spotter", "loadouts\pavn_s_spotter.sqf"],
		["Sierra Sniper", "loadouts\pavn_s_sniper.sqf"]
	]],

	["Air", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_air.paa",
		[["Rodeo Pilot", "loadouts\pilot_rotaryPilot.sqf"],
		["Rodeo Co-Pilot (Crewman)", "loadouts\pilot_rotaryCrew.sqf"],
		["Whiskey Pilot", "loadouts\pilot_fixedWing.sqf"]
	]],

	["Lima", "#ff8c00", "a3\ui_f\data\Map\Markers\NATO\b_support.paa",
		[["Lima Technician", "loadouts\pavn_e_e_repair.sqf"],
		["Lima Operator", "loadouts\pavn_e_rifleman.sqf"]
	]]
];
					
[this, _uniforms] call fw_fnc_addUniformsToBox;