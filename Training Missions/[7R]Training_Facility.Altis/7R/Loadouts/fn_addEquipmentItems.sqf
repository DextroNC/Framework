/*
    Parameters:
        <-- Terminal as Object
        <-- Tier as Number

    Description:
        Adds support equipment as action items to a terminal

    Example (in terminal script):
        [this, 3] call fw_fnc_addEquipmentItems;

    Return:
        --> Nil
*/

params ["_terminal", "_tier"];

if (_tier <= 3) then {
    _terminal addaction ["<t color=""#FF0000"">UAV Terminal", "7R\Loadouts\7R_EQ.sqf", ["B_UavTerminal"]];
    _terminal addaction ["<t color=""#FF0000"">GPS", "7R\Loadouts\7R_EQ.sqf", ["ItemGPS"]];
    _terminal addaction ["<t color=""#FF0000"">Vector", "7R\Loadouts\7R_EQ.sqf", ["ACE_Vector"]];
    _terminal addaction ["<t color=""#FF0000"">Laser Designator", "7R\Loadouts\7R_EQ.sqf", ["Laserdesignator"]];
};

_terminal addaction ["<t color=""#FF0000"">Lockpicks", "7R\Loadouts\7R_EQ.sqf", ["ACE_key_lockpick"]];
_terminal addaction ["<t color=""#FF0000"">Entrenching Tool", "7R\Loadouts\7R_EQ.sqf", ["ACE_EntrenchingTool"]];
_terminal addaction ["<t color=""#FF0000"">Breaching Kit", "7R\Loadouts\7R_EQ.sqf", ["ACE_wirecutter"]];
_terminal addaction ["<t color=""#FF0000"">Mine Detector", "7R\Loadouts\7R_EQ.sqf", ["MineDetector"]];
