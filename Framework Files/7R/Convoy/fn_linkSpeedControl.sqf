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

// Initialize leader vehicle and convoy length
private _leaderVeh = _groupVehicles select 0;
private _convoyLength = count _groupVehicles;

// Control the speed of each vehicle in the convoy based on the link to the vehicle in front
while {!(_leaderVeh getVariable["convoy_terminate",-1])} do {

	// Retrieve convoy settings from the logic object
	private _convSeparation = _logic getVariable ["convSeparation",-1];
	private _speedFrequecy = _logic getVariable ["speedFrequecy",-1];
	private _stiffnessLinkCoeff = _logic getVariable ["stiffnessLinkCoeff",-1];
	private _speedMode = _logic getVariable ["speedModeConv",-1];
	
	// Loop through each vehicle in the convoy starting from the second one
	for [{ _i = 1 }, { _i < _convoyLength }, { _i = _i + 1 }] do {
		private _vehicle = _groupVehicles select _i;
		private _vehicleInFront = _groupVehicles select _i-1;

		// Set the speed mode for the current vehicle in the convoy
		(group _vehicle) setSpeedMode _speedMode;
		
		// Calculate the distance and speed difference to the vehicle in front
		private _distLink = (position _vehicle) distance (position _vehicleInFront);
		private _speedLink = (speed _vehicle) - (speed _vehicleInFront);
		private _linkRelaxation = _distLink - _convSeparation;
		
		// Calculate the desired link speed based on the distance to the vehicle in front and the stiffness coefficient
		private _linkSpeed = [(speed _vehicleInFront) + _stiffnessLinkCoeff * _linkRelaxation * sqrt (abs _linkRelaxation), 0, 100000] call BIS_fnc_clamp;
		
		// Apply the calculated link speed to the current vehicle if the convoy is not stopped
		if ( !(_leaderVeh getVariable["convoy_stopped",-1]) ) then {
			_vehicle forceSpeed -1;
			_vehicle limitSpeed _linkSpeed;
		}
		else {
			// If the convoy is stopped, force the current vehicle to stop
			_vehicle forceSpeed 0;
		};
		
		// Force the current vehicle to not follow the road
		_vehicle forceFollowRoad false;

	};
	sleep _speedFrequecy;
};