#include <YSI_Coding\y_hooks>

/*

S A V L I N E - R P G
functions.pwn
contains functions and stocks

*/

forward SetPlayerState(playerid);
public SetPlayerState(playerid)
{
	if(PlayerInfo[playerid][pAdminDuty] == true) return SetPlayerColor(playerid, COLOR_RED);
	else SetPlayerColor(playerid, COLOR_WHITE);
	return 1;
}

IsPlayerInRangeOfPlayer(playerid, targetid, Float:radius)
{
	new
	    Float:x,
	    Float:y,
	    Float:z;
	GetPlayerPos(targetid, x, y, z);
	if(IsPlayerInRangeOfPoint(playerid, radius, x, y, z) && GetPlayerInterior(playerid) == GetPlayerInterior(targetid) && GetPlayerVirtualWorld(playerid) == GetPlayerVirtualWorld(targetid))
	{
	    return 1;
	}
	return 0;
}

PlayProximitySound(playerid, Float:radius, soundid)
{
	foreach(new i : Player)
	{
	    if(IsPlayerInRangeOfPlayer(i, playerid, radius))
	    {
	    	PlayerPlaySound(i, soundid, 0.0, 0.0, 0.0);
		}
	}
	return 1;
}

GetPlayerNameEx(playerid)
{
	new name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, sizeof(name));
	return name;
}

GetPlayerIpEx(playerid)
{
	new ip[20];
	GetPlayerIp(playerid, ip, sizeof(ip));
	return ip;
}

GetRoleplayName(playerid, bool:staffcolor = false) // going to add MASK DETECT once they have been added ig.
{
	new output[MAX_PLAYER_NAME + 10];
	new name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, sizeof(name));

	if(staffcolor == true)
	{
		if(PlayerInfo[playerid][pStaff] == 1 && PlayerInfo[playerid][pAdminDuty] == true)
		{
			format(output, sizeof(output), "{81D975}%s", name);
			return output;
		}
		if(PlayerInfo[playerid][pStaff] >= 2  && PlayerInfo[playerid][pAdminDuty] == true)
		{
			format(output, sizeof(output), "{FF0000}%s", name);
			return output;
		}
	}

	format(output, sizeof(output), "%s", name);

	return output;
}

forward KickPlayer(playerid);
public KickPlayer(playerid)
{
	if(!PlayerInfo[playerid][pKicked])
	{
	    PlayerInfo[playerid][pKicked] = 1;
	    SetTimerEx("KickPlayer", 500, false, "i", playerid);
	}
	else
	{
	    PlayerInfo[playerid][pKicked] = 0;
	    Kick(playerid);
	}
}

PreventFall(playerid, time = 1500)
{
	TogglePlayerControllable(playerid, 0);
	SetTimerEx("FreezeTimer", time, false, "i", playerid);
}

forward FreezeTimer(playerid);
public FreezeTimer(playerid)
{
	TogglePlayerControllable(playerid, 1);
    return 1;
}

TeleportToCoords(playerid, Float:x, Float:y, Float:z, Float:angle, interiorid, worldid, bool:vehicle = true)
{
	new vehicleid = GetPlayerVehicleID(playerid);

	if((vehicle) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
	    foreach(new i : Player)
	    {
	        if(IsPlayerInVehicle(i, vehicleid))
	        {
	            SetPlayerInterior(i, interiorid);
	            SetPlayerVirtualWorld(i, worldid);
			}
	    }

        SetVehiclePos(vehicleid, x, y, z);
     	SetVehicleZAngle(vehicleid, angle);
	    SetVehicleVirtualWorld(vehicleid, worldid);
	    LinkVehicleToInterior(vehicleid, interiorid);
	}
	else
	{
	    SetPlayerPos(playerid, x, y, z);
	    SetPlayerFacingAngle(playerid, angle);
		SetPlayerInterior(playerid, interiorid);
		SetPlayerVirtualWorld(playerid, worldid);
		SetCameraBehindPlayer(playerid);
		PreventFall(playerid);
	}
}

TeleportToVehicle(playerid, vehicleid)
{
	new
	    Float:x,
	    Float:y,
	    Float:z,
		Float:a;

	GetVehiclePos(vehicleid, x, y, z);
	GetVehicleZAngle(vehicleid, a);

	TeleportToCoords(playerid, x + 1, y + 1, z + 1, a, 0, GetVehicleVirtualWorld(vehicleid));
}

TeleportToPlayer(playerid, targetid)
{
    new
        Float:ux,
        Float:uy,
        Float:uz,
        Float:ua;
    GetPlayerPos(targetid, ux, uy, uz);
    GetPlayerFacingAngle(targetid, ua);
    TeleportToCoords(playerid, ux + 1, uy + 1, uz, ua, GetPlayerInterior(targetid), GetPlayerVirtualWorld(targetid));
}

stock SRP_RandomMinMax(min, max){
	assert(min < max);
	return YSI_Random(max - min) + min;
}

FormatNumber(number, money = 1)
{
	new length, value[32];

	format(value, sizeof(value), "%i", (number < 0) ? (-number) : (number));

	length = strlen(value);

    if(length > 3)
	{
  		for(new l = 0, i = length; --i >= 0; l ++)
		{
		    if((l % 3 == 0) && l > 0)
		    {
				strins(value, ",", i + 1);
			}
		}
	}

	if(money)
		strins(value, "$", 0);
	if(number < 0)
		strins(value, "-", 0);

	return value;
}

forward OnVPNCheck(playerid, response_code, data[]);
public OnVPNCheck(playerid, response_code, data[])
{
	if(response_code == 200)
	{
		if(data[0] == 'Y')
		{
			PlayerInfo[playerid][pVPN] = true;
			SendAdminMessage(COLOR_ANTICHEAT,"{FF0000}[WARNING]{E4CA78} %s (%i) is possibly using a VPN.", GetPlayerNameEx(playerid), playerid);
		}
	}
	else
	{
		SendAdminMessage(COLOR_ANTICHEAT, "{FF0000}[WARNING]{E4CA78} VPN Detection service has failed.");
	}
	return 1;
}