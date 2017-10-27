/****************************************************************
File: UPSMON_supstatestatus.sqf
Author: Azroul13

Description:
	Check if the group is under fire
	Activated only when TPWCAS script is present 
Parameter(s):
	<--- unit
Returns:
	Boolean
****************************************************************/
	//Check if the group is under fire
private ["_grp","_supstatus","_unitsnbr","_statuslist"];

_grp = _this select 0;
_supstatus = "";
_unitsnbr = count (units _grp);

_statuslist = [];
{
	If (alive _x) then
	{
		_x setvariable ["UPSMON_SUPSTATUS",""];
		If (_x in UPSMON_GOTHIT_ARRAY) then
		{
			UPSMON_GOTHIT_ARRAY = UPSMON_GOTHIT_ARRAY - [_x];
			If (damage _x < 0.3) then
			{
				_statuslist pushback "hit";
			}
			else
			{
				_statuslist pushback "wounded";
			};
			
			_x setvariable ["UPSMON_SUPSTATUS","UNDERFIRE"];
		};
		if ((round (random 100)) <= UPSMON_ROGUE) then {
			_x setSuppression 0; 
			_x doSuppressiveFire (_x findNearestEnemy _x);
			_x suppressFor 5;
		} else {
			_x enableAI "SUPPRESSION";
		};
		if (getSuppression _x > UPSMON_SUP) then {
			_statuslist pushback "supressed";
			_x setvariable ["UPSMON_SUPSTATUS","SUPRESSED"];
		};
	}
	else
	{
		if (_x in UPSMON_GOTKILL_ARRAY) then
		{
			UPSMON_GOTKILL_ARRAY = UPSMON_GOTKILL_ARRAY - [_x];
			_statuslist pushback "dead";
		};
	};
} foreach units _grp;

If ({_x == "supressed" || _x == "wounded" ||  _x == "dead"} count _statuslist >= _unitsnbr) then
{
	If ({_x == "supressed"} count _statuslist < {_x == "wounded" || _x == "dead"} count _statuslist) then
	{
		_supstatus = "INCAPACITED"
	}
	else
	{
		_supstatus = "SUPRESSED"
	};
};

If (_supstatus == "") then
{
	If ("hit" in _statuslist || "wounded" in _statuslist || "dead" in _statuslist || "supressed" in _statuslist) then
	{
		_supstatus = "UNDERFIRE"
	};
};

_supstatus