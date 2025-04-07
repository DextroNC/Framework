/*

	Master InitTerminals File
	
*/
sleep 10;

_handle = [] spawn fw_fnc_terminalInitQualifications;
waituntil {scriptdone _handle};

_handle = [] spawn fw_fnc_terminalInitQI;
waituntil {scriptdone _handle};

_handle = [] spawn fw_fnc_terminalInitQM;
waituntil {scriptdone _handle};

_handle = [] spawn fw_fnc_terminalInitQH;
waituntil {scriptdone _handle};

_handle = [] spawn fw_fnc_terminalInitQMM;
waituntil {scriptdone _handle};

_handle = [] spawn fw_fnc_terminalInitQE;
waituntil {scriptdone _handle};

_handle = [] spawn fw_fnc_termRange1;
waituntil {scriptdone _handle};

_handle = [] spawn fw_fnc_termRange2;
waituntil {scriptdone _handle};

_handle = [] spawn fw_fnc_termPara;
waituntil {scriptdone _handle};

_handle = [] spawn fw_fnc_termSuppress;
waituntil {scriptdone _handle};

_handle = [] spawn fw_fnc_termNav;
waituntil {scriptdone _handle};

_handle = [] spawn fw_fnc_cqbPracTerm;
waituntil {scriptdone _handle};

_handle = [] spawn fw_fnc_termFox;
waituntil {scriptdone _handle};


// Training OPFOR EH
["ace_unconscious", {
	params ["_unit","_unconcious"];
	if (_unconcious && typeOf _unit == "SR_Training_OPFOR") then {
		[_unit] call ace_medical_status_fnc_setDead;
	};
}] call CBA_fnc_addEventHandler;
