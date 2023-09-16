//Delete a composition via its referece name

private[ "_obj", "_group", "_nul" ];
params[ "_compReference" ];

private _deferedGroups = [];
//[ "Marker", "Object", "Group", "Waypoint", "Trigger", "Logic" ];
{
	_obj = _x;
	switch ( typeName _obj ) do {
		//OBJECT, TRIGGER, LOGIC
		case ( "OBJECT" ) : {
			_group = group _obj;
			deleteVehicle _obj;
			if !( isNull _group ) then {
				if ( count units _group isEqualTo 0 ) then {
					deleteGroup _group;
				} else {
					_nul = _deferedGroups pushBack _group;
				};
			};
		};
		//GROUP
		case ( "GROUP" ) : {
			if ( count units _obj isEqualTo 0 ) then {
				deleteGroup _obj;
			} else {
				if (!isNil "_group") then {
					_nul = _deferedGroups pushBack _group;
				}
			};
		};
		//WAYPOINT
		case ( "ARRAY" );
		case ( "WAYPOINT" ) : {
			//Is there a need for this, do not WPs get cleaned up when theyre group is deleted?
		};
		//MARKER
		case ( "STRING" ) : {
			if !( getMarkerPos _obj isEqualTo [0,0,0] ) then {
				deleteMarker _obj;
			};
		};
	};
} forEach ( _compReference call LARs_fnc_getCompObjects );

{
	if !( isNull _x ) then {
		if ( count units _x isEqualTo 0 ) then {
			deleteGroup _x;
		};
	};
} forEach _deferedGroups;

{
	if ( !isNil "_x" && { _x select 0 == _compReference } ) exitWith { LARs_spawnedCompositions set [ _forEachIndex, nil ] };
} forEach LARs_spawnedCompositions;

if ( { !isNil "_x" }count LARs_spawnedCompositions isEqualTo 0 ) then {
	LARs_spawnedCompositions = [];
};
