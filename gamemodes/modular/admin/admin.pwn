#include <YSI_Coding\y_hooks>

/*

S A V L I N E - R P G
admin.pwn

*/


// ---------- ADMIN COMMANDS ----------

CMD:ho(playerid, params[])
{
	if(PlayerInfo[playerid][pStaff] != 1) return 0;

	if(isnull(params))
	{
	    return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /ho [text] (Sends the given text as a msg from Helper)");
	}
	
	SendClientMessageToAllEx(COLOR_HELPER, "(( %s %s{FFFFFF}: %s {8FDA3E}))", GetStaffRank(PlayerInfo[playerid][pStaff]), GetPlayerNameEx(playerid), params);
	return 1;
}

CMD:ao(playerid, params[])
{
	if(PlayerInfo[playerid][pStaff] < 2) return 0;

	if(isnull(params))
	{
	    return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /ao [text] (Sends the given text as a msg from Admin)");
	}
	
	SendClientMessageToAllEx(COLOR_RED, "(( %s %s{FFFFFF}: %s {FF0000}))", GetStaffRank(PlayerInfo[playerid][pStaff]), GetPlayerNameEx(playerid), params);
	return 1;
}

CMD:a(playerid, params[])
{
	if(PlayerInfo[playerid][pStaff] < 2) return 0;

	if(isnull(params))
	{
	    return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /a [text] (Admin Chat)");
	}
	
	SendAdminMessage(0x33CCFFFF, "[A] %s %s{FFFFFF}: %s", GetStaffRank(PlayerInfo[playerid][pStaff]), GetPlayerNameEx(playerid), params);
	return 1;
}

CMD:e(playerid, params[])
{
	if(PlayerInfo[playerid][pStaff] < 1) return 0;

	if(isnull(params))
	{
	    return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /e [text] (Helper Chat)");
	}
	
	SendHelperMessage(0x9ACD32FF, "[H] %s %s{FFFFFF}: %s", GetStaffRank(PlayerInfo[playerid][pStaff]), GetPlayerNameEx(playerid), params);
	return 1;
}

CMD:togp(playerid, params[])
{
	if(PlayerInfo[playerid][pStaff] < 4) return 0;

	if(publicChat == 1)
	{
		publicChat = 0;
		SendClientMessageToAllEx(COLOR_ALERT, "AdmCmd: %s %s has turned on public chat.", GetStaffRank(PlayerInfo[playerid][pStaff]), GetPlayerNameEx(playerid));
		return 1;
	}
	
	publicChat = 1;
	SendClientMessageToAllEx(COLOR_ALERT, "AdmCmd: %s %s has turned off public chat.", GetStaffRank(PlayerInfo[playerid][pStaff]), GetPlayerNameEx(playerid));
	return 1;
}

CMD:togask(playerid, params[])
{
	if(PlayerInfo[playerid][pStaff] < 4) return 0;

	if(askChat == 1)
	{
		askChat = 0;
		SendClientMessageToAllEx(COLOR_ALERT, "AdmCmd: %s %s has turned on ask chat.", GetStaffRank(PlayerInfo[playerid][pStaff]), GetPlayerNameEx(playerid));
		return 1;
	}
	
	askChat = 1;
	SendClientMessageToAllEx(COLOR_ALERT, "AdmCmd: %s %s has turned off ask chat.", GetStaffRank(PlayerInfo[playerid][pStaff]), GetPlayerNameEx(playerid));
	return 1;
}

CMD:ah(playerid, params[]) return cmd_ahelp(playerid, params);
CMD:ahelp(playerid, params[])
{
	if(PlayerInfo[playerid][pStaff] < 1) return 0;

	new string[2048];
    if(PlayerInfo[playerid][pStaff] >= 1) 
	{
        strcat(string, "{31D14C}HELPER | {FFFFFF} /e /aduty /ah /aeject /ho /aping\n\n");

		if(PlayerInfo[playerid][pStaff] >= 2) 
		{
			strcat(string, "{31D14C}MODERATOR | {FFFFFF} /a /ao /goto /get /jetpack /country /freeze /unfreeze /kick /fv /fpv /warn /vpnlist /aport\n\n");
		}
		if(PlayerInfo[playerid][pStaff] >= 3) 
		{
			strcat(string, "{31D14C}ADMIN | {FFFFFF} /agroups /sethp /setap /setvw /setint /getcar /gotocar /ban\n\n");
		}
        if(PlayerInfo[playerid][pStaff] >= 4) 
		{
            strcat(string, "{31D14C}SENIOR ADMIN | {FFFFFF} /togp /togask /veh /gotocoords /asetskin /agroupinvite /agrouprank /agroupkick /gotoproperty\n\n");
		}
		if(PlayerInfo[playerid][pStaff] >= 5) 
		{
			strcat(string, "{31D14C}MANAGER | {FFFFFF} /makeadmin /agiveitem /acreategroup /createhouse /createentrance /edithouse /editentrance /deleteproperty\n\n");
		}
		if(PlayerInfo[playerid][pStaff] >= 6) 
		{
			strcat(string, "{31D14C}LEADER | {FFFFFF} TBA\n\n");
		}
		if(PlayerInfo[playerid][pStaff] >= 7) 
		{
		    strcat(string, "{31D14C}DIRECTOR | {FFFFFF} TBA\n\n");
		}
		if(PlayerInfo[playerid][pStaff] >= 7) 
		{
		    strcat(string, "{31D14C}OWNER | {FFFFFF} TBA");
		}

		ShowPlayerDialog(playerid, DIALOG_NONE, DIALOG_STYLE_MSGBOX, SERVER_NAME, string, "Close", "");
	}

	return 1;
}

CMD:asetskin(playerid, params[])
{
	if(PlayerInfo[playerid][pStaff] < 4) return 0;

	if(!PlayerInfo[playerid][pAdminDuty])
		return SendClientMessage(playerid, COLOR_ERROR, "You must be on admin duty!");

	new targetid, skinid;

	if(sscanf(params, "ui", targetid, skinid))
	{
		return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /asetskin [playerid] [skin id 1 - 311]");
	}

	if(targetid == INVALID_PLAYER_ID)
	{
		return SendClientMessage(playerid, COLOR_ERROR, "Invalid playerid.");
	}

    if(PlayerInfo[playerid][pStaff] < PlayerInfo[targetid][pStaff]) {
    	return SendClientMessage(playerid, COLOR_ERROR, "That player has a higher staff rank than you.");
    }

	if(skinid < 1 || skinid > 311)
	{
		return SendClientMessage(playerid, COLOR_ERROR, "Please select skin from 1 - 311");
	}

	SendClientMessageEx(playerid, COLOR_BLUE, "You have set %s skinid to %i", GetPlayerNameEx(targetid), skinid);
	SendClientMessageEx(targetid, COLOR_BLUE, "Your skin id has been set to %i by an admin.", skinid);

	SendAdminMessage(COLOR_ALERT, "ASETSKIN | %s has set %s skin id to %i", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid), skinid);

	SetPlayerSkin(targetid, skinid);
	PlayerInfo[targetid][pStoreSkin] = skinid;

	return 1;
}

CMD:aping(playerid, params[])
{
	if(PlayerInfo[playerid][pStaff] < 1) return 0;

	if(!PlayerInfo[playerid][pAdminDuty])
		return SendClientMessage(playerid, COLOR_ERROR, "You must be on admin duty!");

	new targetid;

	if(sscanf(params, "u", targetid))
	{
		SendClientMessageEx(playerid, COLOR_BLUE, "%'s ping is: %d", GetPlayerNameEx(targetid), GetPlayerPing(targetid));
		SendAdminMessage(COLOR_ALERT, "APING | %s has used APING on %s.", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid));
	}
	return 1;
}

CMD:spec(playerid, params[])
{
	if(PlayerInfo[playerid][pStaff] < 2) return 0;

	if(!PlayerInfo[playerid][pAdminDuty])
		return SendClientMessage(playerid, COLOR_ERROR, "You must be on admin duty!");

	new targetid;

	if(sscanf(params, "u", targetid))
	{
		return SendClientMessage(playerid, COLOR_ERROR, "Usage: /spec [playerid]");
	}	

	if(targetid == INVALID_PLAYER_ID)
	{
		return SendClientMessage(playerid, COLOR_ERROR, "Invalid playerid.");
	}

    if(PlayerInfo[playerid][pStaff] < PlayerInfo[targetid][pStaff]) {
    	return SendClientMessage(playerid, COLOR_ERROR, "That player has a higher staff rank than you.");
    }

	if(targetid == playerid)
	{
		return SendClientMessage(playerid, COLOR_ERROR, "You cannot spectate yourself");
	}

	if(PlayerInfo[playerid][pSpecating] == true)
	{
		return SendClientMessage(playerid, COLOR_ERROR, "You are already spectating someone! (use /specoff to disable)");
	}

	SendClientMessage(playerid, COLOR_BLUE, "If you want to refresh the spectation, type /spec [same id]");
	SendClientMessage(playerid, COLOR_BLUE, "If you want to change players, type /spec [new id]");

	SendAdminMessage(COLOR_ALERT, "SPEC | %s(%i) started spec over %s(%i).", GetPlayerNameEx(playerid), playerid, GetPlayerNameEx(targetid), targetid);
	PlayerInfo[playerid][pSpecating] = true;


	if(IsPlayerInAnyVehicle(targetid))
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		TogglePlayerSpectating(playerid, 1);
		PlayerSpectateVehicle(playerid, vehicleid);
	}
	else
	{
		TogglePlayerSpectating(playerid, 1);
		PlayerSpectatePlayer(playerid, targetid);
		SetPlayerInterior(playerid, GetPlayerInterior(targetid));
		SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(targetid));
	}

	return 1;
}

CMD:specoff(playerid, params[])
{
	if(PlayerInfo[playerid][pStaff] < 2) return 0;

	if(PlayerInfo[playerid][pSpecating] == false)
	{
		return SendClientMessage(playerid, COLOR_ERROR, "You are not spectating anyone at the moment.");
	}

	PlayerInfo[playerid][pSpecating] = false;
	TogglePlayerSpectating(playerid, 0);
	SetPlayerInterior(playerid, 0);
	SetPlayerVirtualWorld(playerid, 0);
	SendAdminMessage(COLOR_ALERT, "SPECOFF | %s has stopped spectating.", GetPlayerNameEx(playerid));
	return 1;
}

CMD:warn(playerid, params[])
{
	if(PlayerInfo[playerid][pStaff] < 2) return 0;
	
	if(!PlayerInfo[playerid][pAdminDuty])
		return SendClientMessage(playerid, COLOR_ERROR, "You must be on admin duty!");
		
 	new targetid, reason[256];
	
	if(sscanf(params, "us[256]", targetid, reason))
	{
	    return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /warn [playerid] [reason]");
	}
	
 	if(targetid == INVALID_PLAYER_ID)
 	{
		return SendClientMessage(playerid, COLOR_ERROR, "Invalid player ID");
    }

    if(targetid == playerid)
    {
    	return SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command on yourself");
    }
    
    if(PlayerInfo[playerid][pStaff] < PlayerInfo[targetid][pStaff]) {
    	return SendClientMessage(playerid, COLOR_ERROR, "That player has a higher staff rank than you.");
    }

    SendClientMessageEx(playerid, COLOR_BLUE, "You have warned %s for: %s", GetPlayerNameEx(targetid), reason);
    SendClientMessageEx(targetid, COLOR_BLUE, "%s has warned you for: %s", GetPlayerNameEx(playerid), reason);
    SendClientMessageToAllEx(COLOR_ALERT, "AdmCmd: %s has been warned by %s. Reason: %s", GetPlayerNameEx(targetid), GetPlayerNameEx(playerid), reason);
    
    SendAdminMessage(COLOR_ALERT, "WARN | %s has warned %s for: %s", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid), reason);
    
    return 1;
}

CMD:setadmin(playerid, params[]) return cmd_makeadmin(playerid, params);
CMD:makeadmin(playerid, params[]){
    new targetid, rank;

    if(PlayerInfo[playerid][pStaff] < 5) return 0;

	if(sscanf(params, "ui", targetid, rank))
	{
    	return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /makeadmin [playerid] [rank]");
	}

    if(targetid == INVALID_PLAYER_ID) {
        return SendClientMessage(playerid, COLOR_ERROR, "Invalid player ID");
    }

    if(rank < 0 || rank >= 9) {
        return SendClientMessage(playerid, COLOR_ERROR, "Invalid admin rank");
    }

    if(PlayerInfo[playerid][pStaff] <= rank) {
    	return SendClientMessage(playerid, COLOR_ERROR, "You are not allowed to give someone a higher or equal rank");
    }

    if(targetid == playerid)
    {
    	return SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command on yourself");
    }

    if(rank == 0)
    {
	    PlayerInfo[targetid][pStaff] = rank;
	    SendClientMessageEx(playerid, COLOR_BLUE, "You have kicked %s from the staff team.", GetPlayerNameEx(targetid));
	    SendClientMessageEx(targetid, COLOR_BLUE, "%s has kicked you from the staff team.", GetPlayerNameEx(playerid));

	    new query[150];
	    mysql_format(handle, query, sizeof(query), "UPDATE users SET Staff = 0 WHERE Master_ID = %i;", PlayerInfo[targetid][pMasterID]);
	    mysql_tquery(handle, query);

	    if(PlayerInfo[targetid][pAdminDuty] == true) {
            PlayerInfo[targetid][pAdminDuty] = false;

            if(PlayerInfo[targetid][pStaff] == 1) {
				SetPlayerState(targetid);
				TextDrawHideForPlayer(targetid, savline_hdutyTD);
            }
            else {
                SetPlayerState(targetid);
                TextDrawHideForPlayer(targetid, savline_adutyTD);
            }
        }


	    SendAdminMessage(COLOR_ALERT, "SETADMIN | %s has removed the staff position from %s", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid));
    	return 1;
    }

    PlayerInfo[targetid][pStaff] = rank;
    SendClientMessageEx(playerid, COLOR_BLUE, "You have made %s a(n) %s", GetPlayerNameEx(targetid), GetStaffRank(rank));
    SendClientMessageEx(targetid, COLOR_BLUE, "%s has made you a(n) %s", GetPlayerNameEx(playerid), GetStaffRank(rank));

    new query[150];
    mysql_format(handle, query, sizeof(query), "UPDATE users SET Staff = %i WHERE Master_ID = %i;", PlayerInfo[targetid][pStaff], PlayerInfo[targetid][pMasterID]);
    mysql_tquery(handle, query);

    SendAdminMessage(COLOR_ALERT, "SETADMIN | %s has set %s as a %s", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid), GetStaffRank(rank));
    return 1;
}

CMD:aduty(playerid, params[]){
    if(PlayerInfo[playerid][pStaff] >= 1){
        if(PlayerInfo[playerid][pAdminDuty] == false) {
            PlayerInfo[playerid][pAdminDuty] = true;

            if(PlayerInfo[playerid][pStaff] == 1) {
                SetPlayerColor(playerid, COLOR_HELPER);
                SendClientMessage(playerid, COLOR_BLUE, "You are now on helper duty");

                TextDrawShowForPlayer(playerid, savline_hdutyTD);
                SendAdminMessage(COLOR_ALERT, "HDUTY | %s is now on helper duty", GetPlayerNameEx(playerid));
                return 1;
            }

            else {
                SetPlayerColor(playerid, COLOR_RED);
                SendClientMessage(playerid, COLOR_BLUE, "You are now on admin duty");

                TextDrawShowForPlayer(playerid, savline_adutyTD);
                SendAdminMessage(COLOR_ALERT, "ADUTY | %s is now on admin duty", GetPlayerNameEx(playerid));
                return 1;
            }
        }
        else if(PlayerInfo[playerid][pAdminDuty] == true) {
            PlayerInfo[playerid][pAdminDuty] = false;

            if(PlayerInfo[playerid][pStaff] == 1) {
                SendClientMessage(playerid, COLOR_BLUE, "You are now off helper duty");
				SetPlayerState(playerid);
				TextDrawHideForPlayer(playerid, savline_hdutyTD);

                SendAdminMessage(COLOR_ALERT, "HDUTY | %s is now off helper duty", GetPlayerNameEx(playerid));
                return 1;
            }

            else {
                SendClientMessage(playerid, COLOR_BLUE, "You are now off admin duty");
                SetPlayerState(playerid);
                TextDrawHideForPlayer(playerid, savline_adutyTD);

                SendAdminMessage(COLOR_ALERT, "ADUTY | %s is now off admin duty", GetPlayerNameEx(playerid));
                return 1;
            }
        }
    }
    return 0;
}

CMD:goto(playerid, params[])
{
    if(PlayerInfo[playerid][pStaff] < 2) return 0;

	if(!PlayerInfo[playerid][pAdminDuty])
		return SendClientMessage(playerid, COLOR_ERROR, "You must be on admin duty!");

	new targetid;
    if(sscanf(params, "u", targetid))
    {
        return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /goto [playerid]");
    }

	if(targetid == INVALID_PLAYER_ID) {
		return SendClientMessage(playerid, COLOR_ERROR, "Invalid playerid.");
	}

    TeleportToPlayer(playerid, targetid);
    SendAdminMessage(COLOR_ALERT, "GOTO | %s has teleported to %s", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid));
    return 1;
}

CMD:aport(playerid, params[])
{
    if(PlayerInfo[playerid][pStaff] < 2) return 0;

	if(!PlayerInfo[playerid][pAdminDuty])
		return SendClientMessage(playerid, COLOR_ERROR, "You must be on admin duty!");

	ShowPlayerDialog(playerid, DIALOG_APORT, DIALOG_STYLE_LIST, SERVER_NAME, "Important locations\nInteriors\nJobs", "Select", "Close");
	return 1;
}

CMD:fv(playerid, params[])
{
	if(PlayerInfo[playerid][pStaff] < 2) return 0;

	if(!PlayerInfo[playerid][pAdminDuty])
		return SendClientMessage(playerid, COLOR_ERROR, "You must be on admin duty!");
		
    if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_ERROR, "You are not in a vehicle!");
		
 	new Float:Angle;
	
 	GetVehicleZAngle(GetPlayerVehicleID(playerid), Angle);
	SetVehicleZAngle(GetPlayerVehicleID(playerid), Angle);

	RepairVehicle(GetPlayerVehicleID(playerid));

	SendClientMessageEx(playerid, COLOR_BLUE, "You have fixed your own vehicle.");
	SendAdminMessage(COLOR_ALERT, "FIXVEH | %s has fixed their own vehicle.", GetPlayerNameEx(playerid));
	
	return 1;
}

CMD:fpv(playerid, params[])
{
	if(PlayerInfo[playerid][pStaff] < 2) return 0;

	if(!PlayerInfo[playerid][pAdminDuty])
		return SendClientMessage(playerid, COLOR_ERROR, "You must be on admin duty!");
		
 	new targetid;
		
	if(sscanf(params, "u", targetid))
	{
	    return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /fpv [playerid] (Fixes a user's vehicle)");
	}

    if(!IsPlayerInAnyVehicle(targetid)) return SendClientMessage(playerid, COLOR_ERROR, "That player is not in a vehicle!");

 	new Float:Angle;
	
 	GetVehicleZAngle(GetPlayerVehicleID(targetid), Angle);
	SetVehicleZAngle(GetPlayerVehicleID(targetid), Angle);

	RepairVehicle(GetPlayerVehicleID(targetid));

	SendClientMessageEx(playerid, COLOR_BLUE, "You have fixed %'s vehicle.", GetPlayerNameEx(targetid));
	SendClientMessageEx(targetid, COLOR_BLUE, "%s has fixed your vehicle.", GetPlayerNameEx(playerid));
	SendAdminMessage(COLOR_ALERT, "FPV | %s has fixed %'s vehicle.", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid));
	return 1;
}

CMD:vehinfo(playerid, params[])
{
	if(PlayerInfo[playerid][pStaff] < 2) return 0;

	if(!PlayerInfo[playerid][pAdminDuty])
		return SendClientMessage(playerid, COLOR_ERROR, "You must be on admin duty!");
		
	new targetid, Float:vehHealth;
	new vID = GetPlayerVehicleID(targetid);
	GetVehicleHealth(targetid, vehHealth);
	
	if(sscanf(params, "u", targetid))
	{
	    return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /vehinfo [playerid] (Grabs information from the player's vehicle)");
	}
	
	if(!IsPlayerInAnyVehicle(targetid)) return SendClientMessage(playerid, COLOR_ERROR, "That player is not in a vehicle.");
	
	SendAdminMessage(COLOR_ALERT, "VEHINFO | %s has checked %'s vehicle information.", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid));

	SendClientMessageEx(playerid, COLOR_ALERT, "%s's Vehicle Information | Vehicle Health: %f | Vehicle ID: %d", GetPlayerNameEx(targetid), vehHealth, vID);
	
	return 1;
}

CMD:vpnlist(playerid, params[]) 
{
	if(PlayerInfo[playerid][pStaff] < 2) return 0;

	new string[280];
	new vpncount;
	vpncount = 0;
	foreach(new i : Player) 
	{
	    if(PlayerInfo[playerid][pVPN]) 
		{
			vpncount++;
	        format(string, sizeof(string), "{FFFFFF}%s\n", GetPlayerNameEx(playerid));
			strcat(string, string);
	    }
	}
	if(vpncount == 0) return SendClientMessage(playerid, COLOR_ERROR, "There are no online players using a VPN");
	ShowPlayerDialog(playerid, DIALOG_NONE, DIALOG_STYLE_MSGBOX, SERVER_NAME, string, "Close", "");
	return 1;
}

CMD:kick(playerid, params[])
{
    if(PlayerInfo[playerid][pStaff] < 2) return 0;

	if(!PlayerInfo[playerid][pAdminDuty])
		return SendClientMessage(playerid, COLOR_ERROR, "You must be on admin duty!");

	new targetid, reason[256];
    if(sscanf(params, "us[256]", targetid, reason))
    {
        return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /kick [playerid] [reason]");
    }

	if(targetid == INVALID_PLAYER_ID) {
		return SendClientMessage(playerid, COLOR_ERROR, "Invalid playerid.");
	}

	if(targetid == playerid)
    {
    	return SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command on yourself");
    }

    if(PlayerInfo[playerid][pStaff] < PlayerInfo[targetid][pStaff]) {
    	return SendClientMessage(playerid, COLOR_ERROR, "That player has a higher staff rank than you.");
    }

	SendClientMessageEx(targetid, COLOR_ERROR, "%s has kicked you for %s", GetPlayerNameEx(playerid), reason);
	SendClientMessageToAllEx(COLOR_ALERT, "AdmCmd: %s has been kicked by %s. Reason: %s", GetPlayerNameEx(targetid), GetPlayerNameEx(playerid), reason);

    KickPlayer(targetid);
    SendAdminMessage(COLOR_ALERT, "KICK | %s has kicked %s for: %s", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid), reason);
    return 1;
}

CMD:ban(playerid, params[])
{
    if(PlayerInfo[playerid][pStaff] < 3) return 0;

	if(!PlayerInfo[playerid][pAdminDuty])
		return SendClientMessage(playerid, COLOR_ERROR, "You must be on admin duty!");

	new targetid, reason[256];
    if(sscanf(params, "us[256]", targetid, reason))
    {
        return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /ban [playerid] [reason]");
    }

	if(targetid == INVALID_PLAYER_ID) {
		return SendClientMessage(playerid, COLOR_ERROR, "Invalid playerid.");
	}

	if(targetid == playerid)
    {
    	return SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command on yourself");
    }

    if(PlayerInfo[playerid][pStaff] < PlayerInfo[targetid][pStaff]) {
    	return SendClientMessage(playerid, COLOR_ERROR, "That player has a higher staff rank than you.");
    }

	SendClientMessageEx(targetid, COLOR_ERROR, "%s has banned you for %s", GetPlayerNameEx(playerid), reason);
	SendClientMessageToAllEx(COLOR_ALERT, "AdmCmd: %s has been banned by %s. Reason: %s", GetPlayerNameEx(targetid), GetPlayerNameEx(playerid), reason);

	new query[256];
	mysql_format(handle, query, sizeof(query), "INSERT INTO bans (bannedId, adminId, reason, ip) VALUES (%i, %i, '%e', '%e')", PlayerInfo[targetid][pMasterID], PlayerInfo[playerid][pMasterID], reason, GetPlayerIpEx(targetid));
	mysql_tquery(handle, query);

    KickPlayer(targetid);
    SendAdminMessage(COLOR_ALERT, "BAN | %s has banned %s for: %s", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid), reason);
    return 1;
}


CMD:gethere(playerid, params[]) return cmd_get(playerid, params);
CMD:get(playerid, params[])
{
    if(PlayerInfo[playerid][pStaff] < 2) return 0;

	if(!PlayerInfo[playerid][pAdminDuty])
		return SendClientMessage(playerid, COLOR_ERROR, "You must be on admin duty!");

    new targetid;
    if(sscanf(params, "u", targetid))
    {
        return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /get [playerid]");
    }

	if(targetid == INVALID_PLAYER_ID) {
		return SendClientMessage(playerid, COLOR_ERROR, "Invalid playerid.");
	}

	if(targetid == playerid)
    {
    	return SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command on yourself");
    }

    if(PlayerInfo[playerid][pStaff] < PlayerInfo[targetid][pStaff]) {
    	return SendClientMessage(playerid, COLOR_ERROR, "You are not allowed to get a player with a higher rank.");
    }

    TeleportToPlayer(targetid, playerid);
    SendAdminMessage(COLOR_ALERT, "GETHERE | %s has teleported %s to their position.", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid));
    return 1;
}

CMD:sethp(playerid, params[])
{
    if(PlayerInfo[playerid][pStaff] < 3) return 0;

	if(!PlayerInfo[playerid][pAdminDuty])
		return SendClientMessage(playerid, COLOR_ERROR, "You must be on admin duty!");

	new targetid, Float:Health;
    if(sscanf(params, "uf", targetid, Health))
    {
        return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /sethp [playerid] [hp]");
    }

	if(targetid == INVALID_PLAYER_ID) {
		return SendClientMessage(playerid, COLOR_ERROR, "Invalid playerid.");
	}

	SetPlayerHealth(targetid, Health);

    SendAdminMessage(COLOR_ALERT, "SETHEALTH | %s has set %s's health to: %f", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid), Health);
    return 1;
}

CMD:setap(playerid, params[])
{
    if(PlayerInfo[playerid][pStaff] < 3) return 0;

	if(!PlayerInfo[playerid][pAdminDuty])
		return SendClientMessage(playerid, COLOR_ERROR, "You must be on admin duty!");

	new targetid, Float:Armor;
    if(sscanf(params, "uf", targetid, Armor))
    {
        return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /setap [playerid] [armor]");
    }

	if(targetid == INVALID_PLAYER_ID) {
		return SendClientMessage(playerid, COLOR_ERROR, "Invalid playerid.");
	}

	SetPlayerArmour(targetid, Armor);

    SendAdminMessage(COLOR_ALERT, "SETARMOR | %s has set %s's armor to: %f", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid), Armor);
    return 1;
}

CMD:aeject(playerid, params[])
{
    if(PlayerInfo[playerid][pStaff] < 1) return 0;

	if(!PlayerInfo[playerid][pAdminDuty])
		return SendClientMessage(playerid, COLOR_ERROR, "You must be on admin duty!");

	new targetid;
    if(sscanf(params, "u", targetid))
    {
        return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /aeject [playerid] (Ejects the user from their vehicle)");
    }

	if(targetid == INVALID_PLAYER_ID) {
		return SendClientMessage(playerid, COLOR_ERROR, "Invalid playerid.");
	}

	RemovePlayerFromVehicle(targetid);

	SendClientMessageEx(playerid, COLOR_BLUE, "You have ejected %s from their vehicle.", GetPlayerNameEx(targetid));
	SendClientMessageEx(targetid, COLOR_BLUE, "%s has ejected you from the vehicle.", GetPlayerNameEx(playerid));
    SendHelperMessage(COLOR_ALERT, "EJECT | %s has ejected %s from their vehicle.", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid));
    return 1;
}

CMD:gotocar(playerid, params[])
{
	new vehicleid;

    if(PlayerInfo[playerid][pStaff] < 3) return 0;

	if(!PlayerInfo[playerid][pAdminDuty])
		return SendClientMessage(playerid, COLOR_ERROR, "You must be on admin duty!");

	if(sscanf(params, "i", vehicleid))
	{
	    return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /gotocar [vehicleid]");
	}
	if(!IsValidVehicle(vehicleid))
	{
	    return SendClientMessage(playerid, COLOR_ERROR, "Invalid vehicle ID specified.");
	}

	TeleportToVehicle(playerid, vehicleid);
	SendClientMessageEx(playerid, COLOR_BLUE, "Teleported to vehicle ID %i.", vehicleid);
	return 1;
}

CMD:getcar(playerid, params[])
{
	new vehicleid, driverid;

    if(PlayerInfo[playerid][pStaff] < 3) return 0;

	if(!PlayerInfo[playerid][pAdminDuty])
		return SendClientMessage(playerid, COLOR_ERROR, "You must be on admin duty!");

	if(sscanf(params, "i", vehicleid))
	{
	    return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /getcar [vehicleid]");
	}
	if(!IsValidVehicle(vehicleid))
	{
	    return SendClientMessage(playerid, COLOR_GREY, "Invalid vehicle specified.");
	}
    if((driverid = GetVehicleDriver(vehicleid)) != INVALID_PLAYER_ID && PlayerInfo[driverid][pStaff] > PlayerInfo[playerid][pStaff])
	{
	    return SendClientMessage(playerid, COLOR_GREY, "You can't teleport the vehicle of an admin who has a higher admin level than you.");
	}

	new
	    Float:x,
	    Float:y,
	    Float:z;

	GetPlayerPos(playerid, x, y, z);
	SetVehiclePos(vehicleid, x + 1, y + 1, z + 2.0);

	SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
	LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));

	SendClientMessageEx(playerid, COLOR_BLUE, "Teleported vehicle ID %i to your position.", vehicleid);
	return 1;
}

CMD:gotocoords(playerid, params[])
{
	new Float:x, Float:y, Float:z, interiorid;

    if(PlayerInfo[playerid][pStaff] < 4) return 0;

	if(!PlayerInfo[playerid][pAdminDuty])
		return SendClientMessage(playerid, COLOR_ERROR, "You must be on admin duty!");

	if(sscanf(params, "fffI(0)", x, y, z, interiorid))
	{
	    return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /gotocoords [x] [y] [z] [int (optional)]");
	}

	SetPlayerPos(playerid, x, y, z);
	SetPlayerInterior(playerid, interiorid);
	return 1;
}

CMD:setvw(playerid, params[])
{
    if(PlayerInfo[playerid][pStaff] < 3) return 0;

	if(!PlayerInfo[playerid][pAdminDuty])
		return SendClientMessage(playerid, COLOR_ERROR, "You must be on admin duty!");

	new targetid, vw;
    if(sscanf(params, "ui", targetid, vw))
    {
        return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /setvw [playerid] [worldid]");
    }

	if(targetid == INVALID_PLAYER_ID) {
		return SendClientMessage(playerid, COLOR_ERROR, "Invalid playerid.");
	}

    if(PlayerInfo[playerid][pStaff] < PlayerInfo[targetid][pStaff]) {
    	return SendClientMessage(playerid, COLOR_ERROR, "That player has a higher staff rank than you.");
    }

    SetPlayerVirtualWorld(playerid, vw);
    SendClientMessageEx(targetid, COLOR_BLUE, "%s has set your virtual world to %i.", GetPlayerNameEx(playerid), vw);
    SendAdminMessage(COLOR_ALERT, "SETVW | %s has set %s virtual world to %i", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid), vw);
    return 1;
}

CMD:setint(playerid, params[])
{
    if(PlayerInfo[playerid][pStaff] < 3) return 0;

	if(!PlayerInfo[playerid][pAdminDuty])
		return SendClientMessage(playerid, COLOR_ERROR, "You must be on admin duty!");

	new targetid, int;
    if(sscanf(params, "ui", targetid, int))
    {
        return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /setint [playerid] [interior]");
    }

	if(targetid == INVALID_PLAYER_ID) {
		return SendClientMessage(playerid, COLOR_ERROR, "Invalid playerid.");
	}

    if(PlayerInfo[playerid][pStaff] < PlayerInfo[targetid][pStaff]) {
    	return SendClientMessage(playerid, COLOR_ERROR, "That player has a higher staff rank than you.");
    }

    SetPlayerInterior(playerid, int);
    SendClientMessageEx(targetid, COLOR_BLUE, "%s has set your interior to %i.", GetPlayerNameEx(playerid), int);
    SendAdminMessage(COLOR_ALERT, "SETINT | %s has set %s interior to %i", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid), int);
    return 1;
}


CMD:freeze(playerid, params[])
{
    if(PlayerInfo[playerid][pStaff] < 2) return 0;

	if(!PlayerInfo[playerid][pAdminDuty])
		return SendClientMessage(playerid, COLOR_ERROR, "You must be on admin duty!");

	new targetid;
    if(sscanf(params, "u", targetid))
    {
        return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /freeze [playerid]");
    }

	if(targetid == INVALID_PLAYER_ID) {
		return SendClientMessage(playerid, COLOR_ERROR, "Invalid playerid.");
	}

	if(targetid == playerid)
    {
    	return SendClientMessage(playerid, COLOR_ERROR, "You cannot use this command on yourself");
    }

    if(PlayerInfo[playerid][pStaff] < PlayerInfo[targetid][pStaff]) {
    	return SendClientMessage(playerid, COLOR_ERROR, "That player has a higher staff rank than you.");
    }

    TogglePlayerControllable(targetid, 0);
    PlayerInfo[targetid][pFreeze] = 1;
    SendClientMessageEx(targetid, COLOR_BLUE, "%s has frozen you.", GetPlayerNameEx(playerid));
    SendAdminMessage(COLOR_ALERT, "FREEZE | %s has frozen %s", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid));
    return 1;
}

CMD:unfreeze(playerid, params[])
{
    if(PlayerInfo[playerid][pStaff] < 2) return 0;

	if(!PlayerInfo[playerid][pAdminDuty])
		return SendClientMessage(playerid, COLOR_ERROR, "You must be on admin duty!");

	new targetid;
    if(sscanf(params, "u", targetid))
    {
        return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /unfreeze [playerid]");
    }

	if(targetid == INVALID_PLAYER_ID) {
		return SendClientMessage(playerid, COLOR_ERROR, "Invalid playerid.");
	}

    TogglePlayerControllable(targetid, 1);
    PlayerInfo[targetid][pFreeze] = 0;
    SendClientMessageEx(targetid, COLOR_BLUE, "%s has unfrozen you.", GetPlayerNameEx(playerid));
    SendAdminMessage(COLOR_ALERT, "THAW | %s has unfrozen %s", GetPlayerNameEx(playerid), GetPlayerNameEx(targetid));
    return 1;
}

CMD:jetpack(playerid, params[])
{
    if(PlayerInfo[playerid][pStaff] < 2) return 0;

	if(!PlayerInfo[playerid][pAdminDuty])
	{
		return SendClientMessage(playerid, COLOR_ERROR, "You must be on admin duty!");
	}

	if(GetPlayerSpecialAction(playerid) == 2)
	{
		SendAdminMessage(COLOR_ALERT, "JETPACK | %s has removed his Jetpack.", GetPlayerNameEx(playerid));
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		return 1;
	}
 	SetPlayerSpecialAction(playerid, 2);

    SendAdminMessage(COLOR_ALERT, "JETPACK | %s has spawned a Jetpack.", GetPlayerNameEx(playerid));
    return 1;
}

CMD:country(playerid, params[])
{
    if(PlayerInfo[playerid][pStaff] < 2) return 0;

	new targetid;
    if(sscanf(params, "u", targetid))
    {
        return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /country [playerid] (Looks up the country of the user)");
    }

	if(targetid == INVALID_PLAYER_ID) {
		return SendClientMessage(playerid, COLOR_ERROR, "Invalid playerid.");
	}

	new country[45];
	GetPlayerCountry(targetid, country, sizeof(country));
    SendClientMessageEx(playerid, COLOR_BLUE, "%s is from %s.", GetPlayerNameEx(targetid), country);
    return 1;
}

CMD:veh(playerid, params[])
{
	if(PlayerInfo[playerid][pStaff] < 4) return 0;

	new model[20], modelid, color1, color2, Float:x, Float:y, Float:z, Float:a, vehicleid;
	if(!PlayerInfo[playerid][pAdminDuty] && PlayerInfo[playerid][pStaff] < 6)
	{
	    return SendClientMessage(playerid, COLOR_ERROR, "You must be on admin duty!");
	}
	if(sscanf(params, "s[20]I(-1)I(-1)", model, color1, color2))
	{
	    return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /veh [modelid/name] [color1 (optional)] [color2 (optional)]");
	}
	if((modelid = GetVehicleModelByName(model)) == 0)
	{
	    return SendClientMessage(playerid, COLOR_ERROR, "Invalid vehicle model.");
	}
	if(!(-1 <= color1 <= 255) || !(-1 <= color2 <= 255))
	{
	    return SendClientMessage(playerid, COLOR_ERROR, "Invalid color. Valid colors range from -1 to 255.");
	}

	GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, a);

	vehicleid = AddStaticVehicleEx(modelid, x, y, z, a, color1, color2, -1);

	if(vehicleid == INVALID_PLAYER_ID)
	{
	    return SendClientMessage(playerid, COLOR_GREY, "Cannot spawn vehicle. The vehicle pool is currently full.");
	}

	SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
	LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));

	PutPlayerInVehicle(playerid, vehicleid, 0);
	SendAdminMessage(COLOR_ALERT, "VEH | %s has spawned a %s", GetPlayerNameEx(playerid), GetVehicleName(vehicleid));
	return 1;
}

CMD:agroups(playerid, params[])
{
	new string[2080];
	for(new i = 0; i < MAX_GROUPS; i ++)
	{
		if(GroupInfo[i][gExists])
		{
			format(string, sizeof(string), "%s {FFFFFF}Group ID %i: {31D14C}[%s] %s\n", string, GroupInfo[i][gID], GroupInfo[i][gTag], GroupInfo[i][gName]);
		}
    }
	ShowPlayerDialog(playerid, DIALOG_NONE, DIALOG_STYLE_MSGBOX, SERVER_NAME, string, "Close", "");
	return 1;
}

CMD:acreategroup(playerid, params[])
{
	new tag[6], name[50], type = 0;
    if(PlayerInfo[playerid][pStaff] < 5) return 0;

	if(sscanf(params, "is[6]s[50]", type, tag, name))
	{
	    return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /acreategroup [type] [tag] [name]");
	}

	if(strlen(tag) > 6)
	{
		return SendClientMessage(playerid, COLOR_ERROR, "Group tag cannot be over 6 characters.");
	}

	if(strlen(name) > 49)
	{
		return SendClientMessage(playerid, COLOR_ERROR, "Group name cannot be over 50 characters.");
	}

   	SetupGroup(name, tag, type);

    SendAdminMessage(COLOR_ALERT, "GROUP | %s has created [%s] '%e'", GetPlayerNameEx(playerid), tag, name);
    SendClientMessageEx(playerid, COLOR_BLUE, "You have created [%s] %s.", tag, name);
    ReloadGroupsQuery();
	return 1;
}

CMD:agroupinvite(playerid, params[])
{
	new targetid, groupid;
	if(PlayerInfo[playerid][pStaff] < 4) return 0;

	if(sscanf(params, "iu", groupid, targetid))
	{
		return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /agroupinvite [groupid] [playerid]");
	}

	if(!DoesGroupExist(groupid))
		return SendClientMessage(playerid, COLOR_ERROR, "Invalid groupid.");

	if(targetid == INVALID_PLAYER_ID)
		return SendClientMessage(playerid, COLOR_ERROR, "Invalid playerid.");

	if(GetPlayerGroupSlot(targetid, groupid) != -1) return SendClientMessageEx(playerid, COLOR_ERROR, "That player is already in that group.");

	SetPlayerGroup(playerid, targetid, groupid);
	return 1;
}

CMD:agrouprank(playerid, params[])
{
	new targetid, tag[6], rank;
	if(PlayerInfo[playerid][pStaff] < 4) return 0;

	if(sscanf(params, "s[6]ui", tag, targetid, rank))
	{
		return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /agrouprank [tag] [playerid] [rank]");
	}

	if(targetid == INVALID_PLAYER_ID)
		return SendClientMessage(playerid, COLOR_ERROR, "Invalid playerid.");

	new slot = GetPlayerGroupSlotByTag(targetid, tag);

	if(slot == -1) return SendClientMessageEx(playerid, COLOR_ERROR, "That player is not in the group.");

	PlayerGroup[targetid][slot][gRank] = rank;

	SendClientMessageEx(playerid, COLOR_BLUE, "You have set %s rank to %s(%i)", GetPlayerNameEx(targetid), GetGroupRankName(PlayerGroup[targetid][slot][gId], rank), rank);
	SendClientMessageEx(targetid, COLOR_BLUE, "%s has set you as a [%s] %s(%i)", GetPlayerNameEx(playerid), GroupInfo[PlayerGroup[targetid][slot][gId]][gTag], GetGroupRankName(PlayerGroup[targetid][slot][gId], rank), rank);

	SendGroupMessage(PlayerGroup[targetid][slot][gId], COLOR_GROUP, "[%s] %s %s has changed the rank of %s to %s", GroupInfo[PlayerGroup[targetid][slot][gId]][gTag], GetStaffRank(PlayerInfo[playerid][pStaff]), GetPlayerNameEx(playerid), GetPlayerNameEx(targetid), GetPlayerRankName(targetid, PlayerGroup[targetid][slot][gId]));

    new query[180];
    mysql_format(handle, query, sizeof(query), "UPDATE group_members SET groupRank = %i WHERE groupId = %i AND Master_ID = %i", rank, GroupInfo[PlayerGroup[targetid][slot][gId]][gID], PlayerInfo[targetid][pMasterID]);
    mysql_tquery(handle, query);
	return 1;
}

CMD:agroupkick(playerid, params[])
{
	new targetid, tag[6];
	if(PlayerInfo[playerid][pStaff] < 4) return 0;

	if(sscanf(params, "s[6]u", tag, targetid))
	{
		return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /agroupkick [tag] [playerid]");
	}

	if(targetid == INVALID_PLAYER_ID)
		return SendClientMessage(playerid, COLOR_ERROR, "Invalid playerid.");

	new slot = GetPlayerGroupSlotByTag(targetid, tag);

	if(slot == -1) return SendClientMessageEx(playerid, COLOR_ERROR, "That player is not in the group.");

	SendClientMessageEx(playerid, COLOR_BLUE, "You have kicked %s %s from the %s", GetGroupRankName(PlayerGroup[targetid][slot][gId], PlayerGroup[targetid][slot][gRank]), GetPlayerNameEx(targetid), GroupInfo[PlayerGroup[targetid][slot][gId]][gName]);
	SendClientMessageEx(targetid, COLOR_BLUE, "[%s] %s has kicked you from the group", GroupInfo[PlayerGroup[targetid][slot][gId]][gTag], GetPlayerNameEx(playerid));

	SendGroupMessage(PlayerGroup[targetid][slot][gId], COLOR_GROUP, "[%s] %s %s has admin kicked %s from the group", GroupInfo[PlayerGroup[targetid][slot][gId]][gTag], GetStaffRank(PlayerInfo[playerid][pStaff]), GetPlayerNameEx(playerid), GetPlayerNameEx(targetid), GetPlayerRankName(targetid, PlayerGroup[targetid][slot][gId]));

    new query[180];
    mysql_format(handle, query, sizeof(query), "DELETE FROM `group_members` WHERE groupId = %i AND Master_ID = %i", GroupInfo[PlayerGroup[targetid][slot][gId]][gID], PlayerInfo[targetid][pMasterID]);
    mysql_tquery(handle, query);

	PlayerGroup[targetid][slot][gRank] = 0;
	PlayerGroup[targetid][slot][gId] = -1;

	return 1;
}

CMD:agiveitem(playerid, params[]) {
    new targetid, amount, itemParam[20];

    if(PlayerInfo[playerid][pStaff] <= 5) return 0;

	if(sscanf(params, "uis[20]", targetid, amount, itemParam))
	{
    	return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /agiveitem [playerid] [amount] [item]");
	}

	if(targetid == INVALID_PLAYER_ID) {
		return SendClientMessage(playerid, COLOR_ERROR, "Invalid playerid.");
	}

	if(amount <= 0) {
		return SendClientMessage(playerid, COLOR_ERROR, "Item amount should not be less than or equal to zero!");
	}

	new itemid = GetItemID(itemParam);
	if(itemid == -1)
	    return SendClientMessage(playerid, COLOR_ERROR, "Invalid item.");
	    
    GivePlayerItem(targetid, itemid, amount);
	new itemName[30];
	format(itemName, sizeof(itemName), "%s", ReturnItemName(itemid));
	SendClientMessageEx(targetid, COLOR_BLUE, "%s has just given you %s (%i quantity)", itemName, GetPlayerNameEx(playerid), amount);
	return SendAdminMessage(COLOR_ALERT, "AGIVE |  %s %s (%i) has given %s to %s (%i quantity)", GetStaffRank(PlayerInfo[playerid][pStaff]), GetPlayerNameEx(playerid), playerid, itemName, GetPlayerNameEx(targetid), amount);
}

// ------ ADMIN FUNCTIONS ------

stock GetStaffRank(rankid)
{
	new string[30];
	switch(rankid)
	{
		case 0:	string = "";
		case 1: string = "Helper";
		case 2: string = "Moderator";
		case 3: string = "Admin";
		case 4: string = "Senior Admin";
		case 5: string = "Manager";
		case 6: string = "Server Leader";
		case 7: string = "Director";
		case 8: string = "Owner";
		default: string = "Error";
	}
	return string;
}
