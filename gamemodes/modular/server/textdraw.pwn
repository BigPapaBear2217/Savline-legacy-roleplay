#include <YSI_Coding\y_hooks>



// [===| SERVERWIDE |===| TEXTDRAWS START BELOW |===]

new Text:savline_time;

hook OnGameModeInit()
{
	LoadTimeTextdraw();
	LoadAdutyTextdraw();
	LoadHdutyTextdraw();
	return 1;
}

LoadTimeTextdraw()
{
	savline_time = TextDrawCreate(577.000000, 27.000000, "12:00");
	TextDrawFont(savline_time, 2);
	TextDrawLetterSize(savline_time, 0.304165, 1.499998);
	TextDrawTextSize(savline_time, 402.500000, 15.000000);
	TextDrawSetOutline(savline_time, 1);
	TextDrawSetShadow(savline_time, 0);
	TextDrawAlignment(savline_time, 2);
	TextDrawColor(savline_time, -1);
	TextDrawBackgroundColor(savline_time, 255);
	TextDrawBoxColor(savline_time, 50);
	TextDrawUseBox(savline_time, 0);
	TextDrawSetProportional(savline_time, 1);
	TextDrawSetSelectable(savline_time, 0);
}

LoadAdutyTextdraw()
{
	savline_adutyTD = TextDrawCreate(260.000000, 381.000000, "You are on admin duty.");
	TextDrawFont(savline_adutyTD, 1);
	TextDrawLetterSize(savline_adutyTD, 0.308333, 1.600000);
	TextDrawTextSize(savline_adutyTD, 484.000000, 9.000000);
	TextDrawSetOutline(savline_adutyTD, 1);
	TextDrawSetShadow(savline_adutyTD, 0);
	TextDrawAlignment(savline_adutyTD, 1);
	TextDrawColor(savline_adutyTD, -16776961);
	TextDrawBackgroundColor(savline_adutyTD, 255);
	TextDrawBoxColor(savline_adutyTD, 50);
	TextDrawUseBox(savline_adutyTD, 0);
	TextDrawSetProportional(savline_adutyTD, 1);
	TextDrawSetSelectable(savline_adutyTD, 0);
}

LoadHdutyTextdraw()
{
	savline_hdutyTD = TextDrawCreate(260.000000, 381.000000, "You are on helper duty.");
	TextDrawFont(savline_hdutyTD, 1);
	TextDrawLetterSize(savline_hdutyTD, 0.308333, 1.600000);
	TextDrawTextSize(savline_hdutyTD, 484.000000, 9.000000);
	TextDrawSetOutline(savline_hdutyTD, 1);
	TextDrawSetShadow(savline_hdutyTD, 0);
	TextDrawAlignment(savline_hdutyTD, 1);
	TextDrawColor(savline_hdutyTD, 0x8FDA3EFF);
	TextDrawBackgroundColor(savline_hdutyTD, 255);
	TextDrawBoxColor(savline_hdutyTD, 50);
	TextDrawUseBox(savline_hdutyTD, 0);
	TextDrawSetProportional(savline_hdutyTD, 1);
	TextDrawSetSelectable(savline_hdutyTD, 0);
}

// [===| FOR PLAYER |===| TEXTDRAWS START BELOW |===]

hook OnPlayerConnect(playerid)
{
	LoadCustomHealthBars(playerid);
	LoadPropertyTextdraws(playerid);
	return 1;
}

LoadCustomHealthBars(playerid) // [FOR PLAYER] health and armour bar indicators
{
	savline_text_armour[playerid] = CreatePlayerTextDraw(playerid, 618.000000, 45.000000, "83");
	PlayerTextDrawFont(playerid, savline_text_armour[playerid], 1);
	PlayerTextDrawLetterSize(playerid, savline_text_armour[playerid], 0.241666, 0.749998);
	PlayerTextDrawTextSize(playerid, savline_text_armour[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, savline_text_armour[playerid], 1);
	PlayerTextDrawSetShadow(playerid, savline_text_armour[playerid], 0);
	PlayerTextDrawAlignment(playerid, savline_text_armour[playerid], 2);
	PlayerTextDrawColor(playerid, savline_text_armour[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, savline_text_armour[playerid], 255);
	PlayerTextDrawBoxColor(playerid, savline_text_armour[playerid], 50);
	PlayerTextDrawUseBox(playerid, savline_text_armour[playerid], 0);
	PlayerTextDrawSetProportional(playerid, savline_text_armour[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, savline_text_armour[playerid], 0);

	savline_text_health[playerid] = CreatePlayerTextDraw(playerid, 618.000000, 67.000000, "83");
	PlayerTextDrawFont(playerid, savline_text_health[playerid], 1);
	PlayerTextDrawLetterSize(playerid, savline_text_health[playerid], 0.241666, 0.749998);
	PlayerTextDrawTextSize(playerid, savline_text_health[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, savline_text_health[playerid], 1);
	PlayerTextDrawSetShadow(playerid, savline_text_health[playerid], 0);
	PlayerTextDrawAlignment(playerid, savline_text_health[playerid], 2);
	PlayerTextDrawColor(playerid, savline_text_health[playerid], -16776961);
	PlayerTextDrawBackgroundColor(playerid, savline_text_health[playerid], 255);
	PlayerTextDrawBoxColor(playerid, savline_text_health[playerid], 50);
	PlayerTextDrawUseBox(playerid, savline_text_health[playerid], 0);
	PlayerTextDrawSetProportional(playerid, savline_text_health[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, savline_text_health[playerid], 0);
}

LoadPropertyTextdraws(playerid)
{
	propertyTDbackground[playerid] = CreatePlayerTextDraw(playerid, 623.000000, 161.000000, "~w~");
	PlayerTextDrawFont(playerid, propertyTDbackground[playerid], 1);
	PlayerTextDrawLetterSize(playerid, propertyTDbackground[playerid], 0.679166, 6.450006);
	PlayerTextDrawTextSize(playerid, propertyTDbackground[playerid], 480.500000, 90.000000);
	PlayerTextDrawSetOutline(playerid, propertyTDbackground[playerid], 1);
	PlayerTextDrawSetShadow(playerid, propertyTDbackground[playerid], 0);
	PlayerTextDrawAlignment(playerid, propertyTDbackground[playerid], 1);
	PlayerTextDrawColor(playerid, propertyTDbackground[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, propertyTDbackground[playerid], 255);
	PlayerTextDrawBoxColor(playerid, propertyTDbackground[playerid], 60);
	PlayerTextDrawUseBox(playerid, propertyTDbackground[playerid], 1);
	PlayerTextDrawSetProportional(playerid, propertyTDbackground[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, propertyTDbackground[playerid], 0);

	propertyTDRedbackground[playerid] = CreatePlayerTextDraw(playerid, 623.000000, 149.000000, "~w~");
	PlayerTextDrawFont(playerid, propertyTDRedbackground[playerid], 1);
	PlayerTextDrawLetterSize(playerid, propertyTDRedbackground[playerid], 0.608331, 0.949999);
	PlayerTextDrawTextSize(playerid, propertyTDRedbackground[playerid], 480.500000, 51.000000);
	PlayerTextDrawSetOutline(playerid, propertyTDRedbackground[playerid], 1);
	PlayerTextDrawSetShadow(playerid, propertyTDRedbackground[playerid], 0);
	PlayerTextDrawAlignment(playerid, propertyTDRedbackground[playerid], 1);
	PlayerTextDrawColor(playerid, propertyTDRedbackground[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, propertyTDRedbackground[playerid], 255);
	PlayerTextDrawBoxColor(playerid, propertyTDRedbackground[playerid], -1962934212);
	PlayerTextDrawUseBox(playerid, propertyTDRedbackground[playerid], 1);
	PlayerTextDrawSetProportional(playerid, propertyTDRedbackground[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, propertyTDRedbackground[playerid], 0);

	propertyTDenter[playerid] = CreatePlayerTextDraw(playerid, 552.000000, 203.000000, "~y~Press ~r~~k~~GROUP_CONTROL_BWD~ ~y~to enter");
	PlayerTextDrawFont(playerid, propertyTDenter[playerid], 1);
	PlayerTextDrawLetterSize(playerid, propertyTDenter[playerid], 0.183329, 1.050001);
	PlayerTextDrawTextSize(playerid, propertyTDenter[playerid], 754.500000, 135.500000);
	PlayerTextDrawSetOutline(playerid, propertyTDenter[playerid], 1);
	PlayerTextDrawSetShadow(playerid, propertyTDenter[playerid], 0);
	PlayerTextDrawAlignment(playerid, propertyTDenter[playerid], 2);
	PlayerTextDrawColor(playerid, propertyTDenter[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, propertyTDenter[playerid], 255);
	PlayerTextDrawBoxColor(playerid, propertyTDenter[playerid], 50);
	PlayerTextDrawUseBox(playerid, propertyTDenter[playerid], 0);
	PlayerTextDrawSetProportional(playerid, propertyTDenter[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, propertyTDenter[playerid], 0);

	propertyTDvalue[playerid] = CreatePlayerTextDraw(playerid, 486.000000, 188.000000, "~g~Value: ~w~$50,00");
	PlayerTextDrawFont(playerid, propertyTDvalue[playerid], 1);
	PlayerTextDrawLetterSize(playerid, propertyTDvalue[playerid], 0.200001, 0.800001);
	PlayerTextDrawTextSize(playerid, propertyTDvalue[playerid], 619.500000, 136.500000);
	PlayerTextDrawSetOutline(playerid, propertyTDvalue[playerid], 1);
	PlayerTextDrawSetShadow(playerid, propertyTDvalue[playerid], 0);
	PlayerTextDrawAlignment(playerid, propertyTDvalue[playerid], 1);
	PlayerTextDrawColor(playerid, propertyTDvalue[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, propertyTDvalue[playerid], 255);
	PlayerTextDrawBoxColor(playerid, propertyTDvalue[playerid], 50);
	PlayerTextDrawUseBox(playerid, propertyTDvalue[playerid], 0);
	PlayerTextDrawSetProportional(playerid, propertyTDvalue[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, propertyTDvalue[playerid], 0);

	propertyTDowner[playerid] = CreatePlayerTextDraw(playerid, 485.000000, 180.000000, "~b~Owner: ~w~Property Owner");
	PlayerTextDrawFont(playerid, propertyTDowner[playerid], 1);
	PlayerTextDrawLetterSize(playerid, propertyTDowner[playerid], 0.191667, 0.750001);
	PlayerTextDrawTextSize(playerid, propertyTDowner[playerid], 619.000000, 136.000000);
	PlayerTextDrawSetOutline(playerid, propertyTDowner[playerid], 1);
	PlayerTextDrawSetShadow(playerid, propertyTDowner[playerid], 0);
	PlayerTextDrawAlignment(playerid, propertyTDowner[playerid], 1);
	PlayerTextDrawColor(playerid, propertyTDowner[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, propertyTDowner[playerid], 255);
	PlayerTextDrawBoxColor(playerid, propertyTDowner[playerid], 50);
	PlayerTextDrawUseBox(playerid, propertyTDowner[playerid], 0);
	PlayerTextDrawSetProportional(playerid, propertyTDowner[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, propertyTDowner[playerid], 0);

	propertyTDname[playerid] = CreatePlayerTextDraw(playerid, 552.000000, 164.000000, "Small House");
	PlayerTextDrawFont(playerid, propertyTDname[playerid], 1);
	PlayerTextDrawLetterSize(playerid, propertyTDname[playerid], 0.187490, 0.850000);
	PlayerTextDrawTextSize(playerid, propertyTDname[playerid], 765.000000, 135.500000);
	PlayerTextDrawSetOutline(playerid, propertyTDname[playerid], 1);
	PlayerTextDrawSetShadow(playerid, propertyTDname[playerid], 0);
	PlayerTextDrawAlignment(playerid, propertyTDname[playerid], 2);
	PlayerTextDrawColor(playerid, propertyTDname[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, propertyTDname[playerid], 255);
	PlayerTextDrawBoxColor(playerid, propertyTDname[playerid], 50);
	PlayerTextDrawUseBox(playerid, propertyTDname[playerid], 0);
	PlayerTextDrawSetProportional(playerid, propertyTDname[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, propertyTDname[playerid], 0);

	propertyTDpropertyinfo[playerid] = CreatePlayerTextDraw(playerid, 552.000000, 149.000000, "Property Information");
	PlayerTextDrawFont(playerid, propertyTDpropertyinfo[playerid], 2);
	PlayerTextDrawLetterSize(playerid, propertyTDpropertyinfo[playerid], 0.179157, 0.799998);
	PlayerTextDrawTextSize(playerid, propertyTDpropertyinfo[playerid], 765.000000, 135.500000);
	PlayerTextDrawSetOutline(playerid, propertyTDpropertyinfo[playerid], 1);
	PlayerTextDrawSetShadow(playerid, propertyTDpropertyinfo[playerid], 0);
	PlayerTextDrawAlignment(playerid, propertyTDpropertyinfo[playerid], 2);
	PlayerTextDrawColor(playerid, propertyTDpropertyinfo[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, propertyTDpropertyinfo[playerid], 255);
	PlayerTextDrawBoxColor(playerid, propertyTDpropertyinfo[playerid], 50);
	PlayerTextDrawUseBox(playerid, propertyTDpropertyinfo[playerid], 0);
	PlayerTextDrawSetProportional(playerid, propertyTDpropertyinfo[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, propertyTDpropertyinfo[playerid], 0);
}