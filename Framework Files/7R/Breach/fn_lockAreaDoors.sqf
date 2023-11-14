/*
	Parameters:
	<-- Trigger as Object or Area Marker Name as String
    <-- Number as Percentage of Doors to lock in Area
    <-- Number as Percentage of Houses with locked doors in Area
	<-- Optional: Excluded Units as Array of Objects
		
	Description:
		Lock a random perctange of doors in area.
    
    Example (Trigger onActivation):
		nul = [thisTrigger,0.33,0.5] spawn fw_fnc_lockAreaDoors;

*/
// Parmeter Init
params ["_trigger",["_doorChance",.1],["_houseChance",1],["_excl",[]]];

if (_doorChance > 1) then {_doorChance = 1};
if (_doorChance < 0) then {_doorChance = 0};

if (_houseChance > 1) then {_houseChance = 1};
if (_houseChance < 0) then {_houseChance = 0};

//Gets all houses in triggerArea
_triggerRadius = (triggerArea _trigger select 0) max (triggerArea _trigger select 1);
_objects = nearestObjects [_trigger, ["STATIC"], _triggerRadius] inAreaArray _trigger;

// Debug
if (SR_Debug) then { format ["Objects: %1", _objects] remoteExec ["systemChat", 0]; };

_houses = [_objects, [_excl], {_x}, "ASCEND",{!(_x in _input0) && {_x isKindOf "STATIC"}}] call BIS_fnc_sortBy;

// Debug
if (SR_Debug) then { format ["Houses: %1", _houses] remoteExec ["systemChat", 0]; };

{
    _house = _x;
    if (random 1 <= _houseChance) then {
        //Exits if houses/building is in blacklist
        if (_house in SR_lockBlacklist) exitWith {};
        if ((typeOf _house) in SR_lockBlacklist) exitWith {};

        //Finds all doors
        _numberOfDoors = getNumber (configfile >> "CfgVehicles" >> typeOf _x >> "numberOfDoors");
        if (_numberOfDoors == 0) then {_numberOfDoors = count (configfile >> "CfgVehicles" >> typeOf _x >> "UserActions")};

        //Locks Them
        for "_i" from 0 to (_numberOfDoors) do {
            if (random 1 <= _doorChance) then {_x setVariable [format ["bis_disabled_Door_%1", _i], 1, true]};  //-- Door lock chance
        };
    };
} forEach _houses;

