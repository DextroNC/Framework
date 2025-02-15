_uniforms = [

	["Platoon", "#ffff00", "a3\ui_f\data\Map\Markers\NATO\b_hq.paa",
		[["Platoon Leader", "loadouts\cdf_p_pl.sqf"],
		["Platoon Forward Observer", "loadouts\cdf_p_fac.sqf"],
		["Platoon Engineer (Demo)", "loadouts\cdf_p_e_demo.sqf"],
		["Platoon Engineer (EOD)", "loadouts\cdf_p_e_eod.sqf"],
		["Platoon Engineer (Fortification)", "loadouts\cdf_p_e_fort.sqf"],
		["Platoon Engineer (Repair)", "loadouts\cdf_p_e_repair.sqf"],
		["Platoon DMR", "loadouts\cdf_p_dmr.sqf"],
		["Platoon UAV Operator", "loadouts\cdf_p_uav.sqf"],
		["Platoon Driver", "loadouts\cdf_p_driver.sqf"],
		["Platoon AR", "loadouts\cdf_p_ar.sqf"],
		["Platoon Medic", "loadouts\cdf_p_medic.sqf"]
	]],

	["Infantry", "#00ff00", "a3\ui_f\data\Map\Markers\NATO\b_inf.paa",
		[["Squad Leader", "loadouts\cdf_o_sl.sqf"],
		["Combat Medic", "loadouts\cdf_o_medic.sqf"],
		["Operator Rifleman", "loadouts\cdf_o_rifleman.sqf"],
		["Operator AR", "loadouts\cdf_o_ar.sqf"],
		["Operator LAT", "loadouts\cdf_o_lat.sqf"],
		["Operator LAT (NLAW)", "loadouts\cdf_o_lat2.sqf"],
		["Operator MMG", "loadouts\cdf_o_mmg.sqf"],
		["Operator Asst. MMG", "loadouts\cdf_o_mmgAsst.sqf"],
		["Operator MAT", "loadouts\cdf_o_mat.sqf"],
		["Operator Asst. MAT", "loadouts\cdf_o_matAsst.sqf"]
	]],

	["Specialists", "#00ff00", "a3\ui_f\data\Map\Markers\NATO\b_inf.paa",
		[["Operator Grenadier", "loadouts\cdf_o_Grenadier.sqf"],
		["Operator DMR", "loadouts\cdf_o_dmr.sqf"],
		["Operator Battlerifle", "loadouts\cdf_o_br.sqf"],
		["Operator Specialist (M4A1)", "loadouts\cdf_o_spec.sqf"],
		["Operator Breacher", "loadouts\cdf_o_breacher.sqf"],
		["Operator Engineer (Demo)", "loadouts\cdf_o_e_demo.sqf"],
		["Operator Engineer (EOD)", "loadouts\cdf_o_e_eod.sqf"],
		["Operator Engineer (Fortification)", "loadouts\cdf_o_e_fort.sqf"],
		["Operator Engineer (Repair)", "loadouts\cdf_o_e_repair.sqf"]
	]],

	["Echo", "#ff8c00", "a3\ui_f\data\Map\Markers\NATO\b_maint.paa",
		[["Echo Rifleman", "loadouts\cdf_e_rifleman.sqf"],
		["Echo AR", "loadouts\cdf_e_ar.sqf"],
		["Echo Engineer (Demo)", "loadouts\cdf_e_e_demo.sqf"],
		["Echo Engineer (EOD)", "loadouts\cdf_e_e_eod.sqf"],
		["Echo Engineer (Fortification)", "loadouts\cdf_e_e_fort.sqf"],
		["Echo Engineer (Repair)", "loadouts\cdf_e_e_repair.sqf"],
		["Echo Heavy Weapons (Mortar)", "loadouts\cdf_e_mor.sqf"],
		["Echo Asst. Heavy Weapons (Mortar)", "loadouts\cdf_e_morAsst.sqf"],
		["Echo Heavy Weapons (HAT)", "loadouts\cdf_e_hat.sqf"],
		["Echo Asst. Heavy Weapons (HAT)", "loadouts\cdf_e_hatAsst.sqf"],
		["Echo Driver", "loadouts\cdf_e_driver.sqf"]
	]],

	["Foxtrot", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_armor.paa",
		[["Fox Commander", "loadouts\cdf_f_com.sqf"],
		["Fox Crewman", "loadouts\cdf_f_crew.sqf"],
		["Fox Technician", "loadouts\cdf_f_tech.sqf"]
	]],

	["Sierra", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_recon.paa",
		[["Sierra Spotter", "loadouts\cdf_s_spotter.sqf"],
		["Sierra Sniper", "loadouts\cdf_s_sniper.sqf"],
		["Sierra Sniper (M82A1)", "loadouts\cdf_s_sniper2.sqf"],
		["Sierra Recon", "loadouts\cdf_s_recon.sqf"]
	]],

	["Air", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_air.paa",
		[["Rodeo Pilot", "loadouts\pilot_rotaryPilot.sqf"],
		["Rodeo Co-Pilot (Crewman)", "loadouts\pilot_rotaryCrew.sqf"],
		["Whiskey Pilot", "loadouts\pilot_fixedWing.sqf"]
	]],

	["Lima", "#ff8c00", "a3\ui_f\data\Map\Markers\NATO\b_support.paa",
		[["Lima Technician", "loadouts\cdf_e_e_repair.sqf"],
		["Lima Operator", "loadouts\cdf_e_rifleman.sqf"]
	]]
];
					
[this, _uniforms] call fw_fnc_addUniformsToBox;