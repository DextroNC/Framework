/*
	Parameters:
		<-- Classname1 as String
		<-- Classname2 as String
	Return:
		---> Return Array as Array [classname, cargoSize]

	Decription:
		Selects the plane and defines the cargoSize
		
*/

// Parameter Init
Params ["_class1", "_class2"];
private _return = [];

// Select Plane
private _type1Count = [_class1,true] call BIS_fnc_crewCount - [_class1,false] call BIS_fnc_crewCount;
private _type2Count = [_class2,true] call BIS_fnc_crewCount - [_class2,false] call BIS_fnc_crewCount;
if (_type2Count > _type1Count) then {
	_return = [_class2 , _type2Count];
} else {
	_return = [_class1 , _type1Count];
};

// Return
_return