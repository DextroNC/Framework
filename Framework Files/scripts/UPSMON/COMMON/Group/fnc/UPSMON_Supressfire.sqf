private ["_units","_targetpos","_timeout","_delete","_unit","_target","_Pos","_direction"];

_units = _this select 0;
_targetpos = _this select 1;

_timeout = time + 15;
while {_timeout > time && {alive _x} count _units > 0} do
{
	{
		_delete = false;
		If (alive _x) then
		{
			_unit = _x;
			_target = _targetpos;
			If (typename _targetpos == "ARRAY") then
			{
				_Pos = [_targetpos,[0,20],[0,360],0,[0,100],0] call UPSMON_pos;
				_target = createVehicle ["UserTexture1m_F",[_Pos select 0,_Pos select 1,1], [], 0, "NONE"];
				_delete = true;
			};

			If ([_unit,_target,300,130] call UPSMON_Haslos) then
			{
				[_unit,_target,100] call UPSMON_DOwatch;
				sleep 1;
				_unit doSuppressiveFire _target;
				 _unit suppressFor 5;
			};
			
			if (_delete) then
			{
				[_target] spawn {sleep 5; Deletevehicle (_this select 0)};
			};
		};
	} foreach _units;
	sleep ((random 0.4) +0.4);
};