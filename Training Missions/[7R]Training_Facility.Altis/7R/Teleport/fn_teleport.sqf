/*
	Parameters:
		<-- Mode as Integer
			1: to Marker
			<-- Marker Name as String
			2: to Object	
			<-- Object as Object
			3: into Vehicle
			<-- Vehicles as Object
			<-- Position as String (Driver, Commander, Gunner, Cargo)
	
	Description:
	Use with a terminal and addActions.
	
	Example:	
	this addAction ["Teleport to Marker", fw_fnc_teleport, [1,"MARKERNAME"], 0, true, true, "","",5];     
*/

// Parameter Init
_unit = _this select 1;
_mode = _this select 3 select 0;
_param1 = _this select 3 select 1;
_param2 = _this select 3 select 2;

// Only Local Exec
if( !local _unit ) exitWith {};

// Wait
sleep 0.5;



// Select mode and exec code
switch (_mode) do {
	case 1: {
		if (_param1 isEqualTo "freedom") exitWith {_unit setPosASL [markerPos _param1 select 0,markerPos _param1 select 1,34];};
		_unit setPos (markerPos _param1);
	};
	case 2: {
		_unit setPosATL (getPosATL _param1);
	};
	case 3: {
		if (_param2 isEqualto "COMMANDER") exitWith {
		if (!(commander _param1 isEqualto objNull)) exitWith {hint "Slot occupied."};
		_unit moveInCommander _param1;
		};
		if (_param2 isEqualto "DRIVER") exitWith {
			if (!(driver _param1 isEqualto objNull)) exitWith {hint "Slot occupied."};
			_unit moveInDriver _param1; 
		};
		if (_param2 isEqualto "GUNNER") exitWith {
			if (!(gunner _param1 isEqualto objNull)) exitWith {hint "Slot occupied."};
			_unit moveInGunner _param1;
		};
		if (_param2 isEqualto "CARGO") exitWith {
			_unit moveInCargo _param1;
		};
	};
};