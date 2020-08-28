/*
	Parameters:
		<-- none
		
	Description:
		Supply Drop Status Report listing remaining resources.
	
*/


private _string = "Artillery Supplies: " + str (ArtilleryCallAmmo) + "<br/>" + "Supply Drops: " + str(SupplyDropAmmo) + "<br/>" + "CAS: " + str (CASCallAmmo);

["",_string] spawn fw_fnc_info;