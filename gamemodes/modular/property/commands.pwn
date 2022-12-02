#include <YSI_Coding\y_hooks>

CMD:property(playerid, params[])
{
	new propertyid = GetNearbyProperty(playerid);
	if(propertyid == -1)
	{
	    return SendClientMessage(playerid, COLOR_ERROR, "You are not near a property.");
	}

	if(!DoesPlayerOwnProperty(playerid, propertyid))
	{
		return SendClientMessage(playerid, COLOR_ERROR, "You do not own this property.");
	}

	ShowPlayerDialog(playerid, DIALOG_PROPERTY, DIALOG_STYLE_LIST, SERVER_NAME, "{FFFFFF}Information\n{FFFFFF}Lock\n{FFFFFF}Name\n{FFFFFF}Money Safe\n{FF0000}Sell to State", "Select", "Close");

	return 1;
}

CMD:purchase(playerid, params[])
{
	new propertyid = GetNearbyProperty(playerid);
	if(propertyid == -1) {
	    return SendClientMessage(playerid, COLOR_ERROR, "You are not near a property.");
	}

	if(strcmp(params, "confirm", true)) {
		return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /purchase [confirm]");
	}

	if(PropertyInfo[propertyid][pOwnerid] != -1 || PropertyInfo[propertyid][pType] == PROPERTY_TYPE_ENTERABLE || PropertyInfo[propertyid][pOwnertype] == TYPE_GROUP) {
	    return SendClientMessage(playerid, COLOR_ERROR, "You cannot purchase this property.");
	}

    if(PropertyInfo[propertyid][pPrice] > GetPlayerMoney(playerid)) {
        return SendClientMessage(playerid, COLOR_ERROR, "You cannot afford this property.");
    }

    SendClientMessageEx(playerid, COLOR_GREEN, "Congratulations, you have purchased this property for %s", FormatNumber(PropertyInfo[propertyid][pPrice]));

	PropertyInfo[propertyid][pOwnerid] = PlayerInfo[playerid][pMasterID];

	new name[50];
	GetPlayerName(playerid, name, sizeof(name));

	PropertyInfo[propertyid][pOwnername] = name;

	new query[180];
	mysql_format(handle, query, sizeof(query), "UPDATE property SET ownerid = %i, ownertype = %i, ownername ='%e' WHERE propertyid = %i", PropertyInfo[propertyid][pOwnerid], TYPE_PLAYER, PropertyInfo[propertyid][pOwnername], PropertyInfo[propertyid][pId]);
	mysql_tquery(handle, query);

	ReloadProperties();
    return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	switch(dialogid)
	{
		case DIALOG_PROPERTY:
	    {
			if(response)
			{
				new id = GetNearbyProperty(playerid);
				if(id == -1)
				{
				    return SendClientMessage(playerid, COLOR_ERROR, "You are not near a property.");
				}

				if(!DoesPlayerOwnProperty(playerid, id))
				{
					return SendClientMessage(playerid, COLOR_ERROR, "You do not own this property.");
				}

				switch(listitem)
				{
					case 0: // Information
					{
		                new MapZone:zone = GetPlayerMapZone(playerid);
		                new name[MAX_MAP_ZONE_NAME];
		                GetMapZoneName(zone, name);

						new string[180];
						format(string, sizeof(string), "Owner: %s\nAddress: %s\nValue %s\nStatus: %s\nItem Stock %i", PropertyInfo[id][pOwnername], name, FormatNumber(PropertyInfo[id][pPrice]), (PropertyInfo[id][pLocked]) ? ("Locked") : ("Unlocked"), PropertyInfo[id][pStock]);
						return ShowPlayerDialog(playerid, DIALOG_NONE, DIALOG_STYLE_MSGBOX, SERVER_NAME, string, "Close", "");
					}
					case 1: // Lock
					{
						PlayProximitySound(playerid, 20, 24600);
						if(PropertyInfo[id][pLocked]) // Locked
						{
							SendClientMessage(playerid, COLOR_BLUE, "You have unlocked the property");
							SendProximityMessage(playerid, 20.0, COLOR_OOC, "* %s"COL_OOC" has unlocked the property", GetRoleplayName(playerid, true));
							
							new query[180];
							mysql_format(handle, query, sizeof(query), "UPDATE property SET locked = 0 WHERE propertyid = %i", PropertyInfo[id][pId]);
					    	mysql_tquery(handle, query);

							PropertyInfo[id][pLocked] = 0;
						}
						else // Unlocked
						{
							SendClientMessage(playerid, COLOR_BLUE, "You have locked the property");
							SendProximityMessage(playerid, 20.0, COLOR_OOC, "* %s"COL_OOC" has locked the property", GetRoleplayName(playerid, true));
							
							new query[180];
							mysql_format(handle, query, sizeof(query), "UPDATE property SET locked = 1 WHERE propertyid = %i", PropertyInfo[id][pId]);
					    	mysql_tquery(handle, query);

							PropertyInfo[id][pLocked] = 1;
						}
						return 1;
					}
					case 2: // Name
					{
						return ShowPlayerDialog(playerid, DIALOG_PROPERTYNAME, DIALOG_STYLE_INPUT, SERVER_NAME, "The property name cannot be over 32 characters\n\nMake sure the name fits the server rules\nProperty names can be renamed by a administrator.", "Edit", "Close");
					}
					case 3: // Money Safe
					{
						new string[180];
						format(string, sizeof(string), "%s inside the property safe\nWithdraw\nDeposit", FormatNumber(PropertyInfo[id][pPropertysafe]));
						return ShowPlayerDialog(playerid, DIALOG_PROPERTYSAFE, DIALOG_STYLE_LIST, SERVER_NAME, string, "Select", "Close");
					}
					case 4: // Sell to State
					{
						return ShowPlayerDialog(playerid, DIALOG_PROPERTYSELL, DIALOG_STYLE_MSGBOX, SERVER_NAME, "{FF0000}Are you sure you wish to sell the property to the state?", "Sell", "Cancel");
					}
				}
			}
		}
		case DIALOG_PROPERTYNAME:
		{
			new id = GetNearbyProperty(playerid);
			if(id == -1)
			{
			    return SendClientMessage(playerid, COLOR_ERROR, "You are not near a property.");
			}

			if(!DoesPlayerOwnProperty(playerid, id))
			{
				return SendClientMessage(playerid, COLOR_ERROR, "You do not own this property.");
			}

			if(response)
			{
				if(strlen(inputtext) < 32)
				{
					return SendClientMessage(playerid, COLOR_ERROR, "Property names cannot be longer then 32 characters.");
				}

				new string[32];
				format(string, sizeof(string), "%s", inputtext);
				PropertyInfo[id][pName] = string;

				new query[180];
				mysql_format(handle, query, sizeof(query), "UPDATE property SET propertyname = '%e' WHERE propertyid = %i", inputtext, PropertyInfo[id][pId]);
			    mysql_tquery(handle, query);

				ReloadProperties();
			    SendClientMessageEx(playerid, COLOR_BLUE, "The property name has been set to '%e'", inputtext);
			    return 1;
			}
		}
		case DIALOG_PROPERTYSAFE:
		{
			new id = GetNearbyProperty(playerid);
			if(id == -1)
			{
			    return SendClientMessage(playerid, COLOR_ERROR, "You are not near a property.");
			}

			if(!DoesPlayerOwnProperty(playerid, id))
			{
				return SendClientMessage(playerid, COLOR_ERROR, "You do not own this property.");
			}

			if(response)
			{
				switch(listitem)
				{
					case 0:
					{
						new string[180];
						format(string, sizeof(string), "%s inside the property safe\nWithdraw\nDeposit", FormatNumber(PropertyInfo[id][pPropertysafe]));
						return ShowPlayerDialog(playerid, DIALOG_PROPERTYSAFE, DIALOG_STYLE_LIST, SERVER_NAME, string, "Select", "Close");
					}
					case 1:
					{
						return ShowPlayerDialog(playerid, DIALOG_PROPERTYWITHDRAW, DIALOG_STYLE_INPUT, SERVER_NAME, "Withdraw money from your property safe", "Withdraw", "Close");
					}
					case 2:
					{
						return ShowPlayerDialog(playerid, DIALOG_PROPERTYDEPOSIT, DIALOG_STYLE_INPUT, SERVER_NAME, "Deposit money from your property safe", "Deposit", "Close");
					}
				}
			}
		}
		case DIALOG_PROPERTYWITHDRAW:
		{
			new id = GetNearbyProperty(playerid);
			if(id == -1)
			{
			    return SendClientMessage(playerid, COLOR_ERROR, "You are not near a property.");
			}

			if(!DoesPlayerOwnProperty(playerid, id))
			{
				return SendClientMessage(playerid, COLOR_ERROR, "You do not own this property.");
			}

			new amount = strval(inputtext);
            if(amount <= 0) return SendClientMessage(playerid, COLOR_ERROR, "You have entered an invalid amount to withdraw.");
            if(amount > PropertyInfo[id][pPropertysafe]) return SendClientMessage(playerid, COLOR_ERROR, "You don't even have that much money in the safe.");
            PropertyInfo[id][pPropertysafe] -= amount;
            GivePlayerMoney(playerid, amount);

			new query[180];
			mysql_format(handle, query, sizeof(query), "UPDATE property SET propertysafe = %i WHERE propertyid = %i", PropertyInfo[id][pPropertysafe], PropertyInfo[id][pId]);
		    mysql_tquery(handle, query);

            return SendClientMessageEx(playerid, COLOR_BLUE, "You have withdrawn %s from the property", FormatNumber(amount));
		}
		case DIALOG_PROPERTYDEPOSIT:
		{
			new id = GetNearbyProperty(playerid);
			if(id == -1)
			{
			    return SendClientMessage(playerid, COLOR_ERROR, "You are not near a property.");
			}

			if(!DoesPlayerOwnProperty(playerid, id))
			{
				return SendClientMessage(playerid, COLOR_ERROR, "You do not own this property.");
			}

			new amount = strval(inputtext);
            if(amount <= 0) return SendClientMessage(playerid, COLOR_ERROR, "You have entered an invalid amount to deposit.");
            if(amount > GetPlayerMoney(playerid)) return SendClientMessage(playerid, COLOR_ERROR, "You do not have that much money on you to deposit.");
            PropertyInfo[id][pPropertysafe] += amount;
            GivePlayerMoney(playerid, -amount);

			new query[180];
			mysql_format(handle, query, sizeof(query), "UPDATE property SET propertysafe = %i WHERE propertyid = %i", PropertyInfo[id][pPropertysafe], PropertyInfo[id][pId]);
		    mysql_tquery(handle, query);

            return SendClientMessageEx(playerid, COLOR_BLUE, "You have deposited %s from the property", FormatNumber(amount));
		}
		case DIALOG_PROPERTYSELL:
		{
			new id = GetNearbyProperty(playerid);
			if(id == -1)
			{
			    return SendClientMessage(playerid, COLOR_ERROR, "You are not near a property.");
			}

			if(!DoesPlayerOwnProperty(playerid, id))
			{
				return SendClientMessage(playerid, COLOR_ERROR, "You do not own this property.");
			}

			if(response)
			{
				new moneyback = PropertyInfo[id][pPrice] / 2;

				new forsale[50] = "For Sale";
				PropertyInfo[id][pOwnername] = forsale;
	            PropertyInfo[id][pOwnerid] = -1;
	            GivePlayerMoney(playerid, moneyback);

				new query[180];
				mysql_format(handle, query, sizeof(query), "UPDATE property SET ownerid = -1, ownername = '%e' WHERE propertyid = %i", PropertyInfo[id][pOwnername], PropertyInfo[id][pId]);
			    mysql_tquery(handle, query);

			    ReloadProperties();
			    return SendClientMessageEx(playerid, COLOR_BLUE, "You sold the property to the state and was given %i back.", moneyback);
			}
			else
			{
				return SendClientMessage(playerid, COLOR_BLUE, "You choose to not sell the property to the state");
			}
		}


	}

	return 1;
}