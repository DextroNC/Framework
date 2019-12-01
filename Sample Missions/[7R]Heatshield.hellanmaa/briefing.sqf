/*
	Create Briefing with:
	http://www.ferstaberinde.com/f3/f3webtools/index.php
	
	Paste result into this file.
*/

// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// FACTION: CTRG

// ====================================================================================

// TASKS
// The code below creates tasks. Two (commented-out) sample tasks are included.
// Note: tasks should be entered into this file in reverse order.

// _task2 = player createSimpleTask ["OBJ_2"];
// _task2 setSimpleTaskDescription ["IN DEPTH OBJECTIVE DESCRIPTION", "SHORT OBJECTIVE DESCRIPTION", "WAYPOINT TEXT"];
// _task2 setSimpleTaskDestination WAYPOINTLOCATION;
// _task2 setTaskState "Created";

// _task1 = player createSimpleTask ["OBJ_1"];
// _task1 setSimpleTaskDescription ["IN DEPTH OBJECTIVE DESCRIPTION", "SHORT OBJECTIVE DESCRIPTION", "WAYPOINT TEXT"];
// _task1 setSimpleTaskDestination WAYPOINTLOCATION;
// _task1 setTaskState "Created";



// ====================================================================================

// NOTES: EXECUTION
// The code below creates the execution sub-section of notes.

_exe = player createDiaryRecord ["diary", ["Execution","
<br/>
<font size='18'>COMMANDER'S INTENT</font>
<br/>
We are depended on ground based resupplies which will take time. Plan ahead and stay focused on the objective.
<br/><br/>
<font size='18'>MOVEMENT PLAN</font>
<br/>
Echo and Platoon are motorized, the rest is moving on foot. Reinsertion by Echo.
<br/><br/>
<font size='18'>FIRE SUPPORT PLAN</font>
<br/>
Supplies by Echo, Artillery, CAS
<br/><br/>
<font size='18'>SPECIAL TASKS</font>
<br/>
Incendiary Grenades to destroy chemicals
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
Quickly move in and raid the factory. We are not hear to liberate the country, our objective is to shut down any chemical warfare agent production. Keep a low profile.
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
After the Russian-Georgian war Ossetian, gained its liberty with the help of russian interference. After a peace agreement with russian forces retreated under the condition that Ossetian remains indipendent. Nowadays Ossetian is a failed state, a lawless region, under control by bandits and local warlords.
<br/>
ISR picked up some suspicious activity on a former abandonded factory near the border. CIA is conviced that the factory is a production facility for chemical warfare agents alongside increase black market activity.
<br/>
A task force has been deployed to raid the factory and secure any chemical warfare agents as well as shutting down production.
<br/>

<br/><br/>
<font size='18'>ENEMY FORCES</font>
<br/>
Locals (Bandits, Militia, Armsdealers), equipment unknown
<br/><br/>
<font size='18'>FRIENDLY FORCES</font>
<br/>
US
"]];

// ====================================================================================