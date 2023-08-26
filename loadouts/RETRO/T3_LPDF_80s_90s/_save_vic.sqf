if ({typeOf _x == "Redd_Tank_Wiesel_1A2_TOW_Tropentarn"} count thisList > 0) then {vic1 = "Redd_Tank_Wiesel_1A2_TOW_Tropentarn";};
if ({typeOf _x == "Redd_Tank_Wiesel_1A4_MK20_Tropentarn"} count thisList > 0) then {vic1 = "Redd_Tank_Wiesel_1A4_MK20_Tropentarn";};
if ({typeOf _x == "B_LSV_01_AT_F"} count thisList > 0) then {vic1 = "B_LSV_01_AT_F";};
if ({typeOf _x == "B_LSV_01_Armed_F"} count thisList > 0) then {vic1 = "B_LSV_01_Armed_F";};
vTerm setVariable ["Drop_Vehicle",vic1, true];