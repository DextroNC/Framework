/*
    Parameters:
        <-- Text to color as String
        <-- Color as String

    Description:
        Adds color to a piece of text.

    Example (in _uniforms_box.sqf):
        _coloredText = ["Operator", "#00ff00"] call fw_fnc_makeColor;

    Return:
        --> String
*/

params ["_text", "_color"];
format ["<t color='%1'>%2</t>", _color, _text];
