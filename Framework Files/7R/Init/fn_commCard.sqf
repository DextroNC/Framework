/*
	Parameters:
		<-- none

	Auto Exec on Start
*/

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