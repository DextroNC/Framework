class fw
{
	class init {
		file = "7R\Init";
		class playerSide{preInit = 1;};
		class commCard{postInit = 1;};
		class regulations{postInit = 1;};
		class radioInit{postInit = 1;};
		class composition{postInit = 1;};
		class compositionDisplay{};
	};
	class shared
	{
		file = "7R\Shared";
		class deleteVehicle{};
		class designateMarker{};
		class dismountVehicle{};
		class vehiclePatrol{};
		class flag{};
	};
	class template
	{
		file = "7R\Templates";
		class saveTemplate{};
		class spawnTemplate{};
		class spawnVehicleTemplate{};
	};
	class civ
	{
		file = "7R\Civ";
		class civSpawn{};
		class civPatrol{};
		class civBomber{};
	};
	class arty
	{
		file = "7R\FireSupport";
		class artillery{};
	};
	class supply
	{
		file = "7R\Supplies";
		class supplyDropInit{};
		class supplyDropBox{};
		class supplyDropEject{};
		class supplyDropLanding{};
		class supplyDropReport{};
		class supplyDropVehicleInit{};
		class supplyDropVehicleAction{};
		class supplyDropVehicleTrigger{};
		class supplyDropFortInit{};
		class supplyDropFortAction{};
		class supplyDropSparePart{};
	};	
	class exfil {
		file = "7R\Exfil";
		class exfilAction{};
		class exfilCall{};
	};
	class Objectives {
		file = "7R\Objectives";
		class hvt{};
		class intelAction{};
		class intelCollection{};
		class hackingAction{};
		class hackingLoop{};
		class hackingPickup{};	
	};
	class repair {
		file = "7R\Repair";
		class resupplyPost{};
		class repairStation{};
		
	};
	class para {
		file = "7R\ParaDrop";
		class paraDrop{};
	};
	class teleport {
		file = "7R\Teleport";
		class jipTeleport{};
		class teleport{};
	};
	class spawn {
		file = "7R\Spawn";
		class vehicleSpawn{};
		class heloSpawn{};
		class cargoSpawn{};
	};
	class special {
		file = "7R";
		class missionManager{};
		class systemInit{preInit = 1;};
	};
};