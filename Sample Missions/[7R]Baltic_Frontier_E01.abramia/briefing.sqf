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

// FACTION: NATO

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

// NOTES: ADMINISTRATION
// The code below creates the administration sub-section of notes.

_adm = player createDiaryRecord ["diary", ["Administration","
<br/>
start, end, bridge, town, mortar, airfield
"]];

// ====================================================================================

// NOTES: EXECUTION
// The code below creates the execution sub-section of notes.

_exe = player createDiaryRecord ["diary", ["Execution","
<br/>
<font size='18'>COMMANDER'S INTENT</font>
<br/>
Focus on de-escalating any tensions while maintaining neutral regarding local conflicts.
<br/><br/>
<font size='18'>MOVEMENT PLAN</font>
<br/>
Movement by boat and on foot. Once the Airfield is secure an air bridge with helicopters will be established.
<br/><br/>
<font size='18'>FIRE SUPPORT PLAN</font>
<br/>
Supplies
<br/><br/>
<font size='18'>SPECIAL TASKS</font>
<br/>
none
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
Land at the harbor and make contact with local officials to coordinate the demilitarization. Continue to the airfield and take control over the are and secure the transport effort.
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
With tehe desolation of teh USSR and the retreat of Russia from the region, we are left with an island group under control of a troubled and distant government loaded with weapons left by Russian troops. Furthermore, we have multiple ethnic groups struggling to get the upperhand in the post USSR era.
<br/>

<br/>
This Island has also been used to train troops from all over the USSR. The Chernarus government made a deal with western countries to demilitarize the island in return for economical help. In order to oversee the transport of weaponry off the island, US Marines have been deployed to a newly built airbase in the region.
<br/>

<br/>
There are some concerns that remaining forces on the island will sell the weapons to arms dealers which will smuggle them off the island and sell them on the global market. The current plan is to transport all weapons of the main airfield. 
<br/>

<br/>
Before troops will land on the island there will be a training exercise to ensure troop readyness. 
<br/><br/>
<font size='18'>ENEMY FORCES</font>
<br/>
unkown
<br/><br/>
<font size='18'>FRIENDLY FORCES</font>
<br/>
US
"]];

// ====================================================================================