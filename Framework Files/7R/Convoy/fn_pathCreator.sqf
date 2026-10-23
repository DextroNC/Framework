/*

	Parameters:
		<-- Convoy Logic as Object
		<-- Convoy Vehicles in driving order as Array

	Description:
	Builds the convoy path by recording the trail of the Leader (first Vehicle) while he drives his group waypoints.
	The Leader needs his waypoints set before this is called.
	Every following Vehicle drives the part of the trail between itself and the Vehicle in front of it.
	Runs until convoy_terminate is set on the Leader, then resets the forced speed of all Vehicles.
	Draws arrows along the path of every following Vehicle if SR_Debug is true.

*/

private _groupVehicles = _this select 1;
private _logic = _this select 0;

private _leaderVeh = _groupVehicles select 0;
private _convoyLength = count _groupVehicles;

private _convoy_path=[];
_convoy_path pushBack (position _leaderVeh);
_leaderVeh setVariable ["convoy_path", _convoy_path, true];

// initialize draw objects
_leaderVeh setVariable ["convoy_drawObjects", [], true];
for [{ _i = 0 }, { _i < _convoyLength-1 }, { _i = _i + 1 }] do {
	private _convoy_drawObjects = _leaderVeh getVariable ["convoy_drawObjects", -1];
	_convoy_drawObjects pushBack [];
	_leaderVeh setVariable ["convoy_drawObjects", _convoy_drawObjects, true];
};

while {!(_leaderVeh getVariable["convoy_terminate",-1])} do {
	private _pathFrequecy = _logic getVariable ["pathFrequecy",-1];
	
	private _convoy_path = _leaderVeh getVariable["convoy_path",-1];
	private _leaderPos = position _leaderVeh;
	if !(_leaderPos isEqualTo (_convoy_path select ((count _convoy_path) - 1))) then {
		_convoy_path pushBack _leaderPos;
	};
	
	// Delete Unecessary Points
	private _vehicleInBack = _groupVehicles select ((count _groupVehicles)-1);
	private _itMax = count _convoy_path;
	private _distBack2wp = 0;
	private _foundCandidate = false;
	private _chopDistance = 10;
	for [{ _j = _itMax-1 }, { _j > -1 }, { _j = _j - 1 }] do {
		_distBack2wp = (_convoy_path select _j) distance (position _vehicleInBack);
		if ( _distBack2wp < _chopDistance && !_foundCandidate ) then {
			_foundCandidate = true;
		};
		if ( _distBack2wp > _chopDistance && _foundCandidate ) then {
			_convoy_path deleteAt _j;
		};
	};
	// ------------------------
	
	// Create Vehicle Path
	for [{ _i = 1 }, { _i < _convoyLength }, { _i = _i + 1 }] do {
		private _vehiclePathChop = [];
		private _vehicle = _groupVehicles select _i;
		private _vehicleInFront = _groupVehicles select _i-1;
		
		private _foundCandidate = false;
		private _foundLast = false;
		private _foundFirst = false;
		private _lastPoint = [];
		private _firstPoint = [];
		private _pathTemp = _convoy_path;
		private _itMax = count _pathTemp;
		private _wpPosition = [];
		private _distFront2wp = [];
		private _distBack2wp = [];
		for [{ _j = _itMax-1 }, { _j > -1 }, { _j = _j - 1 }] do {
			_wpPosition = _pathTemp select _j;
			_distFront2wp = _wpPosition distance (position _vehicleInFront);
			_distBack2wp = _wpPosition distance (position _vehicle);
			// find first point candidate
			if ( _distFront2wp < _chopDistance && !_foundCandidate && !_foundLast && !_foundFirst ) then {
				_foundCandidate = true;
			};
			// find last point
			if ( _distFront2wp > _chopDistance && _foundCandidate && !_foundLast && !_foundFirst ) then {
				_foundLast = true;
				_lastPoint = _j;
			};
			// find first point
			if ( ( _distBack2wp < _chopDistance || _j==0 ) && _foundCandidate && _foundLast && !_foundFirst ) then {
				_foundFirst = true;
				_firstPoint = _j;
				if ( _firstPoint < _lastPoint ) then {
					_vehiclePathChop = _pathTemp select [ _firstPoint, _lastPoint - _firstPoint +1 ];
				};
			};
		};
		
		_leaderVeh setVariable ["convoy_path", _convoy_path];
		
		if ( speed _vehicle == 0 && ( (position _vehicle) distance (position _vehicleInFront)) > 100 ) then {
			(driver _vehicle) doMove (position _vehicleInFront);
		}
		else {
			//_vehicle setDriveOnPath (path select _i-1);
			_vehicle setDriveOnPath _vehiclePathChop;
		};
		
		// DEBUG
		if (SR_Debug) then {
			private _convoy_drawObjects = _leaderVeh getVariable ["convoy_drawObjects", -1];
			
			{deleteVehicle _x} forEach (_convoy_drawObjects select _i-1);
			_itMax = count _vehiclePathChop;
			for [{ _j = _itMax-1 }, { _j > -1 }, { _j = _j - 1 }] do {
				private _iconPos = _vehiclePathChop select _j;
				switch (_i) do
				{
					case 1:  { (_convoy_drawObjects select _i-1) pushBack createVehicle ["Sign_Arrow_Blue_F"	,_iconPos,[],0,"CAN_COLLIDE"]; };
					case 2:  { (_convoy_drawObjects select _i-1) pushBack createVehicle ["Sign_Arrow_Cyan_F"	,_iconPos,[],0,"CAN_COLLIDE"]; };
					case 3:  { (_convoy_drawObjects select _i-1) pushBack createVehicle ["Sign_Arrow_Green_F"	,_iconPos,[],0,"CAN_COLLIDE"]; };
					case 4:  { (_convoy_drawObjects select _i-1) pushBack createVehicle ["Sign_Arrow_Pink_F"	,_iconPos,[],0,"CAN_COLLIDE"]; };
					case 5:  { (_convoy_drawObjects select _i-1) pushBack createVehicle ["Sign_Arrow_F"			,_iconPos,[],0,"CAN_COLLIDE"]; };
					case 6:  { (_convoy_drawObjects select _i-1) pushBack createVehicle ["Sign_Arrow_Yellow_F"	,_iconPos,[],0,"CAN_COLLIDE"]; };
					case 7:  { (_convoy_drawObjects select _i-1) pushBack createVehicle ["Sign_Arrow_Blue_F"	,_iconPos,[],0,"CAN_COLLIDE"]; };
					case 8:  { (_convoy_drawObjects select _i-1) pushBack createVehicle ["Sign_Arrow_Cyan_F"	,_iconPos,[],0,"CAN_COLLIDE"]; };
					case 9:  { (_convoy_drawObjects select _i-1) pushBack createVehicle ["Sign_Arrow_Green_F"	,_iconPos,[],0,"CAN_COLLIDE"]; };
					case 10: { (_convoy_drawObjects select _i-1) pushBack createVehicle ["Sign_Arrow_Pink_F"	,_iconPos,[],0,"CAN_COLLIDE"]; };
					case 11: { (_convoy_drawObjects select _i-1) pushBack createVehicle ["Sign_Arrow_F"			,_iconPos,[],0,"CAN_COLLIDE"]; };
					case 12: { (_convoy_drawObjects select _i-1) pushBack createVehicle ["Sign_Arrow_Yellow_F"	,_iconPos,[],0,"CAN_COLLIDE"]; };
					default { hint "too long to draw" };
				};
			};
		};
		// ------------------------
	};

	sleep _pathFrequecy;
};

// exit script
for [{ _i = 0 }, { _i < _convoyLength }, { _i = _i + 1 }] do {
	private _vehicle = _groupVehicles select _i;
	
	_vehicle forceSpeed -1;
	_vehicle limitSpeed 100000;
	
	//(driver _vehicle) setBehaviour "AWARE";
	//_vehicle setUnloadInCombat [true, true];
};