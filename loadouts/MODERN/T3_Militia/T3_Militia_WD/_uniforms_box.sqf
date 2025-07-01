_uniforms = [

	["Platoon", "#ffff00", "a3\ui_f\data\Map\Markers\NATO\b_hq.paa",
		[["Platoon Leader", "loadouts\mil_p_pl.sqf"],
		["Platoon Forward Observer", "loadouts\mil_p_fac.sqf"],
		["Platoon Engineer (Demo)", "loadouts\mil_p_e_demo.sqf"],
		["Platoon Engineer (EOD)", "loadouts\mil_p_e_eod.sqf"],
		["Platoon Engineer (Fortification)", "loadouts\mil_p_e_fort.sqf"],
		["Platoon Engineer (Repair)", "loadouts\mil_p_e_repair.sqf"],
		["Platoon DMR", "loadouts\mil_p_dmr.sqf"],
		["Platoon Driver", "loadouts\mil_p_driver.sqf"],
		["Platoon AR", "loadouts\mil_p_ar.sqf"],
		["Platoon Medic", "loadouts\mil_p_medic.sqf"]
	]],

	["Infantry", "#00ff00", "a3\ui_f\data\Map\Markers\NATO\b_inf.paa",
		[["Squad Leader", "loadouts\mil_o_sl.sqf"],
		["Combat Medic", "loadouts\mil_o_medic.sqf"],
		["Operator Rifleman", "loadouts\mil_o_rifleman.sqf"],
		["Operator AR", "loadouts\mil_o_ar.sqf"],
		["Operator LAT", "loadouts\mil_o_lat.sqf"],
		["Operator MMG", "loadouts\mil_o_mmg.sqf"],
		["Operator Asst. MMG", "loadouts\mil_o_mmgAsst.sqf"],
		["Operator MAT", "loadouts\mil_o_mat.sqf"],
		["Operator Asst. MAT", "loadouts\mil_o_matAsst.sqf"]
	]],

	["Specialists", "#00ff00", "a3\ui_f\data\Map\Markers\NATO\b_inf.paa",
		[["Operator Grenadier", "loadouts\mil_o_Grenadier.sqf"],
		["Operator DMR", "loadouts\mil_o_dmr.sqf"],
		["Operator Battlerifle", "loadouts\mil_o_br.sqf"],
		["Operator Specialist (M4)", "loadouts\mil_o_spec.sqf"],
		["Operator Breacher", "loadouts\mil_o_breacher.sqf"],
		["Operator Engineer (Demo)", "loadouts\mil_o_e_demo.sqf"],
		["Operator Engineer (EOD)", "loadouts\mil_o_e_eod.sqf"],
		["Operator Engineer (Fortification)", "loadouts\mil_o_e_fort.sqf"],
		["Operator Engineer (Repair)", "loadouts\mil_o_e_repair.sqf"]
	]],

	["Support", "#ff8c00", "a3\ui_f\data\Map\Markers\NATO\b_maint.paa",
		[["Support Rifleman", "loadouts\mil_e_rifleman.sqf"],
		["Support AR", "loadouts\mil_e_ar.sqf"],
		["Support Engineer (Demo)", "loadouts\mil_e_e_demo.sqf"],
		["Support Engineer (EOD)", "loadouts\mil_e_e_eod.sqf"],
		["Support Engineer (Fortification)", "loadouts\mil_e_e_fort.sqf"],
		["Support Engineer (Repair)", "loadouts\mil_e_e_repair.sqf"],
		["Support Heavy Weapons (Mortar)", "loadouts\mil_e_mor.sqf"],
		["Support Asst. Heavy Weapons (Mortar)", "loadouts\mil_e_morAsst.sqf"],
		["Support Heavy Weapons (HAT)", "loadouts\mil_e_hat.sqf"],
		["Support Asst. Heavy Weapons (HAT)", "loadouts\mil_e_hatAsst.sqf"],
		["Support Driver", "loadouts\mil_e_driver.sqf"]
	]],

	["Foxtrot", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_armor.paa",
		[["Fox Commander", "loadouts\mil_f_com.sqf"],
		["Fox Crewman", "loadouts\mil_f_crew.sqf"],
		["Fox Technician", "loadouts\mil_f_tech.sqf"]
	]],

	["Sierra", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_recon.paa",
		[["Sierra Spotter", "loadouts\mil_s_spotter.sqf"],
		["Sierra Sniper", "loadouts\mil_s_sniper.sqf"]
	]],

	["Air", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_air.paa",
		[["Rodeo Pilot", "loadouts\pilot_rotaryPilot.sqf"],
		["Rodeo Co-Pilot (Crewman)", "loadouts\pilot_rotaryCrew.sqf"],
		["Whiskey Pilot", "loadouts\pilot_fixedWing.sqf"]
	]]
];
					
[this, _uniforms] call fw_fnc_addUniformsToBox;