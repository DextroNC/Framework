// Parameter init Navigation Training
params ["_con","_terminal"];
// Practice spots
_navtrain = ["tnav_1","tnav_2","tnav_3","tnav_4","tnav_5","tnav_6","tnav_7","tnav_8","tnav_9","tnav_10","tnav_11","tnav_12"];
// Prepare trainee
_con setVariable ["SR_Class", "Nav", true];
_pos = markerPos (selectRandom _navtrain);
_con unlinkItem "ItemGPS";
ace_map_BFT_Enabled = false;
// Port Trainee
_con setPos _pos;
// Display AO Marker
["train_nav", 0.4] remoteExec ["setMarkerAlphalocal", _con];
// Start message
hint "Teleported";