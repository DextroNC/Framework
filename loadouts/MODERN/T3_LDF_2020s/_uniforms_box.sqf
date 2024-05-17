_uniforms = [

	["Platoon", "#ffff00", "a3\ui_f\data\Map\Markers\NATO\b_hq.paa",
		[["Platoon Leader", "loadouts\ldf_p_pl.sqf"],
		["Platoon FAC", "loadouts\ldf_p_fac.sqf"],
		["Platoon Engineer (Demo)", "loadouts\ldf_p_e_demo.sqf"],
		["Platoon Engineer (EOD)", "loadouts\ldf_p_e_eod.sqf"],
		["Platoon Engineer (Fortification)", "loadouts\ldf_p_e_fort.sqf"],
		["Platoon Engineer (Repair)", "loadouts\ldf_p_e_repair.sqf"],
		["Platoon DMR", "loadouts\ldf_p_dmr.sqf"],
		["Platoon Driver", "loadouts\ldf_p_driver.sqf"],
		["Platoon AR", "loadouts\ldf_p_ar.sqf"],
		["Platoon Medic", "loadouts\ldf_p_medic.sqf"]
	]],

	["Infantry", "#00ff00", "a3\ui_f\data\Map\Markers\NATO\b_inf.paa",
		[["Squad Leader", "loadouts\ldf_o_sl.sqf"],
		["Combat Medic", "loadouts\ldf_o_medic.sqf"],
		["Operator Rifleman", "loadouts\ldf_o_rifleman.sqf"],
		["Operator AR", "loadouts\ldf_o_ar.sqf"],
		["Operator LAT", "loadouts\ldf_o_lat.sqf"],
		["Operator MMG", "loadouts\ldf_o_mmg.sqf"],
		["Operator Asst. MMG", "loadouts\ldf_o_mmgAsst.sqf"],
		["Operator MAT", "loadouts\ldf_o_mat.sqf"],
		["Operator Asst. MAT", "loadouts\ldf_o_matAsst.sqf"]
	]],

	["Specialists", "#00ff00", "a3\ui_f\data\Map\Markers\NATO\b_inf.paa",
		[["Operator Grenadier", "loadouts\ldf_o_Grenadier.sqf"],
		["Operator DMR", "loadouts\ldf_o_dmr.sqf"],
		["Operator Battlerifle", "loadouts\ldf_o_br.sqf"],
		["Operator Specialist (HK416 D10)", "loadouts\ldf_o_spec.sqf"],
		["Operator Breacher", "loadouts\ldf_o_breacher.sqf"],
		["Operator Engineer (Demo)", "loadouts\ldf_o_e_demo.sqf"],
		["Operator Engineer (EOD)", "loadouts\ldf_o_e_eod.sqf"],
		["Operator Engineer (Fortification)", "loadouts\ldf_o_e_fort.sqf"],
		["Operator Engineer (Repair)", "loadouts\ldf_o_e_repair.sqf"]
	]],

	["Echo", "#ff8c00", "a3\ui_f\data\Map\Markers\NATO\b_maint.paa",
		[["Echo Rifleman", "loadouts\ldf_e_rifleman.sqf"],
		["Echo AR", "loadouts\ldf_e_ar.sqf"],
		["Echo Engineer (Demo)", "loadouts\ldf_e_e_demo.sqf"],
		["Echo Engineer (EOD)", "loadouts\ldf_e_e_eod.sqf"],
		["Echo Engineer (Fortification)", "loadouts\ldf_e_e_fort.sqf"],
		["Echo Engineer (Repair)", "loadouts\ldf_e_e_repair.sqf"],
		["Echo Heavy Weapons (Mortar)", "loadouts\ldf_e_mor.sqf"],
		["Echo Asst. Heavy Weapons (Mortar)", "loadouts\ldf_e_morAsst.sqf"],
		["Echo Heavy Weapons (HAT)", "loadouts\ldf_e_hat.sqf"],
		["Echo Asst. Heavy Weapons (HAT)", "loadouts\ldf_e_hatAsst.sqf"],
		["Echo Driver", "loadouts\ldf_e_driver.sqf"]
	]],

	["Foxtrot", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_armor.paa",
		[["Fox Commander", "loadouts\ldf_f_com.sqf"],
		["Fox Crewman", "loadouts\ldf_f_crew.sqf"],
		["Fox Technician", "loadouts\ldf_f_tech.sqf"]
	]],

	["Sierra", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_recon.paa",
		[["Sierra Spotter", "loadouts\ldf_s_spotter.sqf"],
		["Sierra Sniper", "loadouts\ldf_s_sniper.sqf"],
		["Sierra Sniper (M82A1)", "loadouts\ldf_s_sniper2.sqf"],
		["Sierra Recon", "loadouts\ldf_s_recon.sqf"]
	]],

	["Air", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_air.paa",
		[["Rodeo Pilot", "loadouts\pilot_rotaryPilot.sqf"],
		["Rodeo Co-Pilot (Crewman)", "loadouts\pilot_rotaryCrew.sqf"],
		["Whiskey Pilot", "loadouts\pilot_fixedWing.sqf"]
	]],

	["Lima", "#ff8c00", "a3\ui_f\data\Map\Markers\NATO\b_support.paa",
		[["Lima Technician", "loadouts\ldf_e_e_repair.sqf"],
		["Lima Operator", "loadouts\ldf_e_rifleman.sqf"]
	]]
];
					
[this, _uniforms] call fw_fnc_addUniformsToBox;