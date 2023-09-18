
class q {
	file = "7R\Training\Qualifications";
	class terminalInitQualifications;
};
class iq {
	file = "7R\Training\Qualifications\Infantry";
	class terminalInitQI;
	class shootingRange{};
};
class mq {
	file = "7R\Training\Qualifications\Medical";
	class terminalInitQM ;
	class medicalQualification{};
};
class hwq {
	file = "7R\Training\Qualifications\HeavyWeapons";
	class terminalInitQH ;
	class heavyRange{};
};
class mmq {
	file = "7R\Training\Qualifications\Marksman";
	class terminalInitQMM ;
	class marksmanRange{};
};
class engq {
	file = "7R\Training\Qualifications\Engineer";
	class terminalInitQE ;
	class engineerRange{};
};
class basics {
	file = "7R\Training\Basics";
	class heloAddAction{};
	class planeAddAction{};
	class vehicleAddAction{};
	class teleporterAddAction{};
};

class tfunc {
	file = "7R\Training\Functions";
	class cleanUp{};
	class endSR1{};
	class getSR1ModeIDandDescr{};
	class hitMarker{};
	class sphereTarget{};
	class addSR1TerminalEntry{};
	class targetInit{};
	class rcCover{};
	class spotPractice{};
	class paraMarker{};
	class paraPos{};
};
class tpractice {
	file = "7R\Training\Practice";
	class R1_rifle{};
	class termRange1;
	class termRange2;
	class R1AddAllModes{};
	class R2_reactionCourse{};
	class termPara ;
	class practicePara;
	class practiceSuppression;
	class termSuppress ;
	class navigation;
	class termNav;
	class TermInits {postInit =1;};
};
class qfunc {
	file = "7R\Training\Qualifications\Functions";
	class courseStart{};
	class courseEnd{};
	class eventHit{};
	class removeTasks{};
	class removeWounded{};
	class resetPopTargets{};
	class spawnWounded{};
	class suppression{};
	class trackShooter{};
	class spawnMovingCar{};
	class spawnStaticCar{};
};
class cqbTrain {
	file = "7R\Training\CQB";
	class CQBcourse{};
	class cqbPracTerm;
};
class tbootcamp {
	file = "7R\Training\BootCamp";
	class terminalInitBC ;
	class bootcamp{};
	class spawnWoundedBC{};
};
class tfoxtrot {
	file = "7R\Training\Foxtrot";
	class termFox ;
	class brokenTankSpawn{};
	class commander{};
	class firing_range{};
};
class qfoxtrot {
	file = "7R\Training\Qualifications\Foxtrot";
	class FoxQual{};
};
class fixedwing {
	file = "7R\Training\Fixedwing";
	class checkPlaneDamage {};
	class setTime {};
	class fixedwingAddAction {};
	class fixedwingCompositionSpawn {};
	class fixedwingCompositionDelete {};
};
