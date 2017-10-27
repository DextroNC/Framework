/*
	Parameters:
		<-- Unit as Object
		
	Description:
	Allows JIP players to teleport to their unit.
	Called by addAction added to the JIP player by initPlayerLocal.sqf

			  
*/

// Parameter Init
_unit = _this select 1;
_id = _this select 2;
_leader = leader _unit;

// Only Local Exec
if( !local _unit ) exitWith {};

// Teleport to Leader
if (leader _unit != _unit) then {
	_unit setPos (getPos _leader);
	hint "Teleporting to Leader";
} else {
	// Teleport to Map Marker
	[_unit] onMapSingleClick  {
		hint "Click on Map to teleport.";
		_unit = _this select 0;
		_unit setPos _pos;
		onMapSingleClick "";
	};
};

// Remove JIP Teleport Action
_unit removeAction _id;