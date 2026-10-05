/*
    Parameters:
        <-- Terminal as Object

    Description:
        Adds radios as action items to a terminal

    Example (in terminal script):
        [this] call fw_fnc_addEquipmentRadios;

    Return:
        --> Nil
*/

params ["_terminal", ["_tier",3]];

switch true do {
    case (_tier >= 5): {
        _terminal addaction ["<t color=""#FF0000"">RADIO PRC343 (SLs, FTLs)", "7R\Loadouts\7R_EQ.sqf", ["ACRE_PRC343"]];
        _terminal addaction ["<t color=""#FF0000"">RADIO PRC77 (Command)", "7R\Loadouts\7R_EQ.sqf", ["ACRE_PRC77"]];
    };
    case (_tier > 4): {
        _terminal addaction ["<t color=""#FF0000"">RADIO PRC343 (SLs, FTLs)", "7R\Loadouts\7R_EQ.sqf", ["ACRE_PRC343"]];
        _terminal addaction ["<t color=""#FF0000"">RADIO PRC152 (Command)", "7R\Loadouts\7R_EQ.sqf", ["ACRE_PRC152"]];
    };
    case (_tier <= 4): {
        _terminal addaction ["<t color=""#FF0000"">RADIO PRC343 (Infantry)", "7R\Loadouts\7R_EQ.sqf", ["ACRE_PRC343"]];
        _terminal addaction ["<t color=""#FF0000"">RADIO PRC152 (SLs, FTLs)", "7R\Loadouts\7R_EQ.sqf", ["ACRE_PRC152"]];
        _terminal addaction ["<t color=""#FF0000"">RADIO PRC148 (Air, Sup, Mech)", "7R\Loadouts\7R_EQ.sqf", ["ACRE_PRC148"]];
        _terminal addaction ["<t color=""#FF0000"">RADIO PRC117F (Long Range)", "7R\Loadouts\7R_EQ.sqf", ["ACRE_PRC117F"]];
    };
};
