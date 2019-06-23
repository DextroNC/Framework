//Parameter Init
params ["_phase"];
if (!isServer) exitWith {};

switch (_phase) do {
	// Effect Phase 1
	case 0: {
		[markerPos "fs",markerPos "fe", 80,"FULL","rhs_uh1h_hidf_gunship"] call BIS_fnc_ambientFlyBy; 
		sleep 3;
		[markerPos "fs",markerPos "fe", 90,"FULL","rhs_uh1h_hidf"] call BIS_fnc_ambientFlyBy; 
		sleep 4;
		[markerPos "fs",markerPos "fe", 75,"FULL","rhs_uh1h_hidf"] call BIS_fnc_ambientFlyBy; 
		sleep 3;
		[markerPos "fs",markerPos "fe", 95,"FULL","rhs_uh1h_hidf"] call BIS_fnc_ambientFlyBy; 
	};
	// Effect Phase 2
	case 1: {
		[markerPos "fs2",markerPos "fe2", 80,"FULL","rhs_uh1h_hidf_gunship"] call BIS_fnc_ambientFlyBy; 
		sleep 3;
		[markerPos "fs2",markerPos "fe2", 90,"FULL","rhs_uh1h_hidf"] call BIS_fnc_ambientFlyBy; 
		sleep 4;
		[markerPos "fs2",markerPos "fe2", 75,"FULL","rhs_uh1h_hidf"] call BIS_fnc_ambientFlyBy; 
		sleep 3;
		[markerPos "fs2",markerPos "fe2", 95,"FULL","rhs_uh1h_hidf"] call BIS_fnc_ambientFlyBy; 
	};
	// Effect Phase 3
	case 2: {

	};
};