_uniforms = [

	["Platoon", "#ffff00", "a3\ui_f\data\Map\Markers\NATO\b_hq.paa",
		[["Platoon Leader", "loadouts\nato_p_pl.sqf"],
		["Platoon Forward Observer", "loadouts\nato_p_fac.sqf"],
		["Platoon Engineer (Demo)", "loadouts\nato_p_e_demo.sqf"],
		["Platoon Engineer (EOD)", "loadouts\nato_p_e_eod.sqf"],
		["Platoon Engineer (Fortification)", "loadouts\nato_p_e_fort.sqf"],
		["Platoon Engineer (Repair)", "loadouts\nato_p_e_repair.sqf"],
		["Platoon DMR", "loadouts\nato_p_dmr.sqf"],
		["Platoon UAV Operator", "loadouts\nato_p_uav.sqf"],
		["Platoon Driver", "loadouts\nato_p_driver.sqf"],
		["Platoon AR", "loadouts\nato_p_ar.sqf"],
		["Platoon Medic", "loadouts\nato_p_medic.sqf"]
	]],

	["Infantry", "#00ff00", "a3\ui_f\data\Map\Markers\NATO\b_inf.paa",
		[["Squad Leader", "loadouts\nato_o_sl.sqf"],
		["Combat Medic", "loadouts\nato_o_medic.sqf"],
		["Operator Rifleman", "loadouts\nato_o_rifleman.sqf"],
		["Operator AR", "loadouts\nato_o_ar.sqf"],
		["Operator LAT", "loadouts\nato_o_lat.sqf"],
		["Operator LAT (NLAW)", "loadouts\nato_o_lat2.sqf"],
		["Operator MMG", "loadouts\nato_o_mmg.sqf"],
		["Operator Asst. MMG", "loadouts\nato_o_mmgAsst.sqf"],
		["Operator MAT", "loadouts\nato_o_mat.sqf"],
		["Operator Asst. MAT", "loadouts\nato_o_matAsst.sqf"]
	]],

	["Specialists", "#00ff00", "a3\ui_f\data\Map\Markers\NATO\b_inf.paa",
		[["Operator Grenadier", "loadouts\nato_o_Grenadier.sqf"],
		["Operator DMR", "loadouts\nato_o_dmr.sqf"],
		["Operator Battlerifle", "loadouts\nato_o_br.sqf"],
		["Operator Specialist (MXC)", "loadouts\nato_o_spec.sqf"],
		["Operator Breacher", "loadouts\nato_o_breacher.sqf"],
		["Operator Engineer (Demo)", "loadouts\nato_o_e_demo.sqf"],
		["Operator Engineer (EOD)", "loadouts\nato_o_e_eod.sqf"],
		["Operator Engineer (Fortification)", "loadouts\nato_o_e_fort.sqf"],
		["Operator Engineer (Repair)", "loadouts\nato_o_e_repair.sqf"]
	]],

	["Echo", "#ff8c00", "a3\ui_f\data\Map\Markers\NATO\b_maint.paa",
		[["Echo Rifleman", "loadouts\nato_e_rifleman.sqf"],
		["Echo AR", "loadouts\nato_e_ar.sqf"],
		["Echo Engineer (Demo)", "loadouts\nato_e_e_demo.sqf"],
		["Echo Engineer (EOD)", "loadouts\nato_e_e_eod.sqf"],
		["Echo Engineer (Fortification)", "loadouts\nato_e_e_fort.sqf"],
		["Echo Engineer (Repair)", "loadouts\nato_e_e_repair.sqf"],
		["Echo Heavy Weapons (Mortar)", "loadouts\nato_e_mor.sqf"],
		["Echo Asst. Heavy Weapons (Mortar)", "loadouts\nato_e_morAsst.sqf"],
		["Echo Heavy Weapons (HAT)", "loadouts\nato_e_hat.sqf"],
		["Echo Asst. Heavy Weapons (HAT)", "loadouts\nato_e_hatAsst.sqf"],
		["Echo Driver", "loadouts\nato_e_driver.sqf"]
	]],

	["Foxtrot", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_armor.paa",
		[["Fox Commander", "loadouts\nato_f_com.sqf"],
		["Fox Crewman", "loadouts\nato_f_crew.sqf"],
		["Fox Technician", "loadouts\nato_f_tech.sqf"]
	]],

	["Sierra", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_recon.paa",
		[["Sierra Spotter", "loadouts\nato_s_spotter.sqf"],
		["Sierra Sniper", "loadouts\nato_s_sniper.sqf"],
		["Sierra Sniper (GM6)", "loadouts\nato_s_sniper2.sqf"],
		["Sierra Recon", "loadouts\nato_s_recon.sqf"]
	]],

	["Air", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_air.paa",
		[["Rodeo Pilot", "loadouts\pilot_rotaryPilot.sqf"],
		["Rodeo Co-Pilot (Crewman)", "loadouts\pilot_rotaryCrew.sqf"],
		["Whiskey Pilot", "loadouts\pilot_fixedWing.sqf"]
	]],

	["Lima", "#ff8c00", "a3\ui_f\data\Map\Markers\NATO\b_support.paa",
		[["Lima Technician", "loadouts\nato_e_e_repair.sqf"],
		["Lima Operator", "loadouts\nato_e_rifleman.sqf"]
	]]
];
					
[this, _uniforms] call fw_fnc_addUniformsToBox;
