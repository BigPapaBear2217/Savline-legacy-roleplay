CMD:engine(playerid, params[])
{
	if(!IsPlayerInAnyVehicle(playerid))
		return SendClientMessage(playerid, COLOR_ERROR, "You are not inside a vehicle");

	new Float:health;
	new vehicleid = GetPlayerVehicleID(playerid);
	GetVehicleHealth(vehicleid, health);

	if(!vehicleid || GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
	{
	    return SendClientMessage(playerid, COLOR_ERROR, "You are not driving the vehicle.");
	}

	if(!VehicleHasEngine(vehicleid))
		return SendClientMessage(playerid, COLOR_ERROR, "This vehicle has no engine");

    if(health <= 300.0)
    {
        return SendClientMessage(playerid, COLOR_GREY, "The engine is too damaged to start.");
    }

	if(!GetEngineStatus(vehicleid)) {
		SetEngineStatus(vehicleid, 1);
		SendClientMessage(playerid, COLOR_BLUE, "You turned on the vehicle engine");
		SendProximityMessage(playerid, 20.0, COLOR_OOC, "* %s"COL_OOC" turns on the engine of the vehicle", GetRoleplayName(playerid, true));
		return 1;
	}

	SetEngineStatus(vehicleid, 0);
	SendClientMessage(playerid, COLOR_BLUE, "You turned off the vehicle engine");
	SendProximityMessage(playerid, 20.0, COLOR_OOC, "* %s"COL_OOC" turns off the engine of the vehicle", GetRoleplayName(playerid, true));

	return 1;
}

CMD:lights(playerid, params[])
{
	new vehicleid = GetPlayerVehicleID(playerid);

	if(!vehicleid || GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
	{
	    return SendClientMessage(playerid, COLOR_ERROR, "You must be driving a vehicle.");
	}
	if(!VehicleHasEngine(vehicleid))
	{
	    return SendClientMessage(playerid, COLOR_ERROR, "This vehicle has no lights which can be turned on.");
	}

	if(!GetLightStatus(vehicleid))
	{
	    SetLightStatus(vehicleid, 1);
	    SendProximityMessage(playerid, 20.0, COLOR_OOC, "* %s"COL_OOC" turns on the lights of the vehicle", GetRoleplayName(playerid, true));
	}
	else
	{
	    SetLightStatus(vehicleid, 0);
	    SendProximityMessage(playerid, 20.0, COLOR_OOC, "* %s"COL_OOC" turns off the lights of the vehicle", GetRoleplayName(playerid, true));
	}

	return 1;
}