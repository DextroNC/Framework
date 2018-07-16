/*
	Parameters:
		<-- Unit as Object
		<-- Action ID as Integer
		
	Description:
		Allows JIP players to teleport to their unit. 
		If Unit is in vehicle, player will join vehicle as cargo.
		Called by addAction added to the JIP player by initPlayerLocal.sqf
			  
*/

// Parameter Init
_unit = _this select 1;
_id = _this select 2;
_leader = leader _unit;
_str = "";

// Teleport to Leader
if (_leader != _unit) then {
	// Teleport into Vehicle
	if (vehicle _leader != _leader && vehicle _leader emptyPositions  "cargo") then {
		_unit moveInCargo (vehicle _leader);
		hint "Teleporting into Leader's Vehicle";
	} 
	// Teleport Next to Leader
	else {
		_unit setPos (getPos _leader);
		hint "Teleporting to Leader";
	};
// Teleport to Click on Map (if Unit == Leader)
} else {
	[_unit] onMapSingleClick  {
		hint "Click on Map to teleport.";
		_unit = _this select 0;
		_unit setPos _pos;
		onMapSingleClick "";
	};
};

// Info for Leader
_str = (name _unit) + "JIP Teleported";
_str remoteExec ["hint",_leader];

// Remove JIP Teleport Action
_unit removeAction _id;