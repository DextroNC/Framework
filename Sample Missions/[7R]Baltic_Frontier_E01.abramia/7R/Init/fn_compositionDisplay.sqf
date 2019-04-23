/*
	Parameters:
		<-- none

	Description:
		Displays the Platoon Composition using ACE Structured Text Display.
*/

private _aG = [];
_info = "Platoon Composition:";

{_aG pushBackUnique group _x} forEach allPlayers;

_aG = [_aG,[],{groupId _x},"ASCEND"] call BIS_fnc_sortBy;

{	
	private _sqd = groupID _x + " - ";

	{
		_class = _x getVariable ["SR_Class", "UKN"];
		_sqd = _sqd + (_x) + "/" + _class + " - "; 
	} forEach units _x;
	_info = _info + "<br/>" +  _sqd;
	
} forEach _aG;

[_info, count _aG + 1] call ace_common_fnc_displayTextStructured;