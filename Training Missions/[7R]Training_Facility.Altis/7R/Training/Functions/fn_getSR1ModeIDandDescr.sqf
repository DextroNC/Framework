params ["_modeNr"];
_return = [];
switch (_modeNR) do
{
	case 1: {
		_return = ["Mode1", "4 Covered Targets"];
	};
	case 2: {
		_return = ["Mode2", "Single Large"];
	};
	case 3: {
		_return = ["Mode3", "Large Covered"];
	};
	case 4: {
		_return = ["Mode4", "Covered Target"];
	};
	case 5: {
		_return = ["Mode5", "Sturdy Target"];
	};
	case 6: {
		_return = ["Mode6", "Suppression"];
	};
	case 7: {
		_return = ["Mode7", "Marksman"];
	};
	case 8: {
		_return = ["Mode8", "Sniper"];
	};
};
_return