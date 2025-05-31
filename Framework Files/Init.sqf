// ACE Gear Save Disable
ace_respawn_savePreDeathGear = false;

// Respawn Message Queuing 
if(isServer) then 
{
    [] spawn fw_fnc_spawnMessageHandler;
};