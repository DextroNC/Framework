R1TermMain =
{
	params ["_rangePositionID"];
	[_rangePositionID] call addTerminalMenus;

	// Mode 1
	_curModeID = (([1] call fw_fnc_getSR1ModeIDandDescr) select 0);
	[_curModeID, _rangePositionID, 1, [300]] call fw_fnc_addSR1TerminalEntry;
	[_curModeID, _rangePositionID, 1, [450]] call fw_fnc_addSR1TerminalEntry;
	[_curModeID, _rangePositionID, 1, [600]] call fw_fnc_addSR1TerminalEntry;
	[_curModeID, _rangePositionID, 1, [300, 450, 600]] call fw_fnc_addSR1TerminalEntry;

	// Mode 2
	_curModeID = (([2] call fw_fnc_getSR1ModeIDandDescr) select 0);
	[_curModeID, _rangePositionID, 2, [150]] call fw_fnc_addSR1TerminalEntry;
	[_curModeID, _rangePositionID, 2, [250]] call fw_fnc_addSR1TerminalEntry;
	[_curModeID, _rangePositionID, 2, [350]] call fw_fnc_addSR1TerminalEntry;
	[_curModeID, _rangePositionID, 2, [120,200,250,350]] call fw_fnc_addSR1TerminalEntry;
		
	// Mode 3
	_curModeID = (([3] call fw_fnc_getSR1ModeIDandDescr) select 0);
	[_curModeID, _rangePositionID, 3, [150]] call fw_fnc_addSR1TerminalEntry;
	[_curModeID, _rangePositionID, 3, [250]] call fw_fnc_addSR1TerminalEntry;
	[_curModeID, _rangePositionID, 3, [350]] call fw_fnc_addSR1TerminalEntry;
	[_curModeID, _rangePositionID, 3, [150, 250, 350]] call fw_fnc_addSR1TerminalEntry;

	// Mode 4
	_curModeID = (([4] call fw_fnc_getSR1ModeIDandDescr) select 0);
	[_curModeID, _rangePositionID, 4, [150]] call fw_fnc_addSR1TerminalEntry;
	[_curModeID, _rangePositionID, 4, [250]] call fw_fnc_addSR1TerminalEntry;
	[_curModeID, _rangePositionID, 4, [350]] call fw_fnc_addSR1TerminalEntry;
	[_curModeID, _rangePositionID, 4, [150, 250, 350]] call fw_fnc_addSR1TerminalEntry;

	// Mode 5
	_curModeID = (([5] call fw_fnc_getSR1ModeIDandDescr) select 0);
	[_curModeID, _rangePositionID, 5, [300]] call fw_fnc_addSR1TerminalEntry;
	[_curModeID, _rangePositionID, 5, [450]] call fw_fnc_addSR1TerminalEntry;
	[_curModeID, _rangePositionID, 5, [600]] call fw_fnc_addSR1TerminalEntry;
	[_curModeID, _rangePositionID, 5, [300, 450, 600]] call fw_fnc_addSR1TerminalEntry;

	// Mode 6
	_curModeID = (([6] call fw_fnc_getSR1ModeIDandDescr) select 0);
	[_curModeID, _rangePositionID, 6, [300]] call fw_fnc_addSR1TerminalEntry;

	// Mode 7
	_curModeID = (([7] call fw_fnc_getSR1ModeIDandDescr) select 0);
	[_curModeID, _rangePositionID, 7, [300]] call fw_fnc_addSR1TerminalEntry;
	[_curModeID, _rangePositionID, 7, [600]] call fw_fnc_addSR1TerminalEntry;
	[_curModeID, _rangePositionID, 7, [800]] call fw_fnc_addSR1TerminalEntry;
	[_curModeID, _rangePositionID, 7, [1000]] call fw_fnc_addSR1TerminalEntry;
	[_curModeID, _rangePositionID, 7, [300, 600, 800 ,1000]] call fw_fnc_addSR1TerminalEntry;

	// Mode 8	
	_curModeID = (([8] call fw_fnc_getSR1ModeIDandDescr) select 0);
	[_curModeID, _rangePositionID, 8, [300]] call fw_fnc_addSR1TerminalEntry;
	[_curModeID, _rangePositionID, 8, [600]] call fw_fnc_addSR1TerminalEntry;
	[_curModeID, _rangePositionID, 8, [800]] call fw_fnc_addSR1TerminalEntry;
	[_curModeID, _rangePositionID, 8, [1000]] call fw_fnc_addSR1TerminalEntry;
	[_curModeID, _rangePositionID, 8, [1200]] call fw_fnc_addSR1TerminalEntry;
	[_curModeID, _rangePositionID, 8, [300, 600, 800, 1000, 1200]] call fw_fnc_addSR1TerminalEntry;

	[_rangePositionID] call addCancelOption;
};

addTerminalMenus =
{
	params ["_rangePositionID"];
	for "_i" from 1 to 8 do
	{
		_curMode = [_i] call fw_fnc_getSR1ModeIDandDescr;
		[_rangePositionID, (_curMode select 0), (_curMode select 1)] call addTerminalMenu;
	};
};

addTerminalMenu =
{
	params["_rangePositionID", "_modeIDString", "_modeDisplayString"];
	_terminalFormatName = "r1_p%1_terminal";
	_terminalRef = (missionNamespace getVariable ( format [_terminalFormatName, str _rangePositionID]) );
	_aceMenuEntry = [_modeIDString, _modeDisplayString, "", {}, {true}] call ace_interact_menu_fnc_createAction;
	[_terminalRef, 0, ["ACE_MainActions"], _aceMenuEntry] call ace_interact_menu_fnc_addActionToObject;
};

addCancelOption =
{
	params ["_rangePositionID"];
	_terminalRef = (missionNamespace getVariable (format ["r1_p%1_terminal", str _rangePositionID]) );
	
	_aceMenuEntry = [
			("Abort"),
			"Abort",
			"",
			{
				_actionParams = (_this select 2);
				_rangePositionID = (_actionParams select 0);
				[_rangePositionID] call fw_fnc_endSR1;
			},
			{
				_actionParams = (_this select 2);
				_terminalRef = (_actionParams select 1);
				( _terminalRef getVariable ["rangeActive", false] )
			},
			{},
			[_rangePositionID, _terminalRef]
		] call ace_interact_menu_fnc_createAction;
	[_terminalRef, 0, ["ACE_MainActions"], _aceMenuEntry] call ace_interact_menu_fnc_addActionToObject;
};

params ["_rangePositionID"];
[_rangePositionID] call R1TermMain;