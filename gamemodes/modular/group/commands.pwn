CMD:groups(playerid, params[])
{
	new string[2080];
	for(new i = 0; i < MAX_GROUPS; i ++)
	{
		if(GroupInfo[i][gExists])
		{
			new color[10];
			if(GroupInfo[i][gOfficial]) color = "{31D14C}";
			else color = "{FFFFFF}";

			new officialstr[12];
			if(GroupInfo[i][gOfficial]) officialstr = "Official";
			else officialstr = "Unofficial";

			format(string, sizeof(string), "%s%s%s\t%s\t%s\t%s\t%s\n", string, color, GroupInfo[i][gName], GroupInfo[i][gTag], GetGroupType(i), officialstr);
		}
    }
	ShowPlayerDialog(playerid, DIALOG_NONE, DIALOG_STYLE_TABLIST, SERVER_NAME, string, "Close", "");
	return 1;
}

CMD:mygroups(playerid, params[])
{
	if(CountPlayerGroups(playerid) == 0)
		return SendClientMessage(playerid, COLOR_ERROR, "You are not in any groups");

	new string[1080];
	format(string, sizeof(string), "#\tName\tTag\tRank\n");
	for(new i = 0; i < MAX_GROUP_SLOTS; i ++)
	{
		if(PlayerGroup[playerid][i][gId] != 0)
		{
			new string2[128];
			format(string2, sizeof(string2), "%i\t%s\t%s\t%s\n", i, GroupInfo[PlayerGroup[playerid][i][gId]][gName], GroupInfo[PlayerGroup[playerid][i][gId]][gTag], GetGroupRankName(PlayerGroup[playerid][i][gId], PlayerGroup[playerid][i][gRank]));
			strcat(string, string2);
    	}
    }
	ShowPlayerDialog(playerid, DIALOG_NONE, DIALOG_STYLE_TABLIST_HEADERS, SERVER_NAME, string, "Close", "");
	return 1;
}

CMD:groupeditrank(playerid, params[])
{
	new tag[6];
	if(sscanf(params, "s[6]", tag))
	{
		return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /groupeditrank [tag]");
	}

	if(strlen(tag) > 6) return SendClientMessage(playerid, COLOR_ERROR, "Invalid group tag.");

	new slot = GetPlayerGroupSlotByTag(playerid, tag);
	if(slot == -1) return SendClientMessageEx(playerid, COLOR_ERROR, "You are not in that group");

	PlayerInfo[playerid][pEditingGroup] = PlayerGroup[playerid][slot][gId];

	new string[1084];
	for(new i = 1; i < 16; i ++)
	{
	    format(string, sizeof(string), "%s%i - %s\n", string, i, GetGroupRankName(PlayerGroup[playerid][slot][gId], i));
	}

	ShowPlayerDialog(playerid, DIALOG_GROUPRANK, DIALOG_STYLE_TABLIST, SERVER_NAME, string, "Edit", "Cancel");
	return 1;
}


// DEBUGGING COMMANDS

CMD:grouptest(playerid, params[])
{
	new tag[6];
	if(sscanf(params, "s[6]", tag))
	{
		return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /grouptest [tag]");
	}

	if(strlen(tag) > 6) return SendClientMessage(playerid, COLOR_ERROR, "Invalid group tag.");

	if(GetPlayerGroupSlotByTag(playerid, tag) == -1) return SendClientMessageEx(playerid, COLOR_ERROR, "You are not in that group");
	
	SendClientMessageEx(playerid, COLOR_BLUE, "%s is on slot %i", tag, GetPlayerGroupSlotByTag(playerid, tag));
	return 1;
}

CMD:grouptestid(playerid, params[])
{
	new groupid;
	if(sscanf(params, "i", groupid))
	{
		return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /grouptest [id]");
	}
	if(GetPlayerGroupSlot(playerid, groupid) == -1) return SendClientMessageEx(playerid, COLOR_ERROR, "You are not in that group");
	
	SendClientMessageEx(playerid, COLOR_BLUE, "%s is on slot %i", GroupInfo[groupid][gName], GetPlayerGroupSlot(playerid, groupid));
	return 1;
}

CMD:grouplist(playerid, params[])
{
    for(new i; i < MAX_GROUP_SLOTS; i++)
    {
        SendClientMessageEx(playerid, COLOR_GREEN, "#%i | Group %i | Rank %s(%i)", i, PlayerGroup[playerid][i][gId], GetGroupRankName(PlayerGroup[playerid][i][gId], PlayerGroup[playerid][i][gRank]), PlayerGroup[playerid][i][gRank]);
    }
	return 1;
}

CMD:groupcount(playerid, params[])
{
	SendClientMessageEx(playerid, COLOR_BLUE, "CountPlayerGroups is: %i", CountPlayerGroups(playerid));
	return 1;
}

CMD:rankname(playerid, params[])
{
	new groupid, rankid;
	if(sscanf(params, "ii", groupid, rankid))
	{
		return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /rankname [groupid] [rankid]");
	}
	SendClientMessageEx(playerid, COLOR_BLUE, "%s", GetGroupRankName(groupid, rankid));
	SendClientMessageEx(playerid, COLOR_BLUE, "rankid 1: %s", GroupInfo[groupid][gRank1]);
	return 1;
}