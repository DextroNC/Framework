// JIP Teleporter Init

if (_this select 1) then {
	(_this select 0) addAction ["<t color='#FF0000'>JIP Teleporter</t>",fw_fnc_jipTeleport,nil,0,false,true,"","(_target distance2D (markerPos 'respawn_west') < 75)"];   
};
 
// =====================================================================================================================================================

// Briefing Init
nul = execVM "briefing.sqf";

// =====================================================================================================================================================


// Hacking
SR_Hack_Area = [];