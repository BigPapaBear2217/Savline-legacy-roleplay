#include <YSI_Coding\y_hooks>

public OnGameModeInit()
{
	handle = mysql_connect(DB_HOST, DB_USER, DB_PASS, DB_NAME);
	
	if(mysql_errno(handle) == 0) printf("[! | MYSQL] Connection successful"); //returns number of errors. 0 means no errors..
	else
	{
	    new error[100];
	    mysql_error(error, sizeof(error), handle);
		printf("[! | MySQL] Connection Failed : %s", error);
	}

	UpdateTime(); // Start custom scripted server time
	SetWeather(6); // Set the server's weather 
	EnableStuntBonusForAll(0); // So players dont get money by doing stunts
	DisableInteriorEnterExits(); // Default interiors dont show
	DisableCrashDetectLongCall(); // Disable crash detect long callbacks time
	ManualVehicleEngineAndLights(); // Tell the server that the script will handle vehicles
	SetGameModeText("Savline RPG V1.0"); // gamemode text shown in the client
	ShowPlayerMarkers(PLAYER_MARKERS_MODE_STREAMED); // show markers to nearby players

	// LOAD GROUPS
	mysql_tquery(handle, "SELECT * FROM `groups`", "LoadGroups");

	// LOAD PROPERTIES
	mysql_tquery(handle, "SELECT * FROM `property`", "LoadProperties");

	// LOAD GAS STATIONS
	mysql_tquery(handle, "SELECT * FROM `gas_station`", "LoadGasStations");

	return 1;
}

public OnGameModeExit()
{
	foreach(new i : Player)
	{
		if(PlayerInfo[i][pLoggedIn]) SavePlayerData(i);
	}
	mysql_close(handle);
	return 1;
}