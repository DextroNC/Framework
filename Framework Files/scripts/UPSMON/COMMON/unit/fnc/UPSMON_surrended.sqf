/****************************************************************
File: UPSMON_surrended.sqf
Author: MONSADA

Description:
	Function to surrender AI soldier
Parameter(s):

Returns:

****************************************************************/
private ["_grp"];

_grp = _this select 0;
_rogue = false;

UPSMON_NPCs = UPSMON_NPCs - [_grp];

if ((round (random 100)) <= UPSMON_ROGUE) then {_rogue = true};
	
{
	If (alive _x) then
	{
		if (_rogue) then {
			[_x] call fw_fnc_rogueCharge;
		} else {
			[_x, true] call ACE_captives_fnc_setSurrendered;
			[{
				params ["_u"];
					if (alive _u) then {
					_u addEventHandler ["Killed", {
					params ["_dead"];
					if (_dead getVariable ["UPSMON_ROGUE",false]) exitWith {}; 
					_killer = _dead getVariable ["ace_medical_lastDamageSource", "unknown"];
					_name = name _dead;
					_str = SR_WC;
					_str = format [_str + "<br/>" + str (_killer)];
					SR_WC = _str;
					publicVariable "SR_WC";
			}]; 
				};
			}, [_x], 5] call CBA_fnc_waitAndExecute;
		};
	};
} foreach units _grp;