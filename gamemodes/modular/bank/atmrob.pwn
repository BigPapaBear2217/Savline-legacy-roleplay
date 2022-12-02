#include <YSI_Coding\y_hooks>

new PlayerText:PlayerATMRobTD[MAX_PLAYERS][2];
new PlayerBar:PlayerATMRobProgressBar[MAX_PLAYERS][1];


hook OnPlayerPickUpDynPickup(playerid, pickupid) {
    for(new i=0; i<MAX_ATM; i++) {
        if(pickupid == atmInfo[i][Pickup]) {
            for(new j =0; j<8; j++)
            {
                new marked_money = Random(500, 1500);
                pInv[playerid][Marked_Money] += marked_money;
                DestroyDynamicPickup(atmInfo[i][Pickup]);

                SendClientMessageEx(playerid, COLOR_GREEN, "You have received $%d marked money from the destroyed ATM.", marked_money);
            }
        }

    }
    return 1;
}

timer ResetRobbedATM[180000](player_atm){
    atmInfo[player_atm][State] = 0;
    ResetRobbedATMObject(player_atm);
}

timer OnPlayerPlantC4AtATM[15000](playerid, player_atm, attach_object, Float:aox, Float:aoy, Float:aoz, Float:arx, Float:ary, Float:arz) 
{
    CreateExplosion(aox, aoy, aoz, 10, 10.0);
    DestroyDynamicObject(attach_object);
    DestroyDynamicObject(atmInfo[player_atm][Object]);
    atmInfo[player_atm][Object] = CreateDynamicObject(2943, aox, aoy, aoz, arx, ary, arz);
    atmInfo[player_atm][Pickup] = CreateDynamicPickup(1212, 1, aox, aoy, aoz+1);
    ClearAnimations(playerid);
    defer ResetRobbedATM(player_atm);
}

timer OnPlayerPlantingC4AtATM[1000](playerid, PlayerProgress, player_atm, attach_object, Float:aox, Float:aoy, Float:aoz, Float:arx, Float:ary, Float:arz) 
{
    if(PlayerProgress == 61){
        PlayerTextDrawDestroy(playerid, PlayerATMRobTD[playerid][0]);
        PlayerTextDrawDestroy(playerid, PlayerATMRobTD[playerid][1]);
        DestroyPlayerProgressBar(playerid, PlayerATMRobProgressBar[playerid][0]);

        TogglePlayerControllable(playerid, 1);
        SendClientMessage(playerid, COLOR_GREEN, "You have planted the C4 and it will explode in 15 seconds!");
        defer OnPlayerPlantC4AtATM(playerid, player_atm, attach_object, aox, aoy, aoz, arx, ary, arz);
    }
    else if(PlayerProgress != 61){
        PlayerProgress++;
        SetPlayerProgressBarValue(playerid, PlayerATMRobProgressBar[playerid][0], PlayerProgress);
        defer OnPlayerPlantingC4AtATM(playerid, PlayerProgress, player_atm, attach_object, Float:aox, Float:aoy, Float:aoz, Float:arx, Float:ary, Float:arz);
    }
}

CMD:robatm(playerid, params[])
{
    if(IsPlayerAtATM(playerid) == -1)
    {
        return SendClientMessage(playerid, COLOR_ERROR, "You are not near an ATM");
    }

    new player_atm = IsPlayerAtATM(playerid);

    if(atmInfo[player_atm][State] == 1)
    {
        return SendClientMessage(playerid, COLOR_ERROR, "This ATM has been robbed recently, wait a few minutes and try again.");
    }

    if(atmInfo[player_atm][State] == 0)
    {
        if(pInv[playerid][C4] < 1) return SendClientMessage(playerid, COLOR_ERROR, "You don't have C4 to plant.");

        CreatePlayerC4PlantingTextDraw(playerid);

        atmInfo[player_atm][State] = 1;
        new Float:aox, Float:aoy, Float:aoz;
        new Float:arx, Float:ary, Float:arz;
        GetDynamicObjectPos(atmInfo[player_atm][Object], aox, aoy, aoz);
        GetDynamicObjectRot(atmInfo[player_atm][Object], arx, ary, arz);
        ApplyAnimation(playerid, "BOMBER", "BOM_PLANT", 4.1, 1, 1, 1, 0, 0, 1);
        new attach_object = CreateDynamicObject(1252, 547.1234, -1444.0190, 15.4961, 0.0000, 0.0000, 0.0000); //barrelexpos
        AttachDynamicObjectToObject(attach_object, atmInfo[player_atm][Object], 0.0000, -0.3499, -0.3799, 0.0000, 0.0000, 0.0000);
        pInv[playerid][C4] -= 1;
        new PlayerProgress = 0;

        TogglePlayerControllable(playerid, 0);

        PlayerTextDrawShow(playerid, PlayerATMRobTD[playerid][0]);
        PlayerTextDrawShow(playerid, PlayerATMRobTD[playerid][1]);
        ShowPlayerProgressBar(playerid, PlayerATMRobProgressBar[playerid][0]);


        defer OnPlayerPlantingC4AtATM(playerid, PlayerProgress, player_atm, attach_object, Float:aox, Float:aoy, Float:aoz, Float:arx, Float:ary, Float:arz);
        
    }
    else
    {
        return SendClientMessage(playerid, COLOR_ERROR, "This ATM is currently being robbed, please wait.");
    }

    return 1;
}

forward CreatePlayerC4PlantingTextDraw(playerid);
public CreatePlayerC4PlantingTextDraw(playerid){
    PlayerATMRobTD[playerid][0] = CreatePlayerTextDraw(playerid, 343.000000, 352.000000, "_");
	PlayerTextDrawFont(playerid, PlayerATMRobTD[playerid][0], 0);
	PlayerTextDrawLetterSize(playerid, PlayerATMRobTD[playerid][0], 0.600000, 6.299993);
	PlayerTextDrawTextSize(playerid, PlayerATMRobTD[playerid][0], 303.000000, 345.500000);
	PlayerTextDrawSetOutline(playerid, PlayerATMRobTD[playerid][0], 0);
	PlayerTextDrawSetShadow(playerid, PlayerATMRobTD[playerid][0], 0);
	PlayerTextDrawAlignment(playerid, PlayerATMRobTD[playerid][0], 2);
	PlayerTextDrawColor(playerid, PlayerATMRobTD[playerid][0], -1);
	PlayerTextDrawBackgroundColor(playerid, PlayerATMRobTD[playerid][0], 255);
	PlayerTextDrawBoxColor(playerid, PlayerATMRobTD[playerid][0], 1296911716);
	PlayerTextDrawUseBox(playerid, PlayerATMRobTD[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, PlayerATMRobTD[playerid][0], 1);
	PlayerTextDrawSetSelectable(playerid, PlayerATMRobTD[playerid][0], 0);

	PlayerATMRobTD[playerid][1] = CreatePlayerTextDraw(playerid, 284.000000, 363.000000, "PLANTING");
	PlayerTextDrawFont(playerid, PlayerATMRobTD[playerid][1], 2);
	PlayerTextDrawLetterSize(playerid, PlayerATMRobTD[playerid][1], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, PlayerATMRobTD[playerid][1], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, PlayerATMRobTD[playerid][1], 0);
	PlayerTextDrawSetShadow(playerid, PlayerATMRobTD[playerid][1], 3);
	PlayerTextDrawAlignment(playerid, PlayerATMRobTD[playerid][1], 1);
	PlayerTextDrawColor(playerid, PlayerATMRobTD[playerid][1], -168436481);
	PlayerTextDrawBackgroundColor(playerid, PlayerATMRobTD[playerid][1], 255);
	PlayerTextDrawBoxColor(playerid, PlayerATMRobTD[playerid][1], 50);
	PlayerTextDrawUseBox(playerid, PlayerATMRobTD[playerid][1], 0);
	PlayerTextDrawSetProportional(playerid, PlayerATMRobTD[playerid][1], 1);
	PlayerTextDrawSetSelectable(playerid, PlayerATMRobTD[playerid][1], 0);

	PlayerATMRobProgressBar[playerid][0] = CreatePlayerProgressBar(playerid, 190.000000, 390.000000, 309.500000, 10.000000, -16776961, 60.000000, 0);
	SetPlayerProgressBarValue(playerid, PlayerATMRobProgressBar[playerid][0], 50.000000);
    return 1;
}

stock LoadATMObjects(){ // Galax
    atmInfo[0][Object] = CreateDynamicObject(19324, 1928.5579, -1782.4971, 13.1678, 0.0000, 0.0000, 90.6996); //kmb_atm1_2
    CreateDynamicMapIcon(1928.5579, -1782.4971, 13.1678, 52, 0, 0, -1, -1, STREAMER_MAP_ICON_SD, MAPICON_LOCAL); 

    atmInfo[1][Object] = CreateDynamicObject(19324, 2496.2663, -1958.7751, 13.2142, 0.0000, 0.0000, -179.0006); //kmb_atm1_2
    CreateDynamicMapIcon(2496.2663, -1958.7751, 13.2142, 52, 0, 0, -1, -1, STREAMER_MAP_ICON_SD, MAPICON_LOCAL); 

    atmInfo[2][Object] = CreateDynamicObject(19324, 1504.4300, -1751.8903, 13.1922, 0.0000, 0.0000, 89.9996); //kmb_atm1_2
    CreateDynamicMapIcon(1504.4300, -1751.8903, 13.1922, 52, 0, 0, -1, -1, STREAMER_MAP_ICON_SD, MAPICON_LOCAL); 

    atmInfo[3][Object] = CreateDynamicObject(19324, 555.3122, -1439.2811, 15.3283, 0.0000, 1.8000, -86.3999); //kmb_atm1_2
    CreateDynamicMapIcon(555.3122, -1439.2811, 15.3283, 52, 0, 0, -1, -1, STREAMER_MAP_ICON_SD, MAPICON_LOCAL); 
}

stock ResetRobbedATMObject(atm){
	switch(atm){
		case 0:
		{
			DestroyDynamicObject(atmInfo[atm][Object]);
			atmInfo[atm][Object] = CreateDynamicObject(19324, 1928.5579, -1782.4971, 13.1678, 0.0000, 0.0000, 90.6996); //kmb_atm1_2
		}
		case 1:
		{
			DestroyDynamicObject(atmInfo[atm][Object]);
    		atmInfo[atm][Object] = CreateDynamicObject(19324, 2496.2663, -1958.7751, 13.2142, 0.0000, 0.0000, -179.0006); //kmb_atm1_2
		}
		case 2:
		{
			DestroyDynamicObject(atmInfo[atm][Object]);
			atmInfo[atm][Object] = CreateDynamicObject(19324, 555.3122, -1439.2811, 15.3283, 0.0000, 1.8000, -86.3999); //kmb_atm1_2
		}
		case 3:
		{
			DestroyDynamicObject(atmInfo[atm][Object]);
			atmInfo[atm][Object] = CreateDynamicObject(19324, 1504.4300, -1751.8903, 13.1922, 0.0000, 0.0000, 89.9996); //kmb_atm1_2
		}
	}
}