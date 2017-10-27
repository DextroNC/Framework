/*

	Parameters:
		<-- none
	
	Description:
	System Init, both static variables and EventHandlers
*/

// Server only execute check
SR_Side = west;

if (isServer) then {
	SR_CC = "Civilian Casulties:";
	publicVariable "SR_CC";
	SR_KIA = "Those we lost in battle: ";
	publicVariable "SR_KIA";
	SR_WC = "Alleged War Criminals:";
	publicVariable "SR_WC";
};


// Function Inits (do not touch)
if (!isDedicated) then {
	["ParaPort", {(_this select 1)allowDamage false;(_this select 1) moveInCargo [(_this select 0), (_this select 2)]; (_this select 1) assignAsCargo (_this select 0); [(_this select 1)] orderGetIn true; (_this select 1) allowDamage true; }] call CBA_fnc_addEventHandler;
	["SideChatSS", {(_this select 0) sideChat (_this select 1) }] call CBA_fnc_addEventHandler;
	["VehicleAmmo", {vehicle (_this select 0) setVehicleAmmo 1}] call CBA_fnc_addEventHandler;
	["CombatLog", {player createDiaryRecord ["Combat Log", [_this select 0, _this select 1]]}] call CBA_fnc_addEventHandler;
};