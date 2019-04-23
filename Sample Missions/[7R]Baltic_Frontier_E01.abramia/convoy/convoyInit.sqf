// convoyDefend_init.sqf
// © v.1 NOVEMBER 2016 - Devastator_cm
/*
	Parameters:
		<-- Markers as Array
		<-- Vehilces as Array
		<-- Upsmon Params as Array (without unit)
		
		Example:
		[["r2_1","r2_2","r2_3"],[v2_1,v2_2,v2_3],[taor,"NOWP","DELETE:",300]] execVM "convoy\convoyInit.sqf";



*/

private ["_vcl","_markerArray","_convoyArray", "_cem"]; 
DEVAS_convoyMaxSpeed 	= Compile PreprocessFile "convoy\convoyMaxSpeed.sqf";
DEVAS_convoyMove		= Compile PreprocessFile "convoy\convoyMove.sqf";
DEVAS_endPoint 			= Compile PreprocessFile "convoy\convoyEndPoint.sqf";

_markerArray 		 	= _this select 0;
_convoyArray 		 	= _this select 1;
_upsmonArray 			= _this select 2;
///// Below parameters can be modified  /////
DEVAS_SpeedLimit		= 35;    // This is the speed limit of convoy. It might be a bit lower than this during the game due to speed corrections related to vehicle distances
DEVAS_SearchRange		= 500;   // How close enemies are considered as threat
DEVAS_RestartDelay		= 15;    // This value will be multiplied by 10 and will give the seconds before convoy starts again after an ambush
/////////////////////////////////////////////
[_markerArray,_convoyArray,_upsmonArray] spawn DEVAS_convoyMove;