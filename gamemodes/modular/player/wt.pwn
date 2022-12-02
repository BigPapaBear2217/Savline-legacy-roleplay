#include <YSI_Coding\y_hooks>

hook OnPlayerDisconnect(playerid){
    for(new i = 0; i < 3; i++){
        Player_WT[playerid][pWTInfo:i] = 0;
        Player_WTRank[playerid][pWTRank:i] = 0;
    }
    return 1;
}

forward LoadPlayerWTData(playerid);
public LoadPlayerWTData(playerid){
	new query[128];
	mysql_format(handle, query, sizeof(query), "SELECT * FROM wt_members WHERE Master_ID = %d AND Slot > 0;", PlayerInfo[playerid][pMasterID]);
    mysql_tquery(handle, query, "OnPlayerWTDataLoads", "d", playerid);
}

forward OnPlayerWTDataLoads(playerid);
public OnPlayerWTDataLoads(playerid){
    new rows;
    if(cache_num_rows()){
        cache_get_row_count(rows);
        new slot, channel, rank;
        for(new i=0; i<rows; i++){
            cache_get_value_name_int(i, "Slot", slot);
            cache_get_value_name_int(i, "Channel", channel);
            cache_get_value_name_int(i, "Rank", rank);
            if(slot == 1){
                Player_WT[playerid][pWTInfo:(slot-1)] = channel;
                Player_WTRank[playerid][pWTRank:(slot-1)] = rank;
            }
            else if(slot == 2){
                Player_WT[playerid][pWTInfo:(slot-1)] = channel;
                Player_WTRank[playerid][pWTRank:(slot-1)] = rank;
            }
            else if(slot == 3){
                Player_WT[playerid][pWTInfo:(slot-1)] = channel;
                Player_WTRank[playerid][pWTRank:(slot-1)] = rank;
            }
            printf("%s|Master ID: %d has loads his wt data.", ReturnPlayerName(playerid), PlayerInfo[playerid][pMasterID]);
        }
    }
    return 1;
}


CMD:wt(playerid, params[])
{
    new message[145], slot;
    if(sscanf(params, "is[128]", slot, message)) return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /wt [slot] [messsage]");

    else if(slot <= 0 || slot > MAX_PLAYER_WT_SLOT) return SendClientMessage(playerid, COLOR_ERROR, "Please specify a slot between 1-3");

    else if(!Player_WT[playerid][pWTInfo:(slot-1)]) return SendClientMessage(playerid, COLOR_ERROR, "You have not joined a channel in this slot");

    foreach( new i : Player){
        for(new j = 0; j < MAX_PLAYER_WT_SLOT; j++){
            if(Player_WT[playerid][pWTInfo:(slot-1)] == Player_WT[i][pWTInfo:j]){
                SendClientMessageEx(i, COLOR_WALKIE_MSG, "*** [%i | %i] %s: %s", (j+1), Player_WT[i][pWTInfo:j], ReturnPlayerName(playerid), message);
            }
        }
    }
    return 1;
}

CMD:wtalert(playerid, params[]){
    new message[145], slot;
    if(sscanf(params, "is[128]", slot, message)) return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /wtalert [slot] [messsage]");

    else if(slot <= 0 || slot > MAX_PLAYER_WT_SLOT) return SendClientMessage(playerid, COLOR_ERROR, "Please specify a slot between 1-3");

    else if(!Player_WT[playerid][pWTInfo:(slot-1)]) return SendClientMessage(playerid, COLOR_ERROR, "You have not joined a channel in this slot");

    else if(Player_WTRank[playerid][pWTRank:(slot-1)] >= 2){

        foreach( new i : Player){
            for(new j = 0; j < MAX_PLAYER_WT_SLOT; j++){
                if(Player_WT[playerid][pWTInfo:(slot-1)] == Player_WT[i][pWTInfo:j]){
                    SendClientMessageEx(i, COLOR_WALKIE_MSG, "*** [%i | %i] %s: {fc0303}%s", Player_WT[i][pWTInfo:j], (j+1), ReturnPlayerName(playerid), message);
                }
            }
        }
    }  
    else{
        return SendClientMessage(playerid, COLOR_ERROR, "You don't have permission to use this command.");
    }
    return 1;
}

timer WTPanicMapIconRemove[10000](panic_icon){
    DestroyDynamicMapIcon(panic_icon);
}

CMD:wtpanic(playerid, params[]){
    new slot;
    if(sscanf(params, "i", slot)) return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /wtpanic [slot]");
    else if(playerid == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_ERROR, "Something went wrong!");
    else if(slot <= 0 || slot > MAX_PLAYER_WT_SLOT) return SendClientMessage(playerid, COLOR_ERROR, "Please specify a slot between 1-3");
    else if(!Player_WT[playerid][pWTInfo:(slot-1)]) return SendClientMessage(playerid, COLOR_ERROR, "You have not joined a channel in this slot");

    new MapZone:zone = GetPlayerMapZone(playerid);
    new name[MAX_MAP_ZONE_NAME], soundid;
    GetMapZoneName(zone, name);
    GetMapZoneSoundID(zone, soundid);

    new Float:px, Float:py, Float:pz;
    GetPlayerPos(playerid, px, py, pz);

    PlayProximitySound(playerid, 20, 41603);


    if (zone == INVALID_MAP_ZONE_ID) {
        foreach( new i : Player){
            for(new j = 0; j < MAX_PLAYER_WT_SLOT; j++){
                if(Player_WT[playerid][pWTInfo:(slot-1)] == Player_WT[i][pWTInfo:j]){
                    // PlayerPlaySound(playerid, soundid, 0.0, 0.0, 0.0);
                    // new mapex = SetPlayerMapIcon(i, i, pz, py, pz, 41, 0, MAPICON_LOCAL_CHECKPOINT);
                    new panic_icon = CreateDynamicMapIcon(px, py, pz, 41, 0, -1, -1, i, STREAMER_MAP_ICON_SD, MAPICON_GLOBAL, -1, 0);
                    printf("Place panic map was :%d",panic_icon);
                    PlayerPlaySound(i, 41603, 0.0, 0.0, 0.0);
                    SendClientMessageEx(i, COLOR_WALKIE_ALERT, "*** [%d | %d] %s has pressed their panic button at an unknown place.", Player_WT[i][pWTInfo:j], (j+1), ReturnPlayerName(playerid));
                    defer WTPanicMapIconRemove(panic_icon);
                }
            }
        }
    }
    else{
        foreach(new i : Player){
            for(new j = 0; j < MAX_PLAYER_WT_SLOT; j++){
                if(Player_WT[playerid][pWTInfo:(slot-1)] == Player_WT[i][pWTInfo:j]){
                    // PlayerPlaySound(playerid, soundid, 0.0, 0.0, 0.0);
                    // new mapex = SetPlayerMapIcon(i, i, pz, py, pz, 41, 0, MAPICON_LOCAL_CHECKPOINT);
                    new panic_icon = CreateDynamicMapIcon(px, py, pz, 41, 0, -1, -1, i, STREAMER_MAP_ICON_SD, MAPICON_GLOBAL, -1, 0);
                    printf("Place panic map was :%d",panic_icon);
                    PlayerPlaySound(i, 41603, 0.0, 0.0, 0.0);
                    SendClientMessageEx(i, COLOR_WALKIE_ALERT, "*** [%d | %d] %s has pressed their panic button at %s.", Player_WT[i][pWTInfo:j], (j+1), ReturnPlayerName(playerid), name);
                    defer WTPanicMapIconRemove(panic_icon);
                }
            }
        }
    }

    return 1;
}

timer PlayerWTCountDownTimer[1000](playerid, slot, start_seconds, final_seconds) 
{
    new string[12];
    format(string, sizeof(string), "%d", (start_seconds+1));
    foreach(new i : Player){
        for(new j = 0; j < MAX_PLAYER_WT_SLOT; j++){
            if(Player_WT[playerid][pWTInfo:(slot-1)] == Player_WT[i][pWTInfo:j]){
                GameTextForPlayer(i, string, 970, 3);
            }
         }
    }
    if((start_seconds+1) != final_seconds){
        defer PlayerWTCountDownTimer(playerid, slot, start_seconds+1, final_seconds);
    }
}

CMD:wtcountdown(playerid, params[]){
    new slot, seconds;
    if(sscanf(params, "dd", slot, seconds)) return SendClientMessageEx(playerid, COLOR_ERROR, "Correct usage: /wtcountdown [slot] [seconds]");
    else if(playerid == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_ERROR, "Something went wrong!");
    else if(slot <= 0 || slot > MAX_PLAYER_WT_SLOT) return SendClientMessage(playerid, COLOR_ERROR, "Please specify a slot between 1-3");
    else if(!Player_WT[playerid][pWTInfo:(slot-1)]) return SendClientMessage(playerid, COLOR_ERROR, "You have not joined a channel in this slot");
    else if(seconds > 20) return SendClientMessage(playerid, COLOR_ERROR, "The countdown cannot be longer than 20 seconds.");
    else if(seconds <= 0) return SendClientMessage(playerid, COLOR_ERROR, "Invalid input, please enter seconds above 1.");

    else if(Player_WTRank[playerid][pWTRank:(slot-1)] >= 3){

        foreach( new i : Player){
            for(new j = 0; j < MAX_PLAYER_WT_SLOT; j++){
                if(Player_WT[playerid][pWTInfo:(slot-1)] == Player_WT[i][pWTInfo:j]){
                    SendClientMessageEx(i, COLOR_WALKIE_ALERT, "*** [%d | %d] %s has started a countdown for %d seconds.", Player_WT[i][pWTInfo:j], (j+1), ReturnPlayerName(playerid), seconds);
                }
            }
        }

        // new timer_value;
        // Timer:timer_value = repeat PlayerWTCountDownTimer(playerid, seconds, timer_value);
        defer PlayerWTCountDownTimer(playerid, slot, 0, seconds);
    }
    else{
        return SendClientMessage(playerid, COLOR_ERROR, "You don't have permission to use this command.");
    }
    return 1;
}



CMD:ch(playerid, params[])
{
    new option[56];
    new channel, slot, targetid, level;

    // /ch [not 1 argu]
    if(sscanf(params, "s[56]", option)) return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /ch [join|leave|register|unregister|members|lock|unlock|level|kick]");


    // /ch [1 argu] [not 2 argu] (These error should be good and would not create any problem.)
    else if(sscanf(params, "s[16]i", option, slot)){

        if(!strcmp(option, "register", true)) return SendClientMessage(playerid, COLOR_ERROR, "Correct Usage: /ch register [slot]");
        else if(!strcmp(option, "unregister", true)) return SendClientMessage(playerid, COLOR_ERROR, "Correct Usage: /ch unregister [slot]");
        else if(strfind(option, "leave", true) != -1) return SendClientMessage(playerid, COLOR_ERROR, "Correct Usage: /ch leave [slot]");
        else if(strfind(option, "members", true) != -1) return SendClientMessage(playerid, COLOR_ERROR, "Correct Usage: /ch members [slot]");
        else if(!strcmp(option, "lock", true)) return SendClientMessage(playerid, COLOR_ERROR, "Correct Usage: /ch lock [slot]");
        else if(!strcmp(option, "unlock", true)) return SendClientMessage(playerid, COLOR_ERROR, "Correct Usage: /ch unlock [slot]");
        else if(!strcmp(option, "join", true)) return SendClientMessage(playerid, COLOR_ERROR, "Correct Usage: /ch join [slot] [channel]");
        else if(!strcmp(option, "level", true)) return SendClientMessage(playerid, COLOR_ERROR, "Correct Usage: /ch level [slot] [playerid] [level]");
        else if(!strcmp(option, "kick", true)) return SendClientMessage(playerid, COLOR_ERROR, "Correct Usage: /ch kick [slot] [playerid]");
    }


    // /ch [1 argu] [2 argu] [not 3 argu] (You can remove these if you want!)
    else if(sscanf(params, "s[16]ii", option, slot, channel)){

        if(!strcmp(option, "join", true)) return SendClientMessageEx(playerid, COLOR_ERROR, "Correct Usage: /ch join %d [channel]", slot);
        else if(!strcmp(option, "kick", true)) return SendClientMessageEx(playerid, COLOR_ERROR, "Correct Usage: /ch kick %d [playerid]", slot);
        else if(!strcmp(option, "level", true)) return SendClientMessageEx(playerid, COLOR_ERROR, "Correct Usage: /ch level %d [playerid] [level]", slot);
    }


    // /ch [1 argu] [2 argu] [3 argu] [not 4 argu]
    else if(sscanf(params, "s[16]iii", option, slot, targetid, level)){

        if(!strcmp(option, "level", true)) return SendClientMessageEx(playerid, COLOR_ERROR, "Correct Usage: /ch level %d %d [level]", slot, targetid);
    }

    else if(!sscanf(params, "s[16]iii", option, slot, targetid, level)){

        printf("Option: %s, Slot: %d , PlayerID: %d, Level: %s", option, slot, targetid, level);
    }
    



    // ----- Register -----
    if(!strcmp(option, "register", true)){

        if(slot <= 0 || slot > MAX_PLAYER_WT_SLOT){
            return SendClientMessage(playerid, COLOR_ERROR, "Please specify a slot between 1-3");
        }

        else if(!Player_WT[playerid][pWTInfo:(slot-1)]){
            return SendClientMessage(playerid, COLOR_ERROR, "You have not joined a channel in this slot");
        }
        
        else{

            new query[128];
            mysql_format(handle, query, sizeof(query), "SELECT * FROM wt_channels WHERE Channel = %i", Player_WT[playerid][pWTInfo:(slot-1)]);
            mysql_tquery(handle, query, "OnChannelRegister", "dd", playerid, slot);
        }
    }


    // ----- Unregister -----
    else if(!strcmp(option, "unregister", true)){

        if(slot <= 0 || slot > MAX_PLAYER_WT_SLOT){
            return SendClientMessage(playerid, COLOR_ERROR, "Please specify a slot between 1-3");
        }

        else if(!Player_WT[playerid][pWTInfo:(slot-1)]){
            return SendClientMessage(playerid, COLOR_ERROR, "You have not joined a channel in this slot");
        }

        else{

            new query[128];
            mysql_format(handle, query, sizeof(query), "SELECT * FROM wt_channels WHERE Channel = %i", Player_WT[playerid][pWTInfo:(slot-1)]);
            mysql_tquery(handle, query, "OnChannelUnregister", "dd", playerid, slot);
        }
    }


    // ----- Leave -----
    else if(strfind(option, "leave", true) != -1){
        if(!Player_WT[playerid][pWTInfo:(slot-1)]){
            return SendClientMessage(playerid, COLOR_ERROR, "You have not joined a channel in this slot");
        }

        else if(slot <= 0 || slot > MAX_PLAYER_WT_SLOT){
            return SendClientMessage(playerid, COLOR_ERROR, "Please specify a slot between 1-3");
        }

        else{

            new query[128];
            mysql_format(handle, query, sizeof(query), "SELECT * FROM wt_members WHERE Master_ID = %d AND Channel = %d;", PlayerInfo[playerid][pMasterID], Player_WT[playerid][pWTInfo:(slot-1)]);
            mysql_tquery(handle, query, "OnPlayerChannelLeave", "ddd", playerid, Player_WT[playerid][pWTInfo:(slot-1)], slot);
        }
    }


    // ----- Members -----
    else if(strfind(option, "members", true) != -1){
        if(!Player_WT[playerid][pWTInfo:(slot-1)]) return SendClientMessage(playerid, COLOR_ERROR, "You have not joined a channel in this slot");

        else if(slot <= 0 || slot > MAX_PLAYER_WT_SLOT) return SendClientMessage(playerid, COLOR_ERROR, "Please specify a slot between 1-3");
        
        else{
            new query[128];

            mysql_format(handle, query, sizeof(query), "SELECT * FROM wt_members WHERE Channel = %d AND Slot > 0;", Player_WT[playerid][pWTInfo:(slot-1)]);
            mysql_tquery(handle, query, "OnPlayerWTMemberRequest", "ddd", playerid, Player_WT[playerid][pWTInfo:(slot-1)], slot);
        }
    }


    // ----- Lock -----
    else if(!strcmp(option, "lock", true)){
        if(!Player_WT[playerid][pWTInfo:(slot-1)]) return SendClientMessage(playerid, COLOR_ERROR, "You have not joined a channel in this slot");

        else if(slot <= 0 || slot > MAX_PLAYER_WT_SLOT) return SendClientMessage(playerid, COLOR_ERROR, "Please specify a slot between 1-3");
        
        else{
            if(Player_WTRank[playerid][pWTRank:(slot-1)] >= 3){
                new query[128];
                mysql_format(handle, query, sizeof(query), "UPDATE wt_channels SET State = 0 WHERE Channel = %d;", channel);
                mysql_tquery(handle, query);

                SendClientMessage(playerid, COLOR_BLUE, "You locked the channel.");
                foreach(new i : Player){
                    for(new j=0;j<MAX_PLAYER_WT_SLOT;j++){
                        if(Player_WT[playerid][pWTInfo:(slot-1)] == Player_WT[i][pWTInfo:j]){
                            SendClientMessageEx(i, COLOR_WALKIE_ALERT, "*** [ | %i] %s has locked the channel.", channel, ReturnPlayerName(playerid));
                        }
                    }
                }
            }
            else{
                return SendClientMessage(playerid, COLOR_ERROR, "You don't have permission to lock this channel.");
            }
        }
    }


    // ----- Unlock -----
    else if(!strcmp(option, "unlock", true)){
        if(!Player_WT[playerid][pWTInfo:(slot-1)]) return SendClientMessage(playerid, COLOR_ERROR, "You have not joined a channel in this slot");

        else if(slot <= 0 || slot > MAX_PLAYER_WT_SLOT) return SendClientMessage(playerid, COLOR_ERROR, "Please specify a slot between 1-3");

        else{
            if(Player_WTRank[playerid][pWTRank:(slot-1)] >= 3){
                new query[128];
                mysql_format(handle, query, sizeof(query), "UPDATE wt_channels SET State = 0 WHERE Channel = %d;", channel);
                mysql_tquery(handle, query);

                SendClientMessageEx(playerid, COLOR_BLUE, "You have unlocked channel %i.", channel);
                foreach(new i : Player){
                    for(new j=0;j<MAX_PLAYER_WT_SLOT;j++){
                        if(Player_WT[playerid][pWTInfo:(slot-1)] == Player_WT[i][pWTInfo:j]){
                            SendClientMessageEx(i, COLOR_WALKIE_ALERT, "*** [ | %i] %s has unlocked the channel", channel, ReturnPlayerName(playerid));
                        }
                    }
                }

            }
            else{
                return SendClientMessage(playerid, COLOR_ERROR, "You don't have permission to unlock this channel.");
            }
        }
    }


    // ----- Join -----
    if(strfind(option, "join", true) != -1){

        if(slot <= 0 || slot > MAX_PLAYER_WT_SLOT) return SendClientMessage(playerid, COLOR_ERROR, "Please specify a slot between 1-3");
        else if(Player_WT[playerid][pWTInfo:(slot-1)] > 0) return SendClientMessage(playerid, COLOR_ERROR, "You are already in a channel, leave the channel first to join another, use /ch leave [slot]");

        else{
            for(new i =0; i<MAX_PLAYER_WT_SLOT; i++){
                if(i != (slot-1)){
                    if(Player_WT[playerid][pWTInfo:i] == channel){
                        return SendClientMessageEx(playerid, COLOR_ERROR, "You have already joined that channel on slot %d.", i+1);
                    }
                }
            }

            new query[128];
            mysql_format(handle, query, sizeof(query), "SELECT * FROM wt_channels WHERE Channel = %i", channel);
            mysql_tquery(handle, query, "IsJoinChannelUnlock", "ddd", playerid, channel, slot);

        }
    }


    // ----- LEVEL -----
    if(!strcmp(option, "level", true)){
        new targetid_rank = -1;
        new targetid_slot = -1;

        if(Player_WTRank[playerid][pWTRank:(slot-1)] <= 2) return SendClientMessage(playerid, COLOR_ERROR, "You need to be admin+ to change wt ranks.");
        else if(slot <= 0 || slot > MAX_PLAYER_WT_SLOT) return SendClientMessage(playerid, COLOR_ERROR, "Please specifiy a slot between 1 and 3");
        else if(level == 4) return SendClientMessage(playerid, COLOR_ERROR, "You cannot make anyone WT owner using this command. Use /ch register and /ch unregister");
        else if(level < 0 || level > 3) return SendClientMessage(playerid, COLOR_ERROR, "You have entered a invaild rank.");
        else if(targetid == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_ERROR, "You have entered an invalid playerid.");
        else if(targetid == playerid) return SendClientMessage(playerid, COLOR_ERROR, "You cannot change you own rank");
        else{
            for(new i=0; i <MAX_PLAYER_WT_SLOT; i++){
                if(Player_WT[playerid][pWTInfo:(slot-1)] == Player_WT[targetid][pWTInfo:(i)]){
                    targetid_rank = Player_WTRank[targetid][pWTRank:(i)];
                    targetid_slot = i;
                }
            }

            if(targetid_rank == -1){
                return SendClientMessage(playerid, COLOR_ERROR, "Target player is not in your wt channel at specified slot.");
            }
            if(Player_WTRank[playerid][pWTRank:(slot-1)] <= targetid_rank){
                return SendClientMessage(playerid, COLOR_ERROR, "You cannot change the rank of a high rank player.");
            }

            Player_WTRank[targetid][pWTRank:(targetid_slot)] = level;

            foreach(new i : Player){
                for(new j=0; j < MAX_PLAYER_WT_SLOT; j++){
                    if(Player_WT[playerid][pWTInfo:(slot-1)] == Player_WT[i][pWTInfo:(j)] && Player_WT[targetid][pWTInfo:(targetid_slot)] == Player_WT[i][pWTInfo:(j)]){
                        SendClientMessageEx(i, COLOR_WALKIE_ALERT, "*** [%d | %d] %s has changed the rank of %s to %s.", Player_WT[i][pWTInfo:(j)], (j+1), ReturnPlayerName(playerid), ReturnPlayerName(targetid), ReturnWTRank(level));
                    }
                }
            }
            new query[128];
            mysql_format(handle, query, sizeof(query), "UPDATE wt_members SET Rank = %d WHERE Master_ID = %d AND Slot = %d AND Channel = %d;", level, PlayerInfo[targetid][pMasterID], (targetid_slot+1), Player_WT[targetid][pWTInfo:(targetid_slot)]);
            mysql_tquery(handle, query);
        }
    }

    if(!strcmp(option, "kick", true)){
        if(!sscanf(params, "s[56]iu", option, slot, targetid)){
            new targetid_rank = -1;
            new targetid_slot = -1;
            new targetid_channel = -1;
            if(Player_WTRank[playerid][pWTRank:(slot-1)] <= 2) return SendClientMessage(playerid, COLOR_ERROR, "You need to be Admin+ to kick someone from wt.");
            else if(slot <= 0 || slot > MAX_PLAYER_WT_SLOT) return SendClientMessage(playerid, COLOR_ERROR, "Please specify a slot between 1-3");
            else if(targetid == INVALID_PLAYER_ID) return SendClientMessage(playerid, COLOR_ERROR, "You have entered an invalid playerid.");
            else{
                for(new i=0; i <MAX_PLAYER_WT_SLOT; i++){
                    if(Player_WT[playerid][pWTInfo:(slot-1)] == Player_WT[targetid][pWTInfo:(i)]){
                        targetid_rank = Player_WTRank[targetid][pWTRank:(i)];
                        targetid_slot = i;
                        targetid_channel = Player_WT[targetid][pWTInfo:(i)];
                    }
                }
                if(targetid_rank == -1){
                    return SendClientMessage(playerid, COLOR_ERROR, "Target player is not in your wt channel at specified slot.");
                }
                if(Player_WTRank[playerid][pWTRank:(slot-1)] <= targetid_rank){
                    return SendClientMessage(playerid, COLOR_ERROR, "You cannot change the rank of a high rank player.");
                }

                Player_WT[targetid][pWTInfo:(targetid_slot)] = 0;
                Player_WTRank[targetid][pWTRank:(targetid_slot)] = 0;

                SendClientMessageEx(playerid, COLOR_BLUE, "You have kicked %s from the channel: %d", ReturnPlayerName(targetid), targetid_channel);
                SendClientMessageEx(targetid, COLOR_BLUE, "%s has kicked you from the channel: %d", ReturnPlayerName(playerid), targetid_channel);

                foreach(new i : Player){
                    for(new j=0; j < MAX_PLAYER_WT_SLOT; j++){
                        if(Player_WT[playerid][pWTInfo:(slot-1)] == Player_WT[i][pWTInfo:(j)] && targetid_channel == Player_WT[i][pWTInfo:(j)]){
                            SendClientMessageEx(i, COLOR_WALKIE_ALERT, "*** [%d | %d] %s has kicked %s from the channel.", (j+1), Player_WT[i][pWTInfo:(j)], ReturnPlayerName(playerid), ReturnPlayerName(targetid));
                        }
                    }
                }
                new query[128];
                mysql_format(handle, query, sizeof(query), "DELETE FROM wt_members WHERE Master_ID = %d AND Slot = %d AND Channel = %d AND Rank = %d;", PlayerInfo[targetid][pMasterID], (targetid_slot+1), targetid_channel, targetid_rank);
                mysql_tquery(handle, query);
            }
        }
    }


    return 1;
}
// --- CH COMMAND FINISH


// ----- UNLOCK FUNCTIONS -----
forward OnPlayerChannelUnlock(playerid, channel, slot);
public OnPlayerChannelUnlock(playerid, channel, slot){
    
    return 1;
}


// ----- MEMBERS FUNCTIONS -----
forward OnPlayerWTMemberRequest(playerid, channel, slot);
public OnPlayerWTMemberRequest(playerid, channel, slot){
    new rows;
    new target_master_id, wt_rank, main_string[4096];
    format(main_string, sizeof(main_string), "Name\tRank\n");
    if(cache_num_rows()){
        cache_get_row_count(rows);
        for(new i = 0; i < rows; i++){
            cache_get_value_name_int(i, "Master_ID", target_master_id);
            cache_get_value_name_int(i, "Rank", wt_rank);
            foreach(new p : Player){
                if(PlayerInfo[p][pMasterID] == target_master_id){
                    new string[44];
                    format(string, sizeof(string), "%s\t%s\n", ReturnPlayerName(p), ReturnWTRank(wt_rank));
                    strcat(main_string, string);
                }
            }
        }
        ShowPlayerDialog(playerid, DIALOG_NONE, DIALOG_STYLE_TABLIST_HEADERS, "Members", main_string, "Close", "");
    }
    else{
        SendClientMessage(playerid, COLOR_ERROR, "There are no members in this channel.");
    }
    return 1;
}


// ----- LEAVE FUNCTIONS -----

forward OnPlayerChannelLeave(playerid, channel, slot);
public OnPlayerChannelLeave(playerid, channel, slot){
    new rank;
    if(cache_num_rows()){
        cache_get_value_name_int(0, "Rank", rank);
        if(rank != 0){
            new query[128];
            SendClientMessageEx(playerid, COLOR_BLUE, "You have left the channel", Player_WT[playerid][pWTInfo:(slot-1)], slot);

            foreach( new i : Player){
                for(new j = 0; j < MAX_PLAYER_WT_SLOT; j++){
                    if(Player_WT[i][pWTInfo:(j)] == Player_WT[playerid][pWTInfo:(slot-1)]){
                        SendClientMessageEx(i, COLOR_WALKIE_ALERT, "*** [%i | %i] %s has left the channel", j+1, Player_WT[i][pWTInfo:(j)], ReturnPlayerName(playerid));
                    }
                }
            }

            mysql_format(handle, query, sizeof(query), "UPDATE wt_members SET Slot = 0, Rank = %d WHERE Master_ID = %d AND Channel = %d;", Player_WTRank[playerid][pWTRank:(slot-1)], PlayerInfo[playerid][pMasterID], channel);
            mysql_tquery(handle, query);

            Player_WT[playerid][pWTInfo:(slot-1)] = 0;
            Player_WTRank[playerid][pWTRank:(slot-1)] = 0;
            return 1;
        }
        else{
            new query[128];
            SendClientMessageEx(playerid, COLOR_BLUE, "You have left the channel", Player_WT[playerid][pWTInfo:(slot-1)], slot);

            foreach( new i : Player){
                for(new j = 0; j < MAX_PLAYER_WT_SLOT; j++){
                    if(Player_WT[i][pWTInfo:(j)] == Player_WT[playerid][pWTInfo:(slot-1)]){
                        SendClientMessageEx(i, COLOR_WALKIE_ALERT, "*** [%i | %i] %s has left the channel", j+1, Player_WT[i][pWTInfo:(j)], ReturnPlayerName(playerid));
                    }
                }
            }
            Player_WT[playerid][pWTInfo:(slot-1)] = 0;

            mysql_format(handle, query, sizeof(query), "DELETE FROM wt_members WHERE Master_ID = %d AND Channel = %d;", PlayerInfo[playerid][pMasterID], channel);
            mysql_tquery(handle, query);
            return 1;
        }
    }
    else{ // It can't possible there is no data in wt_members if player has joined a channel
        return SendClientMessage(playerid, COLOR_ERROR, "Something went wrong!");
    }
}



// ----- JOIN FUNCTIONS -----

forward IsJoinChannelUnlock(playerid, channel, slot);
public IsJoinChannelUnlock(playerid, channel, slot){
	new channel_state, owner;
	if(cache_num_rows()){
		cache_get_value_name_int(0, "State", channel_state);
        cache_get_value_name_int(0, "Owner", owner);
        if(channel_state != 1 || owner == PlayerInfo[playerid][pMasterID]){
            Player_WT[playerid][pWTInfo:(slot-1)] = channel;
            new query[128];
            mysql_format(handle, query, sizeof(query), "SELECT * FROM wt_members WHERE Master_ID = %i AND Channel = %i;", PlayerInfo[playerid][pMasterID], channel);
            mysql_tquery(handle, query, "OnPlayerChannelJoin", "ddd", playerid, channel, slot);

        }
        else{
            return SendClientMessage(playerid, COLOR_ERROR, "You can't join a locked channel.");
        }
	}
    else{
        Player_WT[playerid][pWTInfo:(slot-1)] = channel;


        new query[128];
        mysql_format(handle, query, sizeof(query), "SELECT * FROM wt_members WHERE Master_ID = %i AND Channel = %i;", PlayerInfo[playerid][pMasterID], channel);
        mysql_tquery(handle, query, "OnPlayerChannelJoin", "ddd", playerid, channel, slot);
    }
	return 1;
}

forward OnPlayerChannelJoin(playerid, channel, slot);
public OnPlayerChannelJoin(playerid, channel, slot){
    if(cache_num_rows()){
        cache_get_value_name_int(0, "Rank", Player_WTRank[playerid][pWTRank:(slot-1)]);

        new query[128];
        mysql_format(handle, query, sizeof(query), "UPDATE wt_members SET Slot = %d WHERE Master_ID = %d AND Channel = %d;", slot, PlayerInfo[playerid][pMasterID], channel);
        mysql_tquery(handle, query);

        SendClientMessage(playerid, COLOR_BLUE, "You have joined the channel!");
        foreach( new i : Player){
            for(new j = 0; j < MAX_PLAYER_WT_SLOT; j++){
                if(Player_WT[i][pWTInfo:j] == channel){
                    SendClientMessageEx(i, COLOR_WALKIE_ALERT, "*** [%i | %i] %s has joined the channel", j+1, Player_WT[i][pWTInfo:j], ReturnPlayerName(playerid));
                }
            }
        }
    }
    else{
        new query[256];
        // Please don't touch this query
        mysql_format(handle, query, sizeof(query), "INSERT INTO wt_members (Master_ID, Channel, Slot) SELECT * FROM (SELECT %d AS Master_ID, %d AS Channel, %d AS Slot) AS temp WHERE NOT EXISTS (SELECT * FROM wt_members WHERE Master_ID = %d AND Channel = %d) LIMIT 1;", PlayerInfo[playerid][pMasterID], channel, slot, PlayerInfo[playerid][pMasterID], channel);
        mysql_tquery(handle, query);
        Player_WTRank[playerid][pWTRank:(slot-1)] = 0;

        SendClientMessage(playerid, COLOR_BLUE, "You have joined the channel!");
        foreach( new i : Player){
            for(new j = 0; j < MAX_PLAYER_WT_SLOT; j++){
                if(Player_WT[i][pWTInfo:j] == channel){
                    return SendClientMessageEx(i, COLOR_WALKIE_ALERT, "*** [%i | %i] %s has joined the channel", j+1, Player_WT[i][pWTInfo:j], ReturnPlayerName(playerid));
                }
            }
        }
    }
    return 1;
}

// ----- Unregister Function -----
forward OnChannelUnregister(playerid, slot);
public OnChannelUnregister(playerid, slot){
    new owner;
    if(cache_num_rows()){
        cache_get_value_name_int(0, "Owner", owner);
        if(owner == PlayerInfo[playerid][pMasterID]){
            new query[128];


            mysql_format(handle, query, sizeof(query), "DELETE FROM wt_channels WHERE Channel = %d AND Owner = %d;", Player_WT[playerid][pWTInfo:(slot-1)], owner);
            mysql_tquery(handle, query, "OnChannelUnregistered", "ddd", playerid, Player_WT[playerid][pWTInfo:(slot-1)], slot);
        }
        else{
            return SendClientMessage(playerid, COLOR_ERROR, "You are not the owner of this channel.");
        }
    }
    else{
        return SendClientMessage(playerid, COLOR_ERROR, "This channel is not registered.");
    }
    return 1;
}

forward OnChannelUnregistered(playerid, channel,slot);
public OnChannelUnregistered(playerid, channel, slot){
    new query[128];

    mysql_format(handle, query, sizeof(query), "UPDATE wt_members SET Rank = %d WHERE Master_ID = %d AND Channel = %d;", 3, PlayerInfo[playerid][pMasterID], channel);
    mysql_tquery(handle, query);

    SendClientMessageEx(playerid, COLOR_BLUE, "You have unregistered the channel.");

    foreach( new i : Player){
        for(new j = 0; j < MAX_PLAYER_WT_SLOT; j++){
            if(Player_WT[i][pWTInfo:j] == channel){
                return SendClientMessageEx(i, COLOR_WALKIE_ALERT, "*** [%i | %i] %s has unregistered the channel", j+1, Player_WT[i][pWTInfo:j], ReturnPlayerName(playerid));
            }
        }
    }

    return 1;
}


// ----- Register Function -----

forward OnChannelRegister(playerid, slot);
public OnChannelRegister(playerid, slot){
	if(cache_num_rows()){
		SendClientMessage(playerid, COLOR_ERROR, "This channel has already been registered.");
	}
	else{
		new query[128];

		mysql_format(handle, query, sizeof(query), "INSERT INTO wt_channels (Channel, State, Owner) VALUES ('%i', '%i', '%i')", Player_WT[playerid][pWTInfo:(slot-1)], 0, PlayerInfo[playerid][pMasterID]);
		mysql_tquery(handle, query, "OnChannelRegistered", "dd", playerid, slot);
	}
}

forward OnChannelRegistered(playerid, slot);
public OnChannelRegistered(playerid, slot){
    SendClientMessage(playerid, COLOR_BLUE, "You have registered the channel.");

    new query[128];
    mysql_format(handle, query, sizeof(query), "UPDATE wt_members SET Rank = 4 WHERE Master_ID = %d AND Channel = %d;", PlayerInfo[playerid][pMasterID], Player_WT[playerid][pWTInfo:(slot-1)]);
    mysql_tquery(handle, query);

    foreach( new i : Player){
        for(new j = 0; j < MAX_PLAYER_WT_SLOT; j++){
            if(Player_WT[i][pWTInfo:j] == Player_WT[playerid][pWTInfo:(slot-1)]){
                return SendClientMessageEx(i, COLOR_WALKIE_ALERT, "*** [%i | %i] %s has registered the channel", j+1, Player_WT[i][pWTInfo:j], ReturnPlayerName(playerid));
            }
        }
    }

    return 1;
}


CMD:mywt(playerid){
    SendClientMessageEx(playerid, COLOR_ERROR, "Slot 1: %d |Rank 1: %d, Slot 2: %d |Rank 2: %d, Slot 3: %d |Rank 3: %d", Player_WT[playerid][SLOT1], Player_WTRank[playerid][SLOT1], Player_WT[playerid][SLOT2], Player_WTRank[playerid][SLOT2], Player_WT[playerid][SLOT3], Player_WTRank[playerid][SLOT3]);
    return 1;
}

stock ReturnWTRank(rank) {
	new string[10];
	switch(rank) {
		case 0: string = "Guest";
		case 1: string = "Member";
		case 2: string = "Moderator";
		case 3: string = "Admin";
		case 4: string = "Owner";
	}
	return string;
}