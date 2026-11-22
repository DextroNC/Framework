/*
	Parameters:
		<-- Text as String

	Description:
		Escapes the characters that structured text reads as markup (&, < and >), so text such
		as a player name shows as written in a diary record or a debriefing section.

	Example:
		_safeName = (name player) call fw_fnc_escapeText;

	Return:
		--> String
*/

params [["_text", "", [""]]];
{
	_text = [_text, _x select 0, _x select 1] call CBA_fnc_replace;
} forEach [["&", "&amp;"], ["<", "&lt;"], [">", "&gt;"]];
_text
