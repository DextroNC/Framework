/*
	Parameters:
		<-- Terminal as Object
		<-- Helipad as Object
		<-- Spawn group as string

	Description:
		Add vehicle spawn actions to a terminal.

	Example:
		[this, pad1, "APC"] spawn fw_fnc_vehicleAddAction;
*/

params ["_terminal","_pad", "_group"];

makeTextGreen = {
	params ["_text"];
	"<t color='#00FF00'>" + _text + "</t>"
};

switch (_group) do {
	case "Foxtrot": {
		_terminal addaction ["Spawn Abrams" call makeTextGreen, fw_fnc_vehicleSpawn, ["rhsusf_m1a2sep1wd_usarmy", _pad, false]];
		_terminal addaction ["Spawn Bradley" call makeTextGreen, fw_fnc_vehicleSpawn, ["RHS_M2A3_wd", _pad, false]];
		_terminal addaction ["Clear Spawn Pad" call makeTextGreen, fw_fnc_vehicleSpawn,["",_pad, false]];
	};

	case "MRAP": {
		_terminal addaction ["Spawn BRDM-2" call makeTextGreen, fw_fnc_vehicleSpawn, ["rhsgref_BRDM2_HQ_b", _pad, false]];
		_terminal addaction ["Spawn Caiman" call makeTextGreen, fw_fnc_vehicleSpawn, ["rhsusf_M1220_M2_usarmy_wd", _pad, false]];
		_terminal addaction ["Spawn Cougar" call makeTextGreen, fw_fnc_vehicleSpawn, ["rhsusf_CGRCAT1A2_M2_usmc_wd", _pad, false]];
		_terminal addaction ["Spawn Fennek" call makeTextGreen, fw_fnc_vehicleSpawn, ["BW_SPw_Fennek_SMG_F", _pad, false]];
		_terminal addaction ["Spawn Hunter" call makeTextGreen, fw_fnc_vehicleSpawn, ["B_T_MRAP_01_hmg_F", _pad, false]];
		_terminal addaction ["Spawn Jackal" call makeTextGreen, fw_fnc_vehicleSpawn, ["UK3CB_BAF_Jackal2_L2A1_W_DPMW_RM", _pad, false]];
		_terminal addaction ["Spawn M1117" call makeTextGreen, fw_fnc_vehicleSpawn, ["rhsusf_M1117_W", _pad, false]];
		_terminal addaction ["Spawn Punisher" call makeTextGreen, fw_fnc_vehicleSpawn, ["O_MRAP_02_hmg_F", _pad, false]];
		_terminal addaction ["Spawn RG-33" call makeTextGreen, fw_fnc_vehicleSpawn, ["rhsusf_M1232_MC_M2_usmc_wd", _pad, false]];
		_terminal addaction ["Spawn Tigr" call makeTextGreen, fw_fnc_vehicleSpawn, ["rhs_tigr_msv", _pad, false]];
		_terminal addaction ["Clear Spawn Pad" call makeTextGreen, fw_fnc_vehicleSpawn,["",_pad, false]];
	};

	case "APC": {
		_terminal addaction ["Spawn AAV" call makeTextGreen, fw_fnc_vehicleSpawn, ["CUP_B_AAV_USMC", _pad, false]];
		_terminal addaction ["Spawn BTR-60" call makeTextGreen, fw_fnc_vehicleSpawn, ["rhs_btr60_msv", _pad, false]];
		_terminal addaction ["Spawn Bulldog" call makeTextGreen, fw_fnc_vehicleSpawn, ["UK3CB_BAF_FV432_Mk3_RWS_Green", _pad, false]];
		_terminal addaction ["Spawn Fuchs" call makeTextGreen, fw_fnc_vehicleSpawn, ["Redd_Tank_Fuchs_1A4_Jg_Flecktarn", _pad, false]];
		_terminal addaction ["Spawn M113" call makeTextGreen, fw_fnc_vehicleSpawn, ["rhsusf_m113_usarmy", _pad, false]];
		_terminal addaction ["Spawn Marid" call makeTextGreen, fw_fnc_vehicleSpawn, ["O_APC_Wheeled_02_rcws_v2_F", _pad, false]];
		_terminal addaction ["Spawn Namer" call makeTextGreen, fw_fnc_vehicleSpawn, ["B_APC_Tracked_01_rcws_F", _pad, false]];
		_terminal addaction ["Clear Spawn Pad" call makeTextGreen, fw_fnc_vehicleSpawn,["",_pad, false]];
	};

	case "IFV": {
		_terminal addaction ["Spawn Badger" call makeTextGreen, fw_fnc_vehicleSpawn, ["B_APC_Wheeled_01_cannon_F", _pad, false]];
		_terminal addaction ["Spawn BMP-2" call makeTextGreen, fw_fnc_vehicleSpawn, ["rhs_bmp2e_msv", _pad, false]];
		_terminal addaction ["Spawn BMP-3" call makeTextGreen, fw_fnc_vehicleSpawn, ["rhs_bmp3_late_msv", _pad, false]];
		_terminal addaction ["Spawn Bradley" call makeTextGreen, fw_fnc_vehicleSpawn, ["RHS_M2A3_wd", _pad, false]];
		// _terminal addaction ["Spawn Marder" call makeTextGreen, fw_fnc_vehicleSpawn, ["Redd_Marder_1A5_Tropentarn", _pad, false]]; // Throws error "Bad vehicle type Redd_Milan_Static_Bag"
		_terminal addaction ["Spawn Pandur" call makeTextGreen, fw_fnc_vehicleSpawn, ["I_APC_Wheeled_03_cannon_F", _pad, false]];
		_terminal addaction ["Spawn Stalker" call makeTextGreen, fw_fnc_vehicleSpawn, ["O_APC_Tracked_02_cannon_F", _pad, false]];
		_terminal addaction ["Spawn Warrior" call makeTextGreen, fw_fnc_vehicleSpawn, ["I_APC_tracked_03_cannon_F", _pad, false]];
		_terminal addaction ["Clear Spawn Pad" call makeTextGreen, fw_fnc_vehicleSpawn,["",_pad, false]];
	};

	case "MBT": {
		_terminal addaction ["Spawn 2S25" call makeTextGreen, fw_fnc_vehicleSpawn, ["rhs_sprut_vdv", _pad, false]];
		_terminal addaction ["Spawn Abrams" call makeTextGreen, fw_fnc_vehicleSpawn, ["rhsusf_m1a2sep1wd_usarmy", _pad, false]];
		_terminal addaction ["Spawn Angara" call makeTextGreen, fw_fnc_vehicleSpawn, ["O_T_MBT_04_cannon_F", _pad, false]];
		_terminal addaction ["Spawn Leopard" call makeTextGreen, fw_fnc_vehicleSpawn, ["I_MBT_03_cannon_F", _pad, false]];
		_terminal addaction ["Spawn Markava" call makeTextGreen, fw_fnc_vehicleSpawn, ["B_MBT_01_cannon_F", _pad, false]];
		_terminal addaction ["Spawn T-80" call makeTextGreen, fw_fnc_vehicleSpawn, ["rhs_t80", _pad, false]];
		_terminal addaction ["Spawn T-100" call makeTextGreen, fw_fnc_vehicleSpawn, ["O_T_MBT_02_cannon_ghex_F", _pad, false]];
		_terminal addaction ["Clear Spawn Pad" call makeTextGreen, fw_fnc_vehicleSpawn,["",_pad, false]];
	};
}
