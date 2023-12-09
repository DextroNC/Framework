_unit = (_this select 1);
_id = (_this select 2);
_title = (infostand actionParams _id select 0);
if( !local _unit ) exitWith {};

call compile preprocessFileLineNumbers "loadouts\RETRO\T3_LPDF_80s_90s\_big_box.sqf";
removeAllActions uniBox;
[uniBox,uniBox] call ace_common_fnc_claim;
call compile preprocessFileLineNumbers "loadouts\RETRO\T3_LPDF_80s_90s\_uniforms_box.sqf";
removeAllActions eqBox;
call compile preprocessFileLineNumbers "loadouts\RETRO\T3_LPDF_80s_90s\_equipment_box.sqf";

[objNull, display_0] call compile preprocessFileLineNumbers "loadouts\RETRO\T3_LPDF_80s_90s\lpdf_p_pl.sqf";
[objNull, display_1] call compile preprocessFileLineNumbers "loadouts\RETRO\T3_LPDF_80s_90s\lpdf_p_e_fort.sqf";
[objNull, display_2] call compile preprocessFileLineNumbers "loadouts\RETRO\T3_LPDF_80s_90s\lpdf_p_dmr.sqf";
[objNull, display_3] call compile preprocessFileLineNumbers "loadouts\RETRO\T3_LPDF_80s_90s\lpdf_p_medic.sqf";
[objNull, display_4] call compile preprocessFileLineNumbers "loadouts\RETRO\T3_LPDF_80s_90s\lpdf_o_sl.sqf";
[objNull, display_5] call compile preprocessFileLineNumbers "loadouts\RETRO\T3_LPDF_80s_90s\lpdf_o_mat.sqf";
[objNull, display_6] call compile preprocessFileLineNumbers "loadouts\RETRO\T3_LPDF_80s_90s\lpdf_o_ar.sqf";
[objNull, display_7] call compile preprocessFileLineNumbers "loadouts\RETRO\T3_LPDF_80s_90s\lpdf_o_spec.sqf";
[objNull, display_8] call compile preprocessFileLineNumbers "loadouts\RETRO\T3_LPDF_80s_90s\lpdf_o_lat.sqf";
[objNull, display_9] call compile preprocessFileLineNumbers "loadouts\RETRO\T3_LPDF_80s_90s\lpdf_o_rifleman.sqf";

{
	_x setObjectTextureGlobal [0, "\7R Factions\7R_factions_lpdf\data\lpr_flag.paa"]
} forEach [banner,banner_1];

format ["Now showcasing: Livonian People's Defense Forces - 1980s (RETRO)"] remoteExec ["systemChat", 0];