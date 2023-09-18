/*
	Parameters:
		<-- None

	Description:
		Zeus fix (only execute local)


	Example:
	[] call fw_fnc_zeus;

*/
	
// Fix Zeus
[player, (allCurators select 0)] remoteExec ["assignCurator", 2];