/*
	Parameters:
		<-- Horn as Object
		<-- Group as Group

	Description:
		Dual Horn sound for Course End

*/

// Parmeter Init
params ["_horn","_group"];

// End Horn Sound
[_horn,"FD_Course_Active_F"] remoteExec ["say3D",_group];
sleep 2;
[_horn,"FD_Course_Active_F"] remoteExec ["say3D",_group];
