#include <YSI_Coding\y_hooks>

#define MAX_DRUG_DEALERS 3

enum DRUG_DEALER{
    Phil_McKracken,
    Sonny_Crockett,
    Tubbs
};

new Drug_Dealer[DRUG_DEALER];
new STREAMER_TAG_AREA:Drug_Circle;
new Drug_MapIcon;

forward SpawnDrugDealer();
public SpawnDrugDealer(){

    if(ServerTime[0] >= 18 || ServerTime[0] <= 5){

        new value = random(3);
        if(value == 0){
            Drug_Dealer[Phil_McKracken] = CreateDynamicActor(28, 2364.5935, -1941.3743, 13.5340, -43.9999, 1,100.0, 0,-1,-1, STREAMER_ACTOR_SD,-1, 0); //Roberto_Pannunzi //Now Phil McKracken -TL
            Drug_Circle = CreateDynamicCircle(2364.5935, -1941.3743, 2.0);
            Drug_MapIcon = CreateDynamicMapIcon(2364.5935, -1941.3743, 13.5340, 56, 0, 0, -1, -1, STREAMER_MAP_ICON_SD, MAPICON_LOCAL);
            // SetDynamicActorInvulnerable(Drug_Dealer[Roberto_Pannunzi], 1);
            printf("Phil McKracken has spawned | Virtual World: %d", GetDynamicActorVirtualWorld(Drug_Dealer[Phil_McKracken]));
        }
        else if(value == 1){
            Drug_Dealer[Sonny_Crockett] = CreateDynamicActor(29, 2536.5422, -1353.5435, 30.6889, -89.6998, 1,100.0, 0,-1,-1, STREAMER_ACTOR_SD,-1, 0); //Crack_Jacker //Now Sonny Crockett -TL
            Drug_Circle = CreateDynamicCircle(2536.5422, -1353.5435, 2.0);
            Drug_MapIcon = CreateDynamicMapIcon(2536.5422, -1353.5435, 30.6889, 56, 0, 0, -1, -1, STREAMER_MAP_ICON_SD, MAPICON_LOCAL);
            // SetDynamicActorInvulnerable(Drug_Dealer[Crack_Jacker], 1);
            printf("Sonny Crockett has spawned | Virtual World: %d", GetDynamicActorVirtualWorld(Drug_Dealer[Sonny_Crockett]));
        }
        else if(value == 2){
            Drug_Dealer[Tubbs] = CreateDynamicActor(30, 1940.5422, -2030.2553, 13.4297, 124.6000, 1,100.0, 0,-1,-1, STREAMER_ACTOR_SD,-1, 0); //marcola //Now Tubbs -TL
            Drug_Circle = CreateDynamicCircle(1940.5422, -2030.2553, 2.0);
            Drug_MapIcon = CreateDynamicMapIcon(1940.5422, -2030.2553, 13.4297, 56, 0, 0, -1, -1, STREAMER_MAP_ICON_SD, MAPICON_LOCAL);
            // SetDynamicActorInvulnerable(Drug_Dealer[Tubbs], 1);
            printf("Tubbs has spawned | Virtual World: %d", GetDynamicActorVirtualWorld(Drug_Dealer[Tubbs]));
        }
    }
}

forward DespawnDrugDealer();
public DespawnDrugDealer(){
    for(new i = 0; i<MAX_DRUG_DEALERS; i++){
        if(Drug_Dealer[DRUG_DEALER:i]){
            DestroyDynamicActor(Drug_Dealer[DRUG_DEALER:i]);
        }
    }
    DestroyDynamicArea(Drug_Circle);
    DestroyDynamicMapIcon(Drug_MapIcon);
    return 1;
}

hook OnGameModeInit(){
    SpawnDrugDealer();
    return 1;
}

hook OnPlayerEnterDynArea(playerid, areaid) {
    if(areaid == Drug_Circle) {
        SendProximityMessage(playerid, 20.0, COLOR_LOCAL, "%s says: Ay mannn.. I might got what you need.", GetDealerName(playerid));
    }
    return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]){
    if(!response){ }
    if(dialogid == DIALOG_DRUG_DEALER){
        switch(listitem){
            case 0: // Sell
            {
                ShowPlayerDialog(playerid, DIALOG_DRUG_DEALER_SELL, DIALOG_STYLE_TABLIST_HEADERS, "Sell", "Item\tPrice\nWeed\t$98\nHeroin\t$99\nMeth\t$100", "Okay", "Close");
            }
            case 1: // Buy
            {
                ShowPlayerDialog(playerid, DIALOG_DRUG_DEALER_BUY, DIALOG_STYLE_TABLIST_HEADERS, "Buy", "Item\tPrice\nAcetone\t$140\nCalcium\t$150\nLithium\t$145\nSodium\t$180\nToluene\t$130\nWeed Seed\t$27", "Okay", "Close");

            }
        }
    }
    else if(dialogid == DIALOG_DRUG_DEALER_SELL){
        if(!response){ }
        switch(listitem){
            case 0: // Weed
            {
                ShowPlayerDialog(playerid, DIALOG_DRUG_DEALER_WEED, DIALOG_STYLE_INPUT, SERVER_NAME, "{ffffff}How much Weed do you wanna sell, bro?\nType '0' to sell all weed in your inventory.", "Okay", "Cancel");
            }
            case 1: // Heroin
            {
                ShowPlayerDialog(playerid, DIALOG_DRUG_DEALER_HEROIN, DIALOG_STYLE_INPUT, SERVER_NAME, "{ffffff}How much Heroin do you wanna sell, dawg?\nType '0' to sell all heroin in your inventory.", "Okay", "Cancel");
            }
            case 2: // Meth
            {
                ShowPlayerDialog(playerid, DIALOG_DRUG_DEALER_METH, DIALOG_STYLE_INPUT, SERVER_NAME, "{ffffff}How much Meth do you wanna sell, pal?\nType '0' to sell all meth in your inventory.", "Okay", "Cancel");
            }
        }
    }
    else if(dialogid == DIALOG_DRUG_DEALER_WEED){
        if(response){
            new amount;
            if(sscanf(inputtext, "i", amount)) return SendClientMessage(playerid, COLOR_ERROR, "The input you've entered is invalid.");
            else if(amount < 0) return SendClientMessage(playerid, COLOR_ERROR, "You have entered an invalid amount.");

            else if(amount == 0){
                if(amount > pInv[playerid][Weed] || pInv[playerid][Weed] <= 0) return SendClientMessageEx(playerid, COLOR_ERROR, "You don't have %d of Weed to sell.", amount);
                new givemoney = pInv[playerid][Weed] * 98;
                amount = pInv[playerid][Weed];
                pInv[playerid][Weed] = 0;
                GivePlayerMoney(playerid, givemoney);
                return SendClientMessageEx(playerid, COLOR_GREEN, "You have sold %d Weed to the Drug Dealer and received $%d.", amount, givemoney);
            }

            else if(amount > pInv[playerid][Weed]) return SendClientMessageEx(playerid, COLOR_ERROR, "You don't have %d Weed to sell.", amount);
            pInv[playerid][Weed] -= amount;
            new givemoney = amount * 98;
            GivePlayerMoney(playerid, givemoney);
            return SendClientMessageEx(playerid, COLOR_GREEN, "You have sold %d Weed to the Drug Dealer and received $%d.", amount, givemoney);
        }
    }
    else if(dialogid == DIALOG_DRUG_DEALER_HEROIN){
        if(response){
            new amount;
            if(sscanf(inputtext, "i", amount)) return SendClientMessage(playerid, COLOR_ERROR, "The input you've entered is invalid.");
            else if(amount < 0) return SendClientMessage(playerid, COLOR_ERROR, "You have entered an invalid amount.");

            else if(amount == 0){
                if(amount > pInv[playerid][Heroin] || pInv[playerid][Heroin] <= 0) return SendClientMessageEx(playerid, COLOR_ERROR, "You don't have %d Heroin to sell.", amount);
                new givemoney = pInv[playerid][Heroin] * 98;
                amount = pInv[playerid][Heroin];
                pInv[playerid][Heroin] = 0;
                GivePlayerMoney(playerid, givemoney);
                return SendClientMessageEx(playerid, COLOR_GREEN, "You have sold %d Heroin to the Drug Dealer and received $%d.", amount, givemoney);
            }

            else if(amount > pInv[playerid][Heroin]) return SendClientMessageEx(playerid, COLOR_ERROR, "You don't have %d Heroin to sell.", amount);
            pInv[playerid][Heroin] -= amount;
            new givemoney = amount * 99;
            GivePlayerMoney(playerid, givemoney);
            return SendClientMessageEx(playerid, COLOR_GREEN, "You have sold %d Heroin to the Drug Dealer and received $%d.", amount, givemoney);
        }
    }
    else if(dialogid == DIALOG_DRUG_DEALER_METH){
        if(response){
            new amount;
            if(sscanf(inputtext, "i", amount)) return SendClientMessage(playerid, COLOR_ERROR, "The input you've entered is invalid.");
            else if(amount < 0) return SendClientMessage(playerid, COLOR_ERROR, "You have entered an invalid amount.");

            else if(amount == 0){
                if(amount > pInv[playerid][Meth] || pInv[playerid][Meth] <= 0) return SendClientMessageEx(playerid, COLOR_ERROR, "You don't have %d Meth to sell.", amount);
                new givemoney = pInv[playerid][Meth] * 98;
                amount = pInv[playerid][Meth];
                pInv[playerid][Meth] = 0;
                GivePlayerMoney(playerid, givemoney);
                return SendClientMessageEx(playerid, COLOR_GREEN, "You have sold %d Meth to the Drug Dealer and received $%d.", amount, givemoney);
            }

            else if(amount > pInv[playerid][Meth]) return SendClientMessageEx(playerid, COLOR_ERROR, "You don't have %d Meth to sell.", amount);
            pInv[playerid][Meth] -= amount;
            new givemoney = amount * 99;
            GivePlayerMoney(playerid, givemoney);
            return SendClientMessageEx(playerid, COLOR_GREEN, "You have sold %d Meth to the Drug Dealer and received $%d.", amount, givemoney);
        }
    }
    else if(dialogid == DIALOG_DRUG_DEALER_BUY){
        switch(listitem){
            case 0: // acetone
            {
                ShowPlayerDialog(playerid, DIALOG_DRUG_DEALER_ACETONE, DIALOG_STYLE_INPUT, "Buy Acetone", "{ffffff}Enter the amount of Acetone to buy.", "Okay", "Cancel");
            }
            case 1: // calcium
            {
                ShowPlayerDialog(playerid, DIALOG_DRUG_DEALER_CALCIUM, DIALOG_STYLE_INPUT, "Buy Calcium", "{ffffff}Enter the amount of Calcium to buy.", "Okay", "Cancel");
            }
            case 2:
            {
                ShowPlayerDialog(playerid, DIALOG_DRUG_DEALER_LITHIUM, DIALOG_STYLE_INPUT, "Buy Lithium", "{ffffff}Enter the amount of Lithium to buy.", "Okay", "Cancel");
            }
            case 3:
            {
                ShowPlayerDialog(playerid, DIALOG_DRUG_DEALER_SODIUM, DIALOG_STYLE_INPUT, "Buy Sodium", "{ffffff}Enter the amount of Sodium to buy.", "Okay", "Cancel");
            }
            case 4:
            {
                ShowPlayerDialog(playerid, DIALOG_DRUG_DEALER_TOLUENE, DIALOG_STYLE_INPUT, "Buy Toluene", "{ffffff}Enter the amount of Toluene to buy.", "Okay", "Cancel");
            }
            case 5:
            {
                ShowPlayerDialog(playerid, DIALOG_DRUG_DEALER_WEED_SEED, DIALOG_STYLE_INPUT, "Buy Weed Seed", "{ffffff}Enter the amount of Weed Seeds to buy.", "Okay", "Cancel");
            }
        }
    }
    else if(dialogid == DIALOG_DRUG_DEALER_ACETONE){
        if(response){
            new amount;
            if(sscanf(inputtext, "d", amount)) return SendClientMessage(playerid, COLOR_ERROR, "The input you've entered is invalid.");
            else if(amount <= 0) return SendClientMessage(playerid, COLOR_ERROR, "You have entered an invalid amount.");
            new cost = amount * 140;
            if(GetPlayerMoney(playerid) < cost) return SendClientMessageEx(playerid, COLOR_ERROR, "You don't have enough money to buy %d of Acetone.", amount);

            pInv[playerid][Acetone] += amount;
            GivePlayerMoney(playerid, -(cost));
            return SendClientMessageEx(playerid, COLOR_GREEN, "You purchased %d Acetone for $%d.", amount, cost);
        }
    }
    else if(dialogid == DIALOG_DRUG_DEALER_CALCIUM){
        if(response){
            new amount;
            if(sscanf(inputtext, "d", amount)) return SendClientMessage(playerid, COLOR_ERROR, "The input you've entered is invalid.");
            else if(amount <= 0) return SendClientMessage(playerid, COLOR_ERROR, "You have entered an invalid amount.");
            new cost = amount * 150;
            if(GetPlayerMoney(playerid) < cost) return SendClientMessageEx(playerid, COLOR_ERROR, "You don't have enough money to buy %d of Calcium.", amount);

            pInv[playerid][Calcium] += amount;
            GivePlayerMoney(playerid, -(cost));
            return SendClientMessageEx(playerid, COLOR_GREEN, "You purchased %d Calcium for $%d.", amount, cost);
        }
    }
    else if(dialogid == DIALOG_DRUG_DEALER_LITHIUM){
        if(response){
            new amount;
            if(sscanf(inputtext, "d", amount)) return SendClientMessage(playerid, COLOR_ERROR, "The input you've entered is invalid.");
            else if(amount <= 0) return SendClientMessage(playerid, COLOR_ERROR, "You have entered an invalid amount.");
            new cost = amount * 145;
            if(GetPlayerMoney(playerid) < cost) return SendClientMessageEx(playerid, COLOR_ERROR, "You don't have enough money to buy %d of Lithium.", amount);

            pInv[playerid][Lithium] += amount;
            GivePlayerMoney(playerid, -(cost));
            return SendClientMessageEx(playerid, COLOR_GREEN, "You purchased %d Lithium for $%d.", amount, cost);
        }
    }
    else if(dialogid == DIALOG_DRUG_DEALER_SODIUM){
        if(response){
            new amount;
            if(sscanf(inputtext, "d", amount)) return SendClientMessage(playerid, COLOR_ERROR, "The input you've entered is invalid.");
            else if(amount <= 0) return SendClientMessage(playerid, COLOR_ERROR, "You have entered an invalid amount.");
            new cost = amount * 180;
            if(GetPlayerMoney(playerid) < cost) return SendClientMessageEx(playerid, COLOR_ERROR, "You don't have enough money to buy %d of Sodium.", amount);

            pInv[playerid][Sodium] += amount;
            GivePlayerMoney(playerid, -(cost));
            return SendClientMessageEx(playerid, COLOR_GREEN, "You purchased %d Sodium for $%d.", amount, cost);
        }
    }
    else if(dialogid == DIALOG_DRUG_DEALER_TOLUENE){
        if(response){
            new amount;
            if(sscanf(inputtext, "d", amount)) return SendClientMessage(playerid, COLOR_ERROR, "The input you've entered is invalid.");
            else if(amount <= 0) return SendClientMessage(playerid, COLOR_ERROR, "You have entered an invalid amount.");
            new cost = amount * 130;
            if(GetPlayerMoney(playerid) < cost) return SendClientMessageEx(playerid, COLOR_ERROR, "You don't have enough money to buy %d of Toluene.", amount);

            pInv[playerid][Toluene] += amount;
            GivePlayerMoney(playerid, -(cost));
            return SendClientMessageEx(playerid, COLOR_GREEN, "You purchased %d Toluene for $%d.", amount, cost);
        }
    }
    else if(dialogid == DIALOG_DRUG_DEALER_WEED_SEED){
        if(response){
            new amount;
            if(sscanf(inputtext, "d", amount)) return SendClientMessage(playerid, COLOR_ERROR, "The input you've entered is invalid.");
            else if(amount <= 0) return SendClientMessage(playerid, COLOR_ERROR, "You have entered an invalid amount.");
            new cost = amount * 27;
            if(GetPlayerMoney(playerid) < cost) return SendClientMessageEx(playerid, COLOR_ERROR, "You don't have enough money to buy %d Weed Seeds.", amount);

            pInv[playerid][Weed_Seed] += amount;
            GivePlayerMoney(playerid, -(cost));
            return SendClientMessageEx(playerid, COLOR_GREEN, "You purchased %d Weed Seeds for $%d.", amount, cost);
        }
    }
    return 1;
}

CMD:dealer(playerid) {

    if(ServerTime[0] >= 18 && ServerTime[0] <= 5)
        return SendClientMessage(playerid, COLOR_ERROR, "Drug Dealers arrive in town between 18:00 and 05:00.");

    if(IsPlayerAtDrugDealer(playerid) >= 0){
        ShowPlayerDialog(playerid, DIALOG_DRUG_DEALER, DIALOG_STYLE_LIST, SERVER_NAME, "Sell\nBuy", "Okay", "Cancel");
    }
    else{
        return SendClientMessage(playerid, COLOR_ERROR, "You are not near a Drug Dealer.");
    }
    return 1;
}

forward IsPlayerAtDrugDealer(playerid);
public IsPlayerAtDrugDealer(playerid){
    new Float:ax, Float:ay, Float:az;
    for(new i = 0; i<MAX_DRUG_DEALERS; i++){
        GetDynamicActorPos(Drug_Dealer[DRUG_DEALER:i], ax, ay, az);
        if(IsPlayerInRangeOfPoint(playerid, 2.0, ax, ay, az)){
            return i;
        }
    }
    return -1;
}

stock GetDealerName(playerid)
{
    new string[16];
    switch(IsPlayerAtDrugDealer(playerid))
    {
        case 0: string = "Phil McKracken";
        case 1: string = "Sonny Crockett";
        case 2: string = "Tubbs";
    }
    return string;
}