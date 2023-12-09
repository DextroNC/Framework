/*
	Parameters:
		<-- none
		
	Description:
		Displays the status of support available
	

*/
private _string = "Support Status:" + 
		"<br/>Supply Drops: " + str(SupplyDropAmmo) +
		"<br/>Artillery: " + str (ArtilleryCallAmmo) +
		"<br/>CAS: " + str (CASCallAmmo) + 
		"<br/>UAV: " + str (UAVCallAmmo);

["",_string] spawn fw_fnc_info;