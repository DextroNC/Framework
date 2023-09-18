_unit = _this select 1;

_unit addAction ["Arm Teleport", "7R\Training\FlightSchool\teleport.sqf",[],1,true,true,"","vehicle player != player"];
_unit addAction ["Random Damage", "7R\Training\FlightSchool\damage.sqf",[0],1,true,true,"","vehicle player != player"];
_unit addAction ["Damage Tail Rotor", "7R\Training\FlightSchool\damage.sqf",[1],1,true,true,"","vehicle player != player"];
_unit addAction ["Destroy Tail Rotor", "7R\Training\FlightSchool\damage.sqf",[2],1,true,true,"","vehicle player != player"];
_unit addAction ["Damage Main Rotor", "7R\Training\FlightSchool\damage.sqf",[3],1,true,true,"","vehicle player != player"];
_unit addAction ["Destroy Main Rotor", "7R\Training\FlightSchool\damage.sqf",[4],1,true,true,"","vehicle player != player"];
_unit addAction ["Destroy Engine", "7R\Training\FlightSchool\damage.sqf",[5],1,true,true,"","vehicle player != player"];
_unit addAction ["Fuel Rupture", "7R\Training\FlightSchool\damage.sqf",[6],1,true,true,"","vehicle player != player"];
_unit addAction ["Repair, Refuel, Rearm", "7R\Training\FlightSchool\repair.sqf",[],1,true,true,"","vehicle player != player"];
