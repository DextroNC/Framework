_uniforms = [

	["Platoon", "#ffff00", "a3\ui_f\data\Map\Markers\NATO\b_hq.paa",
		[["Platoon Leader", "loadouts\nlf_p_pl.sqf"],
		["Platoon Forward Observer", "loadouts\nlf_p_fac.sqf"],
		["Platoon Engineer (Demo)", "loadouts\nlf_p_e_demo.sqf"],
		["Platoon Engineer (EOD)", "loadouts\nlf_p_e_eod.sqf"],
		["Platoon Engineer (Fortification)", "loadouts\nlf_p_e_fort.sqf"],
		["Platoon Engineer (Repair)", "loadouts\nlf_p_e_repair.sqf"],
		["Platoon DMR", "loadouts\nlf_p_dmr.sqf"],
		["Platoon Driver", "loadouts\nlf_p_driver.sqf"],
		["Platoon AR", "loadouts\nlf_p_ar.sqf"],
		["Platoon Medic", "loadouts\nlf_p_medic.sqf"]
	]],

	["Infantry", "#00ff00", "a3\ui_f\data\Map\Markers\NATO\b_inf.paa",
		[["Squad Leader", "loadouts\nlf_o_sl.sqf"],
		["Combat Medic", "loadouts\nlf_o_medic.sqf"],
		["Operator Rifleman", "loadouts\nlf_o_rifleman.sqf"],
		["Operator AR", "loadouts\nlf_o_ar.sqf"],
		["Operator Asst. AR", "loadouts\nlf_o_mmgasst.sqf"],
		["Operator LAT", "loadouts\nlf_o_lat.sqf"],
		["Operator MAT", "loadouts\nlf_o_mat.sqf"],
		["Operator Asst. MAT", "loadouts\nlf_o_matAsst.sqf"]
	]],

	["Specialists", "#00ff00", "a3\ui_f\data\Map\Markers\NATO\b_inf.paa",
		[["Operator Grenadier", "loadouts\nlf_o_Grenadier.sqf"],
		["Operator DMR", "loadouts\nlf_o_dmr.sqf"],
		["Operator Battlerifle", "loadouts\nlf_o_br.sqf"],
		["Operator Specialist (Type-56 AK)", "loadouts\nlf_o_spec.sqf"],
		["Operator Breacher", "loadouts\nlf_o_breacher.sqf"],
		["Operator Engineer (Demo)", "loadouts\nlf_o_e_demo.sqf"],
		["Operator Engineer (EOD)", "loadouts\nlf_o_e_eod.sqf"],
		["Operator Engineer (Fortification)", "loadouts\nlf_o_e_fort.sqf"],
		["Operator Engineer (Repair)", "loadouts\nlf_o_e_repair.sqf"]
	]],

	["Echo", "#ff8c00", "a3\ui_f\data\Map\Markers\NATO\b_maint.paa",
		[["Echo Rifleman", "loadouts\nlf_e_rifleman.sqf"],
		["Echo AR", "loadouts\nlf_e_ar.sqf"],
		["Echo Engineer (Demo)", "loadouts\nlf_e_e_demo.sqf"],
		["Echo Engineer (EOD)", "loadouts\nlf_e_e_eod.sqf"],
		["Echo Engineer (Fortification)", "loadouts\nlf_e_e_fort.sqf"],
		["Echo Engineer (Repair)", "loadouts\nlf_e_e_repair.sqf"],
		["Echo Heavy Weapons (Mortar)", "loadouts\nlf_e_mor.sqf"],
		["Echo Asst. Heavy Weapons (Mortar)", "loadouts\nlf_e_morAsst.sqf"],
		["Echo Driver", "loadouts\nlf_e_driver.sqf"]
	]],

	["Foxtrot", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_armor.paa",
		[["Fox Commander", "loadouts\nlf_f_com.sqf"],
		["Fox Crewman", "loadouts\nlf_f_crew.sqf"],
		["Fox Technician", "loadouts\nlf_f_tech.sqf"]
	]],

	["Sierra", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_recon.paa",
		[["Sierra Spotter", "loadouts\nlf_s_spotter.sqf"],
		["Sierra Sniper", "loadouts\nlf_s_sniper.sqf"]
	]],

	["Air", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_air.paa",
		[["Rodeo Pilot", "loadouts\pilot_rotaryPilot.sqf"],
		["Rodeo Co-Pilot (Crewman)", "loadouts\pilot_rotaryCrew.sqf"],
		["Whiskey Pilot", "loadouts\pilot_fixedWing.sqf"]
	]],

	["Lima", "#ff8c00", "a3\ui_f\data\Map\Markers\NATO\b_support.paa",
		[["Lima Technician", "loadouts\nlf_e_e_repair.sqf"],
		["Lima Operator", "loadouts\nlf_e_rifleman.sqf"]
	]]
];
					
[this, _uniforms] call fw_fnc_addUniformsToBox;