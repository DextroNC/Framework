_heloacc = _this select 0;
_heloacc addAction ["<t color='#FF9933'>Lift off</t>","7R\REINF\ReinfMove.sqf", [_heloacc,count crew _heloacc], 0, false, false, "","player in (crew _target) && (count waypoints _target == 1)"];
