/*
    Heroin Stage: Producing (1 Level)
    Need Water (2 Level)
    Heroin Stage: Watering (3 Level)
    Need Calcium (4 Level)
    Heroin Stage: Calcium (5 Level)
    Need Sodium (6 Level)
    Heroin Stage: Sodium (7 Level)
    Need Acetone (8 Level)
    Heroin Stage: Acetone (9 Level)
    Heroin Stage: Collect (10 Level)
*/

#include <YSI_Coding\y_hooks>

#define MAX_HEROIN_SHACK 4

// X,Y,Z Coordinates
#define HeroinX 0
#define HeroinY 1
#define HeroinZ 2

// enums
enum HEROIN_INFO{
    Text3D:TextLabel,
    Level
};
enum HEROIN_SHACK{
    North_Rock,
    SF_Boat,
    BC_ACRO,
    Fern_Ridge
};

new Heroin_Shack[HEROIN_SHACK][HEROIN_INFO];
new Float:Heroin_Shack_Pos[HEROIN_SHACK][] = {
  {2351.3850,-653.0150,128.0547},
  {-2733.8032,2124.4133,3.9922},
  {-791.7661,2429.9370,157.2100},
  {894.9196,18.7777,91.5858}
};


hook OnGameModeInit(){
    return 1;
}

timer HeroinProgressTimer[10000](hs_id, level, playerid){
    if(level == 2){
        UpdateDynamic3DTextLabelText(Text3D:Heroin_Shack[HEROIN_SHACK:hs_id][TextLabel], COLOR_HEROIN_RED, "Heroin\nStage: Needs Water");
        Heroin_Shack[HEROIN_SHACK:hs_id][Level] = 2;
        SendClientMessage(playerid, COLOR_BLUE, "Add Water to the mixture.");
    }
    else if(level == 4){
        UpdateDynamic3DTextLabelText(Text3D:Heroin_Shack[HEROIN_SHACK:hs_id][TextLabel], COLOR_HEROIN_ORANGE, "Heroin\nStage: Needs Calcium");
        Heroin_Shack[HEROIN_SHACK:hs_id][Level] = 4;
        SendClientMessage(playerid, COLOR_BLUE, "Add Calcium to the mixture.");
    }
    else if(level == 6){
        UpdateDynamic3DTextLabelText(Text3D:Heroin_Shack[HEROIN_SHACK:hs_id][TextLabel], COLOR_HEROIN_YELLOW, "Heroin\nStage: Needs Sodium");
        Heroin_Shack[HEROIN_SHACK:hs_id][Level] = 6;
        SendClientMessage(playerid, COLOR_BLUE, "Add Sodium to the mixture.");
    }
    else if(level == 8){
        UpdateDynamic3DTextLabelText(Text3D:Heroin_Shack[HEROIN_SHACK:hs_id][TextLabel], COLOR_HEROIN_GREEN, "Heroin\nStage: Needs Acetone");
        Heroin_Shack[HEROIN_SHACK:hs_id][Level] = 8;
        SendClientMessage(playerid, COLOR_BLUE, "Add Acetone to the mixture.");
    }
    else if(level == 10){
        UpdateDynamic3DTextLabelText(Text3D:Heroin_Shack[HEROIN_SHACK:hs_id][TextLabel], COLOR_HEROIN_GREEN, "Heroin Ready\nStage: Ready to collect");
        Heroin_Shack[HEROIN_SHACK:hs_id][Level] = 10;
        SendClientMessage(playerid, COLOR_BLUE, "The Heroin is now ready! Use '/heroin collect' to collect the Heroin.");
    }

}

CMD:heroin(playerid, params[]){
    new select[12], option[10], hs_id;
    if(!sscanf(params, "s[12]", select) && strfind(select, "produce", true) != -1){
        if(IsPlayerAtHeroinShack(playerid) >= 0){
            if(Heroin_Shack[HEROIN_SHACK:hs_id][Level] <= 0){
                hs_id = IsPlayerAtHeroinShack(playerid); // CHeck player at heroin shack and return that heroin shack id
                Heroin_Shack[HEROIN_SHACK:hs_id][TextLabel] = CreateDynamic3DTextLabel("Heroin\nStage: Producing", COLOR_HEROIN_RED, Heroin_Shack_Pos[HEROIN_SHACK:hs_id][0], Heroin_Shack_Pos[HEROIN_SHACK:hs_id][1], Heroin_Shack_Pos[HEROIN_SHACK:hs_id][2], 5);
                Heroin_Shack[HEROIN_SHACK:hs_id][Level] = 1;
                SendClientMessage(playerid, COLOR_BLUE, "You have started producing Heroin.");
                defer HeroinProgressTimer(hs_id, 2, playerid);
            }
            else{
                return SendClientMessage(playerid, COLOR_ERROR, "There is already a mixture in the pot.");
            }
        }
        else{
            return SendClientMessage(playerid, COLOR_ERROR, "You are not at a Heroin Shack.");
        }
    }
    else if(!sscanf(params, "s[12]s[10]", select, option) && strfind(select, "add", true) != -1){
        if(IsPlayerAtHeroinShack(playerid) >= 0){
            hs_id = IsPlayerAtHeroinShack(playerid); // CHeck player at heroin shack and return that heroin shack id

            if(strfind(option, "water", true) != -1){
                if(Heroin_Shack[HEROIN_SHACK:hs_id][Level] == 2){
                    if(pInv[playerid][Water] <= 0){
                        return SendClientMessage(playerid, COLOR_ERROR, "You don't have enough Water.");
                    }
                    UpdateDynamic3DTextLabelText(Text3D:Heroin_Shack[HEROIN_SHACK:hs_id][TextLabel], COLOR_HEROIN_RED, "Heroin\nStage: Watering");
                    Heroin_Shack[HEROIN_SHACK:hs_id][Level] = 3;
                    pInv[playerid][Water] -= 1;
                    SendClientMessage(playerid, COLOR_BLUE, "You added Water to the mixture. Wait for it to mix in.");
                    defer HeroinProgressTimer(hs_id, 4, playerid);
                }
                else{
                    return SendClientMessage(playerid, COLOR_ERROR, "This mixture does not need Water right now.");
                }
            }
            else if(strfind(option, "calcium", true) != -1){
                if(Heroin_Shack[HEROIN_SHACK:hs_id][Level] == 4){
                    if(pInv[playerid][Calcium] <= 0){
                        return SendClientMessage(playerid, COLOR_ERROR, "You don't have enough Calcium.");
                    }
                    UpdateDynamic3DTextLabelText(Text3D:Heroin_Shack[HEROIN_SHACK:hs_id][TextLabel], COLOR_HEROIN_ORANGE, "Heroin\nStage: Calcium");
                    Heroin_Shack[HEROIN_SHACK:hs_id][Level] = 5;
                    pInv[playerid][Calcium] -= 1;
                    SendClientMessage(playerid, COLOR_BLUE, "You added Calcium to the mixture. Wait for it to mix in.");
                    defer HeroinProgressTimer(hs_id, 6, playerid);
                }
                else{
                    return SendClientMessage(playerid, COLOR_ERROR, "This mixture does not need Calcium right now.");
                }
            }
            else if(strfind(option, "sodium", true) != -1){
                if(Heroin_Shack[HEROIN_SHACK:hs_id][Level] == 6){
                    if(pInv[playerid][Sodium] <= 0){
                        return SendClientMessage(playerid, COLOR_ERROR, "You don't have enough Sodium.");
                    }
                    UpdateDynamic3DTextLabelText(Text3D:Heroin_Shack[HEROIN_SHACK:hs_id][TextLabel], COLOR_HEROIN_YELLOW, "Heroin\nStage: Sodium");
                    Heroin_Shack[HEROIN_SHACK:hs_id][Level] = 7;
                    pInv[playerid][Sodium] -= 1;
                    SendClientMessage(playerid, COLOR_BLUE, "You added Sodium to the mixture. Wait for it to mix in.");
                    defer HeroinProgressTimer(hs_id, 8, playerid);
                }
                else{
                    return SendClientMessage(playerid, COLOR_ERROR, "This mixture does not need Sodium right now.");
                }
            }
            else if(strfind(option, "acetone", true) != -1){
                if(Heroin_Shack[HEROIN_SHACK:hs_id][Level] == 8){
                    if(pInv[playerid][Acetone] <= 0){
                        return SendClientMessage(playerid, COLOR_ERROR, "You don't have enough Acetone.");
                    }
                    UpdateDynamic3DTextLabelText(Text3D:Heroin_Shack[HEROIN_SHACK:hs_id][TextLabel], COLOR_HEROIN_GREEN, "Heroin\nStage: Acetone");
                    Heroin_Shack[HEROIN_SHACK:hs_id][Level] = 9;
                    pInv[playerid][Acetone] -= 1;
                    SendClientMessage(playerid, COLOR_BLUE, "You added Acetone to the mixture. Wait for it to mix in.");
                    defer HeroinProgressTimer(hs_id, 10, playerid);
                }
                else{
                    return SendClientMessage(playerid, COLOR_ERROR, "This mixture does not need Acetone right now.");
                }
            }
            else{
                return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /heroin add [water|calcium|sodium|acetone]");
            }
        }
        else{
            return SendClientMessage(playerid, COLOR_ERROR, "You are not at a Heroin Shack.");
        }
    }
    else if(!sscanf(params, "s[12]", select) && strfind(select, "collect", true) != -1){
        if(IsPlayerAtHeroinShack(playerid) >= 0){
            hs_id = IsPlayerAtHeroinShack(playerid);

            if(Heroin_Shack[HEROIN_SHACK:hs_id][Level] == 10){
                DestroyDynamic3DTextLabel(Heroin_Shack[HEROIN_SHACK:hs_id][TextLabel]);
                Heroin_Shack[HEROIN_SHACK:hs_id][TextLabel] = Text3D:0;
                Heroin_Shack[HEROIN_SHACK:hs_id][Level] = 0;
                pInv[playerid][Heroin] += 150;
                SendClientMessage(playerid, COLOR_BLUE, "You have collected 150 grams of Heroin.");
            }
            else {
                return SendClientMessage(playerid, COLOR_ERROR, "Heroin is not ready yet.");
            }
        }
        else{
            return SendClientMessage(playerid, COLOR_ERROR, "You are not at a Heroin Shack");
        }
    }
    else if(!sscanf(params, "s[12]", select) && strfind(select, "empty", true) != -1){
        if(IsPlayerAtHeroinShack(playerid) >= 0){
            hs_id = IsPlayerAtHeroinShack(playerid);
            if(Heroin_Shack[HEROIN_SHACK:hs_id][Level] >= 1){
                DestroyDynamic3DTextLabel(Heroin_Shack[HEROIN_SHACK:hs_id][TextLabel]);
                Heroin_Shack[HEROIN_SHACK:hs_id][TextLabel] = Text3D:0;
                Heroin_Shack[HEROIN_SHACK:hs_id][Level] = 0;
                SendClientMessage(playerid, COLOR_ERROR, "You have emptied out the Heroin pot.");
            }
            else{
                return SendClientMessage(playerid, COLOR_ERROR, "Heroin is not being produced here.");
            }

        }
        else{
            return SendClientMessage(playerid, COLOR_ERROR, "You are not at a Heroin Shack");
        }
    }
    else{
        return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /heroin [produce|add|collect|empty]");
    }
    return 1;
}

// Heroin Function
forward SetHeroinShackPos();
public SetHeroinShackPos(){
    // Heroin_Shack_Pos[North_Rock][x] = 2351.7332;
    // Heroin_Shack_Pos[North_Rock][y] = -647.8344;
    // Heroin_Shack_Pos[North_Rock][z] = 128.0547;
    return -1;
}


forward IsPlayerAtHeroinShack(playerid);
public IsPlayerAtHeroinShack(playerid){
    for(new i = 0; i < MAX_HEROIN_SHACK; i++){
        if(IsPlayerInRangeOfPoint(playerid, 3.0, Heroin_Shack_Pos[HEROIN_SHACK:i][HeroinX], Heroin_Shack_Pos[HEROIN_SHACK:i][HeroinY], Heroin_Shack_Pos[HEROIN_SHACK:i][HeroinZ])){
            return i;
        }
    }
    return -1;
}

stock GetPlayerHeroinShack(heroin_shack){
    new string[16];
    switch(heroin_shack){
        case 0: string = "North Rock";
    }
    return string;
}