private ["_type"];

_unit = (_this select 1);
if( !local _unit ) exitWith {};

_type = (_this select 3) select 0;
_group = group _unit;

// ACRE Radios
if (_type isEqualTo "ACRE_PRC152") then {_unit additem "ACRE_PRC152"};
if (_type isEqualTo "ACRE_PRC148") then {_unit additem "ACRE_PRC148"};
if (_type isEqualTo "ACRE_PRC117F") then {_unit additemtoBackpack "ACRE_PRC117F"};

// Night Vision
if (_type isEqualTo "rhsusf_ANPVS_14") then {_unit linkItem "rhsusf_ANPVS_14"};
if (_type isEqualTo "rhs_1PN138") then {_unit linkItem "rhs_1PN138"};

// General
if (_type isEqualTo "B_Parachute") then {_unit addBackpack "B_Parachute"};
if (_type isEqualTo "ACE_Altimeter") then {_unit linkItem "ACE_Altimeter"};
if (_type isEqualTo "ACE_key_lockpick") then {_unit addItemToUniform "ACE_key_lockpick"};

// Laserdesignator
if (_type isEqualTo "Laserdesignator") then {_unit addWeapon "Laserdesignator"; _unit addItemToBackpack "Laserbatteries"};
if (_type isEqualTo "ACE_Vector") then {_unit addWeapon "ACE_Vector"};
if (_type isEqualTo "Binocular") then {_unit addWeapon "Binocular"};

// Nato - General
if (_type isEqualTo "B_UavTerminal") then {_unit linkItem "B_UavTerminal"};
if (_type isEqualTo "ItemGPS") then {_unit linkItem "ItemGPS"};

//USA - NATO

//1x Sights
if (_type isEqualTo "RH_eotexps3") then {_unit addPrimaryWeaponItem "RH_eotexps3"};
if (_type isEqualTo "rhsusf_acc_compm4") then {_unit addPrimaryWeaponItem "rhsusf_acc_compm4"};
if (_type isEqualTo "rhsusf_acc_eotech_552") then {_unit addPrimaryWeaponItem "rhsusf_acc_eotech_552"};
if (_type isEqualTo "rhsusf_acc_eotech_xps3") then {_unit addPrimaryWeaponItem "rhsusf_acc_eotech_xps3"};
if (_type isEqualTo "RH_t1") then {_unit addPrimaryWeaponItem "RH_t1"};
if (_type isEqualTo "RH_LTdocter") then {_unit addPrimaryWeaponItem "RH_LTdocter"};
if (_type isEqualTo "RH_cmore") then {_unit addPrimaryWeaponItem "RH_cmore"};
if (_type isEqualTo "RH_compM2l") then {_unit addPrimaryWeaponItem "RH_compM2l"};
if (_type isEqualTo "RH_compM2") then {_unit addPrimaryWeaponItem "RH_compM2"};
if (_type isEqualTo "RH_compm4s") then {_unit addPrimaryWeaponItem "RH_compm4s"};
if (_type isEqualTo "RH_reflex") then {_unit addPrimaryWeaponItem "RH_reflex"};
if (_type isEqualTo "FHQ_optic_AIM") then {_unit addPrimaryWeaponItem "FHQ_optic_AIM"};
if (_type isEqualTo "FHQ_optic_MicroCCO") then {_unit addPrimaryWeaponItem "FHQ_optic_MicroCCO"};
if (_type isEqualTo "FHQ_optic_MicroCCO_low") then {_unit addPrimaryWeaponItem "FHQ_optic_MicroCCO_low"};
if (_type isEqualTo "FHQ_optic_AC11704") then {_unit addPrimaryWeaponItem "FHQ_optic_AC11704"};
if (_type isEqualTo "RKSL_optic_RMR_MS19") then {_unit addPrimaryWeaponItem "RKSL_optic_RMR_MS19"};
if (_type isEqualTo "rhsusf_acc_T1_high") then {_unit addPrimaryWeaponItem "rhsusf_acc_T1_high"};
if (_type isEqualTo "rhsusf_acc_T1_low") then {_unit addPrimaryWeaponItem "rhsusf_acc_T1_low"};

//Special Optics DMR
if (_type isEqualTo "optic_NVS") then {_unit addPrimaryWeaponItem "optic_NVS"};
if (_type isEqualTo "rhsusf_acc_ACOG_MDO") then {_unit addPrimaryWeaponItem "rhsusf_acc_ACOG_MDO"};
if (_type isEqualTo "RH_ta01nsn") then {_unit addPrimaryWeaponItem "RH_ta01nsn"};
if (_type isEqualTo "rhsusf_acc_ACOG3") then {_unit addPrimaryWeaponItem "rhsusf_acc_ACOG3"};
if (_type isEqualTo "ACE_optic_Arco_2D") then {_unit addPrimaryWeaponItem "ACE_optic_Arco_2D"};
if (_type isEqualTo "optic_DMS") then {_unit addPrimaryWeaponItem "optic_DMS"};
if (_type isEqualTo "RH_shortdot") then {_unit addPrimaryWeaponItem "RH_shortdot"};
if (_type isEqualTo "FHQ_optic_VCOG") then {_unit addPrimaryWeaponItem "FHQ_optic_VCOG"};
if (_type isEqualTo "ACE_optic_MRCO_2D") then {_unit addPrimaryWeaponItem "ACE_optic_MRCO_2D"};
if (_type isEqualTo "RH_eothhs1") then {_unit addPrimaryWeaponItem "RH_eothhs1"};
if (_type isEqualTo "rhsusf_acc_ACOG_RMR") then {_unit addPrimaryWeaponItem "rhsusf_acc_ACOG_RMR"};
if (_type isEqualTo "rhsusf_acc_SpecterDR_A") then {_unit addPrimaryWeaponItem "rhsusf_acc_SpecterDR_A"};
if (_type isEqualTo "RKSL_optic_LDS") then {_unit addPrimaryWeaponItem "RKSL_optic_LDS"};
if (_type isEqualTo "UK3CB_BAF_SUSAT") then {_unit addPrimaryWeaponItem "UK3CB_BAF_SUSAT"};
if (_type isEqualTo "UK3CB_BAF_TA31F") then {_unit addPrimaryWeaponItem "UK3CB_BAF_TA31F"};
if (_type isEqualTo "UK3CB_BAF_TA648_308") then {_unit addPrimaryWeaponItem "UK3CB_BAF_TA648_308"};

// MMG
if (_type isEqualTo "RH_m145") then {_unit addPrimaryWeaponItem "RH_m145"};
if (_type isEqualTo "RH_c79") then {_unit addPrimaryWeaponItem "RH_c79"};
if (_type isEqualTo "rhsusf_acc_ELCAN") then {_unit addPrimaryWeaponItem "rhsusf_acc_ELCAN"};

// Silencers
if (_type isEqualTo "hlc_muzzle_556NATO_KAC") then {_unit addPrimaryWeaponItem "hlc_muzzle_556NATO_KAC"};
if (_type isEqualTo "muzzle_snds_H_MG_blk_F") then {_unit addPrimaryWeaponItem "muzzle_snds_H_MG_blk_F"};

//RUSSIA
//UAV Terminal Russia
if (_type isEqualTo "O_UavTerminal") then {_unit linkItem "O_UavTerminal"};
//1x
if (_type isEqualTo "rhs_acc_rakursPM") then {_unit addPrimaryWeaponItem "rhs_acc_rakursPM"};
if (_type isEqualTo "rhs_acc_1p87") then {_unit addPrimaryWeaponItem "rhs_acc_1p87"};
if (_type isEqualTo "rhs_acc_ekp8_18") then {_unit addPrimaryWeaponItem "rhs_acc_ekp8_18"};
if (_type isEqualTo "RH_LTdocterl") then {_unit addPrimaryWeaponItem "RH_LTdocterl"};
if (_type isEqualTo "RH_barska_rdsRH_barska_rds") then {_unit addPrimaryWeaponItem "RH_barska_rds"};
if (_type isEqualTo "FHQ_optic_AC12136") then {_unit addPrimaryWeaponItem "FHQ_optic_AC12136"};
if (_type isEqualTo "FHQ_optic_MARS") then {_unit addPrimaryWeaponItem "FHQ_optic_MARS"};

// 3x
if (_type isEqualTo "rhs_acc_1p78") then {_unit addPrimaryWeaponItem "rhs_acc_1p78"};
if (_type isEqualTo "rhs_acc_nita") then {_unit addPrimaryWeaponItem "rhs_acc_nita"};
if (_type isEqualTo "rhs_acc_pso1m2") then {_unit addPrimaryWeaponItem "rhs_acc_pso1m2"};
if (_type isEqualTo "rhs_acc_pso1m21") then {_unit addPrimaryWeaponItem "rhs_acc_pso1m21"};


//Standard Sights Russian
if (_type isEqualTo "rhs_acc_1p63") then {_unit addPrimaryWeaponItem "rhs_acc_1p63"};
if (_type isEqualTo "rhs_acc_ekp1") then {_unit addPrimaryWeaponItem "rhs_acc_ekp1"};
if (_type isEqualTo "rhs_acc_pkas") then {_unit addPrimaryWeaponItem "rhs_acc_pkas"};
if (_type isEqualTo "rhs_acc_ekp8_02") then {_unit addPrimaryWeaponItem "rhs_acc_ekp8_02"};

//Glasses
if (_type isEqualTo "rhs_ess_black") then {_unit addgoggles "rhs_ess_black"};
if (_type isEqualTo "rhs_googles_clear") then {_unit addgoggles "rhs_googles_clear"};
if (_type isEqualTo "rhs_googles_black") then {_unit addgoggles "rhs_googles_black"};
if (_type isEqualTo "rhs_googles_orange") then {_unit addgoggles "rhs_googles_orange"};
if (_type isEqualTo "rhs_googles_yellow") then {_unit addgoggles "rhs_googles_yellow"};

// Entrenching Tool
if (_type isEqualTo "ACE_EntrenchingTool") then {
	_c = false;
	// Check if other group member already has Entrenching Tool
	{
		if ("ACE_EntrenchingTool" in items _x) then {_c = true};
		if (groupId _group isEqualTo "P-1") exitWith {_c = false};
	} forEach units (group _unit);
	// If check passed add tool
	if (!_c) then {_unit addItem "ACE_EntrenchingTool";} else {
		"Limit reached!" remoteExec ["hint", _group]; 
	};
};

// Save Loadout
_unit setVariable ["SR_Loadout",getUnitLoadout _unit];
