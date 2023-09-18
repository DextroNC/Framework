/*		
	Parameters:
		<-- Target as Object
		
	Description:
		Adds a EH to create a marking on the bullet impact on a target.
		
	Example:

		
*/
// Parameter Init
params ["_obj"];

// Add EH
_obj addEventHandler ["HitPart", {
	// Scheduled execute
	[(_this select 0 select 3)]  spawn {
		// Parameter Init
		_pos = _this select 0;
		// Create Hit-Marker
		_spr = "Sign_sphere10cm_EP1" createVehicle [0,0,0];
		_spr setPosASL _pos;
		[_spr,[0,"#(rgb,8,8,3)color(1,0,0,1)"]] remoteExec ["setObjectTexture",0,true];
		// Wait and delete Marker
		sleep 10;
		deleteVehicle _spr;	
	};
}];




		