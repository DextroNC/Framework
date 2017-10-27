/*
	Parameters:
		<-- none
		
	Description:
	Supply Drop Status Report listing remaining resources.
	
*/

/*
if (isNil "SupplyDropAmmo") then {SupplyDropAmmo = 5; publicVariable "SupplyDropAmmo";};
if (isNil "ArtilleryCallAmmo") then {ArtilleryCallAmmo = 20; publicVariable "ArtilleryCallAmmo";};
*/


hint format ["Artillery Rounds: %1 \nSupply Drops: %2",ArtilleryCallAmmo,SupplyDropAmmo];

