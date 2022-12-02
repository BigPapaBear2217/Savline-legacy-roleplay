#include <YSI_Coding\y_hooks>

/*

S A V L I N E - R P G
chat.pwn
contains anything related to chatting within the server

*/


public OnPlayerText(playerid, text[])
{
	if(!PlayerInfo[playerid][pLoggedIn])
	{
		SendClientMessage(playerid, COLOR_ERROR, "You are not logged in.");
		return 0;
	}


	if(text[0] == '=')
  	{
  		new slot = strcount(text, "=");

		new command[300];
		new newtext[300];
		format(newtext, sizeof(newtext), "%s", text);
		strreplace(newtext, "=", "");

		format(command, sizeof(command), "%i %s", slot, newtext);
		cmd_wt(playerid, command);
		return 0;
	}
	if(pPhoneCall[playerid][OnCall])
	{
		if(pPhone[playerid][Speaker])
		{
			SendProximityMessage(playerid, 20.0, COLOR_LOCAL, "Phone"COL_LOCAL" Speaker: %s", text);
		}
		else
		{
			SendClientMessageEx(playerid, COLOR_LOCAL, "You says: %s", text);
		}

		foreach(new i : Player)
		{
			if(pPhone[i][Number] == pPhoneCall[playerid][OnCall])
			{
				SendClientMessageEx(i, COLOR_LOCAL, "(%d) says: %s", pPhoneCall[i][OnCall], text);
			}
		}
		return 0;
	}

	if(PlayerInfo[playerid][pChatmode] == 0)
	{
		if(publicChat == 1) return SendClientMessage(playerid, COLOR_ERROR, "Public chat has been disabled by a admin.");
		SendClientMessageToAllEx(COLOR_WHITE, "{%06x}%s (%d):{FFFFFF} %s", GetPlayerColor(playerid) >>> 8, GetPlayerNameEx(playerid), playerid, text);
	}
	if(PlayerInfo[playerid][pChatmode] == 1)
	{
		if(PlayerInfo[playerid][pAccent] > 0)
		{
			SendProximityMessage(playerid, 20.0, COLOR_LOCAL, "%s"COL_LOCAL" says [%s accent]: %s", GetRoleplayName(playerid, true), GetPlayerAccent(playerid), text);
		}
		else
			SendProximityMessage(playerid, 20.0, COLOR_LOCAL, "%s"COL_LOCAL" says: %s", GetRoleplayName(playerid, true), text);
	}
	return 0;
}

CMD:chatmode(playerid, params[])
{
	new query[100];
	if(!strcmp(params, "public", true))
	{
		mysql_format(handle, query, sizeof(query), "UPDATE users SET Chatmode = 0 WHERE Master_ID = %i", PlayerInfo[playerid][pMasterID]);
		mysql_tquery(handle, query);
    	PlayerInfo[playerid][pChatmode] = 0;
    	SendClientMessage(playerid, COLOR_BLUE, "Your chatmode has been set to public");
	}
	else if(!strcmp(params, "local", true))
	{
		mysql_format(handle, query, sizeof(query), "UPDATE users SET Chatmode = 1 WHERE Master_ID = %i", PlayerInfo[playerid][pMasterID]);
		mysql_tquery(handle, query);
    	PlayerInfo[playerid][pChatmode] = 1;
    	SendClientMessage(playerid, COLOR_BLUE, "Your chatmode has been set to local");
	}
	else
	{
   		SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /chatmode [public|local]");
	}
	return 1;
}

CMD:l(playerid, params[])
{
	if(isnull(params))
	{
	    return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /l [text]");
	}

	if(PlayerInfo[playerid][pAccent] > 0)
	{
		return SendProximityMessage(playerid, 20.0, COLOR_LOCAL, "%s"COL_LOCAL" says [%s accent]: %s", GetRoleplayName(playerid, true), GetPlayerAccent(playerid), params);
	}

	SendProximityMessage(playerid, 20.0, COLOR_LOCAL, "%s"COL_LOCAL" says: %s", GetRoleplayName(playerid, true), params);
	return 1;
}

CMD:s(playerid, params[])
{
	if(isnull(params))
	{
	    return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /s [shout]");
	}

	if(PlayerInfo[playerid][pAccent] > 0)
	{
		return SendProximityMessage(playerid, 25.0, COLOR_LOCAL, "%s"COL_LOCAL" shouts [%s accent]: %s", GetRoleplayName(playerid, true), GetPlayerAccent(playerid), params);
	}

	SendProximityMessage(playerid, 25.0, COLOR_LOCAL, "%s"COL_LOCAL" shouts: %s", GetRoleplayName(playerid, true), params);
	return 1;
}

CMD:b(playerid, params[])
{
	if(isnull(params))
	{
	    return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /b [text]");
	}

	SendProximityMessage(playerid, 20.0, COLOR_OOC, "(( %s"COL_OOC": %s ))", GetRoleplayName(playerid, true), params);
	return 1;
}

CMD:me(playerid, params[])
{
	if(isnull(params))
	{
	    return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /me [action]");
	}

	SendProximityMessage(playerid, 20.0, COLOR_OOC, "* %s"COL_OOC" %s", GetRoleplayName(playerid, true), params);
	return 1;
}

CMD:do(playerid, params[])
{
	if(isnull(params))
	{
	    return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /do [action]");
	}

	SendProximityMessage(playerid, 20.0, COLOR_OOC, "* %s (( %s"COL_OOC" ))", params, GetRoleplayName(playerid, true));
	return 1;
}

CMD:p(playerid, params[])
{	
	if(publicChat == 1) return SendClientMessage(playerid, COLOR_ERROR, "Public chat has been disabled by a admin.");

	if(isnull(params))
	{
	    return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /p [text]");
	}

	SendClientMessageToAllEx(COLOR_WHITE, "{%06x}%s (%d){FFFFFF}: %s", GetPlayerColor(playerid) >>> 8, GetPlayerNameEx(playerid), playerid, params);
	return 1;
}

CMD:ask(playerid, params[])
{
	if(askChat == 1) return SendClientMessage(playerid, COLOR_ERROR, "Ask chat has been disabled by an admin");

	if(isnull(params))
	{
	    return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /ask [question]");
	}
	if(PlayerInfo[playerid][pStaff] >= 1)
	{
		SendClientMessageToAllEx(COLOR_PURPLE, "[Ask] %s %s (%i){FFFFFF}: %s", GetStaffRank(PlayerInfo[playerid][pStaff]), GetPlayerNameEx(playerid), playerid, params);
	}
	else
	{
		SendClientMessageToAllEx(COLOR_PURPLE, "[Ask] %s (%i){FFFFFF}: %s", GetPlayerNameEx(playerid), playerid, params);
	}
	return 1;
}

SendClientMessageEx(playerid, color, const text[], {Float,_}:...)
{
	static
  	    args,
	    str[192];
	if((args = numargs()) <= 3)
	{
	    SendClientMessage(playerid, color, text);
	}
	else
	{
		while(--args >= 3)
		{
			#emit LCTRL 	5
			#emit LOAD.alt 	args
			#emit SHL.C.alt 2
			#emit ADD.C 	12
			#emit ADD
			#emit LOAD.I
			#emit PUSH.pri
		}
		#emit PUSH.S 	text
		#emit PUSH.C 	192
		#emit PUSH.C 	str
		#emit PUSH.S	8
		#emit SYSREQ.C 	format
		#emit LCTRL 	5
		#emit SCTRL 	4
		SendClientMessage(playerid, color, str);
		#emit RETN
	}
	return 1;
}

SendClientMessageToAllEx(color, const text[], {Float,_}:...)
{
	static
  	    args,
	    str[192];
	if((args = numargs()) <= 2)
	{
	    foreach(new i : Player)
	    {
	        if(PlayerInfo[i][pLoggedIn])
	        {
	    		SendClientMessage(i, color, text);
			}
		}
		//print(text);
	}
	else
	{
		while(--args >= 2)
		{
			#emit LCTRL 	5
			#emit LOAD.alt 	args
			#emit SHL.C.alt 2
			#emit ADD.C 	12
			#emit ADD
			#emit LOAD.I
			#emit PUSH.pri
		}
		#emit PUSH.S 		text
		#emit PUSH.C 		192
		#emit PUSH.C 		str
		#emit LOAD.S.pri 	8
		#emit ADD.C 		4
		#emit PUSH.pri
		#emit SYSREQ.C 		format
		#emit LCTRL 		5
		#emit SCTRL 		4
		foreach(new i : Player)
	    {
	        if(PlayerInfo[i][pLoggedIn])
	        {
	    		SendClientMessage(i, color, str);
			}
		}
		//print(str);
		#emit RETN
	}
	return 1;
}

SendProximityMessage(playerid, Float:radius, color, const text[], {Float,_}:...)
{
	static
  	    args,
	    str[192];
	if((args = numargs()) <= 4)
	{
	    foreach(new i : Player)
		{
	        if(IsPlayerInRangeOfPlayer(i, playerid, radius))
	        {
	            SendClientMessage(i, color, text);
			}
		}
	}
	else
	{
		while(--args >= 4)
		{
			#emit LCTRL 	5
			#emit LOAD.alt 	args
			#emit SHL.C.alt 2
			#emit ADD.C 	12
			#emit ADD
			#emit LOAD.I
			#emit PUSH.pri
		}
		#emit PUSH.S 		text
		#emit PUSH.C 		192
		#emit PUSH.C 		str
		#emit LOAD.S.pri    8
		#emit CONST.alt     4
		#emit SUB
		#emit PUSH.pri
		#emit SYSREQ.C 		format
		#emit LCTRL 		5
		#emit SCTRL 		4
		foreach(new i : Player)
		{
	        if(IsPlayerInRangeOfPlayer(i, playerid, radius))
	        {
	            SendClientMessage(i, color, str);
			}
		}
		#emit RETN
	}
	return 1;
}

SendHelperMessage(color, const text[], {Float,_}:...)
{
	static
  	    args,
	    str[192];
	if((args = numargs()) <= 2)
	{
	    foreach(new i : Player)
	    {
	        if(PlayerInfo[i][pLoggedIn] && PlayerInfo[i][pStaff] >= 1)
	        {
	    		SendClientMessage(i, color, text);
			}
		}
	}
	else
	{
		while(--args >= 2)
		{
			#emit LCTRL 	5
			#emit LOAD.alt 	args
			#emit SHL.C.alt 2
			#emit ADD.C 	12
			#emit ADD
			#emit LOAD.I
			#emit PUSH.pri
		}
		#emit PUSH.S 		text
		#emit PUSH.C 		192
		#emit PUSH.C 		str
		#emit LOAD.S.pri 	8
		#emit ADD.C 		4
		#emit PUSH.pri
		#emit SYSREQ.C 		format
		#emit LCTRL 		5
		#emit SCTRL 		4
		foreach(new i : Player)
	    {
	        if(PlayerInfo[i][pLoggedIn] && PlayerInfo[i][pStaff] >= 1)
	        {
	    		SendClientMessage(i, color, str);
			}
		}
		#emit RETN
	}
	return 1;
}

SendAdminMessage(color, const text[], {Float,_}:...)
{
	static
  	    args,
	    str[192];
	if((args = numargs()) <= 2)
	{
	    foreach(new i : Player)
	    {
	        if(PlayerInfo[i][pLoggedIn] && PlayerInfo[i][pStaff] >= 2)
	        {
	    		SendClientMessage(i, color, text);
			}
		}
	}
	else
	{
		while(--args >= 2)
		{
			#emit LCTRL 	5
			#emit LOAD.alt 	args
			#emit SHL.C.alt 2
			#emit ADD.C 	12
			#emit ADD
			#emit LOAD.I
			#emit PUSH.pri
		}
		#emit PUSH.S 		text
		#emit PUSH.C 		192
		#emit PUSH.C 		str
		#emit LOAD.S.pri 	8
		#emit ADD.C 		4
		#emit PUSH.pri
		#emit SYSREQ.C 		format
		#emit LCTRL 		5
		#emit SCTRL 		4
		foreach(new i : Player)
	    {
	        if(PlayerInfo[i][pLoggedIn] && PlayerInfo[i][pStaff] >= 2)
	        {
	    		SendClientMessage(i, color, str);
			}
		}
		#emit RETN
	}
	return 1;
}

stock GetPlayerAccent(playerid)
{
    return playerAccents[PlayerInfo[playerid][pAccent]];
}
