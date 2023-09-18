/*
	Parameters:
		<-- Flag Pole as Object ([this])
	
	Description:
		Adds Teleport Action to Flag
	
	Example:
		[this] spawn fw_fnc_teleporterAddAction;
*/

// Parameter Init
params ["_flag"];
sleep 10;

// Flag addAction code
_flag addaction ["Teleport Base", fw_fnc_teleport,[1,"m_base"]]; 
_flag addaction ["Teleport Infantry Practice Course", fw_fnc_teleport,[1,"m_inf_prac"]]; 
_flag addaction ["Teleport Infantry Practice Course 2", fw_fnc_teleport,[1,"m_inf_prac_2"]]; 
_flag addaction ["Teleport Infantry Practice Course 3", fw_fnc_teleport,[1,"m_inf_prac_3"]]; 
_flag addaction ["Teleport Infantry Practice Course 4", fw_fnc_teleport,[1,"m_inf_prac_4"]];
_flag addaction ["Teleport Parachute Course", fw_fnc_teleport,[1,"m_para"]]; 
_flag addaction ["Teleport CQB Practice Course", fw_fnc_teleport,[1,"m_cqb_prac"]]; 
_flag addaction ["Teleport Medical Practice Course", fw_fnc_teleport,[1,"m_medic_prac"]]; 
_flag addaction ["Teleport Specialist Weapons Practice Course", fw_fnc_teleport,[1,"m_sw_prac"]]; 
_flag addaction ["Teleport Engineer Practice Course", fw_fnc_teleport,[1,"m_e_prac"]]; 
_flag addaction ["Teleport Qualification Courses", fw_fnc_teleport,[1,"m_qual"]]; 
_flag addaction ["Teleport Flight School", fw_fnc_teleport,[1,"m_flight"]]; 
_flag addaction ["Teleport BootCamp", fw_fnc_teleport,[1,"m_boot"]];
_flag addAction ["Teleport Armour Practice Course", fw_fnc_teleport, [1,"m_foxtrot_1"]];
_flag addAction ["Teleport Armour Practice Course 2", fw_fnc_teleport, [1,"m_foxtrot_2"]];
_flag addaction ["Teleport USS Freedom", fw_fnc_teleport,[1,"freedom"]];