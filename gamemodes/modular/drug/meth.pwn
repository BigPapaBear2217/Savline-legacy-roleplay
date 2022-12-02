#include <YSI_Coding\y_hooks>

enum PLAYER_METH_INFO{
    level,
    STREAMER_TAG_OBJECT:object
};
new Player_Meth_Info[MAX_PLAYERS][PLAYER_METH_INFO];

timer MethProgress[5000](lvl, playerid){
    if(lvl == 2){
        Player_Meth_Info[playerid][level] = 2;
        SendClientMessage(playerid, COLOR_BLUE, "Add the first ingredient to the mix (lithium).");
    }
    else if(lvl == 4){
        Player_Meth_Info[playerid][level] = 4;
        SendClientMessage(playerid, COLOR_BLUE, "Add the second ingredient to the mix (acetone).");
    }
    else if(lvl == 6){
        Player_Meth_Info[playerid][level] = 6;
        SendClientMessage(playerid, COLOR_BLUE, "Add the last ingredient to the mix (toluene).");
    }
    else if(lvl == 8){
        Player_Meth_Info[playerid][level] = 0;
        pInv[playerid][Meth] += 75;
        DestroyDynamicObject(Player_Meth_Info[playerid][object]);
        SendClientMessage(playerid, COLOR_GREEN, "Your batch of Meth gave you 75 grams.");
    }
}

CMD:meth(playerid, params[]){
    new select[12], option[10], player_vehicle_id;
    player_vehicle_id = GetPlayerVehicleID(playerid);
    if(!sscanf(params, "s[12]", select) && strfind(select, "produce", true) != -1){
        if(GetVehicleModel(player_vehicle_id) == 508){ // Journey van
            if(Player_Meth_Info[playerid][level] <= 0){

                new Float:vpx, Float:vpy, Float:vpz;
                GetVehiclePos(player_vehicle_id, vpx, vpy, vpz);

                Player_Meth_Info[playerid][object] = CreateDynamicObject(18725, vpx, vpy, vpz, 0, 0, 0);
                AttachDynamicObjectToVehicle(Player_Meth_Info[playerid][object], player_vehicle_id, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0);

                Player_Meth_Info[playerid][level] = 1;
                SendClientMessage(playerid, COLOR_BLUE, "You started producing Meth. The hotplate is heating up, wait for it to finish.");
                defer MethProgress(2, playerid);
            }
            else{
                return SendClientMessage(playerid, COLOR_ERROR, "You are already producing Meth. Please wait for it to finish.");
            }
        }
        else{
            return SendClientMessage(playerid, COLOR_ERROR, "You are not in a Journey to produce Meth.");
        }
    }
    else if(!sscanf(params, "s[12]s[10]", select, option) && strfind(select, "add", true) != -1){
        if(strfind(option, "lithium", true) != -1){
            if(GetVehicleModel(player_vehicle_id) == 508){ // Journey van
                if(Player_Meth_Info[playerid][level] == 2){
                    if(pInv[playerid][Lithium] <= 0){
                        return SendClientMessage(playerid, COLOR_ERROR, "You don't have enough Lithium.");
                    }

                    Player_Meth_Info[playerid][level] = 3;
                    SendClientMessage(playerid, COLOR_BLUE, "You added Lithium to the mix.");
                    defer MethProgress(4, playerid);
                }
                else if(Player_Meth_Info[playerid][level] <= 0){
                    return SendClientMessage(playerid, COLOR_ERROR, "You are already producing Meth. Please wait for it to finish.");
                }
                else{
                    return SendClientMessage(playerid, COLOR_ERROR, "This ingredient is not needed.");
                }
            }
        }
        else if(strfind(option, "acetone", true) != -1){
            if(GetVehicleModel(player_vehicle_id) == 508){ // Journey van
                if(Player_Meth_Info[playerid][level] == 4){
                    if(pInv[playerid][Acetone] <= 0){
                        return SendClientMessage(playerid, COLOR_ERROR, "You don't have enough Acetone.");
                    }

                    Player_Meth_Info[playerid][level] = 5;
                    SendClientMessage(playerid, COLOR_BLUE, "You added Acetone to the mix.");
                    defer MethProgress(6, playerid);
                }
                else if(Player_Meth_Info[playerid][level] <= 0){
                    return SendClientMessage(playerid, COLOR_ERROR, "You are already producing Meth. Please wait for it to finish.");
                }
                else{
                    return SendClientMessage(playerid, COLOR_ERROR, "This ingredient is not needed.");
                }
            }
        }
        else if(strfind(option, "toluene", true) != -1){
            if(GetVehicleModel(player_vehicle_id) == 508){ // Journey van
                if(Player_Meth_Info[playerid][level] == 6){
                    if(pInv[playerid][Toluene] <= 0){
                        return SendClientMessage(playerid, COLOR_ERROR, "You don't have enough Toluene.");
                    }

                    Player_Meth_Info[playerid][level] = 7;
                    SendClientMessage(playerid, COLOR_BLUE, "You added Toluene to the mix.");
                    defer MethProgress(8, playerid);
                }
                else if(Player_Meth_Info[playerid][level] <= 0){
                    return SendClientMessage(playerid, COLOR_ERROR, "You are already producing Meth. Please wait for it to finish.");
                }
                else{
                    return SendClientMessage(playerid, COLOR_ERROR, "This ingredient is not needed.");
                }
            }
        }
    }
    else{
        return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /meth [produce|add]");
    }
    return 1;
}
