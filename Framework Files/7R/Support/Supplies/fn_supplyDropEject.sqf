/*
	Parameters:
		<-- Group Leader as Object

	Descriptions:
		Ejects attached objects from aircraft


*/

// Parameter Init
params ["_leader"];
private _vehicle = vehicle _leader;

// Exit if not local
if(!local _vehicle) exitWith {};

// Open ramp
_vehicle animate ["ramp_bottom",1];
_vehicle animate ["ramp_top",1];

// Loop through all attached objects and drop them
{
	// Prepare and Detach
	_x setOwner (owner _vehicle);
	_x disableCollisionWith _vehicle;
	_x hideObject false;
	detach _x;

	// Create and Attach Parachute
	private _parachute = "B_Parachute_02_F" createVehicle [0, 0, 100];
	_parachute setDir (direction _vehicle);
	_parachute setposASL (getPosASL _x);
	_x attachTo [_parachute,[0,0,-.5]];
	[_x,_parachute] spawn fw_fnc_supplyDropLanding;
	if (sunOrMoon < 0.6) then {
		private _strobe = "ACE_G_Chemlight_HiBlue" createVehicle (getPos _x);
		_strobe attachTo [_x,[0,0,0.25]];
	};


	sleep 0.25;
} forEach attachedObjects _vehicle;

// Info message
["Cargo dropped."] spawn fw_fnc_info;

// Close ramp
sleep 5;
_vehicle animate ["ramp_bottom",0];
_vehicle animate ["ramp_top",0];
