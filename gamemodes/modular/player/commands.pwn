#include <YSI_Coding\y_hooks>

/*

S A V L I N E - R P G
mysql.pwn
contains player commands
Uses izcmd as the command processor

*/

public OnPlayerCommandPerformed(playerid, cmdtext[], success)
{
	if(!PlayerInfo[playerid][pLoggedIn])
	{
		SendClientMessage(playerid, COLOR_ERROR, "You are not logged in.");
	}

	switch(success)
	{
		case 0:
		{
			SendClientMessage(playerid, COLOR_ERROR, "You entered a command that does not exist - '/cmds'!");
	        return 1;
		}
	}
	return 1;
}

CMD:accent(playerid, params[])
{
	new string[1040];
	for(new i = 0; i < sizeof(playerAccents); i ++)
	{
		format(string, sizeof(string), "%s%s\n", string, playerAccents[i]);
	}

	ShowPlayerDialog(playerid, DIALOG_ACCENT, DIALOG_STYLE_LIST, SERVER_NAME, string, "Select", "Close");
	return 1;
}

CMD:time(playerid, params[])
{
	SendClientMessageEx(playerid, COLOR_BLUE, "The server time is %02d:%02d.", ServerTime[0], ServerTime[1]);
	return 1;
}

CMD:area(playerid) {
    new MapZone:zone = GetPlayerMapZone(playerid);

    if (zone == INVALID_MAP_ZONE_ID) {
        return SendClientMessage(playerid, COLOR_BLUE, "Even I, the computer, have no idea where you are, so good luck!");
    }

    new name[MAX_MAP_ZONE_NAME];
    GetMapZoneName(zone, name);

    SendClientMessageEx(playerid, COLOR_BLUE, "You are at %s", name);
    return 1;
}

CMD:cmds(playerid, params[]) return cmd_help(playerid, params);
CMD:help(playerid, params[])
{
	D_HELP(playerid);
	return 1;
}

CMD:rules(playerid, params[])
{
	D_RULES(playerid);
	return 1;
}

CMD:pm(playerid, params[])
{
    new message[140], targetid;
    if(sscanf(params, "us[140]", targetid, message)) 
    	return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /pm [playerid] [message]");

    if(PlayerInfo[playerid][pPMS] == 0)
    	return SendClientMessage(playerid, COLOR_ERROR, "You have turned off your private messages.");

    if(!IsPlayerConnected(targetid))
    	return SendClientMessage(playerid, COLOR_ERROR, "This player is not connected.");

	if(PlayerInfo[targetid][pPMS] == 0)
    	return SendClientMessage(playerid, COLOR_ERROR, "That player has disabled their private messages.");

    if(playerid == targetid)
    	return SendClientMessage(playerid, COLOR_ERROR, "You cannot PM youself.");

    if(strlen(message) < 1)
    	return SendClientMessage(playerid, COLOR_ERROR, "You need to type more than 1 character.");

    SendClientMessageEx(playerid, COLOR_SENDPM, "PM to %s (%d): %s", GetPlayerNameEx(targetid), targetid, message);
    SendClientMessageEx(targetid, COLOR_RECIVEPM, "PM from %s (%d): %s", GetPlayerNameEx(playerid), playerid, message);
    return true;
}

CMD:pms(playerid, params[])
{
	if(PlayerInfo[playerid][pPMS] == 0)
    {
        PlayerInfo[playerid][pPMS] = 1;
        SendClientMessage(playerid, COLOR_BLUE, "Your private messages have been toggled on.");
    }
    else if(PlayerInfo[playerid][pPMS] == 1)
    {
        PlayerInfo[playerid][pPMS] = 0;
        SendClientMessage(playerid, COLOR_BLUE, "Your private messages have been toggled off.");
    }	
	return 1;
}