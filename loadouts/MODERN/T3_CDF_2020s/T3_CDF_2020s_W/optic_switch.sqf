_unit = (_this select 1);
if( !local _unit ) exitWith {};

private _weapon = primaryWeapon _unit;
private _mag = primaryWeaponMagazine _unit;
private _attachments = primaryWeaponItems _unit;
private _muzzle = _attachments select 0;
private _laser = _attachments select 1;
private _grip = _attachments select 3;

_npz_list = [
	"rhs_weap_ak74n_npz",
	"rhs_weap_ak74m_npz",
	"rhs_weap_ak74n_2_npz",
	"rhs_weap_aks74n_npz",
	"rhs_weap_ak74m_fullplum_npz",
	"rhs_weap_aks74n_2_npz",
	"rhs_weap_ak74m_zenitco01_b33",
	"rhs_weap_ak74m_zenitco01_b33_grip1",
	"rhs_weap_ak74m_zenitco01_b33_afg",
	"rhs_weap_ak105_zenitco01_b33",
	"rhs_weap_ak105_zenitco01_b33_grip1",
	"rhs_weap_ak105_zenitco01_b33_afg",
	"rhs_weap_ak105_npz",
	"rhs_weap_aks74n_gp25_npz",
	"rhs_weap_ak74n_gp25_npz",
	"rhs_weap_ak74n_2_gp25_npz",
	"rhs_weap_ak74m_gp25_npz",
	"rhs_weap_ak74m_fullplum_gp25_npz",
	"rhs_weap_asval_grip_npz",
	"rhs_weap_asval_npz_grip1",
	"rhs_weap_asval_npz_afg",
	"rhs_weap_ak103_zenitco01_b33",
	"rhs_weap_ak103_zenitco01_b33_grip1",
	"rhs_weap_ak103_zenitco01_b33_afg",
	"rhs_weap_ak103_npz",
	"rhs_weap_akmn_npz",
	"rhs_weap_rpk74m_npz",
	"rhs_weap_ak74m_desert_npz"
];

_dvt_list = [
	"rhs_weap_ak74n",
	"rhs_weap_ak74m",
	"rhs_weap_ak74n_2",
	"rhs_weap_aks74n",
	"rhs_weap_ak74m_fullplum",
	"rhs_weap_aks74n_2",
	"rhs_weap_ak74m_zenitco01",
	"rhs_weap_ak74m_zenitco01_grip1",
	"rhs_weap_ak74m_zenitco01_afg",
	"rhs_weap_ak105_zenitco01",
	"rhs_weap_ak105_zenitco01_grip1",
	"rhs_weap_ak105_zenitco01_afg",
	"rhs_weap_ak105",
	"rhs_weap_aks74n_gp25",
	"rhs_weap_ak74n_gp25",
	"rhs_weap_ak74n_2_gp25",
	"rhs_weap_ak74m_gp25",
	"rhs_weap_ak74m_fullplum_gp25",
	"rhs_weap_asval_grip",
	"rhs_weap_asval_grip1",
	"rhs_weap_asval_afg",
	"rhs_weap_ak103_zenitco01",
	"rhs_weap_ak103_zenitco01_grip1",
	"rhs_weap_ak103_zenitco01_afg",
	"rhs_weap_ak103",
	"rhs_weap_akmn",
	"rhs_weap_rpk74m",
	"rhs_weap_ak74m_desert"
];

if (!(_weapon in _npz_list) && !(_weapon in _dvt_list)) exitWith {};

if (_weapon in _npz_list) then{
	_weaponIndex = _npz_list find _weapon;
	_unit addWeapon (_dvt_list select _weaponIndex);
	if ((_unit getVariable ["SR_Class", "R"]) == "SDMR") then {_unit addPrimaryWeaponItem "rhs_acc_pso1m21";};
} else {
	_weaponIndex = _dvt_list find _weapon;
	_unit addWeapon (_npz_list select _weaponIndex);
	if ((_unit getVariable ["SR_Class", "R"]) == "SDMR") then {_unit addPrimaryWeaponItem "rhsusf_acc_ACOG3_USMC";};
};

_unit addPrimaryWeaponItem _grip;
_unit addPrimaryWeaponItem _muzzle;
_unit addPrimaryWeaponItem _laser;

private _newWeapon = primaryWeapon _unit;

if ((_newWeapon != "") && (_newWeapon != _weapon)) then {
	{
		_unit addItem _x;
	} forEach _mag;
};

_newMag = (primaryWeaponMagazine _unit) select 0;
_unit removePrimaryWeaponItem _newMag;
_unit addItem _newMag;