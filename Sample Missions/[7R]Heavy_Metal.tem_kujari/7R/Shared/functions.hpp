class fw
{
	class init {
		file = "7R\Init";
		class frameworkInit{preInit = 1;};
		class radioInit{postInit = 1;};
		class compositionDisplay{};
	};
	class shared
	{
		file = "7R\Shared";
		class deleteVehicle{};
		class designateMarker{};
		class isSergeant{};
		class flag{};
		class checkStatus{};
		class clearArea {};
		class sortUnitsByGroup{};
		class removeNVG{};
		class zeus{};
		class recall{};
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
		class civSleeper{};
		class civShooter{};
	};
	class arty
	{
		file = "7R\FireSupport";
		class artillery{};
		class CAS{};
	};
	class supply
	{
		file = "7R\Supplies";
		class supplyDropInit{};
		class supplyDropBox{};
		class supplyDropEject{};
		class supplyDropLanding{};
		class supplyDropReport{};
	};	
	class exfil {
		file = "7R\Exfil";
		class exfilAction{};
		class exfilCall{};
		class recoverCall{};
	};
	class reinf {
		file = "7R\REINF";
		class reinfInit{};
		class reinfMove{};
		class reinfAction{};
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
	class RP {
		file = "7R\Rally";
		class buildRP{};
		class destroyRP{};
	};
	class UC {
		file = "7R\Undercover";
		class goUndercover{};
		class exitUndercover{};
		class loopUndercover{};
	};
	class AiPatrol {
		file = "7R\AI\PatrolModule";
		class patrol{};
		class patrolInit{preInit = 1;};
		class patrolLoop{postInit = 1;};
	};
	class AiCommon {
		file = "7R\AI\Common";
		class getRandomPos{};
		class surrender{};
		class reinforce{};
		class suppress{};
		class depressedCooldown{};
		class hasLosses{};
		class removeDeadGroups{};
		class garrison{};
		class rampageCharge{};
		class rampageArea{};
		class artilleryInit{};
		class artilleryCheck{};
		class artilleryCall{};
		class dismountVehicle{};
	};
	class CleanUp {
		file = "7R\AI\CleanUp";
		class cleanUpLoop{postInit = true};
	};
};