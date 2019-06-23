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

// NOTES: CREDITS
// The code below creates the administration sub-section of notes.

_cre = player createDiaryRecord ["diary", ["Admin","
<br/>
cas, train
"]];


// ====================================================================================

// NOTES: EXECUTION
// The code below creates the execution sub-section of notes.

_exe = player createDiaryRecord ["diary", ["Execution","
<br/>
<font size='18'>COMMANDER'S INTENT</font>
<br/>
Adjust to the changing terrain and utilize the additional fire power provided by our vehicles.
<br/><br/>
<font size='18'>MOVEMENT PLAN</font>
<br/>
Insertion by convoy.
<br/><br/>
<font size='18'>FIRE SUPPORT PLAN</font>
<br/>
Artillery
<br/><br/>
<font size='18'>SPECIAL TASKS</font>
<br/>
Repair, Fortification
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
Push north towards the airfield and the nearby town and destroy the enemy AA.
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
Facing an organized a well equipped army is posing a considerable challange to the US. Having underestimated the enemy, US forces scramble to make progress. While making slow progress in the jungles, a plan has been made to breakout into the desert areas of the region. The enemy is holding a vital airfield to the north of the jungle areas which is being use to provide reinforcements and supplies. Due to AA capabilities on both sides, the only way to deny the airfield is to push forward and destroy the AA guarding the airfield, before a bombing raid can be executed.
<br/><br/>
<font size='18'>ENEMY FORCES</font>
<br/>
Local Military with USSR gear, including armoured, mechanized and motorized units. SF are believed to be present as well.
<br/><br/>
<font size='18'>FRIENDLY FORCES</font>
<br/>
US
"]];

// ====================================================================================