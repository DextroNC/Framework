/*
	Parameters:
		<--- None
		
	Auto Exec on Start.

*/

// ACRE Settings
// General
[false, false] call acre_api_fnc_setupMission;

// Terrain Loss (Interference)
[0] call acre_api_fnc_setLossModelScale;

// Full Duplex (Multi people can talk at the same time)
[true] call acre_api_fnc_setFullDuplex;

// Interference (Multi people sending at same frequency)
[false] call acre_api_fnc_setInterference;

// AI hearing players
[true] call acre_api_fnc_setRevealToAI;

// Disables simulation of Antenna Direction
[true] call acre_api_fnc_ignoreAntennaDirection;

// Channel Names
["ACRE_PRC152", "default", 1, "description", "PLT NET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "default", 2, "description", "COM NET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "default", 3, "description", "SUP NET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "default", 4, "description", "MECH NET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "default", 5, "description", "AIR NET 1"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "default", 6, "description", "AIR NET 2"] call acre_api_fnc_setPresetChannelField;

["ACRE_PRC148", "default", 1, "label", "PLT NET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC148", "default", 2, "label", "COM NET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC148", "default", 3, "label", "SUP NET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC148", "default", 4, "label", "MECH NET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC148", "default", 5, "label", "AIR NET 1"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC148", "default", 6, "label", "AIR NET 2"] call acre_api_fnc_setPresetChannelField;

["ACRE_PRC117F", "default", 1, "name", "PLT NET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 2, "name", "COM NET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 3, "name", "SUP NET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 4, "name", "MECH NET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 5, "name", "AIR NET 1"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 6, "name", "AIR NET 2"] call acre_api_fnc_setPresetChannelField;

// Client Only Part
if (!hasInterface) exitWith {};

//Comm Card
player createDiarySubject ["Communication", "Communication"];
player createDiaryRecord ["Communication", ["Frequencies", "
<br/>
<font size='16'>Rifleman Radio: AN/PRC-343 PRR</font>
<br/>
Block 1 Channel 1 - Alpha <br/>
Block 1 Channel 2 - Bravo <br/>
Block 1 Channel 3 - Charlie <br/>
Block 1 Channel 4 - Delta <br/>
Block 1 Channel 5 - Platoon Actual <br/>
Block 1 Channel 6 - Echo 1<br/>
Block 1 Channel 7 - Echo 2<br/>
Block 1 Channel 8 - Sierra 1<br/>
Block 1 Channel 9 - Sierra 2<br/>
Block 1 Channel 10 - Hotel 1 (REINF)<br/>
Block 1 Channel 11 - Hotel 2 (REINF)<br/>
<br/>
<font size='16'>Platoon Radio</font>
<br/>
Channel 1 - Platoon Net (Short Wave) <br/>
Channel 2 - Command Net (Long Wave) <br/>
Channel 3 - Support Net <br/>
Channel 4 - Mech Net <br/>
Channel 5 - Air Net 1<br/>
Channel 6 - Air Net 2<br/>
"]];

player createDiaryRecord ["Communication", ["Protocol", "
<br/>
<font size='16'>Request Pickup</font>
<br/>
1. Location<br/>
2. Landing Zone Details<br/>
3. Opt. Friendly Location<br/>
4. Opt. Recommended Approach<br/>
5. Opt. Colored Smoke Reference (on request)<br/>
<br/><br/>
<font size='16'>Request Supply Drop</font>
<br/>
1. Location<br/>
2. Drop Zone Details<br/>
3. Opt. Friendly Location<br/>
4. Opt. Recommended Approach<br/>
5. Opt. Colored Smoke Reference (on request)<br/>
<br/><br/>
<font size='16'>Request CAS</font>
<br/>
1. Target (Marker)<br/>
2. Description (Landmarks, Target Type, Weapon Type)<br/>
3. Friendly Location<br/>
4. Opt. Recommended Approach<br/>
5. Opt. Colored Smoke Reference (on request)<br/>
<br/><br/>
<font size='16'>Request Mortar Support</font>
<br/>
1. Warning: Fire Mission<br/>
2. Type: Adjust by Fire / Fire for Effect<br/>
3. Amount: Number of Rounds (by Fire for Effect)<br/>
4. Ordanance: Type of Ordanance (HE,Smoke,Illumination)<br/>
5. Target: Location / Marker Reference<br/>
6. Opt. Spreading: Size of Area and Direction of Expansion<br/>
7. Mortar Crew will repeat the received Message as Confirmation<br/>
<br/>
Additional Terminology:<br/>
- Rounds away<br/>
- Rounds complete<br/>
- Splash out<br/>
- Adjust Fire (Direction in Mils and Distance in meters)<br/>
"]];

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