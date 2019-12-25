if(isServer) then {
clearweaponcargoGlobal this;
clearmagazinecargoGlobal this;
clearitemcargoGlobal this;
clearBackpackCargoGlobal this;
this addmagazinecargoGlobal ["rhsusf_200rnd_556x45_mixed_box", 40];
this addmagazinecargoGlobal ["rhsusf_100Rnd_556x45_soft_pouch", 40];
this addmagazinecargoGlobal ["rhsusf_100Rnd_762x51", 40];
this addmagazinecargoGlobal ["MRAWS_HEAT_F", 10];
this addmagazinecargoGlobal ["MRAWS_HE_F", 10];
this addWeaponcargoGlobal ["rhs_weap_M136_hedp", 20];
this addWeaponcargoGlobal ["rhs_weap_m72a7", 10];
this additemcargoGlobal ["SatchelCharge_Remote_Mag", 6];
this additemcargoGlobal ["DemoCharge_Remote_Mag", 12];
};
