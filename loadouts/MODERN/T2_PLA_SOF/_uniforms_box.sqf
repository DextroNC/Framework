_uniforms = [

	["Platoon", "#ffff00", "a3\ui_f\data\Map\Markers\NATO\b_hq.paa",
		[["Platoon Leader", "loadouts\pla_p_pl.sqf"],
		["Platoon FAC", "loadouts\pla_p_fac.sqf"],
		["Platoon Engineer (Demo)", "loadouts\pla_p_e_demo.sqf"],
		["Platoon Engineer (EOD)", "loadouts\pla_p_e_eod.sqf"],
		["Platoon Engineer (Fortification)", "loadouts\pla_p_e_fort.sqf"],
		["Platoon Engineer (Repair)", "loadouts\pla_p_e_repair.sqf"],
		["Platoon DMR", "loadouts\pla_p_dmr.sqf"],
		["Platoon UAV Operator", "loadouts\pla_p_uav.sqf"],
		["Platoon Driver", "loadouts\pla_p_driver.sqf"],
		["Platoon AR", "loadouts\pla_p_ar.sqf"],
		["Platoon Medic", "loadouts\pla_p_medic.sqf"]
	]],

	["Infantry", "#00ff00", "a3\ui_f\data\Map\Markers\NATO\b_inf.paa",
		[["Squad Leader", "loadouts\pla_o_sl.sqf"],
		["Combat Medic", "loadouts\pla_o_medic.sqf"],
		["Operator Rifleman", "loadouts\pla_o_rifleman.sqf"],
		["Operator AR", "loadouts\pla_o_ar.sqf"],
		["Operator LAT", "loadouts\pla_o_lat.sqf"],
		["Operator MMG", "loadouts\pla_o_mmg.sqf"],
		["Operator Asst. MMG", "loadouts\pla_o_mmgAsst.sqf"],
		["Operator MAT", "loadouts\pla_o_mat.sqf"],
		["Operator Asst. MAT", "loadouts\pla_o_matAsst.sqf"]
	]],

	["Specialists", "#00ff00", "a3\ui_f\data\Map\Markers\NATO\b_inf.paa",
		[["Operator Grenadier", "loadouts\pla_o_Grenadier.sqf"],
		["Operator DMR", "loadouts\pla_o_dmr.sqf"],
		["Operator Battlerifle", "loadouts\pla_o_br.sqf"],
		["Operator Breacher", "loadouts\pla_o_breacher.sqf"],
		["Operator Engineer (Demo)", "loadouts\pla_o_e_demo.sqf"],
		["Operator Engineer (EOD)", "loadouts\pla_o_e_eod.sqf"],
		["Operator Engineer (Fortification)", "loadouts\pla_o_e_fort.sqf"],
		["Operator Engineer (Repair)", "loadouts\pla_o_e_repair.sqf"]
	]],

	["Echo", "#ff8c00", "a3\ui_f\data\Map\Markers\NATO\b_maint.paa",
		[["Echo Rifleman", "loadouts\pla_e_rifleman.sqf"],
		["Echo AR", "loadouts\pla_e_ar.sqf"],
		["Echo Engineer (Demo)", "loadouts\pla_e_e_demo.sqf"],
		["Echo Engineer (EOD)", "loadouts\pla_e_e_eod.sqf"],
		["Echo Engineer (Fortification)", "loadouts\pla_e_e_fort.sqf"],
		["Echo Engineer (Repair)", "loadouts\pla_e_e_repair.sqf"],
		["Echo Heavy Weapons (Mortar)", "loadouts\pla_e_mor.sqf"],
		["Echo Asst. Heavy Weapons (Mortar)", "loadouts\pla_e_morAsst.sqf"],
		["Echo Heavy Weapons (HAT)", "loadouts\pla_e_hat.sqf"],
		["Echo Asst. Heavy Weapons (HAT)", "loadouts\pla_e_hatAsst.sqf"],
		["Echo Driver", "loadouts\pla_e_driver.sqf"]
	]],

	["Foxtrot", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_armor.paa",
		[["Fox Commander", "loadouts\pla_f_com.sqf"],
		["Fox Crewman", "loadouts\pla_f_crew.sqf"],
		["Fox Technician", "loadouts\pla_f_tech.sqf"]
	]],

	["Sierra", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_recon.paa",
		[["Sierra Spotter", "loadouts\pla_s_spotter.sqf"],
		["Sierra Sniper", "loadouts\pla_s_sniper.sqf"],
		["Sierra Sniper (GM6)", "loadouts\pla_s_sniper2.sqf"],
		["Sierra Recon", "loadouts\pla_s_recon.sqf"]
	]],

	["Air", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_air.paa",
		[["Rodeo Pilot", "loadouts\pilot_rotaryPilot.sqf"],
		["Rodeo Co-Pilot (Crewman)", "loadouts\pilot_rotaryCrew.sqf"],
		["Whiskey Pilot", "loadouts\pilot_fixedWing.sqf"]
	]],

	["Lima", "#ff8c00", "a3\ui_f\data\Map\Markers\NATO\b_support.paa",
		[["Lima Technician", "loadouts\pla_e_e_repair.sqf"],
		["Lima Operator", "loadouts\pla_e_rifleman.sqf"]
	]]
];
					
[this, _uniforms] call fw_fnc_addUniformsToBox;
