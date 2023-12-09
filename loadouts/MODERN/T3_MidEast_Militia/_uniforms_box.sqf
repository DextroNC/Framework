_uniforms = [

	["Platoon", "#ffff00", "a3\ui_f\data\Map\Markers\NATO\b_hq.paa",
		[["Platoon Leader", "loadouts\mem_p_pl.sqf"],
		["Platoon FAC", "loadouts\mem_p_fac.sqf"],
		["Platoon Engineer (Demo)", "loadouts\mem_p_e_demo.sqf"],
		["Platoon Engineer (EOD)", "loadouts\mem_p_e_eod.sqf"],
		["Platoon Engineer (Fortification)", "loadouts\mem_p_e_fort.sqf"],
		["Platoon Engineer (Repair)", "loadouts\mem_p_e_repair.sqf"],
		["Platoon DMR", "loadouts\mem_p_dmr.sqf"],
		["Platoon Driver", "loadouts\mem_p_driver.sqf"],
		["Platoon AR", "loadouts\mem_p_ar.sqf"],
		["Platoon Medic", "loadouts\mem_p_medic.sqf"]
	]],

	["Infantry", "#00ff00", "a3\ui_f\data\Map\Markers\NATO\b_inf.paa",
		[["Squad Leader", "loadouts\mem_o_sl.sqf"],
		["Combat Medic", "loadouts\mem_o_medic.sqf"],
		["Operator Rifleman", "loadouts\mem_o_rifleman.sqf"],
		["Operator AR", "loadouts\mem_o_ar.sqf"],
		["Operator LAT", "loadouts\mem_o_lat.sqf"],
		["Operator MMG", "loadouts\mem_o_mmg.sqf"],
		["Operator Asst. MMG", "loadouts\mem_o_mmgAsst.sqf"],
		["Operator MAT", "loadouts\mem_o_mat.sqf"],
		["Operator Asst. MAT", "loadouts\mem_o_matAsst.sqf"]
	]],

	["Specialists", "#00ff00", "a3\ui_f\data\Map\Markers\NATO\b_inf.paa",
		[["Operator Grenadier", "loadouts\mem_o_Grenadier.sqf"],
		["Operator DMR", "loadouts\mem_o_dmr.sqf"],
		["Operator Battlerifle", "loadouts\mem_o_br.sqf"],
		["Operator Specialist (M4)", "loadouts\mem_o_spec.sqf"],
		["Operator Breacher", "loadouts\mem_o_breacher.sqf"],
		["Operator Engineer (Demo)", "loadouts\mem_o_e_demo.sqf"],
		["Operator Engineer (EOD)", "loadouts\mem_o_e_eod.sqf"],
		["Operator Engineer (Fortification)", "loadouts\mem_o_e_fort.sqf"],
		["Operator Engineer (Repair)", "loadouts\mem_o_e_repair.sqf"]
	]],

	["Echo", "#ff8c00", "a3\ui_f\data\Map\Markers\NATO\b_maint.paa",
		[["Echo Rifleman", "loadouts\mem_e_rifleman.sqf"],
		["Echo AR", "loadouts\mem_e_ar.sqf"],
		["Echo Engineer (Demo)", "loadouts\mem_e_e_demo.sqf"],
		["Echo Engineer (EOD)", "loadouts\mem_e_e_eod.sqf"],
		["Echo Engineer (Fortification)", "loadouts\mem_e_e_fort.sqf"],
		["Echo Engineer (Repair)", "loadouts\mem_e_e_repair.sqf"],
		["Echo Heavy Weapons (Mortar)", "loadouts\mem_e_mor.sqf"],
		["Echo Asst. Heavy Weapons (Mortar)", "loadouts\mem_e_morAsst.sqf"],
		["Echo Heavy Weapons (HAT)", "loadouts\mem_e_hat.sqf"],
		["Echo Asst. Heavy Weapons (HAT)", "loadouts\mem_e_hatAsst.sqf"],
		["Echo Driver", "loadouts\mem_e_driver.sqf"]
	]],

	["Foxtrot", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_armor.paa",
		[["Fox Commander", "loadouts\mem_f_com.sqf"],
		["Fox Crewman", "loadouts\mem_f_crew.sqf"],
		["Fox Technician", "loadouts\mem_f_tech.sqf"]
	]],

	["Sierra", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_recon.paa",
		[["Sierra Spotter", "loadouts\mem_s_spotter.sqf"],
		["Sierra Sniper", "loadouts\mem_s_sniper.sqf"]
	]],

	["Air", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_air.paa",
		[["Rodeo Pilot", "loadouts\pilot_rotaryPilot.sqf"],
		["Rodeo Co-Pilot (Crewman)", "loadouts\pilot_rotaryCrew.sqf"],
		["Whiskey Pilot", "loadouts\pilot_fixedWing.sqf"]
	]],

	["Lima", "#ff8c00", "a3\ui_f\data\Map\Markers\NATO\b_support.paa",
		[["Lima Technician", "loadouts\mem_e_e_repair.sqf"],
		["Lima Operator", "loadouts\mem_e_rifleman.sqf"]
	]]
];
					
[this, _uniforms] call fw_fnc_addUniformsToBox;