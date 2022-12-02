stock GetVehicleSpeed(vehicleid)
{
	new
	    Float:x,
	    Float:y,
	    Float:z;

	if(GetVehicleVelocity(vehicleid, x, y, z))
	{
		return floatsqroot((x * x) + (y * y) + (z * z)) * 181.5;
	}

	return 0.0;
}

stock VehicleHasWindows(vehicleid)
{
    static const vehicleWindows[] = {
	    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0,
		1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 1, 1, 1, 0,
		0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1,
		0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0,
		1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
		1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1,
		0, 1, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0
	};

	new
	    model = GetVehicleModel(vehicleid);

	if(400 <= model <= 611)
	{
	    return vehicleWindows[model - 400];
	}

	return 0;
}

stock VehicleHasEngine(vehicleid)
{
	static const vehicleEngines[] = {
		1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
		1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
		1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
		1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
		1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
		1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1,
		1, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0
	};

	new
	    modelid = GetVehicleModel(vehicleid);

	if(400 <= modelid <= 611)
	{
		return vehicleEngines[modelid - 400];
	}

	return 0;
}

stock GetVehicleSeatCount(vehicleid)
{
    static const vehicleSeats[] =
	{
		4, 2, 2, 2, 4, 4, 1, 2, 2, 4, 2, 2, 2, 4, 2, 2, 4, 2, 4, 2, 4, 4, 2, 2, 2, 1, 4, 4, 4, 2,
		1, 7, 1, 2, 2, 0, 2, 7, 4, 2, 4, 1, 2, 2, 2, 4, 1, 2, 1, 0, 0, 2, 1, 1, 1, 2, 2, 2, 4,
		4, 2, 2, 2, 2, 1, 1, 4, 4, 2, 2, 4, 2, 1, 1, 2, 2, 1, 2, 2, 4, 2, 1, 4, 3, 1, 1, 1, 4, 2,
		2, 4, 2, 4, 1, 2, 2, 2, 4, 4, 2, 2, 1, 2, 2, 2, 2, 2, 4, 2, 1, 1, 2, 1, 1, 2, 2, 4, 2, 2,
		1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 4, 1, 1, 1, 2, 2, 2, 2, 7, 7, 1, 4, 2, 2, 2, 2, 2, 4, 4,
		2, 2, 4, 4, 2, 1, 2, 2, 2, 2, 2, 2, 4, 4, 2, 2, 1, 2, 4, 4, 1, 0, 0, 1, 1, 2, 1, 2, 2, 1, 2,
		4, 4, 2, 4, 1, 0, 4, 2, 2, 2, 2, 0, 0, 7, 2, 2, 1, 4, 4, 4, 2, 2, 2, 2, 2, 4, 2, 0, 0, 0,
		4, 0, 0
	};

	new
	    modelid = GetVehicleModel(vehicleid);

	if(400 <= modelid <= 611)
	{
		return vehicleSeats[modelid - 400];
	}

	return 0;
}

stock IsSeatOccupied(vehicleid, seatid)
{
	foreach(new i : Player)
	{
	    if(IsPlayerInVehicle(i, vehicleid) && GetPlayerVehicleSeat(i) == seatid)
	    {
	        return 1;
		}
	}

	return 0;
}

stock GetVehicleName(vehicleid)
{
	new
		modelid = GetVehicleModel(vehicleid),
		name[32];

	if(400 <= modelid <= 611)
	    strcat(name, vehicleNames[modelid - 400]);
	else
	    name = "Unknown";

	return name;
}

stock GetVehicleModelByName(const string[])
{
	new
	    modelid = strval(string);

	if(400 <= modelid <= 611)
	{
	    return modelid;
	}

	for(new i = 0; i < sizeof(vehicleNames); i ++)
	{
		if(strfind(vehicleNames[i], string, true) != -1)
  		{
			return i + 400;
		}
	}

	return 0;
}

stock GetVehicleDriver(vehicleid)
{
	foreach(new i : Player)
	{
	    if(IsPlayerInVehicle(i, vehicleid) && GetPlayerState(i) == PLAYER_STATE_DRIVER)
	    {
	        return i;
		}
	}

	return INVALID_PLAYER_ID;
}

stock IsVehicleOccupied(vehicleid)
{
	foreach(new i : Player)
	{
	    if(IsPlayerInVehicle(i, vehicleid) && GetPlayerState(i) == PLAYER_STATE_DRIVER)
	    {
	        return 1;
		}
	}

	return 0;
}

stock GetEngineStatus(vehicleid)
{
	new
	    engine,
	    lights,
	    alarm,
	    doors,
	    hood,
	    trunk,
	    objective;

	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, hood, trunk, objective);

	if (engine != 1)
		return 0;

	return 1;
}

stock GetHoodStatus(vehicleid)
{
	new
	    engine,
	    lights,
	    alarm,
	    doors,
	    hood,
	    trunk,
	    objective;

	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, hood, trunk, objective);

	if (bonnet != 1)
		return 0;

	return 1;
}

stock GetTrunkStatus(vehicleid)
{
	new
	    engine,
	    lights,
	    alarm,
	    doors,
	    hood,
	    trunk,
	    objective;

	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, hood, trunk, objective);

	if (boot != 1)
		return 0;

	return 1;
}

stock GetLightStatus(vehicleid)
{
	new
	    engine,
	    lights,
	    alarm,
	    doors,
	    hood,
	    trunk,
	    objective;

	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, hood, trunk, objective);

	if (lights != 1)
		return 0;

	return 1;
}

stock SetEngineStatus(vehicleid, status)
{
	new
	    engine,
	    lights,
	    alarm,
	    doors,
	    hood,
	    trunk,
	    objective;

	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, hood, trunk, objective);
	return SetVehicleParamsEx(vehicleid, status, lights, alarm, doors, hood, trunk, objective);
}

stock SetLightStatus(vehicleid, status)
{
	new
	    engine,
	    lights,
	    alarm,
	    doors,
	    hood,
	    trunk,
	    objective;

	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, hood, trunk, objective);
	return SetVehicleParamsEx(vehicleid, engine, status, alarm, doors, hood, trunk, objective);
}

stock SetHoodStatus(vehicleid, status)
{
	new
	    engine,
	    lights,
	    alarm,
	    doors,
	    hood,
	    trunk,
	    objective;

	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, hood, trunk, objective);
	return SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, status, trunk, objective);
}

stock SetTrunkStatus(vehicleid, status)
{
	new
	    engine,
	    lights,
	    alarm,
	    doors,
	    hood,
	    trunk,
	    objective;

	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, hood, trunk, objective);
	return SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, hood, status, objective);
}

stock SetObjectiveStatus(vehicleid, status)
{
	new
	    engine,
	    lights,
	    alarm,
	    doors,
	    hood,
	    trunk,
	    objective;

	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, hood, trunk, objective);
	return SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, hood, trunk, status);
}