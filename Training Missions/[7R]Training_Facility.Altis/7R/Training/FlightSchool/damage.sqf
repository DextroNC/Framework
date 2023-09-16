_unit = _this select 1;
_veh = vehicle _unit;
_type = _this select 3 select 0;

if (_type == 0) then {
	_type = ceil random 6; 
};

if (_veh != _unit) then
{
	switch (_type) do {
		case 1: {
			_veh setHitPointDamage ["HitVRotor",0.5];
			hint "Tail Rotor damaged";
		};
		case 2: {
			_veh setHitPointDamage ["HitVRotor",1];
			hint "Tail Rotor destroyed";
		};
		case 3: {
			_veh setHitPointDamage ["HitHRotor",0.5];
			hint "Main Rotor damaged";
		};
		case 4: {
			_veh setHitPointDamage ["HitHRotor",1];
			hint "Main Rotor destroyed";
		};
		case 5: {
			_veh setHitPointDamage ["HitEngine",1];
			hint "Engine destroyed";
		};
		case 6: {
			_veh setHitPointDamage ["HitFuel",1];
			hint "Fuel Tank rupture";
		};
	};
};