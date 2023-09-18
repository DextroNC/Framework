waitFor = true;

TAG_fnc_teleport = {
	(vehicle player) setPos (_pos vectorAdd [0, 0, 500]);
	waitFor = false;
};


["Teleport_ID", "onMapSingleClick", "TAG_fnc_teleport"] call BIS_fnc_addStackedEventHandler;
waitUntil{!waitFor};
["Teleport_ID", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;