forward LoadGasStations();
public LoadGasStations()
{
	new row_count;
    cache_get_row_count(row_count);
    for(new i = 0; i < row_count && i < MAX_GASSTATIONS; i ++)
    {
        new gasid;
        cache_get_value_name_int(i, "gasId", gasid);

        GasInfo[gasid][gasID] = gasid;

        cache_get_value_name_int(i, "propertyId", GasInfo[gasid][gasProperty]);
        cache_get_value_name_int(i, "liters", GasInfo[gasid][gasLiters]);
        cache_get_value_name_int(i, "price", GasInfo[gasid][gasPrice]);
        cache_get_value_name_float(i, "gasX", GasInfo[gasid][gasX]);
        cache_get_value_name_float(i, "gasY", GasInfo[gasid][gasY]);
        cache_get_value_name_float(i, "gasZ", GasInfo[gasid][gasZ]);


        GasInfo[gasid][gasExists] = 1;

        new string[180];
        format(string, sizeof(string), "Gas Station\n{GREEN}%s{FFFFFF} per liter\n{GREEN}%i {FFFFFF}/ 2,000 liter", FormatNumber(GasInfo[gasid][gasPrice]), GasInfo[gasLiters]);

        GasInfo[gasid][gasLabel] = CreateDynamic3DTextLabel(string, COLOR_WHITE, GasInfo[gasid][gasX], GasInfo[gasid][gasY], GasInfo[gasid][gasZ], 15);
    }

    printf("LOADED | %i gas stations", row_count);
}

forward ReloadGasStations();
public ReloadGasStations()
{
    for(new i = 0; i < MAX_GASSTATIONS; i++)
    {
        if(IsValidDynamic3DTextLabel(GasInfo[i][gasLabel]))
            DestroyDynamic3DTextLabel(GasInfo[i][gasLabel]);

        GasInfo[i][gasID] = 1;
        GasInfo[i][gasProperty] = -1;
        GasInfo[i][gasLiters] = 0;
        GasInfo[i][gasPrice] = 0;

        GasInfo[i][gasX] = 0;
        GasInfo[i][gasY] = 0;
        GasInfo[i][gasZ] = 0;

        GasInfo[i][gasExists] = 0;

    }

    mysql_tquery(handle, "SELECT * FROM `gas_station`", "LoadProperties");
    printf("RELOADED | ALL GAS STATIONS");
}

CMD:creategasstation(playerid, params[])
{
    if(PlayerInfo[playerid][pStaff] < 5) return 0;

    new propertyid, Float:x, Float:y, Float:z;
    if(sscanf(params, "i", propertyid))
    {
        return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /creategasstation [propertyid]");
    }

    if(PropertyInfo[propertyid][pType] != PROPERTY_TYPE_BUSINESS)
    {
        return SendClientMessage(playerid, COLOR_ERROR, "This property is not a business.");
    }

    if(PropertyInfo[propertyid][pSpeciality] != BUSINESS_SPECIALITY_247)
    {
        return SendClientMessage(playerid, COLOR_ERROR, "Only 24/7's can have gas stations.");
    }

    GetPlayerPos(playerid, x, y, z);

    new query[256];
    mysql_format(handle, query, sizeof(query), "INSERT INTO property (propertyId, liters, price, gasX, gasY, gasZ) VALUES (%i, 0, 20, '%f', '%f', '%f')", propertyid, x, y, z);
    mysql_tquery(handle, query, "ReloadGasStations");

    SendClientMessageEx(playerid, COLOR_BLUE, "You created a gas station linked to propertyid %i", propertyid);
    return 1;
}