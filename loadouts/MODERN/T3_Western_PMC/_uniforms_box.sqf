_uniforms = [

	["Platoon", "#ffff00", "a3\ui_f\data\Map\Markers\NATO\b_hq.paa",
		[["Platoon Leader", "loadouts\pmc_p_pl.sqf"],
		["Platoon FAC", "loadouts\pmc_p_fac.sqf"],
		["Platoon Engineer (Demo)", "loadouts\pmc_p_e_demo.sqf"],
		["Platoon Engineer (EOD)", "loadouts\pmc_p_e_eod.sqf"],
		["Platoon Engineer (Fortification)", "loadouts\pmc_p_e_fort.sqf"],
		["Platoon Engineer (Repair)", "loadouts\pmc_p_e_repair.sqf"],
		["Platoon DMR", "loadouts\pmc_p_dmr.sqf"],
		["Platoon Driver", "loadouts\pmc_p_driver.sqf"],
		["Platoon AR", "loadouts\pmc_p_ar.sqf"],
		["Platoon Medic", "loadouts\pmc_p_medic.sqf"]
	]],

	["Infantry", "#00ff00", "a3\ui_f\data\Map\Markers\NATO\b_inf.paa",
		[["Squad Leader", "loadouts\pmc_o_sl.sqf"],
		["Combat Medic", "loadouts\pmc_o_medic.sqf"],
		["Operator Rifleman", "loadouts\pmc_o_rifleman.sqf"],
		["Operator AR", "loadouts\pmc_o_ar.sqf"],
		["Operator LAT", "loadouts\pmc_o_lat2.sqf"],
		["Operator LAT (NLAW)", "loadouts\pmc_o_lat.sqf"],
		["Operator MMG", "loadouts\pmc_o_mmg.sqf"],
		["Operator Asst. MMG", "loadouts\pmc_o_mmgAsst.sqf"],
		["Operator MAT", "loadouts\pmc_o_mat.sqf"],
		["Operator Asst. MAT", "loadouts\pmc_o_matAsst.sqf"]
	]],

	["Specialists", "#00ff00", "a3\ui_f\data\Map\Markers\NATO\b_inf.paa",
		[["Operator Grenadier", "loadouts\pmc_o_Grenadier.sqf"],
		["Operator Grenadier (M32 MGL)", "loadouts\pmc_o_Grenadier2.sqf"],
		["Operator DMR", "loadouts\pmc_o_dmr.sqf"],
		["Operator Battlerifle", "loadouts\pmc_o_br.sqf"],
		["Operator Specialist (FN-P90)", "loadouts\pmc_o_spec.sqf"],
		["Operator Breacher", "loadouts\pmc_o_breacher.sqf"],
		["Operator Engineer (Demo)", "loadouts\pmc_o_e_demo.sqf"],
		["Operator Engineer (EOD)", "loadouts\pmc_o_e_eod.sqf"],
		["Operator Engineer (Fortification)", "loadouts\pmc_o_e_fort.sqf"],
		["Operator Engineer (Repair)", "loadouts\pmc_o_e_repair.sqf"]
	]],

	["Echo", "#ff8c00", "a3\ui_f\data\Map\Markers\NATO\b_maint.paa",
		[["Echo Rifleman", "loadouts\pmc_e_rifleman.sqf"],
		["Echo AR", "loadouts\pmc_e_ar.sqf"],
		["Echo Engineer (Demo)", "loadouts\pmc_e_e_demo.sqf"],
		["Echo Engineer (EOD)", "loadouts\pmc_e_e_eod.sqf"],
		["Echo Engineer (Fortification)", "loadouts\pmc_e_e_fort.sqf"],
		["Echo Engineer (Repair)", "loadouts\pmc_e_e_repair.sqf"],
		["Echo Heavy Weapons (Mortar)", "loadouts\pmc_e_mor.sqf"],
		["Echo Asst. Heavy Weapons (Mortar)", "loadouts\pmc_e_morAsst.sqf"],
		["Echo Heavy Weapons (HAT)", "loadouts\pmc_e_hat.sqf"],
		["Echo Asst. Heavy Weapons (HAT)", "loadouts\pmc_e_hatAsst.sqf"],
		["Echo Driver", "loadouts\pmc_e_driver.sqf"]
	]],

	["Foxtrot", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_armor.paa",
		[["Fox Commander", "loadouts\pmc_f_com.sqf"],
		["Fox Crewman", "loadouts\pmc_f_crew.sqf"],
		["Fox Technician", "loadouts\pmc_f_tech.sqf"]
	]],

	["Sierra", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_recon.paa",
		[["Sierra Spotter", "loadouts\pmc_s_spotter.sqf"],
		["Sierra Sniper", "loadouts\pmc_s_sniper.sqf"],
		["Sierra Recon", "loadouts\pmc_s_recon.sqf"]
	]],

	["Air", "#ff0000", "a3\ui_f\data\Map\Markers\NATO\b_air.paa",
		[["Rodeo Pilot", "loadouts\pilot_rotaryPilot.sqf"],
		["Rodeo Co-Pilot (Crewman)", "loadouts\pilot_rotaryCrew.sqf"],
		["Whiskey Pilot", "loadouts\pilot_fixedWing.sqf"]
	]],

	["Lima", "#ff8c00", "a3\ui_f\data\Map\Markers\NATO\b_support.paa",
		[["Lima Technician", "loadouts\pmc_e_e_repair.sqf"],
		["Lima Operator", "loadouts\pmc_e_rifleman.sqf"]
	]]
];
					
[this, _uniforms] call fw_fnc_addUniformsToBox;