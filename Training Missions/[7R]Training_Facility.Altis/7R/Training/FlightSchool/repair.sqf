_unit = _this select 1;
_veh = vehicle _unit;
if (_veh != _unit) then
{
	_veh setDamage 0;
	_veh setFuel 1;
	_veh setVehicleAmmo 1;
	hint "repaired, refueled and rearmed";
}
else {
	hint "not in a vehicle!";
}