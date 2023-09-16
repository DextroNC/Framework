/*
	Parameters:
		<-- player name as String
		<-- type of damage as Integer
		
	Example:	
		["Player Name", type] execVM "remoteDamage.sqf";
*/

// Parameter Init
_name = _this select 0;
_type = _this select 1;
_target = objNull ;
// Search for Unit Name among Players
{
	if(name _x isEqualTo _name) exitWith {
		_target = _x;
		
	};
} foreach allPlayers;

// No unit with matching name found exit
if (isNull _target) exitWith {
	hint "Error: Unit not found!";
};

// Remote Action init
[[[objNull,_target,objNull,[_type]],"7R\Training\FlightSchool\damage.sqf"],"BIS_fnc_execVM",_target,true ] call BIS_fnc_MP;