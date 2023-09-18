//Execute only on player. Do not propagate.

// ["2",1] spawn fw_fnc_R1_rifle_new;

/**
 * Manages the first Shooting Range.
 *
 * @param _shootRangeNr Number indicating the position ID within the shooting range
 * @param _mode Shooting Number indicating Range mode. Detailed explanation above.
 * @param _targetDistance Number indicating mean target Distance. If _allTargets is true then this needs to be an Array with the distances
 * @param _targetDistanceVariance (optional) Number giving the variance of randomisation placement of targets.
 *								  Set to 0 for precise placement. Standard Value is 0.1 .
 * @param _allTargets Boolean if True start all targets on given Ranges at the same time
 */

mainSR1 =
{
	params ["_shootRangeNr", "_mode", "_targetDistance", "_targetDistanceVariance"];

	_shootRangeTermRef = (missionNamespace getVariable (format ["r1_p%1_terminal", str _shootRangeNr]));
	_shootRangeTermRef setVariable ["rangeActive", true, true];
	_shootRangeObjRef = (missionNamespace getVariable ("r1_p" + str _shootRangeNr));

	_actualDistance = [];
	{
		_actualDistance pushBack
		(
			random [(_x - _x * _targetDistanceVariance), _x, (_x + _x * _targetDistanceVariance)]
		);
	} foreach _targetDistance;

	switch (_mode) do
	{
			case 1: {
				[
						1,
						"TargetBootcampHumanSimple_F",
						_actualDistance,
						_shootRangeObjRef,
						_shootRangeNr,
						2,
						1
					] spawn initTargets;
			};
			case 2: {
				[
						2,
						"SR_PopUpTarget_Big",
						_actualDistance,
						_shootRangeObjRef,
						_shootRangeNr,
						1
					] spawn initTargets;
			};
			case 3: {
				[
						3,
						"SR_PopUpTarget_Big",
						_actualDistance,
						_shootRangeObjRef,
						_shootRangeNr,
						1,
						2
					] spawn initTargets;
			};
			case 4: {
				[
						4,
						"TargetBootcampHumanSimple_F",
						_actualDistance,
						_shootRangeObjRef,
						_shootRangeNr,
						1,
						3
					] spawn initTargets;
			};
			case 5: {
				[
						5,
						"SR_PopUpTarget_Big",
						_actualDistance,
						_shootRangeObjRef,
						_shootRangeNr,
						10
					] spawn initTargets;
			};
			case 6: {
				[
						6,
						"SR_PopUpTarget_Big",
						_actualDistance,
						_shootRangeObjRef,
						_shootRangeNr
					] spawn initTargets;
			};
			case 7: {
				[
						7,
						"SR_PopUpTarget_Big",
						_actualDistance,
						_shootRangeObjRef,
						_shootRangeNr,
						100,
						4,
						true
					] spawn initTargets;
			};
			case 8: {
				[
						8,
						"SR_PopUpTarget_Big",
						_actualDistance,
						_shootRangeObjRef,
						_shootRangeNr,
						1,
						3
					] spawn initTargets;
			};	
	};
};

initTargets =
{
	params ["_SRmode", "_TargetType", "_actualDistance", "_shootRangeObjRef", "_shootRangeNr", ["_hitsNeeded", 1], ["_specialMode", 0], ["_createHitMarker", false]];
	_targets = [];
	{
		_newTargets = [
				_TargetType,
				_x,
				_shootRangeObjRef,
				_specialMode
			] call fw_fnc_targetInit;
		{
			_targets pushBack (_x);
		} foreach _newTargets;
	} foreach _actualDistance;

	[_SRmode] spawn setupPlayerPerformanceTracking;
	[_targets, _shootRangeNr] spawn linkTargets;
	[_targets, _hitsNeeded] spawn setTargetsHitsNeeded;
	(_targets select 0) spawn makeTargetActive;
	if (_createHitMarker) then
	{
		[(_targets select 0)] spawn fw_fnc_hitMarker;
	};
};

setupPlayerPerformanceTracking =
{
	params ["_mode"];
	player setVariable["laneMode", _mode ];
	player setVariable["startTime", time];
	player addEventHandler ["Fired",
		{
			_shotsFired = player getVariable["shotsFired", 0];
			player setVariable["shotsFired", (_shotsFired + 1) ];
		}
	];
};

/**
 * Store a reference to the next target to pop up in each target.
 * 
 * Last target will not contain anything.
 *
 * @param _targets Array of Targets in the order they are to pop up
 */
linkTargets =
{
	params["_targets", "_shootRangeNr"];
	// Loop through all targets except for last one
	for "_targetNr" from 0 to ((count _targets)-2) do
	{
		_curTarget = _targets select _targetNr;
		_nextTarget = _targets select _targetNr + 1;
		_curTarget setVariable ["nextTarget", _nextTarget];
	};
	(_targets select ((count _targets) -1 ) ) setVariable ["shootingPosition", _shootRangeNr];
};

/**
 * Activate the next linked Popup Target
 *
 * If there is no next target stored in the passed target nothing happens and
 * the return value will be false.
 *
 * @param _target Target where the next linked Item is linked
 * @return true if passed target has next, false else
 */
activateNextTarget =
{
	params["_target"];
	_nextTarget = _target getVariable ["nextTarget", objNull];
	if (isNull _nextTarget) then
	{
		// clean up and show results
		_shootingPosition = _target getVariable ["shootingPosition", 0];
		[_shootingPosition] spawn cleanupAndPostResults;
	}
	else
	{
		[_nextTarget] spawn makeTargetActive;
	};
};

/**
 * Set the amount of hits a dummy target needs before it goes down.
 *
 * @param _targets List of targets to set needed hitcount on
 * @param _targetHitsNeeded number of hits needed
 */
setTargetsHitsNeeded =
{
	params["_targets", "_targetHitsNeeded"];
	{
		_x setVariable ["neededHitCount", _targetHitsNeeded];
		_x setVariable ["hitsScored", 0];
	} foreach _targets;
};

/*
 * Enable hit counting on target
 *
 * Reacts if target has taken maximum amount of hits that has been set earlier
 * by disabling the target and activating the next one.
 *
 * @param _target Popup target that has been shot on
 *
 * @return true if enough hits have been scored, false else
 */
reactToHit =
{
	params["_target"];
	_curHitCount = _target getVariable ["hitsScored", 0];
	_hitsNeeded = _target getVariable ["neededHitCount", 1];
	if ( (_curHitCount + 1) == _hitsNeeded) then
	{
		[_target] spawn makeTargetInactive;
		[_target] spawn activateNextTarget;
	}
	else
	{
		_target setVariable ["hitsScored", _curHitCount + 1];
	};
};

cleanupAndPostResults =
{
	params["_shootingPosition"];
	// needs to be synchronous, otherwhise results get deleted before they are posted
	[] call postResults;
	[_shootingPosition] spawn fw_fnc_endSR1;
};

postResults =
{
	hint "Range finished, results in briefing.";
	_laneModeDescr = ([player getVariable ["laneMode", 1]] call fw_fnc_getSR1ModeIDandDescr) select 1;
	_timeNeededDesc = [(time - (player getVariable ["startTime", time]) )] call BIS_fnc_secondsToString;
	_logEntry = format ["%1 fired %2 Rounds on Mode: %3. Time needed: %4", name player, str (player getVariable ["shotsFired", 0]), _laneModeDescr, _timeNeededDesc];
	["CombatLog", ["Results", _logEntry]] spawn CBA_fnc_globalEvent; 
};

makeTargetInactive =
{
	params["_target"];
	// make target lie down
	_target animate ["terc", 1];
	_target removeEventHandler ["hit", 0];
};

makeTargetActive =
{
	params["_target"];
	// Make target pop up
	_target animate ["terc", 0];
	_target addEventHandler["hit",
		{
			params["_target"];
			[_target] spawn reactToHit;
		}
	];
};

/*********************** main FUNCTION ***************************/
params["_shootRangeNr", "_mode", "_targetDistance", ["_targetDistanceVariance", 0.1]];
[_shootRangeNr, _mode, _targetDistance, _targetDistanceVariance] spawn mainSR1;
