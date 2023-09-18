/*
	Parameters:
		<-- SideChat as String
		<-- Hint as String

	Description:
		Displays info text for support systems.


	Example:
	["Test"] spawn fw_fnc_info;

*/
	
// Parameter Init
params [["_text",""],["_hint",""]];

// Side Msg
if (count _text > 0) then {
	[[SR_Side, "HQ"],_text] remoteExec ["sideChat", 0];
};

// Hint Msg
if (count _hint > 0) then {
	// Hint Box Size
	private _size = 1.5;
	// Adjust Size on Text length
	private _count = count _hint;
	if (_count > 30) then {
		_size = _size + (floor (_count/30) * 0.5);
	};

	// Display Hint
	[_hint, _size] call ace_common_fnc_displayTextStructured;
};

