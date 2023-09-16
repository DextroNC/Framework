/*
	Create Briefing with:
	http://www.ferstaberinde.com/f3/f3webtools/index.php
	
	Paste result into this file.
*/

// Reversed Order

// ====================================================================================

// NOTES: FLIGHT SCHOOL

_exe = player createDiaryRecord ["diary", ["Flight School","
<br/>
<font size='18'>General</font><br/>
Use Terminals to spawn Helicopters.<br/>
Pilot Loadouts can be found in the Box in the starting area.<br/>
<br/><font size='18'>Instructor</font><br/>
[""Player Name"", type] execVM ""remoteDamage.sqf"";<br/>
local exec<br/>
Types:<br/>
0: random<br/>
1: Tail Rotor damaged <br/>
2: Tail Rotor destroyed <br/>
3: Main Rotor damaged <br/>
4: Main Rotor destroyed <br/>
5: Engine destroyed <br/>
6: Fuel Tank rupture <br/>
<br/>
"]];

// NOTES: Infantry Practice

_mis = player createDiaryRecord ["diary", ["Infantry Practice","
<br/>
<font size='18'>General</font><br/>
Area to practice various infantry weapons.<br/>
"]];

// ====================================================================================

// NOTES: PARACHUTE COURSE

_mis = player createDiaryRecord ["diary", ["Parachute Course","
<br/>
<font size='18'>General</font><br/>
Parachutes in the Box.<br/>
No Auto-Open.<br/>
HALO: high altitute - low opening<br/>
HAHO: high altitute - high opening<br/>
Jumps on Course itself are auto exit from the plane<br/>
<br/><font size='18'>Instructor</font><br/>
Group Leader starts Parachute for his Squad.<br/>
Designate Free Drop Zone & Start Free Drop Zone like Fixed, but no auto exit from plane.<br/>
"]];

// NOTES: GENERAL

_sit = player createDiaryRecord ["diary", ["General","
<br/>
<font size='18'>General</font><br/>
Flag Poles are Teleporters.<br/>
<br/><font size='18'>Instructor</font><br/>
Zeus for all Instructor Slots.<br/>
Terminals for Admin Actions (Except Vehicle Spawn Areas)<br/>

"]];

// ====================================================================================