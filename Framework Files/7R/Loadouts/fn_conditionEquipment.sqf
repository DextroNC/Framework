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

params ["_unit","_class",["_max",2],["_squadLevel",true],["_equivalentItems",[]],["_excluded",["PL","P","P-1","P-2"]]];

private _group = group _unit;
private _units = units _group;
private _displayName = getText (configFile >> "CfgWeapons" >> _class >> "displayName");
private _underLimit = true;

if !(_squadLevel) then {_units = allPlayers - entities "HeadlessClient_F"};

_equivalentItems pushBackUnique _class;
{
    _item = _x;
    _underLimit = _underLimit && (({_item in items _x} count _units) < _max);
    
} forEach _equivalentItems;

// Check group exception and add
if (_underLimit || ((groupId _group in _excluded) && _squadLevel)) then {
    _unit addItem _class;
    _return = true;
} else {
    ["",_displayName + " limit reached!"] remoteExec ["fw_fnc_info", _group];
    _return = false;
};

_return;