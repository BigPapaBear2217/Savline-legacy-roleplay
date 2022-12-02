/*

NOTE: GROUP IDS CANNOT BE 0! THIS WILL CAUSE ALOT OF BUGS IN THE SCRIPT
NOTE: SLOT -1 MEANS, THE PLAYER IS NOT IN THE GROUP.

groupSpeciality

0: Business // Business
1: Gang // Criminal
2: Mafia // Criminal
3: Police[SAPD] // Government
4: Tactical[SWAT] // // Government
5: Investigative[FBI] // // Government
6: Fire[SAFD] // // Government
7: Medical[EMS] // // Government
8: Government[GOV] // // Government
9: Army[SAM]    // // Government
*/

#include <YSI_Coding\y_hooks>

stock SetPlayerGroup(inviterid, playerid, groupid)
{
    if(CountPlayerGroups(playerid) == MAX_GROUP_SLOTS) return SendClientMessage(inviterid, COLOR_ERROR, "This player has reached the group limit.");

    if(GetPlayerGroupSlot(playerid, groupid) != -1) return SendClientMessageEx(inviterid, COLOR_ERROR, "That player is already in that group.");

    if(IsPlayerInCriminalGroup(playerid)) return SendClientMessage(inviterid, COLOR_ERROR, "This player is already in a criminal group.");

    if(IsPlayerInLEOGroup(playerid) && (GroupInfo[groupid][gSpeciality] == 1 && GroupInfo[groupid][gSpeciality] == 2))
        return SendClientMessage(inviterid, COLOR_ERROR, "That player cannot join a criminal group while being apart of law enforcement.");

    if(IsPlayerInCriminalGroup(playerid) && (GroupInfo[groupid][gSpeciality] == 3 || GroupInfo[groupid][gSpeciality] == 4 || \
        GroupInfo[groupid][gSpeciality] == 5 || GroupInfo[groupid][gSpeciality] == 9))
        return SendClientMessage(inviterid, COLOR_ERROR, "That player cannot join a law enforcement while being apart of a criminal group.");

    SendClientMessageEx(playerid, COLOR_BLUE, "You are inviting %s to the %s.", GetPlayerNameEx(playerid), GroupInfo[groupid][gName]);


    new string[180];
    format(string, sizeof(string), "{00FF22}%s {FFFFFF}has invited you to the '%e'.\n{FFFFFF}To accept, click 'Accept'.\n{FFFFFF}To reject, click 'Reject'.", GetPlayerNameEx(inviterid), GroupInfo[groupid][gName]);

    inline Dialog_GroupInvite(pid, did, response, listitem, string:inputtext[])
    {
	    #pragma unused pid, did, listitem, inputtext

        if(response) {

            new slot = GetPlayerGroupFreeSlot(playerid);
            PlayerGroup[playerid][slot][gId] = groupid;
            PlayerGroup[playerid][slot][gRank] = 1;

            SendClientMessageEx(inviterid, COLOR_BLUE, "%s has accepted your group invitation", GetPlayerNameEx(playerid));
            SendClientMessageEx(playerid, COLOR_BLUE, "You have joined the %s", GroupInfo[groupid][gName]);

            SendGroupMessage(groupid, COLOR_GROUP, "[%s] %s %s has invited %s to the group", GroupInfo[groupid][gTag], GetPlayerRankName(inviterid, groupid), GetPlayerNameEx(inviterid), GetPlayerNameEx(playerid));
            print("Excuting group invite query");

            new query[512];
            mysql_format(handle, query, sizeof(query), "INSERT INTO group_members (Master_ID, groupId, groupRank) VALUES ('%i', '%i', '1');", PlayerInfo[playerid][pMasterID], groupid);
            mysql_tquery(handle, query);

            print("Group Invite Finished!");
        }
        else{

            SendClientMessageEx(inviterid, COLOR_BLUE, "%s has declined your group invitation", GetPlayerNameEx(playerid));
            SendClientMessage(playerid, COLOR_BLUE, "You declined the group invitation");
        }

    }

    // ShowPlayerDialog(playerid, DIALOG_GROUPINVITE, DIALOG_STYLE_MSGBOX, SERVER_NAME, string, "Accept", "Reject");
    Dialog_ShowCallback(playerid, using inline Dialog_GroupInvite, DIALOG_STYLE_MSGBOX, SERVER_NAME, string, "Accept", "Reject");
    return 1;
}

/*
stock GetPlayerGroupSlot(playerid, groupid)
{
    for(new i; i < MAX_GROUP_SLOTS; i++)
    {
        if(PlayerGroup[playerid][i][gId] == groupid) return i;
    }
    return -1;
}
*/

stock GetPlayerGroupSlot(playerid, groupid)
{
    if(PlayerGroup[playerid][0][gId] == groupid) return 0;
    else if(PlayerGroup[playerid][1][gId] == groupid) return 1;
    else if(PlayerGroup[playerid][2][gId] == groupid) return 2;
    else if(PlayerGroup[playerid][3][gId] == groupid) return 3;
    else if(PlayerGroup[playerid][4][gId] == groupid) return 4;
    else if(PlayerGroup[playerid][5][gId] == groupid) return 5;
    else if(PlayerGroup[playerid][6][gId] == groupid) return 6;
    else if(PlayerGroup[playerid][7][gId] == groupid) return 7;
    else if(PlayerGroup[playerid][8][gId] == groupid) return 8;
    else if(PlayerGroup[playerid][9][gId] == groupid) return 9;
    else return -1;
}

stock GetPlayerGroupSlotByTag(playerid, const tag[])
{
    if(isequal(GroupInfo[PlayerGroup[playerid][0][gId]][gTag], tag, true)) return 0;
    else if(isequal(GroupInfo[PlayerGroup[playerid][1][gId]][gTag], tag, true)) return 1;
    else if(isequal(GroupInfo[PlayerGroup[playerid][2][gId]][gTag], tag, true)) return 2;
    else if(isequal(GroupInfo[PlayerGroup[playerid][3][gId]][gTag], tag, true)) return 3;
    else if(isequal(GroupInfo[PlayerGroup[playerid][4][gId]][gTag], tag, true)) return 4;
    else if(isequal(GroupInfo[PlayerGroup[playerid][5][gId]][gTag], tag, true)) return 5;
    else if(isequal(GroupInfo[PlayerGroup[playerid][6][gId]][gTag], tag, true)) return 6;
    else if(isequal(GroupInfo[PlayerGroup[playerid][7][gId]][gTag], tag, true)) return 7;
    else if(isequal(GroupInfo[PlayerGroup[playerid][8][gId]][gTag], tag, true)) return 8;
    else if(isequal(GroupInfo[PlayerGroup[playerid][9][gId]][gTag], tag, true)) return 9;
    else return -1;
}

/*
stock GetGroupSlotByTag(playerid, const tag[])
{
    for(new i; i < MAX_GROUP_SLOTS; i++)
    {
        if(!strcmp(GroupInfo[PlayerGroup[playerid][i][gId]][gTag], tag)) return i;
    }
    return -1;
}
*/

stock GetGroupIdByTag(const tag[]) {
    new groupid;
    for(new i = 0; i < MAX_GROUPS; i ++) {
        if(isequal(GroupInfo[i][gTag], tag, true)) groupid = GroupInfo[i][gID];
        else groupid = -1;
    }
    return groupid;
}

stock GetPlayerGroupFreeSlot(playerid)
{
    for(new i; i < MAX_GROUP_SLOTS; i++)
    {
        if(PlayerGroup[playerid][i][gId] == 0) return i;
    }
    return -1;
}

stock GetPlayerRankName(playerid, groupid)
{
    new slot;
    slot = GetPlayerGroupSlot(playerid, groupid);

    new rank[32];
    if(slot != -1) rank = GetGroupRankName(groupid, PlayerGroup[playerid][slot][gRank]);
    else rank = "None"; // not in group
    return rank;
}

stock CountPlayerGroups(playerid)
{
    new gcount;
    gcount = 0;
    for(new i = 0; i < MAX_GROUP_SLOTS; i++)
    {
        if(PlayerGroup[playerid][i][gId] != 0)
        {
            gcount++;
        }
    }
    return gcount;
}

stock ResetPlayerGroups(playerid)
{
    for(new i = 0; i < MAX_GROUP_SLOTS; i ++)
    {
        PlayerGroup[playerid][i][gId] = 0;
        PlayerGroup[playerid][i][gRank] = 0;
    }
}

forward LoadPlayerGroups(playerid);
public LoadPlayerGroups(playerid)
{
    new rows;
    cache_get_row_count(rows);

    for(new row = 0; row != rows; row++)
    {
        cache_get_value_name_int(row, "groupId", PlayerGroup[playerid][row][gId]);
        cache_get_value_name_int(row, "groupRank", PlayerGroup[playerid][row][gRank]);
    }
}

forward LoadGroups();
public LoadGroups()
{
	new row_count;
    cache_get_row_count(row_count);
    for(new i = 0; i < row_count && i < MAX_GROUPS; i ++)
    {
        new groupid;
        cache_get_value_name_int(i, "groupId", groupid);

        GroupInfo[groupid][gID] = groupid;
        cache_get_value_name(i, "groupName", GroupInfo[groupid][gName]);
        cache_get_value_name(i, "groupTag", GroupInfo[groupid][gTag]);

        cache_get_value_name_int(i, "groupSpeciality", GroupInfo[groupid][gSpeciality]);
        cache_get_value_name_int(i, "groupOfficial", GroupInfo[groupid][gOfficial]);

        cache_get_value_name(i, "Rank1", GroupInfo[groupid][gRank1]);
        cache_get_value_name(i, "Rank2", GroupInfo[groupid][gRank2]);
        cache_get_value_name(i, "Rank3", GroupInfo[groupid][gRank3]);
        cache_get_value_name(i, "Rank4", GroupInfo[groupid][gRank4]);
        cache_get_value_name(i, "Rank5", GroupInfo[groupid][gRank5]);
        cache_get_value_name(i, "Rank6", GroupInfo[groupid][gRank6]);
        cache_get_value_name(i, "Rank7", GroupInfo[groupid][gRank7]);
        cache_get_value_name(i, "Rank8", GroupInfo[groupid][gRank8]);
        cache_get_value_name(i, "Rank9", GroupInfo[groupid][gRank9]);
        cache_get_value_name(i, "Rank10", GroupInfo[groupid][gRank10]);
        cache_get_value_name(i, "Rank11", GroupInfo[groupid][gRank11]);
        cache_get_value_name(i, "Rank12", GroupInfo[groupid][gRank12]);
        cache_get_value_name(i, "Rank13", GroupInfo[groupid][gRank13]);
        cache_get_value_name(i, "Rank14", GroupInfo[groupid][gRank14]);
        cache_get_value_name(i, "Rank15", GroupInfo[groupid][gRank15]);

        cache_get_value_name_int(i, "permissionInviteKick", GroupInfo[groupid][gPermsInviteKick]);
        cache_get_value_name_int(i, "permissionRank", GroupInfo[groupid][gPermsRank]);
        cache_get_value_name_int(i, "permissionManage", GroupInfo[groupid][gPermsManage]);
        cache_get_value_name_int(i, "permissionStorage", GroupInfo[groupid][gPermsStorage]);
        cache_get_value_name_int(i, "permissionManageProperty", GroupInfo[groupid][gPermsLock]);
        cache_get_value_name_int(i, "gBankAcc", GroupInfo[groupid][gBankAcc]);

        cache_get_value_name_float(i, "gSmuggleVanX", GroupInfo[groupid][gSmuggleVanX]);
        cache_get_value_name_float(i, "gSmuggleVanY", GroupInfo[groupid][gSmuggleVanY]);
        cache_get_value_name_float(i, "gSmuggleVanZ", GroupInfo[groupid][gSmuggleVanZ]);

        cache_get_value_name_float(i, "gSpawnX", GroupInfo[groupid][gSpawnX]);
        cache_get_value_name_float(i, "gSpawnY", GroupInfo[groupid][gSpawnY]);
        cache_get_value_name_float(i, "gSpawnZ", GroupInfo[groupid][gSpawnZ]);

        GroupInfo[groupid][gExists] = 1;
        
    }

    printf("LOADED | %i groups", row_count);
}

forward ReloadGroupsQuery();
public ReloadGroupsQuery()
{
    for(new i = 0; i < MAX_GROUPS; i ++)
    {
        GroupInfo[i][gID] = 0;
        GroupInfo[i][gName] = 0;
        GroupInfo[i][gTag] = 0;
        GroupInfo[i][gSpeciality] = 0;
        GroupInfo[i][gOfficial] = 0;
        GroupInfo[i][gRank1] = 0;
        GroupInfo[i][gRank2] = 0;
        GroupInfo[i][gRank3] = 0;
        GroupInfo[i][gRank4] = 0;
        GroupInfo[i][gRank5] = 0;
        GroupInfo[i][gRank6] = 0;
        GroupInfo[i][gRank7] = 0;
        GroupInfo[i][gRank8] = 0;
        GroupInfo[i][gRank9] = 0;
        GroupInfo[i][gRank10] = 0;
        GroupInfo[i][gRank11] = 0;
        GroupInfo[i][gRank12] = 0;
        GroupInfo[i][gRank13] = 0;
        GroupInfo[i][gRank14] = 0;
        GroupInfo[i][gRank15] = 0;
        GroupInfo[i][gPermsInviteKick] = 0;
        GroupInfo[i][gPermsRank] = 0;
        GroupInfo[i][gPermsManage] = 0;
        GroupInfo[i][gPermsStorage] = 0;
        GroupInfo[i][gPermsLock] = 0;

        GroupInfo[i][gSmuggleVanX] = 0;
        GroupInfo[i][gSmuggleVanY] = 0;
        GroupInfo[i][gSmuggleVanZ] = 0;

        GroupInfo[i][gSpawnX] = 0;
        GroupInfo[i][gSpawnY] = 0;
        GroupInfo[i][gSpawnZ] = 0;

        GroupInfo[i][gExists] = 0;
    }
    mysql_tquery(handle, "SELECT * FROM `groups`", "LoadGroups");
}

SetupGroup(name[], tag[], type)
{
    new query[512];
	mysql_format(handle, query, sizeof(query), "INSERT INTO `groups` (groupName, groupTag, groupSpeciality) VALUES ('%e', '%e', %i);", name, tag, type);
	mysql_tquery(handle, query);
    ReloadGroupsQuery();
}

stock DoesGroupExist(groupid)
{
    if(!(0 <= groupid < MAX_GROUPS) || !GroupInfo[groupid][gExists]) {
        return 0;
    }
    else return 1;
}


SendGroupMessage(groupid, color, const text[], {Float,_}:...)
{
    static
  	    args,
	    str[256];
	if((args = numargs()) <= 3)
	{
	    foreach(new i : Player)
        {
            for(new j = 0; j < MAX_GROUP_SLOTS; j++){
                if(PlayerInfo[i][pLoggedIn] && PlayerGroup[i][j][gId] == groupid)
                {
                    SendClientMessage(i, color, text);
                }
            }
        }
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
		foreach(new i : Player)
        {
            for(new j = 0; j < MAX_GROUP_SLOTS; j++){
                if(PlayerInfo[i][pLoggedIn] && PlayerGroup[i][j][gId] == groupid)
                {
                    SendClientMessage(i, color, str);
                }
            }
        }
		#emit RETN
	}
    return 1;
}

stock GetGroupRankName(groupid, rank)
{
    new string[32];
    if(rank == 1) format(string, sizeof(string), "%s", GroupInfo[groupid][gRank1]);
    else if(rank == 2) format(string, sizeof(string), "%s", GroupInfo[groupid][gRank2]);
    else if(rank == 3) format(string, sizeof(string), "%s", GroupInfo[groupid][gRank3]);
    else if(rank == 4) format(string, sizeof(string), "%s", GroupInfo[groupid][gRank4]);
    else if(rank == 5) format(string, sizeof(string), "%s", GroupInfo[groupid][gRank5]);
    else if(rank == 6) format(string, sizeof(string), "%s", GroupInfo[groupid][gRank6]);
    else if(rank == 7) format(string, sizeof(string), "%s", GroupInfo[groupid][gRank7]);
    else if(rank == 8) format(string, sizeof(string), "%s", GroupInfo[groupid][gRank8]);
    else if(rank == 9) format(string, sizeof(string), "%s", GroupInfo[groupid][gRank9]);
    else if(rank == 10) format(string, sizeof(string), "%s", GroupInfo[groupid][gRank10]);
    else if(rank == 11) format(string, sizeof(string), "%s", GroupInfo[groupid][gRank11]);
    else if(rank == 12) format(string, sizeof(string), "%s", GroupInfo[groupid][gRank12]);
    else if(rank == 13) format(string, sizeof(string), "%s", GroupInfo[groupid][gRank13]);
    else if(rank == 14) format(string, sizeof(string), "%s", GroupInfo[groupid][gRank14]);
    else if(rank == 15) format(string, sizeof(string), "%s", GroupInfo[groupid][gRank15]);
    return string;
}

stock SetGroupRankName(groupid, rank, rankname[])
{
    new newrank[32];
    format(newrank, sizeof(newrank), "%s", rankname);

    if(rank == 1) {
        GroupInfo[groupid][gRank1] = newrank;

        new query[180];
        mysql_format(handle, query, sizeof(query), "UPDATE `groups` SET Rank1 = '%e' WHERE groupId = %i", GroupInfo[groupid][gRank1], groupid);
        mysql_tquery(handle, query);
    }
    else if(rank == 2) {
        GroupInfo[groupid][gRank2] = newrank;

        new query[180];
        mysql_format(handle, query, sizeof(query), "UPDATE `groups` SET Rank2 = '%e' WHERE groupId = %i", GroupInfo[groupid][gRank2], groupid);
        mysql_tquery(handle, query);
    }
    else if(rank == 3) {
        GroupInfo[groupid][gRank3] = newrank;

        new query[180];
        mysql_format(handle, query, sizeof(query), "UPDATE `groups` SET Rank3 = '%e' WHERE groupId = %i", GroupInfo[groupid][gRank3], groupid);
        mysql_tquery(handle, query);
    }
    else if(rank == 4) {
        GroupInfo[groupid][gRank4] = newrank;

        new query[180];
        mysql_format(handle, query, sizeof(query), "UPDATE `groups` SET Rank4 = '%e' WHERE groupId = %i", GroupInfo[groupid][gRank4], groupid);
        mysql_tquery(handle, query);
    }
    else if(rank == 5) {
        GroupInfo[groupid][gRank5] = newrank;

        new query[180];
        mysql_format(handle, query, sizeof(query), "UPDATE `groups` SET Rank5 = '%e' WHERE groupId = %i", GroupInfo[groupid][gRank5], groupid);
        mysql_tquery(handle, query);
    }
    else if(rank == 6) {
        GroupInfo[groupid][gRank6] = newrank;

        new query[180];
        mysql_format(handle, query, sizeof(query), "UPDATE `groups` SET Rank6 = '%e' WHERE groupId = %i", GroupInfo[groupid][gRank6], groupid);
        mysql_tquery(handle, query);
    }
    else if(rank == 7) {
        GroupInfo[groupid][gRank7] = newrank;

        new query[180];
        mysql_format(handle, query, sizeof(query), "UPDATE `groups` SET Rank7 = '%e' WHERE groupId = %i", GroupInfo[groupid][gRank7], groupid);
        mysql_tquery(handle, query);
    }
    else if(rank == 8) {
        GroupInfo[groupid][gRank8] = newrank;

        new query[180];
        mysql_format(handle, query, sizeof(query), "UPDATE `groups` SET Rank8 = '%e' WHERE groupId = %i", GroupInfo[groupid][gRank8], groupid);
        mysql_tquery(handle, query);
    }
    else if(rank == 9) {
        GroupInfo[groupid][gRank9] = newrank;

        new query[180];
        mysql_format(handle, query, sizeof(query), "UPDATE `groups` SET Rank9 = '%e' WHERE groupId = %i", GroupInfo[groupid][gRank9], groupid);
        mysql_tquery(handle, query);
    }
    else if(rank == 10) {
        GroupInfo[groupid][gRank10] = newrank;

        new query[180];
        mysql_format(handle, query, sizeof(query), "UPDATE `groups` SET Rank10 = '%e' WHERE groupId = %i", GroupInfo[groupid][gRank10], groupid);
        mysql_tquery(handle, query);
    }
    else if(rank == 11) {
        GroupInfo[groupid][gRank11] = newrank;

        new query[180];
        mysql_format(handle, query, sizeof(query), "UPDATE `groups` SET Rank11 = '%e' WHERE groupId = %i", GroupInfo[groupid][gRank11], groupid);
        mysql_tquery(handle, query);
    }
    else if(rank == 12) {
        GroupInfo[groupid][gRank12] = newrank;

        new query[180];
        mysql_format(handle, query, sizeof(query), "UPDATE `groups` SET Rank12 = '%e' WHERE groupId = %i", GroupInfo[groupid][gRank12], groupid);
        mysql_tquery(handle, query);
    }
    else if(rank == 13) {
        GroupInfo[groupid][gRank13] = newrank;

        new query[180];
        mysql_format(handle, query, sizeof(query), "UPDATE `groups` SET Rank13 = '%e' WHERE groupId = %i", GroupInfo[groupid][gRank13], groupid);
        mysql_tquery(handle, query);
    }
    else if(rank == 14) {
        GroupInfo[groupid][gRank14] = newrank;

        new query[180];
        mysql_format(handle, query, sizeof(query), "UPDATE `groups` SET Rank14 = '%e' WHERE groupId = %i", GroupInfo[groupid][gRank14], groupid);
        mysql_tquery(handle, query);
    }
    else if(rank == 15)  {
        GroupInfo[groupid][gRank15] = newrank;

        new query[180];
        mysql_format(handle, query, sizeof(query), "UPDATE `groups` SET Rank15 = '%e' WHERE groupId = %i", GroupInfo[groupid][gRank15], groupid);
        mysql_tquery(handle, query);
    }
}

GetGroupType(groupid)
{
    new string[12];
    switch(GroupInfo[groupid][gSpeciality])
    {
        case 0: string = "Business";
        case 1: string = "Criminal";
        case 2: string = "Criminal";
        case 3: string = "Government";
        case 4: string = "Government";
        case 5: string = "Government";
        case 6: string = "Government";
        case 7: string = "Government";
        case 8: string = "Government";
        case 9: string = "Government";
    }
    return string;
}

stock IsPlayerInCriminalGroup(playerid) {
    for(new i = 0; i < MAX_GROUP_SLOTS; i++){
        if(GroupInfo[PlayerGroup[playerid][i][gId]][gSpeciality] == 1 || GroupInfo[PlayerGroup[playerid][i][gId]][gSpeciality] == 2){
            return 1;
        }
    }
    return 0;
}

stock IsPlayerInLEOGroup(playerid) 
{
    for(new i = 0; i < MAX_GROUP_SLOTS; i++) 
    {
        if(GroupInfo[PlayerGroup[playerid][i][gId]][gSpeciality] == 3 || \
            GroupInfo[PlayerGroup[playerid][i][gId]][gSpeciality] == 4 || \
            GroupInfo[PlayerGroup[playerid][i][gId]][gSpeciality] == 5 || \
            GroupInfo[PlayerGroup[playerid][i][gId]][gSpeciality] == 9
        ) 
        {
            return 1;
        }
    }
    return 0;
}

stock IsPlayerInGovernmentGroup(playerid) 
{
    for(new i = 0; i < MAX_GROUP_SLOTS; i++) 
    {
        if(GroupInfo[PlayerGroup[playerid][i][gId]][gSpeciality] == 3 || \
            GroupInfo[PlayerGroup[playerid][i][gId]][gSpeciality] == 4 || \
            GroupInfo[PlayerGroup[playerid][i][gId]][gSpeciality] == 5 || \
            GroupInfo[PlayerGroup[playerid][i][gId]][gSpeciality] == 6 || \
            GroupInfo[PlayerGroup[playerid][i][gId]][gSpeciality] == 7 || \
            GroupInfo[PlayerGroup[playerid][i][gId]][gSpeciality] == 9
        ) 
        {
            return 1;
        }
    }
    return 0;
}

stock IsPlayerFMDGroup(playerid) 
{
    for(new i = 0; i < MAX_GROUP_SLOTS; i++) 
    {
        if(GroupInfo[PlayerGroup[playerid][i][gId]][gSpeciality] == 6 || GroupInfo[PlayerGroup[playerid][i][gId]][gSpeciality] == 7) 
        {
            return 1;
        }
    }
    return 0;
}
