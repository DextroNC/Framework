/*
	Parameters:
		<-- Unit as Object
	
	Return:
	--> None
		
	Description:
		Forces Unit to supress the closest Enemy
		
	Example:
		[_unit] spawn fw_fnc_surrender;
*/
// Parameter Init
params ["_unit"];

// Unit cannot be suppressed
_unit setSuppression 0; 

// Find nearest enemy
private _myNearestEnemy = _unit findNearestEnemy _unit;

// Suppress nearest enemy
if (!isNil "_myNearestEnemy") then {
	_unit doSuppressiveFire _myNearestEnemy;
	_unit suppressFor 5;
	_unit doMove position _myNearestEnemy;
};
