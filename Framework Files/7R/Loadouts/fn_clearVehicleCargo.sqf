/*
    Parameters:
        <-- Vehicle as Object
        <-- (Optional, default false) whether the ACE cargo should be cleared as well as Boolean

    Description:
        Clears the vehicle inventory.

    Example:
        [_vehicle] call fw_fnc_clearVehicleCargo;
        [_vehicle, true] call fw_fnc_clearVehicleCargo;

    Return:
        --> Nil
*/
params ["_vehicle", ["_deleteACECargo", false]];

clearweaponcargoGlobal _vehicle;
clearmagazinecargoGlobal _vehicle;
clearitemcargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;

if (_deleteACECargo) then {
    // The while loop ensures duplicate items are also deleted.
    while {count _vehicle getVariable ["ace_cargo_loaded", []] > 0} do {
        {
            [_x, _vehicle] call ace_cargo_fnc_removeCargoItem;
        } forEach _vehicle getVariable ["ace_cargo_loaded", []];
    }
};
