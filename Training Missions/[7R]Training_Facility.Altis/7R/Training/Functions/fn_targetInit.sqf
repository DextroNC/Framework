/*
	Parameters:
		<-- Model as String
		<-- Distance
		<-- Range Object as Object
		<-- Opt. Special Mode as Integer (0: None, 
										1: Rampart + 4 Small Targets, 
										2: Rampart + 1 Big Target, 
										3: Window + 1 Small Target
										4: Target Circle
										)
	
	Return:
		Targets as Array
		
	Description:
		Spawns a Target at the Range
		
	Example:
		nul = ["TargetBootcampHumanSimple_F",100,r1_p1] call fw_fnc_targetInit;

*/

// Parameter init
params ["_model","_dist","_range","_spec","_window"];
if (isNil "_spec") then {_spec = 0};
_return = [];

// Direction Adjustment
private _dirMod = 180;
if (_model isEqualTo "TargetBootcampHumanSimple_F") then {_dirMod = 0;};
if (_model isEqualTo "SR_PopUpTarget_Big") then {_dirMod = 0;};

// Create Target
if (_spec == 0) then {
	// Find position
	_pos = _range getRelPos [_dist, 0];
	// Create Target and position it
	_target = _model createVehicle [0,0,0];
	_target setDir ((direction _range) + _dirMod);
	_target setPos _pos;
	// Make Target pop down
	_target animate ["terc", 1];
	// Disable Damage to Target
	_target addEventHandler ["HandleDamage", {false}];
	// Generate Return
	_return = [_target];
};


// Special Modes
if (_spec > 0) then {
	switch (_spec) do {
		// Mode 1: 4x Targets with Rampart
		case 1: {
			// Rampart Position assesment and creation
			_pos = _range getRelPos [_dist, 0];
			_cover = "Land_fort_rampart" createVehicle [0,0,0];
			_cover setDir (direction _range);
			_cover setPos _pos;
			// Disable damage to Rampart
			_cover addEventHandler ["HandleDamage", {false}];
			// Create 4x Targets
			for "_i" from 1 to 4 do {
				_target = "TargetBootcampHumanSimple_F" createVehicle [0,0,0];
				_target setDir (direction _range);
				// Relative Position to Rampart and other targets
				_target setPos (_cover modelToWorld [5-(_i * 2), 3,0]);
				// Target pop down
				_target animate ["terc", 1];	
				// Disable Damage				
				_target addEventHandler ["HandleDamage", {false}];	
				// Add Target to Return
				_return pushBack _target;
			};
		};
		// Mode 2: 1x Big Target with Rampart
		case 2: { 			
			_pos = _range getRelPos [_dist, 0];
			_cover = "Land_fort_rampart" createVehicle [0,0,0];
			_cover setDir (direction _range);
			_cover setPos _pos;
			_cover addEventHandler ["HandleDamage", {false}];
			_target = "SR_PopUpTarget_Big" createVehicle [0,0,0];
			_target setDir (direction _range);
			_target setPos (_cover modelToWorld [0,3,0]);
			_target animate ["terc", 1];
			_target addEventHandler ["HandleDamage", {false}];				
			_return pushBack _target;
		};
		// Mode 3: 1x Target with Shelter (window)
		case 3: {			
			_pos = _range getRelPos [_dist, 0];
			_cover = "Land_CncShelter_F" createVehicle [0,0,0];
			_cover setDir (direction _range);
			_cover setPos _pos;
			_cover addEventHandler ["HandleDamage", {false}];	
			_cover2 = "Land_CncBlock" createVehicle [0,0,0];
			_cover2 setDir (direction _range);
			_cover2 setPos (_cover modelToWorld [0,-1,-1.15]);
			_cover2 addEventHandler ["HandleDamage", {false}];	
			_target = "TargetBootcampHumanSimple_F" createVehicle [0,0,0];
			_target setDir (direction _range);
			_target setPos (_cover modelToWorld [0,0,-1.15]);
			_target animate ["terc", 1];		
			_target addEventHandler ["HandleDamage", {false}];				
			_return pushBack _target;
		};
		// Mode 4: Target with Circle
		case 4: { 			
			_pos = _range getRelPos [_dist, 0];
			_target = "SignAd_Sponsor_F" createVehicle [0,0,0];
			_target setDir (direction _range);
			_target setPos _pos;
			_target setObjectTextureGlobal [0, "targets\T_1.jpg"];
			_target addEventHandler ["HandleDamage", {false}];				
			_return pushBack _target;
		};
	};
};

_return
