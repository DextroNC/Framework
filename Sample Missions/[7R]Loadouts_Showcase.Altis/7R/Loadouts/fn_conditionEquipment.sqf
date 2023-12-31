/*
    Parameters:
        <-- Unit as Object
        <-- Classname as String
        <-- Opt. Max as Integer (Default: 2)
        <-- Opt. Excluded Groups as Array (Default: ["PL","P","P-1","P-2"])


    Description:
        Check whether units is allowed selected equipment. Adds the respective equipment when allowed.

    Example:
       [_unit,_class] call fw_fnc_conditionEquipment

    Return:
        --> None
*/

params ["_unit","_class",["_max",2],["_excluded",["PL","P","P-1","P-2"]]];
private _group = group _unit;

// Check quantity and group exception
if (({_class in items _x} count (units _group)) < 2 || groupId _group in _excluded) then {
    _unit addItem _class;
} else {
    ["",_class + " limit reached!"] remoteExec ["fw_fnc_info", _group];
};
