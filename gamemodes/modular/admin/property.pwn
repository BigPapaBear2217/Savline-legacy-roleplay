#include <YSI_Coding\y_hooks>


CMD:createhouse(playerid, params[])
{
    if(PlayerInfo[playerid][pStaff] < 5) return 0;

	new price, Float:x, Float:y, Float:z, Float:a;
	if(sscanf(params, "i", price))
	{
	    return SendClientMessageEx(playerid, COLOR_ERROR, "Correct usage: /createhouse [price]", price);
	}
	if(GetNearbyProperty(playerid) >= 0)
	{
	    return SendClientMessage(playerid, COLOR_ERROR, "There is already a property nearby.");
	}

	GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, a);

	new query[256];
	mysql_format(handle, query, sizeof(query), "INSERT INTO property (ownerid, ownertype, type, speciality, price, enter_x, enter_y, enter_z, enter_a, outsideint, outsidevw) VALUES (-1, %i, %i, %i, %i, '%f', '%f', '%f', '%f', %i, %i)", TYPE_PLAYER, PROPERTY_TYPE_HOUSE, HOUSE_SPECIALITY_NORMAL, price, x, y, z, a - 180.0, GetPlayerInterior(playerid), GetPlayerVirtualWorld(playerid));
	mysql_tquery(handle, query, "ReloadProperties");

	SendClientMessage(playerid, COLOR_BLUE, "You created a new property");
	return 1;
}

CMD:edithouse(playerid, params[])
{
	new houseid, option[10], param[32];

	if(PlayerInfo[playerid][pStaff] < 5) return 0;

	if(sscanf(params, "is[10]S()[32]", houseid, option, param))
	{
	    SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /edithouse [houseid] [option]");
	    SendClientMessage(playerid, COLOR_ERROR, "options: Enter, Exit, World, Group, Player, Price");
	    return 1;
	}
	if(!(0 <= houseid < MAX_PROPERTIES) || !PropertyInfo[houseid][pExists])
	{
	    return SendClientMessage(playerid, COLOR_ERROR, "Invalid propertyid.");
	}
	if(PropertyInfo[houseid][pType] != PROPERTY_TYPE_HOUSE)
	{
		return SendClientMessage(playerid, COLOR_ERROR, "This property is not a house.");
	}
	if(!strcmp(option, "enter", true))
	{
	    GetPlayerPos(playerid, PropertyInfo[houseid][pEnter_x], PropertyInfo[houseid][pEnter_x], PropertyInfo[houseid][pEnter_x]);
	    GetPlayerFacingAngle(playerid, PropertyInfo[houseid][pEnter_a]);

	    PropertyInfo[houseid][pOutsideint] = GetPlayerInterior(playerid);
	    PropertyInfo[houseid][pOutsidevw] = GetPlayerVirtualWorld(playerid);

	    new query[180];
	    mysql_format(handle, query, sizeof(query), "UPDATE property SET enter_x = '%f', enter_y = '%f', enter_z = '%f', enter_a = '%f', outsideint = %i, outsidevw = %i WHERE propertyid = %i", PropertyInfo[houseid][pEnter_x], PropertyInfo[houseid][pEnter_y], PropertyInfo[houseid][pEnter_z], PropertyInfo[houseid][pEnter_a], PropertyInfo[houseid][pOutsideint], PropertyInfo[houseid][pOutsidevw], PropertyInfo[houseid][pId]);
	    mysql_tquery(handle, query);

	    ReloadProperties();
	    SendClientMessageEx(playerid, COLOR_BLUE, "You've changed the entrance of house %i.", houseid);
	}
	else if(!strcmp(option, "exit", true))
	{
	    GetPlayerPos(playerid, PropertyInfo[houseid][pExit_x], PropertyInfo[houseid][pExit_y], PropertyInfo[houseid][pExit_z]);
	    GetPlayerFacingAngle(playerid, PropertyInfo[houseid][pExit_a]);

	    PropertyInfo[houseid][pInterior] = GetPlayerInterior(playerid);

	    new query[180];
	    mysql_format(handle, query, sizeof(query), "UPDATE property SET exit_x = '%f', exit_y = '%f', exit_z = '%f', exit_a = '%f', interior = %i WHERE propertyid = %i", PropertyInfo[houseid][pExit_x], PropertyInfo[houseid][pExit_y], PropertyInfo[houseid][pExit_z], PropertyInfo[houseid][pExit_a], PropertyInfo[houseid][pInterior], PropertyInfo[houseid][pId]);
	    mysql_tquery(handle, query);

		ReloadProperties();
	    SendClientMessageEx(playerid, COLOR_BLUE, "You've changed the exit of house %i.", houseid);
	}
	else if(!strcmp(option, "world", true))
	{
	    new worldid;

	    if(sscanf(param, "i", worldid))
	    {
	        return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /edithouse houseid world [vw]");
		}

		PropertyInfo[houseid][pVirtualworld] = worldid;

		new query[180];
		mysql_format(handle, query, sizeof(query), "UPDATE property SET virtualworld = %i WHERE propertyid = %i", PropertyInfo[houseid][pVirtualworld], PropertyInfo[houseid][pId]);
	    mysql_tquery(handle, query);

		ReloadProperties();
	    SendClientMessageEx(playerid, COLOR_BLUE, "You've changed the virtual world of house %i to %i.", houseid, worldid);
	}
	else if(!strcmp(option, "group", true))
	{
		new groupid;

	    if(sscanf(param, "i", groupid))
	    {
	        return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /edithouse houseid group [groupid]");
		}
		if(!(0 <= groupid < MAX_GROUPS) || !GroupInfo[groupid][gExists])
		{
		    return SendClientMessage(playerid, COLOR_ERROR, "Invalid groupid.");
		}

		new string[50];
		format(string, sizeof(string), "%s", GroupInfo[groupid][gName]);
		PropertyInfo[houseid][pOwnerid] = GroupInfo[groupid][gID];
		PropertyInfo[houseid][pOwnername] = string;

		new query[180];
		mysql_format(handle, query, sizeof(query), "UPDATE property SET ownerid = %i, ownertype = %i, ownername ='%e' WHERE propertyid = %i", PropertyInfo[houseid][pOwnerid], TYPE_GROUP, PropertyInfo[houseid][pOwnername], PropertyInfo[houseid][pId]);
    	mysql_tquery(handle, query);

		ReloadProperties();
		SendClientMessageEx(playerid, COLOR_BLUE, "You've changed the owner of property %i to %s.", houseid, PropertyInfo[houseid][pOwnername]);
	}
	else if(!strcmp(option, "player", true))
	{
		new targetid;

	    if(sscanf(param, "u", targetid))
	    {
	        return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /edithouse houseid player [playerid]");
		}
		if(!IsPlayerConnected(targetid))
		{
		    return SendClientMessage(playerid, COLOR_ERROR, "The player specified is disconnected.");
		}
		if(targetid == INVALID_PLAYER_ID)
		{
		    return SendClientMessage(playerid, COLOR_GREY, "That player hasn't logged in yet.");
		}

		PropertyInfo[houseid][pOwnerid] = PlayerInfo[targetid][pMasterID];

		new name[50];
		GetPlayerName(targetid, name, sizeof(name));

		PropertyInfo[houseid][pOwnername] = name;

		new query[180];
		mysql_format(handle, query, sizeof(query), "UPDATE property SET ownerid = %i, ownertype = %i, ownername ='%e' WHERE propertyid = %i", PropertyInfo[houseid][pOwnerid], TYPE_PLAYER, PropertyInfo[houseid][pOwnername], PropertyInfo[houseid][pId]);
    	mysql_tquery(handle, query);

		ReloadProperties();
		SendClientMessageEx(playerid, COLOR_BLUE, "You've changed the owner of house %i to %s.", houseid, GetPlayerNameEx(targetid));
	}
	else if(!strcmp(option, "price", true))
	{
	    new price;

	    if(sscanf(param, "i", price))
	    {
	        return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /edithouse houseid price [value]");
		}
		if(price < 0)
		{
		    return SendClientMessage(playerid, COLOR_ERROR, "The price can't be below $0.");
		}

		PropertyInfo[houseid][pPrice] = price;

		new query[180];
		mysql_format(handle, query, sizeof(query), "UPDATE property SET price = %i WHERE propertyid = %i", PropertyInfo[houseid][pPrice], PropertyInfo[houseid][pId]);
	    mysql_tquery(handle, query);

		ReloadProperties();
	    SendClientMessageEx(playerid, COLOR_BLUE, "You've changed the price of house %i to $%i.", houseid, price);
	}

	return 1;
}



CMD:createentrance(playerid, params[])
{
    if(PlayerInfo[playerid][pStaff] < 5) return 0;

	new name[32], Float:x, Float:y, Float:z, Float:a;
	if(sscanf(params, "s[32]", name))
	{
	    return SendClientMessageEx(playerid, COLOR_ERROR, "Correct usage: /createentrance [name]");
	}
	if(GetNearbyProperty(playerid) >= 0)
	{
	    return SendClientMessage(playerid, COLOR_ERROR, "There is already a property nearby.");
	}

	GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, a);

	SendClientMessage(playerid, COLOR_BLUE, "You created a new property");

	new query[256];
	mysql_format(handle, query, sizeof(query), "INSERT INTO property (propertyname, ownerid, ownertype, type, speciality, enter_x, enter_y, enter_z, enter_a, outsideint, outsidevw) VALUES ('%e', -1, %i, %i, %i, '%f', '%f', '%f', '%f', %i, %i)", name, TYPE_STATE, PROPERTY_TYPE_ENTERABLE, ENTERABLE_SPECIALITY_NORMAL, x, y, z, a - 180.0, GetPlayerInterior(playerid), GetPlayerVirtualWorld(playerid));
	mysql_tquery(handle, query, "ReloadProperties");
	return 1;
}

CMD:editentrance(playerid, params[])
{
	new propertyid, option[10], param[32];

	if(PlayerInfo[playerid][pStaff] < 5) return 0;

	if(sscanf(params, "is[10]S()[32]", propertyid, option, param))
	{
	    SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /edithouse [propertyid] [option]");
	    SendClientMessage(playerid, COLOR_ERROR, "options: Enter, Exit, World, Blip, Owner, Name");
	    return 1;
	}
	if(!(0 <= propertyid < MAX_PROPERTIES) || !PropertyInfo[propertyid][pExists])
	{
	    return SendClientMessage(playerid, COLOR_ERROR, "Invalid propertyid.");
	}
	if(PropertyInfo[propertyid][pType] != PROPERTY_TYPE_ENTERABLE)
	{
		return SendClientMessage(playerid, COLOR_ERROR, "This property is not a house.");
	}
	if(!strcmp(option, "enter", true))
	{
	    GetPlayerPos(playerid, PropertyInfo[propertyid][pEnter_x], PropertyInfo[propertyid][pEnter_x], PropertyInfo[propertyid][pEnter_x]);
	    GetPlayerFacingAngle(playerid, PropertyInfo[propertyid][pEnter_a]);

	    PropertyInfo[propertyid][pOutsideint] = GetPlayerInterior(playerid);
	    PropertyInfo[propertyid][pOutsidevw] = GetPlayerVirtualWorld(playerid);

	    new query[180];
	    mysql_format(handle, query, sizeof(query), "UPDATE property SET enter_x = '%f', enter_y = '%f', enter_z = '%f', enter_a = '%f', outsideint = %i, outsidevw = %i WHERE propertyid = %i", PropertyInfo[propertyid][pEnter_x], PropertyInfo[propertyid][pEnter_y], PropertyInfo[propertyid][pEnter_z], PropertyInfo[propertyid][pEnter_a], PropertyInfo[propertyid][pOutsideint], PropertyInfo[propertyid][pOutsidevw], PropertyInfo[propertyid][pId]);
	    mysql_tquery(handle, query);

	    ReloadProperties();
	    SendClientMessageEx(playerid, COLOR_BLUE, "You have changed the entrance of property %i.", propertyid);
	}
	else if(!strcmp(option, "exit", true))
	{
	    GetPlayerPos(playerid, PropertyInfo[propertyid][pExit_x], PropertyInfo[propertyid][pExit_y], PropertyInfo[propertyid][pExit_z]);
	    GetPlayerFacingAngle(playerid, PropertyInfo[propertyid][pExit_a]);

	    PropertyInfo[propertyid][pInterior] = GetPlayerInterior(playerid);

	    new query[180];
	    mysql_format(handle, query, sizeof(query), "UPDATE property SET exit_x = '%f', exit_y = '%f', exit_z = '%f', exit_a = '%f', interior = %i WHERE propertyid = %i", PropertyInfo[propertyid][pExit_x], PropertyInfo[propertyid][pExit_y], PropertyInfo[propertyid][pExit_z], PropertyInfo[propertyid][pExit_a], PropertyInfo[propertyid][pInterior], PropertyInfo[propertyid][pId]);
	    mysql_tquery(handle, query);

		ReloadProperties();
	    SendClientMessageEx(playerid, COLOR_BLUE, "You've changed the exit of property %i.", propertyid);
	}
	else if(!strcmp(option, "world", true))
	{
	    new worldid;

	    if(sscanf(param, "i", worldid))
	    {
	        return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /editentrance propertyid world [vw]");
		}

		PropertyInfo[propertyid][pVirtualworld] = worldid;

		new query[180];
		mysql_format(handle, query, sizeof(query), "UPDATE property SET virtualworld = %i WHERE propertyid = %i", PropertyInfo[propertyid][pVirtualworld], PropertyInfo[propertyid][pId]);
	    mysql_tquery(handle, query);

		ReloadProperties();
	    SendClientMessageEx(playerid, COLOR_BLUE, "You've changed the virtual world of propertyid %i to %i.", propertyid, worldid);
	}
	else if(!strcmp(option, "blip", true))
	{
		new blip;

	    if(sscanf(param, "i", blip))
	    {
	        return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /editentrance propertyid blip [blipid (0 for none)]");
		}

		PropertyInfo[propertyid][pBlipid] = blip;

		new query[180];
		mysql_format(handle, query, sizeof(query), "UPDATE property SET blip = %i WHERE propertyid = %i", blip, PropertyInfo[propertyid][pId]);
    	mysql_tquery(handle, query);

		ReloadProperties();
		SendClientMessageEx(playerid, COLOR_BLUE, "You have changed the property's blip to %i", blip);
	}
	else if(!strcmp(option, "owner", true))
	{
		new ownername[50];

	    if(sscanf(param, "s[50]", ownername))
	    {
	        return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /editentrance propertyid owner [ownername]");
		}

		PropertyInfo[propertyid][pOwnername] = ownername;

		new query[180];
		mysql_format(handle, query, sizeof(query), "UPDATE property SET ownername ='%e' WHERE propertyid = %i", PropertyInfo[propertyid][pOwnername], PropertyInfo[propertyid][pId]);
    	mysql_tquery(handle, query);

		ReloadProperties();
		SendClientMessageEx(playerid, COLOR_BLUE, "You have changed the owner of property %i to %s.", propertyid, ownername);
	}
	else if(!strcmp(option, "name", true))
	{
		new newname[32];

	    if(sscanf(param, "s[32]", newname))
	    {
	        return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /editentrance propertyid name [newname]");
		}

		PropertyInfo[propertyid][pName] = newname;

		new query[180];
		mysql_format(handle, query, sizeof(query), "UPDATE property SET propertyname ='%e' WHERE propertyid = %i", PropertyInfo[propertyid][pName], PropertyInfo[propertyid][pId]);
    	mysql_tquery(handle, query);

		ReloadProperties();
		SendClientMessageEx(playerid, COLOR_BLUE, "You have changed the name of property %i to %s.", propertyid, newname);
	}
	return 1;
}

CMD:deleteproperty(playerid, params[])
{
	new propertyid, confirm[10];

	if(PlayerInfo[playerid][pStaff] < 5) return 0;

	if(sscanf(params, "is", propertyid, confirm))
	{
	    SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /deleteproperty [propertyid] [confirm]");
	    return 1;
	}
	if(!(0 <= propertyid < MAX_PROPERTIES) || !PropertyInfo[propertyid][pExists])
	{
	    return SendClientMessage(playerid, COLOR_ERROR, "Invalid propertyid.");
	} 

    SendClientMessageEx(playerid, COLOR_BLUE, "You have deleted property %i.", propertyid);
	
	new query[128];
	mysql_format(handle, query, sizeof(query), "DELETE FROM property WHERE propertyid = %d;", propertyid);
	mysql_tquery(handle, query, "ReloadProperties");

	return 1;
}

// ========== Business ==========
CMD:createbusiness(playerid, params[]) {
    new speciality;
    if(PlayerInfo[playerid][pStaff] < 5) return 0;

	new price, Float:x, Float:y, Float:z, Float:a;
	if(sscanf(params, "ii", speciality, price))
	{
	    SendClientMessageEx(playerid, COLOR_ERROR, "Correct usage: /createhouse [type] [price]", speciality, price);
	    SendClientMessageEx(playerid, COLOR_ERROR, "type: 24/7 - %i | Pharmacy - %i | Toolstore - %i | Resturant - %i | Clothing - %i", BUSINESS_SPECIALITY_247, BUSINESS_SPECIALITY_PHARMACY, BUSINESS_SPECIALITY_TOOLSTORE, BUSINESS_SPECIALITY_RESTURANT, BUSINESS_SPECIALITY_CLOTHING);
	    SendClientMessageEx(playerid, COLOR_ERROR, "type: Office - %i | Ammunation - %i | Pay N' Spray - %i | Bar - %i", BUSINESS_SPECIALITY_OFFICE, BUSINESS_SPECIALITY_AMMUNATION, BUSINESS_SPECIALITY_PAYNSPRAY, BUSINESS_SPECIALITY_BAR);
	    return 1;
	}

	if(speciality < 0 || speciality > 8) return SendClientMessage(playerid, COLOR_ERROR, "Invaild business type entered!");

	if(GetNearbyProperty(playerid) >= 0)
	{
	    return SendClientMessage(playerid, COLOR_ERROR, "There is already a property nearby.");
	}

	GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, a);

	new query[256];
	mysql_format(handle, query, sizeof(query), "INSERT INTO property (ownerid, ownertype, type, speciality, propertyname, price, enter_x, enter_y, enter_z, enter_a, outsideint, outsidevw) VALUES (-1, %i, %i, %i, '%e', %i, '%f', '%f', '%f', '%f', %i, %i)", TYPE_PLAYER, PROPERTY_TYPE_BUSINESS, speciality, GetBusinessSpeciality(speciality), price, x, y, z, a - 180.0, GetPlayerInterior(playerid), GetPlayerVirtualWorld(playerid));
	mysql_tquery(handle, query, "ReloadProperties");

    SendClientMessage(playerid, COLOR_BLUE, "You created a new property");
    return 1;
}


CMD:editbusiness(playerid, params[])
{
	new businessid, option[10], param[32];

	if(PlayerInfo[playerid][pStaff] < 5) return 0;

	if(sscanf(params, "is[10]S()[32]", businessid, option, param))
	{
	    SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /edithouse [businessid] [option]");
	    SendClientMessage(playerid, COLOR_ERROR, "options: Enter, Exit, World, Stock, Entryfee, Player, Price");
	    return 1;
	}
	if(!(0 <= businessid < MAX_PROPERTIES) || !PropertyInfo[businessid][pExists])
	{
	    return SendClientMessage(playerid, COLOR_ERROR, "Invalid propertyid.");
	}
	if(PropertyInfo[businessid][pType] != PROPERTY_TYPE_BUSINESS)
	{
		return SendClientMessage(playerid, COLOR_ERROR, "This property is not a business.");
	}
	if(!strcmp(option, "enter", true))
	{
	    GetPlayerPos(playerid, PropertyInfo[businessid][pEnter_x], PropertyInfo[businessid][pEnter_x], PropertyInfo[businessid][pEnter_x]);
	    GetPlayerFacingAngle(playerid, PropertyInfo[businessid][pEnter_a]);

	    PropertyInfo[businessid][pOutsideint] = GetPlayerInterior(playerid);
	    PropertyInfo[businessid][pOutsidevw] = GetPlayerVirtualWorld(playerid);

	    new query[180];
	    mysql_format(handle, query, sizeof(query), "UPDATE property SET enter_x = '%f', enter_y = '%f', enter_z = '%f', enter_a = '%f', outsideint = %i, outsidevw = %i WHERE propertyid = %i", PropertyInfo[businessid][pEnter_x], PropertyInfo[businessid][pEnter_y], PropertyInfo[businessid][pEnter_z], PropertyInfo[businessid][pEnter_a], PropertyInfo[businessid][pOutsideint], PropertyInfo[businessid][pOutsidevw], PropertyInfo[businessid][pId]);
	    mysql_tquery(handle, query);

	    ReloadProperties();
	    SendClientMessageEx(playerid, COLOR_BLUE, "You've changed the entrance of house %i.", businessid);
	}
	else if(!strcmp(option, "exit", true))
	{
	    GetPlayerPos(playerid, PropertyInfo[businessid][pExit_x], PropertyInfo[businessid][pExit_y], PropertyInfo[businessid][pExit_z]);
	    GetPlayerFacingAngle(playerid, PropertyInfo[businessid][pExit_a]);

	    PropertyInfo[businessid][pInterior] = GetPlayerInterior(playerid);

	    new query[180];
	    mysql_format(handle, query, sizeof(query), "UPDATE property SET exit_x = '%f', exit_y = '%f', exit_z = '%f', exit_a = '%f', interior = %i WHERE propertyid = %i", PropertyInfo[businessid][pExit_x], PropertyInfo[businessid][pExit_y], PropertyInfo[businessid][pExit_z], PropertyInfo[businessid][pExit_a], PropertyInfo[businessid][pInterior], PropertyInfo[businessid][pId]);
	    mysql_tquery(handle, query);

		ReloadProperties();
	    SendClientMessageEx(playerid, COLOR_BLUE, "You've changed the exit of house %i.", businessid);
	}
	else if(!strcmp(option, "world", true))
	{
	    new worldid;

	    if(sscanf(param, "i", worldid))
	    {
	        return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /edithouse businessid world [vw]");
		}

		PropertyInfo[businessid][pVirtualworld] = worldid;

		new query[180];
		mysql_format(handle, query, sizeof(query), "UPDATE property SET virtualworld = %i WHERE propertyid = %i", PropertyInfo[businessid][pVirtualworld], PropertyInfo[businessid][pId]);
	    mysql_tquery(handle, query);

		ReloadProperties();
	    SendClientMessageEx(playerid, COLOR_BLUE, "You've changed the virtual world of house %i to %i.", businessid, worldid);
	}
	else if(!strcmp(option, "stock", true))
	{
		new amount;

	    if(sscanf(param, "i", amount))
	    {
	        return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /edithouse businessid stock [amount]");
		}

		PropertyInfo[businessid][pStock] = amount;

		new query[180];
		mysql_format(handle, query, sizeof(query), "UPDATE property SET stock = %i WHERE propertyid = %i", amount, PropertyInfo[businessid][pId]);
    	mysql_tquery(handle, query);

		ReloadProperties();
		SendClientMessageEx(playerid, COLOR_BLUE, "You've changed the owner of property %i to %s.", businessid, PropertyInfo[businessid][pOwnername]);
	}
	else if(!strcmp(option, "entryfee", true))
	{
		new amount;

	    if(sscanf(param, "i", amount))
	    {
	        return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /edithouse businessid entryfee [amount]");
		}

		PropertyInfo[businessid][pEntryfee] = amount;

		new query[180];
		mysql_format(handle, query, sizeof(query), "UPDATE property SET entryfee = %i WHERE propertyid = %i", amount, PropertyInfo[businessid][pId]);
    	mysql_tquery(handle, query);

		SendClientMessageEx(playerid, COLOR_BLUE, "You've changed the owner of property %i to %s.", businessid, PropertyInfo[businessid][pOwnername]);
	}
	else if(!strcmp(option, "player", true))
	{
		new targetid;

	    if(sscanf(param, "u", targetid))
	    {
	        return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /edithouse businessid player [playerid]");
		}
		if(!IsPlayerConnected(targetid))
		{
		    return SendClientMessage(playerid, COLOR_ERROR, "The player specified is disconnected.");
		}
		if(targetid == INVALID_PLAYER_ID)
		{
		    return SendClientMessage(playerid, COLOR_GREY, "That player hasn't logged in yet.");
		}

		PropertyInfo[businessid][pOwnerid] = PlayerInfo[targetid][pMasterID];

		new name[50];
		GetPlayerName(targetid, name, sizeof(name));

		PropertyInfo[businessid][pOwnername] = name;

		new query[180];
		mysql_format(handle, query, sizeof(query), "UPDATE property SET ownerid = %i, ownertype = %i, ownername ='%e' WHERE propertyid = %i", PropertyInfo[businessid][pOwnerid], TYPE_PLAYER, PropertyInfo[businessid][pOwnername], PropertyInfo[businessid][pId]);
    	mysql_tquery(handle, query);

		ReloadProperties();
		SendClientMessageEx(playerid, COLOR_BLUE, "You've changed the owner of house %i to %s.", businessid, GetPlayerNameEx(targetid));
	}
	else if(!strcmp(option, "price", true))
	{
	    new price;

	    if(sscanf(param, "i", price))
	    {
	        return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /edithouse businessid price [value]");
		}
		if(price < 0)
		{
		    return SendClientMessage(playerid, COLOR_ERROR, "The price can't be below $0.");
		}

		PropertyInfo[businessid][pPrice] = price;

		new query[180];
		mysql_format(handle, query, sizeof(query), "UPDATE property SET price = %i WHERE propertyid = %i", PropertyInfo[businessid][pPrice], PropertyInfo[businessid][pId]);
	    mysql_tquery(handle, query);

		ReloadProperties();
	    SendClientMessageEx(playerid, COLOR_BLUE, "You've changed the price of house %i to $%i.", businessid, price);
	}

	return 1;
}




CMD:gotoproperty(playerid, params[])
{
	new propertyid;
	if(PlayerInfo[playerid][pStaff] < 4) return 0;

	if(sscanf(params, "i", propertyid))
	{
	    SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /gotoproperty [propertyid]");
	    return 1;
	}
	if(!(0 <= propertyid < MAX_PROPERTIES) || !PropertyInfo[propertyid][pExists])
	{
	    return SendClientMessage(playerid, COLOR_ERROR, "Invalid propertyid.");
	} 

	TeleportToCoords(playerid, PropertyInfo[propertyid][pEnter_x], PropertyInfo[propertyid][pEnter_y], PropertyInfo[propertyid][pEnter_z], PropertyInfo[propertyid][pEnter_a], PropertyInfo[propertyid][pOutsideint], PropertyInfo[propertyid][pOutsidevw]);
    SendAdminMessage(COLOR_ALERT, "GOTO | %s has teleported to propertyid %i", GetPlayerNameEx(playerid), propertyid);
	return 1;
}