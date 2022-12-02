#include <YSI_Coding\y_hooks>

hook OnPlayerConnect(playerid)
{
	ResetPlayerInfo(playerid);
	
	new query[64];
	new pname[MAX_PLAYER_NAME];
	GetPlayerName(playerid, pname, sizeof(pname));
	printf("%s has connected and trying to loading his data.", ReturnPlayerName(playerid));

	PreloadAnimations(playerid, 2);

	mysql_format(handle, query, sizeof(query), "SELECT * FROM users WHERE Name = '%e';", pname);
	mysql_pquery(handle, query, "OnPlayerJoin", "d", playerid);

	new vpncheck[60];
	format(vpncheck, sizeof(vpncheck), "www.shroomery.org/ythan/proxycheck.php?ip=%s", GetPlayerIpEx(playerid));
	HTTP(playerid, HTTP_GET, vpncheck, "", "OnVPNCheck");

	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	printf("%s has disconnect and trying to saving his data.", ReturnPlayerName(playerid));
	if(PlayerInfo[playerid][pLoggedIn]){
		SavePlayerData(playerid);
	}
	PlayerInfo[playerid][pLoggedIn] = false;
	ResetPlayerInfo(playerid);
	return 1;
}

hook OnPlayerSpawn(playerid)
{
	SetPlayerHealth(playerid, 100);
	SetPlayerArmour(playerid, 0);

	if(PlayerInfo[playerid][pKnocked] == 1)
	{   
		PlayerInfo[playerid][pKnocked] = 2;
	    SetPlayerPos(playerid, 1177.6096, -1326.2389, 14.0792);
	}
	return 1;
}

hook OnPlayerDeath(playerid, killerid, reason)
{
	PlayerInfo[playerid][pKnocked] = 1;
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	new time = NetStats_GetConnectedTime(playerid);

	if((time - PlayerInfo[playerid][pLastPress]) >= 400)
	{
	    if(PRESSED(KEY_YES))
	    {
	        if(IsPlayerInAnyVehicle(playerid))
	        {
	            return cmd_engine(playerid, "\1");
	        }
	    }
		else if(PRESSED(KEY_CTRL_BACK))
		{
			print("H has pressed!");
			if((EnterCheck(playerid)) == 0)
				ExitCheck(playerid);
		}

		PlayerInfo[playerid][pLastPress] = time; // Prevents spamming. Sometimes keys get messed up and register twice.
	}
    return 1;
}

public OnPlayerDamage(&playerid, &Float:amount, &issuerid, &weapon, &bodypart)
{
	////////////////////////////////////////////////////////////////////////////////////
	// array 0 == health ; array 1 == armour;
	new Float:ahp[2];

	GetPlayerHealth(playerid, ahp[0]);
	GetPlayerArmour(playerid, ahp[1]);

	new healthstr[4];
	format(healthstr, sizeof(healthstr), "%i",  floatround(ahp[0], floatround_ceil));
	PlayerTextDrawSetString(playerid, savline_text_health[playerid], healthstr);

	new armourstr[4];
	format(armourstr, sizeof(armourstr), "%i", floatround(ahp[1], floatround_ceil));
	PlayerTextDrawSetString(playerid, savline_text_armour[playerid], armourstr);
	////////////////////////////////////////////////////////////////////////////////////

	if(PlayerInfo[playerid][pAdminDuty])
	{
		return 0; // do not damage players on staff duties
	}

	return 1;
}