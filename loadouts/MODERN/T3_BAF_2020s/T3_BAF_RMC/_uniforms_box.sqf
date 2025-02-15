_uniforms = [

	["Platoon", "#ffff00", "a3\ui_f\data\Map\Markers\NATO\b_hq.paa",
		[["Platoon Leader", "loadouts\baf_p_pl.sqf"],
		["Platoon Forward Observer", "loadouts\baf_p_fac.sqf"],
		["Platoon Engineer (Demo)", "loadouts\baf_p_e_demo.sqf"],
		["Platoon Engineer (EOD)", "loadouts\baf_p_e_eod.sqf"],
		["Platoon Engineer (Fortification)", "loadouts\baf_p_e_fort.sqf"],
		["Platoon Engineer (Repair)", "loadouts\baf_p_e_repair.sqf"],
		["Platoon DMR", "loadouts\baf_p_dmr.sqf"],
		["Platoon Driver", "loadouts\baf_p_driver.sqf"],
		["Platoon AR", "loadouts\baf_p_ar.sqf"],
		["Platoon Medic", "loadouts\baf_p_medic.sqf"]
	]],

	["Infantry", "#00ff00", "a3\ui_f\data\Map\Markers\NATO\b_inf.paa",
		[["Squad Leader", "loadouts\baf_o_sl.sqf"],
		["Combat Medic", "loadouts\baf_o_medic.sqf"],
		["Operator Rifleman", "loadouts\baf_o_rifleman.sqf"],
		["Operator AR", "loadouts\baf_o_ar.sqf"],
		["Operator LAT", "loadouts\baf_o_lat.sqf"],
		["Operator LAT (NLAW)", "loadouts\baf_o_lat2.sqf"],
		["Operator MAT", "loadouts\baf_o_mat.sqf"],
		["Operator Asst. MAT", "loadouts\baf_o_matAsst.sqf"],
		["Operator MMG", "loadouts\baf_o_mmg.sqf"],
		["Operator Asst. MMG", "loadouts\baf_o_mmgAsst.sqf"]
	]],

	["Specialists", "#00ff00", "a3\ui_f\data\Map\Markers\NATO\b_inf.paa",
		[["Operator Grenadier", "loadouts\baf_o_Grenadier.sqf"],
		["Operator DMR", "loadouts\baf_o_dmr.sqf"],
		["Operator Battlerifle", "loadouts\baf_o_br.sqf"],
		["Operator Specialist (L403A1)", "loadouts\baf_o_spec.sqf"],
		["Operator Breacher", "loadouts\baf_o_breacher.sqf"],
		["Operator Engineer (Demo)", "loadouts\baf_o_e_demo.sqf"],
		["Operator Engineer (EOD)", "loadouts\baf_o_e_eod.sqf"],
		["Operator Engineer (Fortification)", "loadouts\baf_o_e_fort.sqf"],
		["Operator Engineer (Repair)", "loadouts\baf_o_e_repair.sqf"]
	]],

	["Echo", "#ff8c00", "a3\ui_f\data\Map\Markers\NATO\b_maint.paa",
		[["Echo Rifleman", "loadouts\baf_e_rifleman.sqf"],
		["Echo AR", "loadouts\baf_e_ar.sqf"],
		["Echo Engineer (Demo)", "loadouts\baf_e_e_demo.sqf"],
		["Echo Engineer (EOD)", "loadouts\baf_e_e_eod.sqf"],
		["Echo Engineer (Fortification)", "loadouts\baf_e_e_fort.sqf"],
		["Echo Engineer (Repair)", "loadouts\baf_e_e_repair.sqf"],
		["Echo Heavy Weapons (Mortar)", "loadouts\baf_e_mor.sqf"],
		["Echo Asst. Heavy Weapons (Mortar)", "loadouts\baf_e_morAsst.sqf"],
		["Echo Heavy Weapons (HAT)", "loadouts\baf_e_hat.sqf"],
		["Echo Asst. Heavy Weapons (HAT)", "loadouts\baf_e_hatAsst.sqf"],
		["Echo Driver", "loadouts\baf_e_driver.sqf"]
	]],

	["Foxtrot", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_armor.paa",
		[["Fox Commander", "loadouts\baf_f_com.sqf"],
		["Fox Crewman", "loadouts\baf_f_crew.sqf"],
		["Fox Technician", "loadouts\baf_f_tech.sqf"]
	]],

	["Sierra", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_recon.paa",
		[["Sierra Spotter", "loadouts\baf_s_spotter.sqf"],
		["Sierra Sniper", "loadouts\baf_s_sniper.sqf"],
		["Sierra Sniper (M82A1)", "loadouts\baf_s_sniper2.sqf"],
		["Sierra Recon", "loadouts\baf_s_recon.sqf"]
	]],

	["Air", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_air.paa",
		[["Rodeo Pilot", "loadouts\pilot_rotaryPilot.sqf"],
		["Rodeo Co-Pilot (Crewman)", "loadouts\pilot_rotaryCrew.sqf"],
		["Whiskey Pilot", "loadouts\pilot_fixedWing.sqf"]
	]],

	["Lima", "#ff8c00", "a3\ui_f\data\Map\Markers\NATO\b_support.paa",
		[["Lima Technician", "loadouts\baf_e_e_repair.sqf"],
		["Lima Operator", "loadouts\baf_e_rifleman.sqf"]
	]]
];
					
[this, _uniforms] call fw_fnc_addUniformsToBox;