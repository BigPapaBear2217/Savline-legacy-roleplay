#include <YSI_Coding\y_hooks>

// task SpawnSmuggleTimer[15000]() 
// {
//     if(!smuggleCargobob[cargobobVeh]){
//         SpawnCargobobSmuggleMission();
//     }
// }


hook OnPlayerStateChange(playerid, newstate, oldstate){
    if(newstate == PLAYER_STATE_DRIVER){
        new vehicleid = GetPlayerVehicleID(playerid);
        if(vehicleid == smuggleCargobob[cargobobVeh]){
            SendClientMessageToAllEx(COLOR_PURPLE, "[Cargobob]: %s has entered the cargobob and has started the mission.", ReturnPlayerName(playerid));
            CreateCargobobContainer(playerid);
        }
    }
    return 1;
}


hook OnPlayerExitVehicle(playerid, vehicleid){
    if(vehicleid == smuggleCargobob[cargobobVeh]){
        SendClientMessageToAllEx(COLOR_PURPLE, "[Cargobob]: %s has failed to deliver the cargobob.", ReturnPlayerName(playerid));
        DespawnCargobobSmuggleMission(playerid, vehicleid);
    }
    return 1;
}


hook OnPlayerEnterDynRaceCP(playerid, checkpointid){
    if(checkpointid == smuggleCargobob[cargobobCP]){
        new Float:ox, Float:oy, Float:oz;
        GetDynamicObjectPos(smuggleCargobob[cargobobContainer], ox, oy, oz);
        DestroyDynamicRaceCP(smuggleCargobob[cargobobCP]);
        smuggleCargobob[cargobobCP] = CreateDynamicRaceCP(4, 384.5684, 2603.0784, 33.8125, 0.0, 0.0, 0.0, 10.0);
        smuggleCargobob[cargobobRope] = CreateDynamicObject(19089, ox, oy, oz, 0.0, 0.0, 0.0);
        AttachDynamicObjectToVehicle(smuggleCargobob[cargobobRope], smuggleCargobob[cargobobVeh], 0, 0, -1, 0, 0, 0);
        AttachDynamicObjectToVehicle(smuggleCargobob[cargobobContainer], smuggleCargobob[cargobobVeh], 0, 0, -10, 0, 0, 0);

    }
    if(checkpointid == smuggleCargobob[cargobobCP] && IsPlayerInRangeOfPoint(playerid, 50.0, 384.5684, 2603.0784, 33.8125)){
        SendClientMessage(playerid, COLOR_GREEN, "Return the cargobob to get the reward!");
        // smuggleCargobob[cargobobCP] = CreateDynamicRCP(smuggleCargobob[rX], smuggleCargobob[rY], smuggleCargobob[rZ], 5.0);
        DestroyDynamicRaceCP(smuggleCargobob[cargobobCP]);
        smuggleCargobob[cargobobCP] = 0;
        smuggleCargobob[cargobobCP] = CreateDynamicRaceCP(4, smuggleCargobob[rX], smuggleCargobob[rY], smuggleCargobob[rZ], 0.0, 0.0, 0.0, 10.0);
        DestroyDynamicObject(smuggleCargobob[cargobobContainer]);
        DestroyDynamicObject(smuggleCargobob[cargobobRope]);
        smuggleCargobob[cargobobContainer] = 0;
        smuggleCargobob[cargobobRope] = 0;
    }
    if(checkpointid == smuggleCargobob[cargobobCP] && IsPlayerInRangeOfPoint(playerid, 15.0, smuggleCargobob[rX], smuggleCargobob[rY], smuggleCargobob[rZ])){
        new mark_money = Random(20000, 25000);
        SendClientMessageToAllEx(COLOR_PURPLE, "[Cargobob]: The cargobob was successfully delivered by %s.", ReturnPlayerName(playerid));
        SendClientMessageEx(playerid, COLOR_GREEN, "You have successfully delivered the cargobob and received $%i marked money.", mark_money);
        pInv[playerid][Marked_Money] += mark_money;
        DestroyVehicle(smuggleCargobob[cargobobVeh]);
        TogglePlayerDynamicRaceCP(playerid, checkpointid, 0);
        DestroyDynamicRaceCP(smuggleCargobob[cargobobCP]);
        smuggleCargobob[cargobobVeh] = 0;
        smuggleCargobob[rX] = 0;
        smuggleCargobob[rY] = 0;
        smuggleCargobob[rZ] = 0;
    }
    return 1;
}


hook OnPlayerEnterDynamicCP(playerid, checkpointid){
    
    return 1;
}


forward SpawnCargobobSmuggleMission();
public SpawnCargobobSmuggleMission(){
    SendClientMessageToAll(COLOR_PURPLE, "A cargobob has landed at a random airport. The first one that gets to it starts the mission.");
    CreateCargobob();
    return 1;
}


forward DespawnCargobobSmuggleMission(playerid, vehicleid);
public DespawnCargobobSmuggleMission(playerid, vehicleid){
    if(vehicleid == smuggleCargobob[cargobobVeh]){
        DestroyVehicle(smuggleCargobob[cargobobVeh]);
        smuggleCargobob[cargobobVeh] = 0;
        smuggleCargobob[rX] = 0;
        smuggleCargobob[rY] = 0;
        smuggleCargobob[rZ] = 0;
    }
    DestroyDynamicRaceCP(smuggleCargobob[cargobobCP]);
    DestroyDynamicObject(smuggleCargobob[cargobobContainer]);
    DestroyDynamicObject(smuggleCargobob[cargobobRope]);
    smuggleCargobob[cargobobCP] = 0;
    smuggleCargobob[cargobobContainer] = 0;
    smuggleCargobob[cargobobRope] = 0;
    return 1;
}


forward CreateCargobob();
public CreateCargobob(){
    new rand_num = random(3);
    switch(rand_num){
        case 0:
        {
            smuggleCargobob[cargobobVeh] = CreateVehicle(548, 1463.5285, -2638.8381, 15.1964, 359.9891, 0, 0, -1); //LSAP Cargobob
            smuggleCargobob[rX] = 1463.5285;
            smuggleCargobob[rY] = -2638.8381;
            smuggleCargobob[rZ] = 15.1964;
        }
        case 1:
        {
            smuggleCargobob[cargobobVeh] = CreateVehicle(548, -1242.9775, -581.1586, 16.1667, 87.2996, 0, 0, -1); //SFAP Cargobob
            smuggleCargobob[rX] = -1242.9775;
            smuggleCargobob[rY] = -581.1586;
            smuggleCargobob[rZ] = 16.1667;
        }
        case 2:
        {
            smuggleCargobob[cargobobVeh] = CreateVehicle(548, 1328.2207, 1501.7696, 12.7368, -92.1999, 0, 0, -1); //LVAP Cargobob
            smuggleCargobob[rX] = 1328.2207;
            smuggleCargobob[rY] = 1501.7696;
            smuggleCargobob[rZ] = 12.7368;
        }
    }

    return 1;
}


forward CreateCargobobContainer(playerid);
public CreateCargobobContainer(playerid){
    new rand_num = random(3);
    switch(rand_num){
        case 0:
        {
            new zone_name[MAX_MAP_ZONE_NAME];
            smuggleCargobob[cargobobContainer] = CreateDynamicObject(2934, 2852.9719, -2426.1638, 15.3805, 0.0000, 0.0000, 0.0000); //od container
            GetMapZoneName(GetMapZoneAtPoint(2852.9719, -2426.1638, 15.3805), zone_name, sizeof(zone_name));
            SendClientMessageEx(playerid, COLOR_PURPLE, "The smuggle container is located at %s OD.", zone_name);
            smuggleCargobob[cargobobCP] = CreateDynamicRaceCP(3, 2852.9719, -2426.1638, 25.3805, 0.0, 0.0, 0.0, 10.0);
            TogglePlayerDynamicCP(playerid, smuggleCargobob[cargobobCP], 1);
        }
        case 1:
        {
            new zone_name[MAX_MAP_ZONE_NAME];
            smuggleCargobob[cargobobContainer] = CreateDynamicObject(2934, 1634.7576, 766.4650, 19.2708, 0.0000, 0.0000, 0.0000); //randophl container
            GetMapZoneName(GetMapZoneAtPoint(1634.7576, 766.4650, 19.2708), zone_name, sizeof(zone_name));
            SendClientMessageEx(playerid, COLOR_PURPLE, "The smuggle container is located at %s.", zone_name);
            smuggleCargobob[cargobobCP] = CreateDynamicRaceCP(3, 1634.7576, 766.4650, 29.2708, 0.0, 0.0, 0.0, 10.0);
            TogglePlayerDynamicCP(playerid, smuggleCargobob[cargobobCP], 1);
        }
        case 2:
        {
            new zone_name[MAX_MAP_ZONE_NAME];
            smuggleCargobob[cargobobContainer] = CreateDynamicObject(2934, -1484.6827, 142.2580, 19.2148, 0.0000, 0.0000, 44.7999); //EB container
            GetMapZoneName(GetMapZoneAtPoint(-1484.6827, 142.2580, 19.2148), zone_name, sizeof(zone_name));
            SendClientMessageEx(playerid, COLOR_PURPLE, "The smuggle container is located at %s.", zone_name);
            smuggleCargobob[cargobobCP] = CreateDynamicRaceCP(3, -1484.6827, 142.2580, 29.2148, 0.0, 0.0, 0.0, 10.0);
            TogglePlayerDynamicCP(playerid, smuggleCargobob[cargobobCP], 1);
        }
    }
    return 1;
}