#include <YSI_Coding\y_hooks>

/*

S A V L I N E - R P G
dialog.pwn
contains dialog responses, and easyDialog

*/

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{

	// this is to prevent dizzy from doing silly things
	for(new i = 0, l = strlen(inputtext); i < l; i ++)
	{
	    if(inputtext[i] == '%') inputtext[i] = '#';
	}

	switch(dialogid)
	{
		case DIALOG_REGISTER:
	    {
			if(response)
			{
				print("Input entered!");
			    bcrypt_hash(inputtext, 12, "OnPassHash", "d", playerid);
			}
			else Kick(playerid);
		}
		
		case DIALOG_LOGIN:
		{
			if(response)
			{
				new query[128], pname[MAX_PLAYER_NAME];
				GetPlayerName(playerid, pname, sizeof(pname));
    			SetPVarString(playerid, "Unhashed_Pass",inputtext);
				mysql_format(handle, query, sizeof(query), "SELECT Password, Master_ID FROM users WHERE Name = '%e';", pname);
				mysql_tquery(handle, query, "OnPlayerLogin", "d", playerid);
			}
			else Kick(playerid);
		}

		case DIALOG_ACCENT:
		{
			if(response)
			{
				new query[100];
				PlayerInfo[playerid][pAccent] = listitem;
				mysql_format(handle, query, sizeof(query), "UPDATE users SET Accent = %i WHERE Master_ID = %i", PlayerInfo[playerid][pAccent], PlayerInfo[playerid][pMasterID]);
				mysql_tquery(handle, query);
				return SendClientMessageEx(playerid, COLOR_BLUE, "You have set your accent to '%s'", GetPlayerAccent(playerid));
			}
		}

		case DIALOG_APORT:
		{
			if(response)
			{
				switch(listitem)
				{
					case 0: // General Locations
					{
						static list[4096];

						if(isnull(list))
						{
						    for(new i = 0; i < sizeof(aportArray); i ++)
						    {
						        format(list, sizeof(list), "%s\n%s", list, aportArray[i][aportName]);
							}
						}

						ShowPlayerDialog(playerid, DIALOG_APORTG, DIALOG_STYLE_LIST, SERVER_NAME, list, "Go", "Close");
						return 1;
					}
					case 1: // Interiors
					{
						static list[4096];

						if(isnull(list))
						{
						    for(new i = 0; i < sizeof(interiorArray); i ++)
						    {
						        format(list, sizeof(list), "%s\n%s", list, interiorArray[i][intName]);
							}
						}

						ShowPlayerDialog(playerid, DIALOG_APORTI, DIALOG_STYLE_LIST, SERVER_NAME, list, "Go", "Close");
						return 1;
					}
					case 2: // Jobs
					{
						ShowPlayerDialog(playerid, DIALOG_APORTJ, DIALOG_STYLE_LIST, SERVER_NAME, "No valid options", "Go", "Close");
						return 1;
					}
				}
			}
		}
		case DIALOG_APORTG: // General Locations
		{
			if(response)
			{
	            TeleportToCoords(playerid, aportArray[listitem][aportX], aportArray[listitem][aportY], aportArray[listitem][aportZ], aportArray[listitem][aportA], aportArray[listitem][aportInt], aportArray[listitem][aportVW]);
	            SendClientMessageEx(playerid, COLOR_BLUE, "You have teleported to %s", aportArray[listitem][aportName]);
				return 1;
			}
		}
		case DIALOG_APORTI: // Interiors
		{
			if(response)
			{	
				TeleportToCoords(playerid, interiorArray[listitem][intX], interiorArray[listitem][intY], interiorArray[listitem][intZ], interiorArray[listitem][intA], interiorArray[listitem][intID], GetPlayerVirtualWorld(playerid));
	            SendClientMessageEx(playerid, COLOR_BLUE, "You have teleported to %s", interiorArray[listitem][intName]);
				return 1;
			}
		}
		case DIALOG_APORTJ: // Job Locations
		{
			if(response)
			{
				SendClientMessageEx(playerid, COLOR_ERROR, "Dont worry, this will be added at a later date.");
				return 1;
			}
		}


		// group dialogs

		case DIALOG_GROUPRANK:
		{
			if(response)
			{
				new rank = listitem + 1;
				PlayerInfo[playerid][pEditingGRank] = rank;
				new groupid = PlayerInfo[playerid][pEditingGroup];

	    		new string[200];
				format(string, sizeof(string), "The new rank name cannot exceed over 32 characters\nCurrent rank name: %s", GetGroupRankName(groupid, rank));

			    ShowPlayerDialog(playerid, DIALOG_GROUPEDITRANK, DIALOG_STYLE_INPUT, SERVER_NAME, string, "Edit", "Cancel");
			}
			return 1;
		}
		case DIALOG_GROUPEDITRANK:
		{
    		if(response)
    		{
    			if(strlen(inputtext) > 32) return SendClientMessage(playerid, COLOR_ERROR, "Group rank cannot exceed over 32 characters.");

    			SetGroupRankName(PlayerInfo[playerid][pEditingGroup], PlayerInfo[playerid][pEditingGRank], inputtext);

    			SendClientMessageEx(playerid, COLOR_BLUE, "Rank %i has been renammed to %s", PlayerInfo[playerid][pEditingGRank], inputtext);

    			PlayerInfo[playerid][pEditingGroup] = 0;
    		}
		}

		// case DIALOG_GROUPINVITE:
		// {

    	// 	new inviterid = PlayerInfo[playerid][pGroupInviterId];
    	// 	new groupid = PlayerInfo[playerid][pGroupInvitedId];

		// 	if(response){

		// 	    new slot = GetPlayerGroupFreeSlot(playerid);
		// 	    PlayerGroup[playerid][slot][gId] = groupid;
		// 	    PlayerGroup[playerid][slot][gRank] = 1;

		// 	    SendClientMessageEx(inviterid, COLOR_BLUE, "%s has accepted your group invitation", GetPlayerNameEx(playerid));
		// 	    SendClientMessageEx(playerid, COLOR_BLUE, "You have joined the %s", GroupInfo[groupid][gName]);

		// 	    SendGroupMessage(groupid, COLOR_GROUP, "[%s] %s %s has invited %s to the group", GroupInfo[groupid][gTag], GetPlayerRankName(inviterid, groupid), GetPlayerNameEx(inviterid), GetPlayerNameEx(playerid));
			    
		// 		new query[512];
		// 	    mysql_format(handle, query, sizeof(query), "INSERT INTO group_members (Master_ID, groupId, groupRank) VALUES ('%i', '%i', '1');", PlayerInfo[playerid][pMasterID], groupid);
		// 	    mysql_tquery(handle, query);
		// 	}
		// 	else{

		// 	    SendClientMessageEx(inviterid, COLOR_BLUE, "%s has declined your group invitation", GetPlayerNameEx(playerid));
		// 	    SendClientMessage(playerid, COLOR_BLUE, "You declined the group invitation");

		// 	    PlayerInfo[playerid][pGroupInviterId] = -1;
    	// 		PlayerInfo[playerid][pGroupInvitedId] = -1;
			
		// 	}
		// }

		// /help related dialogs
		case DIALOG_HELP:
		{
			if(response)
			{
				if(listitem == 0)
				{
					return ShowPlayerDialog(playerid, DIALOG_HELP_GOTOMAIN, DIALOG_STYLE_MSGBOX, "Account", "(working)", "Back", "Exit");
				}
				if(listitem == 1)
				{
					return D_HELP_JOBS(playerid);
				}
				if(listitem == 2)
				{
					return D_HELP_ECONOMY(playerid);
				}
				if(listitem == 3)
				{
					return D_HELP_GROUP(playerid);
				}
				if(listitem == 8)
				{
					return D_RULES(playerid);
				}
			}
		}
		case DIALOG_HELP_GOTOMAIN:
		{
			if(response)
			{
				return D_HELP(playerid);
			}
		}
		case DIALOG_HELP_JOBS:
		{
			if(response)
			{
				if(listitem == 1)
				{
					return D_HELP(playerid);
				}
			}
		}
		case DIALOG_HELP_GROUP:
		{
			if(response)
			{
				if(listitem == 0)
				{
					return D_HELP_GROUP_1(playerid);
				}
				if(listitem == 1)
				{
					return D_HELP_GROUP_2(playerid);
				}
				if(listitem == 2)
				{
					return D_HELP_GROUP_3(playerid);
				}
				if(listitem == 3)
				{
					return D_HELP_GROUP_4(playerid);
				}
				if(listitem == 4)
				{
					return D_HELP_GROUP_5(playerid);
				}
				if(listitem == 5)
				{
					return D_HELP_GROUP_COMMANDS(playerid);
				}
				if(listitem == 6)
				{
					return D_HELP(playerid);
				}
			}
		}
		case DIALOG_HELP_PROPERTIES:
		{
			if(response)
			{
				if(listitem == 3)
				{
					return D_HELP(playerid);
				}
			}
		}
		// rules related dialogs
	}


	return 1;
}