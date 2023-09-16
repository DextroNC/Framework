/*
	Parameters:
		<-- Spawn Marker as String
		<-- Instructor as Object
		<-- Unit Classname as String
		<-- Is prisoner as boolean
		<-- Damage type as integer

	Example:
		nul = ["wounded",player,"B_Survivor_F", false, 2] spawn fw_fnc_spawnWounded
		nul = ["prison",player,"B_Survivor_F",true] spawn fw_fnc_spawnWounded
		
*/
// Parameter init
params ["_nbr","_ldr","_terminal","_con"];
private _g = group _ldr;
suppression = 20;


// Unified Start
// Terminal set Active
_terminal setVariable ["SR_Test",true,true];

// Wound Unit
switch (_nbr) do {
    case 1: {
		// Parameter Init
		private _units = [];
		private _wounds= [1,2,2,2,3,3,3,3,3,3,4,4,4,4,5,5,5];
		private _strengh = [0.25,0.25,0.5,0.5,0.5,0.5,1,1,1,2,2,2];
	
		// Wounded Spawn Loop
		while {_terminal getVariable ["SR_Test",false] && count _units < 1} do {
			
			// Spawn Wounded
			private _pos = ["bc_medic_area", true] call CBA_fnc_randPosArea;
			_unit = [_pos, selectRandom _wounds, selectRandom _strengh] call fw_fnc_spawnWounded;
			_units pushBack _unit;
			array = _units;

			// If insta dead, remove
			sleep 1;
			if (!alive _unit) then {
				_units = _units - [_unit];
				deleteVehicle _unit;
			};

			sleep 2;
			if (!(_terminal getVariable ["SR_Test",false])) exitWith {};
		};

		waitUntil {!(_terminal getVariable ["SR_Test",false])};
		
		// Reset Course
		[_units] spawn fw_fnc_removeWounded;
		
	};
	case 2: {
		// Parameter Init
		private _units = [];
		private _wounds= [1,2,2,2,3,3,3,3,3,3,4,4,4,4,5,5,5];
		private _strengh = [0.25,0.25,0.5,0.5,0.5,0.5,1,1,1,2,2,2];
	
		// Wounded Spawn Loop
		while {_terminal getVariable ["SR_Test",false] && count _units < 3} do {
			
			// Spawn Wounded
			private _pos = ["bc_medic_area", true] call CBA_fnc_randPosArea;
			_unit = [_pos, selectRandom _wounds, selectRandom _strengh] call fw_fnc_spawnWounded;
			_units pushBack _unit;
			array = _units;

			// If insta dead, remove
			sleep 1;
			if (!alive _unit) then {
				_units = _units - [_unit];
				deleteVehicle _unit;
			};

			sleep 2;
			if (!(_terminal getVariable ["SR_Test",false])) exitWith {};
		};

		waitUntil {!(_terminal getVariable ["SR_Test",false])};

		// Reset Course
		[_units] spawn fw_fnc_removeWounded;
	};		
	case 3: {
		// Parameter Init
		private _units = [];
		private _wounds= [1,2,2,2,3,3,3,3,3,3,4,4,4,4,5,5,5];
		private _strengh = [0.25,0.25,0.5,0.5,0.5,0.5,1,1,1,2,2,2];
	
		// Wounded Spawn Loop
		while {_terminal getVariable ["SR_Test",false] && count _units < 5} do {
			
			// Spawn Wounded
			private _pos = ["bc_medic_area", true] call CBA_fnc_randPosArea;
			_unit = [_pos, selectRandom _wounds, selectRandom _strengh] call fw_fnc_spawnWounded;
			_units pushBack _unit;
			array = _units;

			// If insta dead, remove
			sleep 1;
			if (!alive _unit) then {
				_units = _units - [_unit];
				deleteVehicle _unit;
			};

			sleep 2;
			if (!(_terminal getVariable ["SR_Test",false])) exitWith {};
		};

		waitUntil {!(_terminal getVariable ["SR_Test",false])};

		// Reset Course
		[_units] spawn fw_fnc_removeWounded;
	};
	case 4: {
		// Parameter Init
		private _units = [];
		// Prisoner Spawn Loop
		while {_terminal getVariable ["SR_Test",false] && count _units < 1} do {
		
			// Create VIP
			private _group = createGroup civilian;
			private _vip = _group createUnit ["C_man_w_worker_F", [0,0,0], [],0,"NONE"];
			private _pos = ["bc_medic_area", true] call CBA_fnc_randPosArea;
			_vip disableAi "ALL";
			_vip addItem "HandGrenade";
			_vip setDir (random 360);
			_vip setPos _pos;
			[_vip, true] call ACE_captives_fnc_setSurrendered;
			_units pushBack _vip;
			
			sleep 2;
			if (!(_terminal getVariable ["SR_Test",false])) exitWith {};
		};
		waitUntil {!(_terminal getVariable ["SR_Test",false])};

		// Deletion Loop
		{
			deleteVehicle _x;
		}forEach _units;		
	};
	case 5: {
		// Parameter Init
		private _units = [];
		// Prisoner Spawn Loop
		while {_terminal getVariable ["SR_Test",false] && count _units < 3} do {
		
			// Create VIP
			private _group = createGroup civilian;
			private _vip = _group createUnit ["C_man_w_worker_F", [0,0,0], [],0,"NONE"];
			private _pos = ["bc_medic_area", true] call CBA_fnc_randPosArea;
			_vip disableAi "ALL";
			_vip addItem "HandGrenade";
			_vip setDir (random 360);
			_vip setPos _pos;
			[_vip, true] call ACE_captives_fnc_setSurrendered;
			_units pushBack _vip;
			
			sleep 2;
			if (!(_terminal getVariable ["SR_Test",false])) exitWith {};
		};
		waitUntil {!(_terminal getVariable ["SR_Test",false])};

		// Deletion Loop
		{
			deleteVehicle _x;
		}forEach _units;		
	};
	case 6: {
		// Parameter Init
		private _units = [];
		// Prisoner Spawn Loop
		while {_terminal getVariable ["SR_Test",false] && count _units < 5} do {
		
			// Create VIP
			private _group = createGroup civilian;
			private _vip = _group createUnit ["C_man_w_worker_F", [0,0,0], [],0,"NONE"];
			private _pos = ["bc_medic_area", true] call CBA_fnc_randPosArea;
			_vip disableAi "ALL";
			_vip addItem "HandGrenade";
			_vip setDir (random 360);
			_vip setPos _pos;
			[_vip, true] call ACE_captives_fnc_setSurrendered;
			_units pushBack _vip;
			
			sleep 2;
			if (!(_terminal getVariable ["SR_Test",false])) exitWith {};
		};
		waitUntil {!(_terminal getVariable ["SR_Test",false])};

		// Deletion Loop
		{
			deleteVehicle _x;
		}forEach _units;		
	};
};