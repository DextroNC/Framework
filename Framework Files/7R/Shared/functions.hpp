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
		class isLeader{};
		class flag{};
		class checkStatus{};
		class clearArea {};
		class sortUnitsByGroup{};
		class removeNVG{};
		class recall{};
		class zeus {};
		class info{};
		class findLocation{};
		class debrief{};
		class forceRespawn{};
		class spawnMessage{};
	};
	class template
	{
		file = "7R\Templates";
		class saveTemplate{};
		class spawnTemplate{};
		class spawnVehicleTemplate{};
		class findTemplate{};
		class spawnTemplateUnits{};
	};
	class civ
	{
		file = "7R\Civ";
		class civSpawn{};
		class civPatrol{};
		class civBomber{};
		class civSleeper{};
		class civShooter{};
		class civEventhandler{};
		class civBomberAction{};
		class civUnitSpawn{};
	};
	class support {
		file = "7R\Support";
		class supportStatusReport{};
	};
	
	

	class arty
	{
		file = "7R\Support\FireSupport";
		class artillery{};
		class artilleryReadyCheck{};
		class CAS{};
		class UAV{};
	};
	class supply
	{
		file = "7R\Support\Supplies";
		class supplyDropInit{};
		class supplyDropBox{};
		class supplyDropEject{};
		class supplyDropLanding{};
		class canCallVehicleDrop{};
		class vehicleDropAction{};
		class supplyLoad{};
		class supplySpawn{};
		class supplyDropAction{};
		class supplySlingAction{};
		class supplySpawnAction{};
	};
	class exfil {
		file = "7R\Support\Exfil";
		class exfilAction{};
		class exfilCall{};
	};
	class reinf {
		file = "7R\Support\REINF";
		class reinfInit{};
		class reinfMove{};
		class reinfAction{};
	};
	class Objectives {
		file = "7R\Objectives";
		class hvt{};
		class vip{};
		class intelAction{};
		class intelCollection{};
	};
	class repair {
		file = "7R\Repair";
		class repairStation{};

	};
	class para {
		file = "7R\ParaDrop";
		class paraDrop{};
		class paraDropPlane{};
		class freefallDrop{};
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
		class changePylons{};
	};
	class special {
		file = "7R";
		class missionManager{};
		class systemInit{preInit = 1;};
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
		class findPOI{};
		class garrisonZEI{};
		class createWaypoint{};
		class convoy{};
		class convoyReaction{};
	};
	class AiAnimationn {
		file = "7R\AI\Animation";
		class ambientAnimation{};
	};
	class CleanUp {
		file = "7R\AI\CleanUp";
		class cleanUpLoop{postInit = true};
	};
	class AIEH {
		file = "7R\AI\Eventhandler";
		class civKilledEH{};
		class civPanicEH{};
		class powKilledEH{};
		class garrisonKilledEH{};
	};
	class Loadouts {
		file = "7R\Loadouts";
		class clearVehicleCargo{};
		class addEquipmentRadios{};
		class addEquipmentItems{};
		class conditionEquipment{};
		class addUniformsToBox{};
	};
	class Text {
		file = "7R\Text";
		class makeColor{};
	};
	class Breach {
		file = "7R\Breach";
		class lockAreaDoors{};
	};
};
