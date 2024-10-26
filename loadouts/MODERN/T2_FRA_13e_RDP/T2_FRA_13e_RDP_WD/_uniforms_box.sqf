_uniforms = [

	["Platoon", "#ffff00", "a3\ui_f\data\Map\Markers\NATO\b_hq.paa",
		[["Platoon Leader", "loadouts\fra_p_pl.sqf"],
		["Platoon FAC", "loadouts\fra_p_fac.sqf"],
		["Platoon Engineer (Demo)", "loadouts\fra_p_e_demo.sqf"],
		["Platoon Engineer (EOD)", "loadouts\fra_p_e_eod.sqf"],
		["Platoon Engineer (Fortification)", "loadouts\fra_p_e_fort.sqf"],
		["Platoon Engineer (Repair)", "loadouts\fra_p_e_repair.sqf"],
		["Platoon DMR", "loadouts\fra_p_dmr.sqf"],
		["Platoon UAV Operator", "loadouts\fra_p_uav.sqf"],
		["Platoon Driver", "loadouts\fra_p_driver.sqf"],
		["Platoon AR", "loadouts\fra_p_ar.sqf"],
		["Platoon Medic", "loadouts\fra_p_medic.sqf"]
	]],

	["Infantry", "#00ff00", "a3\ui_f\data\Map\Markers\NATO\b_inf.paa",
		[["Squad Leader", "loadouts\fra_o_sl.sqf"],
		["Combat Medic", "loadouts\fra_o_medic.sqf"],
		["Operator Rifleman", "loadouts\fra_o_rifleman.sqf"],
		["Operator AR", "loadouts\fra_o_ar.sqf"],
		["Operator LAT", "loadouts\fra_o_lat.sqf"],
		["Operator MMG", "loadouts\fra_o_mmg.sqf"],
		["Operator Asst. MMG", "loadouts\fra_o_mmgAsst.sqf"],
		["Operator MAT", "loadouts\fra_o_mat.sqf"],
		["Operator Asst. MAT", "loadouts\fra_o_matAsst.sqf"]
	]],

	["Specialists", "#00ff00", "a3\ui_f\data\Map\Markers\NATO\b_inf.paa",
		[["Operator Grenadier", "loadouts\fra_o_Grenadier.sqf"],
		["Operator DMR", "loadouts\fra_o_dmr.sqf"],
		["Operator Battlerifle", "loadouts\fra_o_br.sqf"],
		["Operator Specialist (SCAR-L)", "loadouts\fra_o_spec.sqf"],
		["Operator Breacher", "loadouts\fra_o_breacher.sqf"],
		["Operator Engineer (Demo)", "loadouts\fra_o_e_demo.sqf"],
		["Operator Engineer (EOD)", "loadouts\fra_o_e_eod.sqf"],
		["Operator Engineer (Fortification)", "loadouts\fra_o_e_fort.sqf"],
		["Operator Engineer (Repair)", "loadouts\fra_o_e_repair.sqf"]
	]],

	["Echo", "#ff8c00", "a3\ui_f\data\Map\Markers\NATO\b_maint.paa",
		[["Echo Rifleman", "loadouts\fra_e_rifleman.sqf"],
		["Echo AR", "loadouts\fra_e_ar.sqf"],
		["Echo Engineer (Demo)", "loadouts\fra_e_e_demo.sqf"],
		["Echo Engineer (EOD)", "loadouts\fra_e_e_eod.sqf"],
		["Echo Engineer (Fortification)", "loadouts\fra_e_e_fort.sqf"],
		["Echo Engineer (Repair)", "loadouts\fra_e_e_repair.sqf"],
		["Echo Heavy Weapons (Mortar)", "loadouts\fra_e_mor.sqf"],
		["Echo Asst. Heavy Weapons (Mortar)", "loadouts\fra_e_morAsst.sqf"],
		["Echo Heavy Weapons (HAT)", "loadouts\fra_e_hat.sqf"],
		["Echo Asst. Heavy Weapons (HAT)", "loadouts\fra_e_hatAsst.sqf"],
		["Echo Driver", "loadouts\fra_e_driver.sqf"]
	]],

	["Foxtrot", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_armor.paa",
		[["Fox Commander", "loadouts\fra_f_com.sqf"],
		["Fox Crewman", "loadouts\fra_f_crew.sqf"],
		["Fox Technician", "loadouts\fra_f_tech.sqf"]
	]],

	["Sierra", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_recon.paa",
		[["Sierra Spotter", "loadouts\fra_s_spotter.sqf"],
		["Sierra Sniper", "loadouts\fra_s_sniper.sqf"],
		["Sierra Sniper (M82A1)", "loadouts\fra_s_sniper2.sqf"],
		["Sierra Recon", "loadouts\fra_s_recon.sqf"]
	]],

	["Air", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_air.paa",
		[["Rodeo Pilot", "loadouts\pilot_rotaryPilot.sqf"],
		["Rodeo Co-Pilot (Crewman)", "loadouts\pilot_rotaryCrew.sqf"],
		["Whiskey Pilot", "loadouts\pilot_fixedWing.sqf"]
	]],

	["Lima", "#ff8c00", "a3\ui_f\data\Map\Markers\NATO\b_support.paa",
		[["Lima Technician", "loadouts\fra_e_e_repair.sqf"],
		["Lima Operator", "loadouts\fra_e_rifleman.sqf"]
	]]
];
					
[this, _uniforms] call fw_fnc_addUniformsToBox;