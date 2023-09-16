/*
	Creates a waypoint for the Micro Dagger for shift+left mouse on map.
	
*/
ace_medical_enableUnconsciousnessAI = 2;
if(isServer) exitWith {};

["7R_WP", "onMapSingleClick", {
	if (("ACE_microDAGR" in (items ACE_player))) then {
		if (_shift) then {
			// Delete Old WP
			private _waypoints = ACE_player getVariable ["ace_microdagr_waypoints", []];
			{
				if ("MapWP" in _x) then {
					_waypoints deleteAT _forEachIndex; 
				};
			} forEach _waypoints;
			private _old = _waypoints find "MapWP";
			if (_old != -1) then {
				[_old] call ace_microdagr_fnc_deviceDeleteWaypoint;
			};
			// Add New WP
			["MapWP", _pos] call ace_microdagr_fnc_deviceAddWaypoint;
			// Set New WP as Active
			_waypoints = ACE_player getVariable ["ace_microdagr_waypoints", []];
			{
				if ("MapWP" in _x) then {
					ace_microdagr_currentWaypoint = _forEachIndex; 
				};
			} forEach _waypoints;
		};
	};
}] call BIS_fnc_addStackedEventHandler;