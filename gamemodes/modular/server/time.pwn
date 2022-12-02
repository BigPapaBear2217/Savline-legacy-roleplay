#include <YSI_Coding\y_hooks>

new ServerTime[2];

forward UpdateTime();
public UpdateTime()
{
    /*
        ServerTime[1] | Minutes
        ServerTime[0] | Hours
    */


    new string[32];


    ServerTime[1] ++;

    if(ServerTime[0] == 18 && ServerTime[1] == 1) {
        SpawnDrugDealer();
    }
    if(ServerTime[0] == 5 && ServerTime[1] == 60) {
        DespawnDrugDealer();
    }

    if(ServerTime[0] == 24)
    {
        ServerTime[0] = 0;
    }
    if(ServerTime[1] == 60)
    {
        ServerTime[0]++;
        ServerTime[1] = 0;
    }

    format(string, sizeof(string), "%02d:%02d", ServerTime[0], ServerTime[1]);
    TextDrawSetString(savline_time, string);

    SetWorldTime(ServerTime[0]);

    ChangePlayersExp();
    
    new rand_smuggle = random(4);
    switch(rand_smuggle){
        case 0:
        {
            if(!smuggleCargobob[cargobobVeh]){
                SpawnCargobobSmuggleMission();
            }
        }
        case 1:
        {
            if(!smuggleVan[veh]){
                SpawnVanSmuggleMission();
            }
        }
    }
    SetTimer("UpdateTime", 15000, false);
}


forward ChangePlayersExp();
public ChangePlayersExp() {
    foreach(new i : Player) {
        if(PlayerInfo[i][pLoggedIn]) {

            if(PlayerInfo[i][pExpTimestamp] == Timestamp:0) PlayerInfo[i][pExpTimestamp] = Timestamp:Now();
            new Timestamp:current_timestamp = Timestamp:Now();
            new Seconds:left_time = current_timestamp - PlayerInfo[i][pExpTimestamp];
            printf("Current Timestamp: %d", _:current_timestamp);
            printf("Last Xp Timestamp: %d", _:PlayerInfo[i][pExpTimestamp]);
            printf("Left time: %d", _:left_time);


            if(left_time >= Seconds:2500) {
                PlayerInfo[i][pExpTimestamp] = Timestamp:Now();
                PlayerInfo[i][pExp]++;
                switch(PlayerInfo[i][pLevel]) {
                    case 0:
                    {
                        if(PlayerInfo[i][pExp] == 1) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 1);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 3 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                    }
                    case 1:
                    {
                        if(PlayerInfo[i][pExp] == 2) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 2);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 3 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 3 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 2:
                    {
                        if(PlayerInfo[i][pExp] == 3) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 3);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 5 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 5 XP to reach the next level", PlayerInfo[i][pExp]);
                        }
                    }
                    case 3:
                    {
                        if(PlayerInfo[i][pExp] == 5) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 4);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 8 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 8 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 4:
                    {
                        if(PlayerInfo[i][pExp] == 8) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 5);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 12 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 12 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 5:
                    {
                        if(PlayerInfo[i][pExp] == 12) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 6);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 17 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 17 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 6:
                    {
                        if(PlayerInfo[i][pExp] == 17) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 7);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 23 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 23 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 7:
                    {
                        if(PlayerInfo[i][pExp] == 23) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 8);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 30 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 30 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 8:
                    {
                        if(PlayerInfo[i][pExp] == 30) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 9);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 38 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 38 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 9:
                    {
                        if(PlayerInfo[i][pExp] == 38) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 10);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 47 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 47 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 10:
                    {
                        if(PlayerInfo[i][pExp] == 47) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 11);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 57 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 57 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 11:
                    {
                        if(PlayerInfo[i][pExp] == 57) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 12);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 68XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 68XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 12:
                    {
                        if(PlayerInfo[i][pExp] == 68) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 13);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 80 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 80 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 13:
                    {
                        if(PlayerInfo[i][pExp] == 80) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 14);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 93 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 93 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 14:
                    {
                        if(PlayerInfo[i][pExp] == 93) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 15);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 107 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 107 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 15:
                    {
                        if(PlayerInfo[i][pExp] == 107) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 16);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 122 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 122 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 16:
                    {
                        if(PlayerInfo[i][pExp] == 122) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 17);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 138 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 138 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 17:
                    {
                        if(PlayerInfo[i][pExp] == 138) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 18);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 155 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 155 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 18:
                    {
                        if(PlayerInfo[i][pExp] == 155) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 19);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 173 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 173 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 19:
                    {
                        if(PlayerInfo[i][pExp] == 173) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 20);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 192 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 192 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 20:
                    {
                        if(PlayerInfo[i][pExp] == 192) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 21);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 212 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 212 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 21:
                    {
                        if(PlayerInfo[i][pExp] == 212) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 22);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 233 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 233 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 22:
                    {
                        if(PlayerInfo[i][pExp] == 233) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 23);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 255 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 255 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 23:
                    {
                        if(PlayerInfo[i][pExp] == 255) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 24);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 278 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 278 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 24:
                    {
                        if(PlayerInfo[i][pExp] == 278) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 25);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 302 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 302 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 25:
                    {
                        if(PlayerInfo[i][pExp] == 302) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 26);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 327 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 327 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 26:
                    {
                        if(PlayerInfo[i][pExp] == 327) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 27);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 353 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 353 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 27:
                    {
                        if(PlayerInfo[i][pExp] == 353) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 28);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 380 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 380 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 28:
                    {
                        if(PlayerInfo[i][pExp] == 380) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 29);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 408 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 408 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 29:
                    {
                        if(PlayerInfo[i][pExp] == 408) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 30);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 437 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 437 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 30:
                    {
                        if(PlayerInfo[i][pExp] == 437) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 31);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 467 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 467 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 31:
                    {
                        if(PlayerInfo[i][pExp] == 467) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 32);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 498 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 498 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 32:
                    {
                        if(PlayerInfo[i][pExp] == 498) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 33);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 530 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 530 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 33:
                    {
                        if(PlayerInfo[i][pExp] == 530) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 34);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 563 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 563 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 34:
                    {
                        if(PlayerInfo[i][pExp] == 563) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 35);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 597 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 597 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 35:
                    {
                        if(PlayerInfo[i][pExp] == 597) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 36);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 632 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 632 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 36:
                    {
                        if(PlayerInfo[i][pExp] == 632) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 37);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 668 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 668 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 37:
                    {
                        if(PlayerInfo[i][pExp] == 668) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 38);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 705 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 705 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 38:
                    {
                        if(PlayerInfo[i][pExp] == 705) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 39);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 743 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 743 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 39:
                    {
                        if(PlayerInfo[i][pExp] == 743) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 40);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 782 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 782 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 40:
                    {
                        if(PlayerInfo[i][pExp] == 782) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 41);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 822 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 822 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 41:
                    {
                        if(PlayerInfo[i][pExp] == 822) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 42);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 863 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 863 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 42:
                    {
                        if(PlayerInfo[i][pExp] == 863) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 43);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 905 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 905 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 43:
                    {
                        if(PlayerInfo[i][pExp] == 905) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 44);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 948 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 948 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 44:
                    {
                        if(PlayerInfo[i][pExp] == 948) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 45);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 992 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 992 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 45:
                    {
                        if(PlayerInfo[i][pExp] == 992) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 46);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 1037 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 1037 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 46:
                    {
                        if(PlayerInfo[i][pExp] == 1037) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 47);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 1083 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 1083 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 47:
                    {
                        if(PlayerInfo[i][pExp] == 1083) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 48);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 1130 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 1130 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 48:
                    {
                        if(PlayerInfo[i][pExp] == 1130) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 49);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. You need 1178 XP for the next level.", PlayerInfo[i][pLevel]);
                        }
                        else {
                            SendClientMessageEx(i, COLOR_ORANGE, "You gained 1 XP and now have %i in total. You need 1178 XP to level up", PlayerInfo[i][pExp]);
                        }
                    }
                    case 49:
                    {
                        if(PlayerInfo[i][pExp] == 1178) {
                            PlayerInfo[i][pExp] = 0;
                            PlayerInfo[i][pLevel]++;
                            SetPlayerScore(i, 50);
                            SendClientMessageEx(i, COLOR_ORANGE, "You have leveled up to %i. No way You've reached the maximum level, thank you so much for playing here <3");
                        }
                    }
                }
            }
        }
    }

    return 1;
}