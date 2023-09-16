/*
	Returns true when a plane has not taken any significant damage.

	Trigger config:
		- Any Player

	Example (put in trigger condition):
		call fw_fnc_checkPlaneDamage;
*/

_passed = false;

{
	if !(isNull objectParent player) then
	{

		_vehicle = vehicle _x;

		_totalDamage = damage _vehicle;
		_engineDamage = _vehicle getHitPointDamage "hitengine";
		_wingDamage = _vehicle getHitPointDamage "hitavionics";

		_velocity = velocity _vehicle;
		_isStopped = (_velocity select 0) == 0 && (_velocity select 1) == 0;

		if (_vehicle isKindOf "Plane" && _totalDamage < 0.1 && _engineDamage < 0.1 && _wingDamage < 0.1 && _isStopped) then
		{
			_alreadyLandedSuccessfully = _vehicle getVariable ["landing_success", false];

			if (!_alreadyLandedSuccessfully) then
			{
				_passed = true;
				_vehicle setVariable ["landing_success", true];

				_name = name player;
				systemChat "Successful landing by: " + _name;
			}
		}
	}
} forEach thisList;

_passed;
