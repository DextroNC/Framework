/*

	Parameters:
		<-- Convoy Logic as Object
		<-- Array of Vehicles as Array of Objects

	Return:
		--> Nothing

	Description:
		Controls the lead vehicle's speed and behavior based on convoy metrics and logic settings.

	Example:
		_return = [_logic, _groupVehicles] call fw_fnc_leadSpeedControl;

*/

// Parameter Init
params ["_logic", "_groupVehicles"];

private _leaderVeh = _groupVehicles select 0;
private _convoyLength = count _groupVehicles;

// While the convoy is active, control the lead vehicle's speed and behavior
while {!(_leaderVeh getVariable["convoy_terminate",-1])} do {
	private _maxDefSpeed = _logic getVariable ["maxSpeed",-1];
	private _convSeparation = _logic getVariable ["convSeparation",-1];
	private _speedFrequecy = _logic getVariable ["speedFrequecy",-1];
	private _dampingCoeff = _logic getVariable ["dampingCoeff",-1];
	private _curvatureCoeff = _logic getVariable ["curvatureCoeff",-1];
	private _stiffnessCoeff = _logic getVariable ["stiffnessCoeff",-1];
	private _followRoad = _logic getVariable ["followRoad",false];
	private _speedMode = _logic getVariable ["speedModeConv",-1];
	private _behaviour = _logic getVariable ["behaviourConv",-1];
	
	// Force leader to follow road based on the followRoad setting
	switch (_followRoad) do
	{
		case "UNCHANGED":	{ };
		case "NO": 			{ _leaderVeh forceFollowRoad false; };
		case "YES": 		{ _leaderVeh forceFollowRoad true; };
		default {
			// hint "Convoy New Feature: \n Please choose the ""Follow the Road"" option again."
		};
	};

	// Set the leader vehicle's speedmode
	(group _leaderVeh) setSpeedMode _speedMode;
	
	// Calculate distances, rotations, and speed differences between convoy vehicles
	private _arrayDistances = [];
	private _arrayRotations = [];
	private _arraySpeeds = [];
	for [{ _i = 1 }, { _i < _convoyLength }, { _i = _i + 1 }] do {
		_vehicle = _groupVehicles select _i;
		_vehicleInFront = _groupVehicles select _i-1;
		_arrayDistances set [_i-1, _vehicle distance _vehicleInFront];
		_arrayRotations set [_i-1, abs( (getDir _vehicle) - (getDir _vehicleInFront) )];
		_arraySpeeds set [_i-1, abs( (speed _vehicle) - (speed _vehicleInFront) )];
	};
	
	// Calculate convoy metrics such as average distance, relaxation, curvature, and entropy
	private _avrDistance = 0;
	private _convoyRelaxation = 0;
	private _convoyCurvature = 0;
	private _convoyEntropy = 0;
	
	// Only calculate convoy metrics if there are vehicles in the convoy
	if (count _arrayDistances > 0) then {
		_avrDistance = _arrayDistances call BIS_fnc_arithmeticMean;
		_convoyRelaxation = [_avrDistance - _convSeparation, 0, 100000] call BIS_fnc_clamp;
		_convoyCurvature = _arrayRotations call BIS_fnc_arithmeticMean;
		_convoyEntropy = _arraySpeeds call BIS_fnc_arithmeticMean;
	};
	
	// Calculate the maximum allowed speed for the leader vehicle based on convoy metrics
	private _maxSpeed = 0;
	if (_maxDefSpeed > 0 ) then {
		_maxSpeed = _maxDefSpeed - ([
			  _stiffnessCoeff*_convoyRelaxation^(1.5) 
			+ _curvatureCoeff*( [_convoyCurvature, 0, 45] call BIS_fnc_clamp )
			+ _dampingCoeff*_convoyEntropy,
									0, _maxDefSpeed-5] call BIS_fnc_clamp );
	};

	// Apply the calculated maximum speed to the leader vehicle if it is not stopped
	if (_maxDefSpeed > 0 && !(_leaderVeh getVariable["convoy_stopped",-1]) ) then {
		_leaderVeh forceSpeed -1;
		_leaderVeh limitSpeed _maxSpeed;
	}
	else {
		// If the convoy is stopped, force the leader vehicle to stop
		_leaderVeh forceSpeed 0;
	};

	// Sleep for the specified frequency before recalculating the leader vehicle's speed
	sleep _speedFrequecy;
};