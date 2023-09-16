/*
	Parameters:
		<-- Horn as Object
		<-- Group as Group

	Description:
		Course Start Msg and Horn Sound

*/

// Parmeter Init
params ["_horn","_group"];

// Start Messages
"Ready" remoteExec ["hint", _group];
sleep 2;
"Set" remoteExec ["hint", _group];
sleep 2;
"Go" remoteExec ["hint", _group];

// Horn Sound
[_horn,"FD_Course_Active_F"] remoteExec ["say3D",_group];
