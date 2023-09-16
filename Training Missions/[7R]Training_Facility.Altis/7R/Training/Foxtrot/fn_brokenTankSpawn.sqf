// spawn a damaged tank to practice field repairs

params ["_nbr","_terminal"];

switch (_nbr) do {
	case 1: {
	
	_old = nearestObjects [fx_repairtest,["AllVehicles"],10]; 
	{
	deleteVehicle _x;
	}forEach _old; 
	sleep 1;

	_veh = createVehicle ["RHS_M2A3_wd",(position fx_repairtest), [], 0, "NONE"];
	clearWeaponCargoGlobal _veh;
	clearMagazineCargoGlobal _veh; 
	clearitemcargoGlobal _veh;
	clearBackpackCargoGlobal _veh;
	_veh setDir (direction fx_repairtest);
	_veh setDamage 0.8;
	_veh setVehicleAmmo 0.5;
	_veh setFuel 0.5;
	};

	case 2: {
	
	_old = nearestObjects [fx_repairtest,["AllVehicles"],10]; 
	{
	deleteVehicle _x;
	}forEach _old; 

	
	};
};