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

_handle = [] spawn fw_fnc_terminalInitBC;
waituntil {scriptdone _handle};

_handle = [] spawn fw_fnc_termFox;
waituntil {scriptdone _handle};
