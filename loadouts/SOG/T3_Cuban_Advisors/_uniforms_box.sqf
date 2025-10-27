_uniforms = [

	["Platoon", "#ffff00", "a3\ui_f\data\Map\Markers\NATO\b_hq.paa",
		[["Platoon Leader", "loadouts\cuba_p_pl.sqf"],
		["Platoon Forward Observer", "loadouts\cuba_p_fac.sqf"],
		["Platoon Engineer (Demo)", "loadouts\cuba_p_e_demo.sqf"],
		["Platoon Engineer (EOD)", "loadouts\cuba_p_e_eod.sqf"],
		["Platoon Engineer (Fortification)", "loadouts\cuba_p_e_fort.sqf"],
		["Platoon Engineer (Repair)", "loadouts\cuba_p_e_repair.sqf"],
		["Platoon DMR", "loadouts\cuba_p_dmr.sqf"],
		["Platoon Driver", "loadouts\cuba_p_driver.sqf"],
		["Platoon AR", "loadouts\cuba_p_ar.sqf"],
		["Platoon Medic", "loadouts\cuba_p_medic.sqf"]
	]],

	["Infantry", "#00ff00", "a3\ui_f\data\Map\Markers\NATO\b_inf.paa",
		[["Squad Leader", "loadouts\cuba_o_sl.sqf"],
		["Combat Medic", "loadouts\cuba_o_medic.sqf"],
		["Operator Rifleman", "loadouts\cuba_o_rifleman.sqf"],
		["Operator AR", "loadouts\cuba_o_ar.sqf"],
		["Operator LAT", "loadouts\cuba_o_lat.sqf"],
		["Operator MMG", "loadouts\cuba_o_mmg.sqf"],
		["Operator Asst. MMG", "loadouts\cuba_o_mmgAsst.sqf"],
		["Operator MAT", "loadouts\cuba_o_mat.sqf"],
		["Operator Asst. MAT", "loadouts\cuba_o_matAsst.sqf"]
	]],

	["Specialists", "#00ff00", "a3\ui_f\data\Map\Markers\NATO\b_inf.paa",
		[["Operator Grenadier", "loadouts\cuba_o_Grenadier.sqf"],
		["Operator DMR", "loadouts\cuba_o_dmr.sqf"],
		["Operator Battlerifle", "loadouts\cuba_o_br.sqf"],
		["Operator Specialist (PPSh-41)", "loadouts\cuba_o_spec.sqf"],
		["Operator Breacher", "loadouts\cuba_o_breacher.sqf"],
		["Operator Engineer (Demo)", "loadouts\cuba_o_e_demo.sqf"],
		["Operator Engineer (EOD)", "loadouts\cuba_o_e_eod.sqf"],
		["Operator Engineer (Fortification)", "loadouts\cuba_o_e_fort.sqf"],
		["Operator Engineer (Repair)", "loadouts\cuba_o_e_repair.sqf"]
	]],

	["Echo", "#ff8c00", "a3\ui_f\data\Map\Markers\NATO\b_maint.paa",
		[["Echo Rifleman", "loadouts\cuba_e_rifleman.sqf"],
		["Echo AR", "loadouts\cuba_e_ar.sqf"],
		["Echo Engineer (Demo)", "loadouts\cuba_e_e_demo.sqf"],
		["Echo Engineer (EOD)", "loadouts\cuba_e_e_eod.sqf"],
		["Echo Engineer (Fortification)", "loadouts\cuba_e_e_fort.sqf"],
		["Echo Engineer (Repair)", "loadouts\cuba_e_e_repair.sqf"],
		["Echo Heavy Weapons (Mortar)", "loadouts\cuba_e_mor.sqf"],
		["Echo Asst. Heavy Weapons (Mortar)", "loadouts\cuba_e_morAsst.sqf"],
		["Echo Driver", "loadouts\cuba_e_driver.sqf"]
	]],

	["Foxtrot", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_armor.paa",
		[["Fox Commander", "loadouts\cuba_f_com.sqf"],
		["Fox Crewman", "loadouts\cuba_f_crew.sqf"],
		["Fox Technician", "loadouts\cuba_f_tech.sqf"]
	]],

	["Sierra", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_recon.paa",
		[["Sierra Spotter", "loadouts\cuba_s_spotter.sqf"],
		["Sierra Sniper", "loadouts\cuba_s_sniper.sqf"]
	]],

	["Air", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_air.paa",
		[["Rodeo Pilot", "loadouts\pilot_rotaryPilot.sqf"],
		["Rodeo Co-Pilot (Crewman)", "loadouts\pilot_rotaryCrew.sqf"],
		["Whiskey Pilot", "loadouts\pilot_fixedWing.sqf"]
	]],

	["Lima", "#ff8c00", "a3\ui_f\data\Map\Markers\NATO\b_support.paa",
		[["Lima Technician", "loadouts\cuba_e_e_repair.sqf"],
		["Lima Operator", "loadouts\cuba_e_rifleman.sqf"]
	]]
];
					
[this, _uniforms] call fw_fnc_addUniformsToBox;