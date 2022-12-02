#include <YSI_Coding\y_hooks>

timer DespawnVanSmuggleTimer[300000]() 
{
    if(smuggleVan[veh]){
        DestroyVehicle(smuggleVan[veh]);
        DestroyDynamicCP(smuggleVan[cp]);
        SendClientMessageToAll(COLOR_PURPLE, "[Securivan]: Nobody has entered the security van in time.");
        smuggleVan[veh] = 0;
        smuggleVan[cp] = 0;
    }
}

forward SpawnVanSmuggleMission();
public SpawnVanSmuggleMission(){
    new rand_van = random(8);
    switch(rand_van){
        case 0:
        {
            smuggleVan[veh] = CreateVehicle(428, 2251.8234, 2476.2128, 10.9610, 179.8000, 0, 0, -1); //LVPD VanS
            SendClientMessageToAllEx(COLOR_PURPLE, "[Securivan]: A security van has arrived at LVPD.");
            defer DespawnVanSmuggleTimer();
        }
        case 1:
        {
            smuggleVan[veh] = CreateVehicle(428, -1637.5162, 663.4733, 7.2895, 268.8999, 0, 0, -1); //SFPD Van
            SendClientMessageToAllEx(COLOR_PURPLE, "[Securivan]: A security van has arrived at SFPD.");
            defer DespawnVanSmuggleTimer();
        }
        case 2:
        {
            smuggleVan[veh] = CreateVehicle(428, -228.6950, 983.9024, 19.2901, 0.0000, 0, 0, -1); //FCPD Van
            SendClientMessageToAllEx(COLOR_PURPLE, "[Securivan]: A security van has arrived at Fort Carson PD.");
            defer DespawnVanSmuggleTimer();
        }
        case 3:
        {
            smuggleVan[veh] = CreateVehicle(428, -1400.5639, 2650.1445, 55.4832, 89.5998, 0, 0, -1); //EQPD Van
            SendClientMessageToAllEx(COLOR_PURPLE, "[Securivan]: A security van has arrived at El Quebrados PD.");
            defer DespawnVanSmuggleTimer();
        }
        case 4:
        {
            smuggleVan[veh] = CreateVehicle(428, -2173.0888, -2363.6210, 30.7702, 50.0996, 0, 0, -1); //APPD Van
            SendClientMessageToAllEx(COLOR_PURPLE, "[Securivan]: A security van has arrived at Angel Pine PD.");
            defer DespawnVanSmuggleTimer();
        }
        case 5:
        {
            smuggleVan[veh] = CreateVehicle(428, 610.7448, -590.8552, 17.3250, -91.5997, 0, 0, -1); //DMPD Van
            SendClientMessageToAllEx(COLOR_PURPLE, "[Securivan]: A security transport van has arrived at Dillmore PD.");
            defer DespawnVanSmuggleTimer();
        }
        case 6:
        {
            smuggleVan[veh] = CreateVehicle(428, 1535.3358, -1640.4570, 13.5817, 1.6066, 0, 0, -1); //LSPD Van
            SendClientMessageToAllEx(COLOR_PURPLE, "[Securivan]: A security transport van has arrived at LSPD.");
            defer DespawnVanSmuggleTimer();
        }
        case 7:
        {
            smuggleVan[veh] = CreateVehicle(428, 2248.5844, -78.6594, 27.3008, 179.2993, 0, 0, -1); //PCPD Van
            SendClientMessageToAllEx(COLOR_PURPLE, "[Securivan]: A security transport van has arrived at Palomino Creek PD.");
            defer DespawnVanSmuggleTimer();
        }
    }
    return 1;
}

hook OnPlayerEnterVehicle(playerid, vehicleid, ispassenger){

    if(vehicleid == smuggleVan[veh]){
        if(!IsPlayerInCriminalGroup(playerid)) {
            new Float:x, Float:y, Float:z;
            GetPlayerPos(playerid, x, y, z);
            SetPlayerPos(playerid, x, y, z);
            return SendClientMessage(playerid, COLOR_ERROR, "You are not in any criminal group to deliver this smuggle.");
        }
    }
    return 1;
}

hook OnPlayerStateChange(playerid, newstate, oldstate){
    if(smuggleVan[veh]){
        if(newstate == PLAYER_STATE_DRIVER){
            new p_veh = GetPlayerVehicleID(playerid);
            if(p_veh == smuggleVan[veh]){
                for(new i = 0; i < MAX_GROUP_SLOTS; i++){
                    if(GroupInfo[PlayerGroup[playerid][i][gId]][gSpeciality] == 1 || GroupInfo[PlayerGroup[playerid][i][gId]][gSpeciality] ==  2){
                        new p_groupid = PlayerGroup[playerid][i][gId];

                        SendClientMessage(playerid, COLOR_BLUE, "Deliver the van to your Group HQ.");
                        smuggleVan[cp] = CreateDynamicCP(GroupInfo[p_groupid][gSmuggleVanX], GroupInfo[p_groupid][gSmuggleVanY], GroupInfo[p_groupid][gSmuggleVanZ], 10.0);
                        TogglePlayerDynamicCP(playerid, smuggleVan[cp], 1);
                    }
                }
            }
        }
    }
    return 1;
}

hook OnPlayerEnterDynamicCP(playerid, checkpointid){
    if(checkpointid == smuggleVan[cp]){
        DestroyVehicle(smuggleVan[veh]);
        DestroyDynamicCP(smuggleVan[cp]);
        smuggleVan[veh] = 0;
        smuggleVan[cp] = 0;
        new p_groupid;
        for(new i = 0; i < MAX_GROUP_SLOTS; i++){
            if(GroupInfo[PlayerGroup[playerid][i][gId]][gSpeciality] == 1 || GroupInfo[PlayerGroup[playerid][i][gId]][gSpeciality] ==  2){
                p_groupid = PlayerGroup[playerid][i][gId];
            }
        }
        GroupInfo[p_groupid][gBankAcc] += Random(25000, 30000);
        SendClientMessage(playerid, COLOR_GREEN, "You have successfully delivered the van and the money goes to your group's bank account.");
        SendClientMessageToAllEx(COLOR_PURPLE, "[Securivan]: The van has successfully been delivered by [%s] %s.", GroupInfo[p_groupid][gTag], ReturnPlayerName(playerid));
    }
    return 1;
}

