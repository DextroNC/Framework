/*
	Parameters:
		<-- none

	Auto Exec on Start
*/

player createDiarySubject ["Composition", "Composition"];
player createDiaryRecord ["Composition", ["Platoon Composition", "
<execute expression='nul = [] spawn fw_fnc_compositionDisplay'>Display Composition</execute> 
"]];