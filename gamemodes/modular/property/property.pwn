#include <YSI_Coding\y_hooks>

forward LoadProperties();
public LoadProperties()
{
	new row_count;
    cache_get_row_count(row_count);
    for(new i = 0; i < row_count && i < MAX_PROPERTIES; i ++)
    {
        new propertyid;
        cache_get_value_name_int(i, "propertyid", propertyid);

        PropertyInfo[propertyid][pId] = propertyid;

        cache_get_value_name_int(i, "ownerid", PropertyInfo[propertyid][pOwnerid]);
        cache_get_value_name_int(i, "ownertype", PropertyInfo[propertyid][pOwnertype]);
        cache_get_value_name(i, "ownername", PropertyInfo[propertyid][pOwnername]);
        cache_get_value_name_int(i, "type", PropertyInfo[propertyid][pType]);
        cache_get_value_name_int(i, "blip", PropertyInfo[propertyid][pBlipid]);
        cache_get_value_name_int(i, "speciality", PropertyInfo[propertyid][pSpeciality]);
        cache_get_value_name(i, "propertyname", PropertyInfo[propertyid][pName]);
        cache_get_value_name_int(i, "price", PropertyInfo[propertyid][pPrice]);
        cache_get_value_name_int(i, "entryfee", PropertyInfo[propertyid][pEntryfee]);
        cache_get_value_name_int(i, "locked", PropertyInfo[propertyid][pLocked]);

        cache_get_value_name_float(i, "enter_x", PropertyInfo[propertyid][pEnter_x]);
        cache_get_value_name_float(i, "enter_y", PropertyInfo[propertyid][pEnter_y]);
        cache_get_value_name_float(i, "enter_z", PropertyInfo[propertyid][pEnter_z]);
        cache_get_value_name_float(i, "enter_a", PropertyInfo[propertyid][pEnter_a]);
        cache_get_value_name_float(i, "exit_x", PropertyInfo[propertyid][pExit_x]);
        cache_get_value_name_float(i, "exit_y", PropertyInfo[propertyid][pExit_y]);
        cache_get_value_name_float(i, "exit_z", PropertyInfo[propertyid][pExit_z]);
        cache_get_value_name_float(i, "exit_a", PropertyInfo[propertyid][pExit_a]);

        cache_get_value_name_int(i, "interior", PropertyInfo[propertyid][pInterior]);
        cache_get_value_name_int(i, "virtualworld", PropertyInfo[propertyid][pVirtualworld]);
        cache_get_value_name_int(i, "outsideint", PropertyInfo[propertyid][pOutsideint]);
        cache_get_value_name_int(i, "outsidevw", PropertyInfo[propertyid][pOutsidevw]);
        cache_get_value_name_int(i, "propertysafe", PropertyInfo[propertyid][pPropertysafe]);
        cache_get_value_name_int(i, "stock", PropertyInfo[propertyid][pStock]);


        PropertyInfo[propertyid][pExists] = 1;

        if(PropertyInfo[propertyid][pType] == PROPERTY_TYPE_HOUSE)
        {
            if(PropertyInfo[propertyid][pOwnertype] == TYPE_PLAYER && PropertyInfo[propertyid][pOwnerid] == -1) // UNOWNED HOUSE
                PropertyInfo[propertyid][pPickup] =  CreateDynamicPickup(1273, 1, PropertyInfo[propertyid][pEnter_x], PropertyInfo[propertyid][pEnter_y], PropertyInfo[propertyid][pEnter_z], PropertyInfo[propertyid][pOutsidevw], PropertyInfo[propertyid][pOutsideint]);
                    
            if(PropertyInfo[propertyid][pOwnertype] == TYPE_PLAYER && PropertyInfo[propertyid][pOwnerid] != -1) // OWNED HOUSE
                PropertyInfo[propertyid][pPickup] =  CreateDynamicPickup(19522, 1, PropertyInfo[propertyid][pEnter_x], PropertyInfo[propertyid][pEnter_y], PropertyInfo[propertyid][pEnter_z], PropertyInfo[propertyid][pOutsidevw], PropertyInfo[propertyid][pOutsideint]);

            if(PropertyInfo[propertyid][pOwnertype] == TYPE_GROUP) // GROUPHQ
                PropertyInfo[propertyid][pPickup] = CreateDynamicPickup(19523, 1, PropertyInfo[propertyid][pEnter_x], PropertyInfo[propertyid][pEnter_y], PropertyInfo[propertyid][pEnter_z], PropertyInfo[propertyid][pOutsidevw], PropertyInfo[propertyid][pOutsideint]);

            LoadPropertyStorage(propertyid);
        }
        else if(PropertyInfo[propertyid][pType] == PROPERTY_TYPE_BUSINESS)
        {
            if(GetBusinessBlip(PropertyInfo[propertyid][pSpeciality]) != 0)
            {
                PropertyInfo[propertyid][pBlip] = CreateDynamicMapIcon(PropertyInfo[propertyid][pEnter_x], PropertyInfo[propertyid][pEnter_y], PropertyInfo[propertyid][pEnter_z], GetBusinessBlip(PropertyInfo[propertyid][pSpeciality]), 0, 0, -1, -1, STREAMER_MAP_ICON_SD, MAPICON_LOCAL);
            }
            
            PropertyInfo[propertyid][pPickup] = CreateDynamicPickup(1274, 1, PropertyInfo[propertyid][pEnter_x], PropertyInfo[propertyid][pEnter_y], PropertyInfo[propertyid][pEnter_z], PropertyInfo[propertyid][pOutsidevw], PropertyInfo[propertyid][pOutsideint]);
        }
        else if(PropertyInfo[propertyid][pType] == PROPERTY_TYPE_ENTERABLE) // GOVT ENTRANCE
        {
            if(PropertyInfo[propertyid][pBlipid] != 0)
            {
                PropertyInfo[propertyid][pBlip] = CreateDynamicMapIcon(PropertyInfo[propertyid][pEnter_x], PropertyInfo[propertyid][pEnter_y], PropertyInfo[propertyid][pEnter_z], PropertyInfo[propertyid][pBlipid], 0, 0, -1, -1, STREAMER_MAP_ICON_SD, MAPICON_LOCAL);
            }

            PropertyInfo[propertyid][pPickup] = CreateDynamicPickup(1314, 1, PropertyInfo[propertyid][pEnter_x], PropertyInfo[propertyid][pEnter_y], PropertyInfo[propertyid][pEnter_z], PropertyInfo[propertyid][pOutsidevw], PropertyInfo[propertyid][pOutsideint]);
        }
    }

    printf("LOADED | %i properties", row_count);
}


forward UnloadProperty(propertyid);
public UnloadProperty(propertyid)
{
    if(IsValidDynamicPickup(PropertyInfo[propertyid][pPickup]))
        DestroyDynamicPickup(PropertyInfo[propertyid][pPickup]);

    PropertyInfo[propertyid][pId] = -1;

    PropertyInfo[propertyid][pOwnerid] = -1;
    PropertyInfo[propertyid][pOwnertype] = 0;
    PropertyInfo[propertyid][pType] = 0;
    PropertyInfo[propertyid][pSpeciality] = 0;
    PropertyInfo[propertyid][pName] = 0;
    PropertyInfo[propertyid][pPrice] = 0;
    PropertyInfo[propertyid][pEntryfee] = 0;
    PropertyInfo[propertyid][pLocked] = 0;

    PropertyInfo[propertyid][pEnter_x] = 0;
    PropertyInfo[propertyid][pEnter_y] = 0;
    PropertyInfo[propertyid][pEnter_z] = 0;
    PropertyInfo[propertyid][pEnter_a] = 0;
    PropertyInfo[propertyid][pExit_x] = 0;
    PropertyInfo[propertyid][pExit_y] = 0;
    PropertyInfo[propertyid][pExit_z] = 0;
    PropertyInfo[propertyid][pExit_a] = 0;

    PropertyInfo[propertyid][pInterior] = 0;
    PropertyInfo[propertyid][pVirtualworld] = 0;
    PropertyInfo[propertyid][pOutsideint] = 0;
    PropertyInfo[propertyid][pOutsidevw] = 0;
    PropertyInfo[propertyid][pPropertysafe] = 0;
    PropertyInfo[propertyid][pStock] = 0;

    PropertyInfo[propertyid][pExists] = 0;

    printf("UNLOADED | PROPERTY %i", propertyid);
}


forward ReloadProperties();
public ReloadProperties()
{
    for(new i = 0; i < MAX_PROPERTIES; i++)
    {
        if(IsValidDynamicPickup(PropertyInfo[i][pPickup]))
            DestroyDynamicPickup(PropertyInfo[i][pPickup]);

        if(IsValidDynamicMapIcon(PropertyInfo[i][pBlip]))
            DestroyDynamicMapIcon(PropertyInfo[i][pBlip]);

        PropertyInfo[i][pId] = -1;

        PropertyInfo[i][pOwnerid] = -1;
        PropertyInfo[i][pOwnertype] = 0;
        PropertyInfo[i][pType] = 0;
        PropertyInfo[i][pSpeciality] = 0;
        PropertyInfo[i][pName] = 0;
        PropertyInfo[i][pPrice] = 0;
        PropertyInfo[i][pEntryfee] = 0;
        PropertyInfo[i][pLocked] = 0;

        PropertyInfo[i][pEnter_x] = 0;
        PropertyInfo[i][pEnter_y] = 0;
        PropertyInfo[i][pEnter_z] = 0;
        PropertyInfo[i][pEnter_a] = 0;
        PropertyInfo[i][pExit_x] = 0;
        PropertyInfo[i][pExit_y] = 0;
        PropertyInfo[i][pExit_z] = 0;
        PropertyInfo[i][pExit_a] = 0;

        PropertyInfo[i][pInterior] = 0;
        PropertyInfo[i][pVirtualworld] = 0;
        PropertyInfo[i][pOutsideint] = 0;
        PropertyInfo[i][pOutsidevw] = 0;
        PropertyInfo[i][pPropertysafe] = 0;
        PropertyInfo[i][pStock] = 0;

        PropertyInfo[i][pExists] = 0;
    }

    mysql_tquery(handle, "SELECT * FROM property", "LoadProperties");
    printf("RELOADED | ALL PROPERTIES");
}

GetNearbyProperty(playerid)
{
    for(new i = 0; i < MAX_PROPERTIES; i++)
    {
        if(PropertyInfo[i][pExists] && IsPlayerInRangeOfPoint(playerid, 2.0, PropertyInfo[i][pEnter_x], PropertyInfo[i][pEnter_y], PropertyInfo[i][pEnter_z]) && GetPlayerInterior(playerid) == PropertyInfo[i][pOutsideint] && GetPlayerVirtualWorld(playerid) == PropertyInfo[i][pOutsidevw])
        {
            return i;
        }
    }

    return -1;
}

GetInsideProperty(playerid)
{
    for(new i = 0; i < MAX_PROPERTIES; i++)
    {
        if(PropertyInfo[i][pExists] && IsPlayerInRangeOfPoint(playerid, 100.0, PropertyInfo[i][pExit_x], PropertyInfo[i][pExit_y], PropertyInfo[i][pExit_z]) && GetPlayerInterior(playerid) == PropertyInfo[i][pInterior] && GetPlayerVirtualWorld(playerid) == PropertyInfo[i][pVirtualworld])
        {
            return i;
        }
    }

    return -1;
}

IsPlayerPropertyOwner(playerid, propertyid)
{
    if(PropertyInfo[propertyid][pOwnerid] && PropertyInfo[propertyid][pOwnertype] == TYPE_PLAYER)
    {
        if(PropertyInfo[propertyid][pOwnerid] == PlayerInfo[playerid][pMasterID])
            return 1;
    }
    return 0;
}

EnterCheck(playerid)
{
    new id;

    if((id = GetNearbyProperty(playerid)) >= 0)
    {
        if((PropertyInfo[id][pExit_x] == 0) && (PropertyInfo[id][pExit_y] == 0) && (PropertyInfo[id][pExit_z] == 0))
        {
            SendClientMessage(playerid, COLOR_ERROR, "This property has no interior.");
            return 0;
        }
        if(PropertyInfo[id][pLocked])
        {
            SendClientMessage(playerid, COLOR_ERROR, "This property is locked.");
            return 0;
        }

        if(IsPlayerPropertyOwner(playerid, id))
        {
            SendProximityMessage(playerid, 20.0, COLOR_OOC, "* %s"COL_OOC" has entered their property", GetRoleplayName(playerid, true));
        }
        else
        {
            SendProximityMessage(playerid, 20.0, COLOR_OOC, "* %s"COL_OOC" has entered the property", GetRoleplayName(playerid, true));
        }

        PreventFall(playerid);
        SetPlayerPos(playerid, PropertyInfo[id][pExit_x], PropertyInfo[id][pExit_y], PropertyInfo[id][pExit_z]);
        SetPlayerFacingAngle(playerid, PropertyInfo[id][pExit_a]);
        SetPlayerInterior(playerid, PropertyInfo[id][pInterior]);
        SetPlayerVirtualWorld(playerid, PropertyInfo[id][pVirtualworld]);
        SetCameraBehindPlayer(playerid);
        return 1;
    }

    return 0;
}

ExitCheck(playerid)
{
    new id;

    if((id = GetInsideProperty(playerid)) >= 0 && IsPlayerInRangeOfPoint(playerid, 3.0, PropertyInfo[id][pExit_x], PropertyInfo[id][pExit_y], PropertyInfo[id][pExit_z]))
    {
        SendProximityMessage(playerid, 20.0, COLOR_OOC, "* %s"COL_OOC" has exited the property", GetRoleplayName(playerid, true));
        PreventFall(playerid);
        SetPlayerPos(playerid, PropertyInfo[id][pEnter_x], PropertyInfo[id][pEnter_y], PropertyInfo[id][pEnter_z]);
        SetPlayerFacingAngle(playerid, PropertyInfo[id][pEnter_a]);
        SetPlayerInterior(playerid, PropertyInfo[id][pOutsideint]);
        SetPlayerVirtualWorld(playerid, PropertyInfo[id][pOutsidevw]);
        SetCameraBehindPlayer(playerid);
        return 1;
    }

    return 0;
}

hook OnPlayerPickUpDynPickup(playerid, pickupid)
{
    for(new i = 0; i != MAX_PROPERTIES; i ++)
    {
        if(pickupid == PropertyInfo[i][pPickup])
        {
            new propertyvalue[180], propertyowner[180], propertyname[180];

            format(propertyname, sizeof(propertyname), "%s~w~, %i", PropertyInfo[i][pName], PropertyInfo[i][pId]);
            PlayerTextDrawSetString(playerid, propertyTDname[playerid], propertyname);

            format(propertyowner, sizeof(propertyowner), "~b~Owner:~w~ %s", PropertyInfo[i][pOwnername]);
            PlayerTextDrawSetString(playerid, propertyTDowner[playerid], propertyowner);

            if(PropertyInfo[i][pType] == PROPERTY_TYPE_HOUSE && PropertyInfo[i][pOwnertype] == TYPE_PLAYER)
            {
                format(propertyvalue, sizeof(propertyvalue), "~g~Price:~w~ %s", FormatNumber(PropertyInfo[i][pPrice]));
                PlayerTextDrawSetString(playerid, propertyTDvalue[playerid], propertyvalue);
            }

            if((PropertyInfo[i][pType] == PROPERTY_TYPE_HOUSE && PropertyInfo[i][pOwnertype] == TYPE_GROUP) || (PropertyInfo[i][pType] == PROPERTY_TYPE_ENTERABLE))
            {
                new MapZone:zone = GetPlayerMapZone(playerid);
                new name[MAX_MAP_ZONE_NAME];
                GetMapZoneName(zone, name);
                format(propertyvalue, sizeof(propertyvalue), "~g~Address:~w~ %s, %i", name, PropertyInfo[i][pId]);
                PlayerTextDrawSetString(playerid, propertyTDvalue[playerid], propertyvalue);
            }

            if(PropertyInfo[i][pType] == PROPERTY_TYPE_BUSINESS && PropertyInfo[i][pOwnertype] == TYPE_PLAYER && PropertyInfo[i][pOwnerid] == -1)
            {
                format(propertyvalue, sizeof(propertyvalue), "~g~Price:~w~ %s", FormatNumber(PropertyInfo[i][pPrice]));
                PlayerTextDrawSetString(playerid, propertyTDvalue[playerid], propertyvalue);
            }

            if(PropertyInfo[i][pType] == PROPERTY_TYPE_BUSINESS && PropertyInfo[i][pOwnertype] == TYPE_PLAYER && PropertyInfo[i][pOwnerid] != -1)
            {
                format(propertyvalue, sizeof(propertyvalue), "~g~Entry Fee:~w~ %s", FormatNumber(PropertyInfo[i][pEntryfee]));
                PlayerTextDrawSetString(playerid, propertyTDvalue[playerid], propertyvalue);
            }

            PlayerTextDrawShow(playerid, propertyTDbackground[playerid]);
            PlayerTextDrawShow(playerid, propertyTDRedbackground[playerid]);
            PlayerTextDrawShow(playerid, propertyTDenter[playerid]);

            PlayerTextDrawShow(playerid, propertyTDvalue[playerid]);
            PlayerTextDrawShow(playerid, propertyTDowner[playerid]);
            PlayerTextDrawShow(playerid, propertyTDname[playerid]);

            PlayerTextDrawShow(playerid, propertyTDpropertyinfo[playerid]);

            SetTimerEx("HidePropertyTextdraw", 2500, false, "ii", playerid, i);
        }
    }
}

forward HidePropertyTextdraw(playerid, pid);
public HidePropertyTextdraw(playerid, pid)
{
    if(!IsPlayerInRangeOfPoint(playerid, 2.0, PropertyInfo[pid][pEnter_x], PropertyInfo[pid][pEnter_y], PropertyInfo[pid][pEnter_z])){
        PlayerTextDrawHide(playerid, propertyTDbackground[playerid]);
        PlayerTextDrawHide(playerid, propertyTDRedbackground[playerid]);
        PlayerTextDrawHide(playerid, propertyTDenter[playerid]);
        PlayerTextDrawHide(playerid, propertyTDvalue[playerid]);
        PlayerTextDrawHide(playerid, propertyTDowner[playerid]);
        PlayerTextDrawHide(playerid, propertyTDname[playerid]);
        PlayerTextDrawHide(playerid, propertyTDpropertyinfo[playerid]);
    }
}

DoesPlayerOwnProperty(playerid, propertyid)
{
    if(PropertyInfo[propertyid][pOwnertype] == TYPE_PLAYER && PropertyInfo[propertyid][pOwnerid] == PlayerInfo[playerid][pMasterID]) return 1;
    else return 0;
}

/*
HasGroupPropertyPerms(playerid, tag, propertyid)
{
    if(PropertyInfo[propertyid][pOwnerid] == PlayerInfo[playerid][pMasterID]) return 1;
    else return 0;
}
*/