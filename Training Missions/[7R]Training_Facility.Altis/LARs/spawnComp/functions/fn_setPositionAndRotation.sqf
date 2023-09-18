//Apply composition Object rotation and position
//TODO: Fixme, this is not always corrrect

#include "macros.inc"

private[ "_pos", "_newPosX", "_newPosY", "_newPosASL", "_newPosZ", "_rotation", "_mkrPos" ];
params[
	[ "_obj", objNull ],
	[ "_cfgOffset", [0,0,0] ],
	[ "_cfgRot", [0,0,0] ],
	[ "_ATLOffset", 0 ],
	[ "_randomStartPos", [] ],
	[ "_needsSurfaceUp", false ],
	[ "_placementRadius", 0 ]
];

if ( _compIgnoreATLOffset ) then {
	_ATLOffset = 0;
};

//TESTING
//	if ( DEBUG_DEV ) then {
//		if !( canSuspend ) exitWith {
//			_this spawn LARs_fnc_setPositionAndRotation;
//		};
//	};

//ReOrientated Objects composition offset from [ x, z, y ] to [ x, y, z ]
_cfgOffset = [ _cfgOffset select 0, _cfgOffset select 2 , _cfgOffset select 1 ];

//Rotate composition offset by rotation passed to spawnComp
_cfgOffset = [ _cfgOffset, 360 - _compRot ] call BIS_fnc_rotateVector2D;

//Add offset passed to spawnComp ( rotated by rotation passed to spawnComp )
_cfgOffset = _cfgOffset vectorAdd ( [ _compOffset, 360 - _compRot ] call BIS_fnc_rotateVector2D ) ;

if ( _compAlign && !_asPlaced ) then {
	_newPosX = ( _compPos select 0 ) + ( _cfgOffset select 0 );
	_newPosY = ( _compPos select 1 ) + ( _cfgOffset select 1 );
	_newPosASL = getTerrainHeightASL [ _newPosX, _newPosY ];
	_newPosZ = _newPosASL + ( _cfgOffset select 2 );
//		if ( _asPlaced ) then {
//			_pos = [ _newPosX, _newPosY, _newPosZ + _ATLOffset ];
//		}else{
		_pos = [ _newPosX, _newPosY, _newPosZ ];
//		};
}else{
	_pos = ( _compPos vectorAdd _cfgOffset ) vectorAdd [ 0, 0, _ATLOffset ];
};

if ( count _randomStartPos > 0 ) then {
	_randomStartPos = _randomStartPos  apply {
		_mkrPos = ATLToASL getMarkerPos _x;
		_mkrPos = _mkrPos vectorAdd [ 0, 0, abs( boundingBoxReal _obj select 0 select 2 ) ];
		_mkrPos
	};
	_pos = selectRandom ( [ _pos ] + _randomStartPos );
};

if ( _placementRadius > 0 ) then {
	_pos = AGLToASL ( _pos getPos [ random _placementRadius, random 360 ] );
	_pos = _pos vectorAdd [ 0, 0, abs( boundingBoxReal _obj select 0 select 2 ) ];
};

if ( surfaceIsWater _pos && _compWater && !_asPlaced ) then {
	_pos = [ _pos select 0, _pos select 1, 0 + ( _cfgOffset select 2 ) + ( _compOffset select 2 ) ];
};

if ( DEBUG_DEV ) then {
	//OBJECT composition pos + offset + atl offset
	createVehicle [ "Sign_Arrow_Yellow_F", ASLToATL ( ( _compPos vectorAdd _cfgOffset ) vectorAdd [ 0, 0, _ATLOffset ] ), [], 0, "CAN_COLLIDE" ];
	//OBJECT calculated final position
	createVehicle [ "Sign_Arrow_Green_F", ASLToATL _pos, [], 0, "CAN_COLLIDE" ];
};


if !( isNull _obj ) then {

	//Move object to its world position
	_obj setPosWorld _pos;

	//Turn composition angles to degrees
	_CfgRot params[ "_P", "_Y", "_R" ];

	_Y = ( deg _Y ) + _compRot;
	_P = deg _P;
	_R = 360 - deg _R;

	//If Aliging composition or its a vehicle that needs surface up
	_pb = if ( ( _compAlign || _needsSurfaceUP ) && !( surfaceIsWater _pos && _compWater ) && !_asPlaced ) then {
		//Face it in the right direction
		_obj setDir _Y;
		//Get positions surface up
		_up = surfaceNormal _pos;

		//Get bound corner surface ups
		_bounds = boundingBoxReal _obj;
		_bounds params[ "_mins", "_maxs" ];
		_mins params[ "_minX", "_minY", "_minZ" ];
		_maxs params[ "_maxX", "_maxY" ];

		//Calculate up based on corner surface normals
		_newUp = _up;
		{
			_cornerPos = _obj modelToWorldVisual _x;
			_cornerUp = surfaceNormal _cornerPos;
			_weight = _pos distance _cornerPos;
			_diff = ( _up vectorDiff _cornerUp ) vectorMultiply _weight;
			_newUp = _newUp vectorAdd _diff;
		}forEach [
			[ _minX, _minY, _minZ ],
			[ _minX, _maxY, _minZ ],
			[ _maxX, _maxY, _minZ ],
			[ _maxX, _minY, _minZ ]
		];

		_obj setVectorUp vectorNormalized _up;

		_obj call BIS_fnc_getPitchBank
	}else{
		[ 0, 0 ]
	};

	//Add any surface offset to composition rotations
	_pb params[ "_pbP", "_pbR" ];

	_P = _P + _pbP;
	_R = _R + _pbR;

	//Make sure rotations are in 0 - 360 range
	{
		_deg = call compile format [ "%1 mod 360", _x ];
		if ( _deg < 0 ) then {
			_deg = linearConversion[ -0, -360, _deg, 360, 0 ];
		};
		call compile format[ "%1 = _deg", _x ];
	}forEach [ "_P", "_R", "_Y" ];

	//Calculate Dir and Up
	_dir = [ sin _Y * cos _P, cos _Y * cos _P, sin _P];
	_up = [ [ sin _R, -sin _P, cos _R * cos _P ], -_Y ] call BIS_fnc_rotateVector2D;

	//Set Object orientation
	_obj setVectorDirAndUp [ _dir, _up ];

};

_pos

//private LARs_fnc_getRotation = {
//	params[ "_CfgRot", "_obj" ];
//
//
//	_CfgRot params[ "_P", "_Y", "_R" ];
//	_Y = ( ( deg _Y ) + _compRot );
//	_P = ( deg _P );
//	_R = ( deg _R );
//
//	_cfgDir = [ sin _Y * cos _P, cos _Y * cos _P, sin _P];
//	_cfgUp = [ [ sin _R, -sin _P, cos _R * cos _P ], -_Y ] call BIS_fnc_rotateVector2D;
//
//	_obj setVectorDirAndUp [ _cfgDir, _cfgUp ];
//
//};