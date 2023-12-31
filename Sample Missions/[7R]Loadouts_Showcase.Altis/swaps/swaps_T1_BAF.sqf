_unit = (_this select 1);
_id = (_this select 2);
_title = (infostand actionParams _id select 0);
if( !local _unit ) exitWith {};

call compile preprocessFileLineNumbers "loadouts\MODERN\T1_BAF\T1_BAF_SAS\_big_box.sqf";
removeAllActions uniBox;
[uniBox,uniBox] call ace_common_fnc_claim;
call compile preprocessFileLineNumbers "loadouts\MODERN\T1_BAF\T1_BAF_SAS\_uniforms_box.sqf";
removeAllActions eqBox;
call compile preprocessFileLineNumbers "loadouts\MODERN\T1_BAF\T1_BAF_SAS\_equipment_box.sqf";

[objNull, display_0] call compile preprocessFileLineNumbers "loadouts\MODERN\T1_BAF\T1_BAF_SAS\baf_p_pl.sqf";
[objNull, display_1] call compile preprocessFileLineNumbers "loadouts\MODERN\T1_BAF\T1_BAF_SAS\baf_p_e_fort.sqf";
[objNull, display_2] call compile preprocessFileLineNumbers "loadouts\MODERN\T1_BAF\T1_BAF_SAS\baf_p_dmr.sqf";
[objNull, display_3] call compile preprocessFileLineNumbers "loadouts\MODERN\T1_BAF\T1_BAF_SAS\baf_p_medic.sqf";
[objNull, display_4] call compile preprocessFileLineNumbers "loadouts\MODERN\T1_BAF\T1_BAF_SAS\baf_o_sl.sqf";
[objNull, display_5] call compile preprocessFileLineNumbers "loadouts\MODERN\T1_BAF\T1_BAF_SAS\baf_o_mat.sqf";
[objNull, display_6] call compile preprocessFileLineNumbers "loadouts\MODERN\T1_BAF\T1_BAF_SAS\baf_o_ar.sqf";
[objNull, display_7] call compile preprocessFileLineNumbers "loadouts\MODERN\T1_BAF\T1_BAF_SAS\baf_o_spec.sqf";
[objNull, display_8] call compile preprocessFileLineNumbers "loadouts\MODERN\T1_BAF\T1_BAF_SAS\baf_o_lat.sqf";
[objNull, display_9] call compile preprocessFileLineNumbers "loadouts\MODERN\T1_BAF\T1_BAF_SAS\baf_o_rifleman.sqf";

{
	_x addPrimaryWeaponItem selectRandom ["optic_ACO","optic_holosight_blk_f","rhsusf_acc_rx01_nofilter","rhsusf_acc_compm4"];
	_x addPrimaryWeaponItem selectRandom ["uk3cb_baf_silencer_l85"];
	
} forEach [display_0,display_3,display_4,display_5,display_6,display_7,display_8,display_9];

display_1 addPrimaryWeaponItem selectRandom ["rksl_optic_lds"];
display_1 addPrimaryWeaponItem selectRandom ["uk3cb_baf_silencer_l115a3"];
display_6 addPrimaryWeaponItem selectRandom ["uk3cb_baf_silencer_l110"];

{
	_x setObjectTextureGlobal [0, "\A3\Data_F\Flags\Flag_uk_CO.paa"]
} forEach [banner,banner_1];

format ["Now showcasing: SAS/SBS (T1)"] remoteExec ["systemChat", 0];