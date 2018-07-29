/*

	Parameters:
		<-- none
	
	Description:
		System Init, both static variables and EventHandlers as preInit
*/

// Global Variable Init
SR_Side = west;
AI_ART_Units = [];
if (isServer) then {
	SR_CC = "Civilian Casulties:";
	publicVariable "SR_CC";
	SR_KIA = "Those we lost in battle: ";
	publicVariable "SR_KIA";
	SR_WC = "Alleged War Criminals:";
	publicVariable "SR_WC";
};
SR_SuspicionValue = 0;
SR_SuspicionSpotted = -60;

// Client Only Part
if (isDedicated) exitWith {};

// CBA Eventhandler
["ParaPort", {(_this select 1)allowDamage false;(_this select 1) moveInCargo [(_this select 0), (_this select 2)]; (_this select 1) assignAsCargo (_this select 0); [(_this select 1)] orderGetIn true; (_this select 1) allowDamage true; }] call CBA_fnc_addEventHandler;
["SideChatSS", {(_this select 0) sideChat (_this select 1) }] call CBA_fnc_addEventHandler;
["VehicleAmmo", {vehicle (_this select 0) setVehicleAmmo 1}] call CBA_fnc_addEventHandler;
["CombatLog", {player createDiaryRecord ["Combat Log", [_this select 0, _this select 1]]}] call CBA_fnc_addEventHandler;
["MissionLog", {player createDiaryRecord ["Mission Log", [_this select 0, _this select 1]]}] call CBA_fnc_addEventHandler;

// Diary Record Category Init
player createDiarySubject ["Combat Log", "Combat Log"];
player createDiarySubject ["Mission Log", "Mission Log"];

// Regulations
player createDiarySubject ["Regulation", "Regulation"];
player createDiaryRecord ["Regu lation", ["Equipment", "
<br/>
<font size='18'>Composition Regulations</font>
<br/>
- Loadouts must remain untouched (do not drop or replace content, Engineers may change explosives) </br>
- 2 Machine Guns max per Squad </br>
- 1 Grenadier max per Squad </br>
- 1 Entreching Tool per Squad (except Platoon is allowed more) </br>
- 1 DMR per Platoon <br/>
- Up to 1 Scope per Squad <br/>
-- perferly Rifleman, Asst. or IAR <br/>
-- Not allowed for SL, Medic, AR, MAT, MMG, Breacher, Grenadier or Saboteur <br/>
- maximum weight per soldier 40kg or default kit weight </br>
- Additional Ammunition can be carried by other members than the weapon operator (for AR, MAT or MMG Ammo) <br/>
- Additional Light AT Launchers can be carried (max 1 Nlaw per Squad)<br/>
-- 3 launchers total per Squad (incl. LAT, MAT) <br/>
-- Not to carry on AR or MMG <br/>
- Lockpicks may be carried by one Squad Member (not SL) <br/>
- One Entrenching Tool may be carried by the Squad (same restriction on roles like Scopes) <br/>
- The Platoon Leader or Sergeant may take a Laser Designator <br/>
<br/>
"]];

// Composition
player createDiarySubject ["Composition", "Composition"];
player createDiaryRecord ["Composition", ["Platoon Composition", "
<execute expression='nul = [] spawn fw_fnc_compositionDisplay'>Display Composition</execute> 
"]];