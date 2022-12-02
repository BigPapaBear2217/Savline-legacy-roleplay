#include <YSI_Coding\y_hooks>

/*

S A V L I N E - R P G
account.pwn
contains account logging in, registering, saving.

*/

SavePlayerData(playerid)
{
	new query[256], pname[MAX_PLAYER_NAME], Float:px, Float:py, Float:pz, Float:pa, Float:health, Float:armour;
	
 	GetPlayerName(playerid, pname, sizeof(pname));
	GetPlayerPos(playerid, px, py, pz);
	GetPlayerFacingAngle(playerid, pa);
	GetPlayerHealth(playerid, health);
	GetPlayerArmour(playerid, armour);

	mysql_format(handle, query, sizeof(query), 
		"UPDATE users SET PosX = %f, PosY = %f, PosZ = %f, PosA = %f, Level = %i, Exp = %d, Exp_Timestamp = %d, Health = %f, Armour = %f, Money = %i, Skin = %i, Pms = %i WHERE Master_ID = %i;",
		px, py, pz, pa, PlayerInfo[playerid][pLevel], PlayerInfo[playerid][pExp], _:Now(), health, armour, GetPlayerMoney(playerid), GetPlayerSkin(playerid), PlayerInfo[playerid][pPMS], PlayerInfo[playerid][pMasterID]);
	mysql_query(handle, query);

	SavePlayerInventoryData(playerid);
	SavePlayerBankData(playerid);
	SavePlayerPhoneData(playerid);

	return 1;
}

forward OnPlayerJoin(playerid);
public OnPlayerJoin(playerid)
{	
	ResetPlayerInfo(playerid);

	InterpolateCameraPos(playerid, 1332.7262, -1071.3055, 83.0842, 1383.8170, -909.1896, 74.4843, 10000);
	InterpolateCameraLookAt(playerid, 1333.0266, -1070.3523, 83.0337, 1384.1174, -908.2363, 74.4337, 10000);

	cache_get_value_name_int(0, "Master_ID", PlayerInfo[playerid][pMasterID]); // FOR BAN CHECK

	new query[180];
	mysql_format(handle, query, sizeof(query), "SELECT * FROM bans WHERE ip = '%e' OR bannedId = %i", GetPlayerIpEx(playerid), PlayerInfo[playerid][pMasterID]);
	mysql_pquery(handle, query, "IsPlayerBanned", "d", playerid);

	if(cache_num_rows()){
		new loginstr[200];
		format(loginstr, sizeof(loginstr), "{FFFFFF}Wazzup, {00FF22}%s{FFFFFF}! You have already registered on our server.\n{FFFFFF}Simply type your password below in order to login.", GetPlayerNameEx(playerid));
		ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, SERVER_NAME, loginstr, "Login", "Quit");
	}
	else
	{
		new registerstr[200];
		format(registerstr, sizeof(registerstr), "{FFFFFF}Welcome, {00FF22}%s{FFFFFF}! It looks like you are new here.\n{00FF22}Simply type your password below in order to register.", GetPlayerNameEx(playerid));
		
		if(strfind(GetPlayerNameEx(playerid), "_") == -1) {
			SendClientMessage(playerid, COLOR_ERROR, "Your name must be formatted as Firstname_Lastname. Please rejoin with a acceptable name");
			KickPlayer(playerid);
		}
		ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD, SERVER_NAME, registerstr, "Register", "Quit");
	}
	return 1;
}

forward IsPlayerBanned(playerid);
public IsPlayerBanned(playerid)
{
	if(cache_num_rows() != 0) {
		SendClientMessageEx(playerid, COLOR_ALERT, "The IP Address %s and/or the username %s is currently banned", GetPlayerIpEx(playerid), GetPlayerNameEx(playerid));
		SendClientMessage(playerid, COLOR_ALERT, "[!] Please do not attempt to ban evade, else your chances of being unbanned will reduce.");
		SendClientMessage(playerid, COLOR_ALERT, "[!] IF you think this is a mistake, contact a staff member.");
		SendClientMessage(playerid, COLOR_ALERT, "Join the discord server to process ban appeals or to contact a staff member.");
		SendClientMessage(playerid, COLOR_BLUE, "https://discord.gg/ZetDQBZVyJ");
		KickPlayer(playerid);
	}
}

forward OnPlayerRegister(playerid);
public OnPlayerRegister(playerid)
{
	SendClientMessage(playerid, COLOR_GREEN, "Welcome to "SERVER_NAME", you may now login.");
	PlayerInfo[playerid][pFirstTime] = 1;
	print("OnPlayerRegister");
    ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, SERVER_NAME, "{FFFFFF}Welcome to {00FF22}"SERVER_NAME"{FFFFFF}! you can now login.\nSimply type your password below in order to login.", "Login", "Quit");
	return 1;
}

forward OnPlayerLogin(playerid);
public OnPlayerLogin(playerid)
{
	new pPass[255], unhashed_pass[128];
	GetPVarString(playerid, "Unhashed_Pass",unhashed_pass,sizeof(unhashed_pass));
	if(cache_num_rows())
	{
		cache_get_value_name(0, "Password", pPass);
		printf("%s has loaded master id: %d", ReturnPlayerName(playerid), PlayerInfo[playerid][pMasterID]);
		bcrypt_check(unhashed_pass, pPass, "OnPassCheck", "dd",playerid, PlayerInfo[playerid][pMasterID]);
  	}
    else printf("ERROR");
	return 1;
}

forward OnPassHash(playerid);
public OnPassHash(playerid)
{
	new pass[BCRYPT_HASH_LENGTH], query[256], pname[MAX_PLAYER_NAME], pipadress[16];
    GetPlayerIp(playerid, pipadress, sizeof(pipadress));
    GetPlayerName(playerid, pname, sizeof(pname));
    bcrypt_get_hash(pass);
	print("On Pass Hash");
    mysql_format(handle, query, sizeof(query), "INSERT INTO users (Name, Password, RegisteredIP, Register_Timestamp) VALUES ('%e', '%e', '%e', %i);", pname, pass, pipadress, _:Now());
	mysql_tquery(handle, query, "OnPlayerRegister", "d", playerid);
	return 1;
}

forward OnPassCheck(playerid, DBID);
public OnPassCheck(playerid, DBID)
{
    if(bcrypt_is_equal())
	{
		new query[128];
		mysql_format(handle, query, sizeof(query), "SELECT * FROM users WHERE Master_ID = %d;", DBID);
		mysql_tquery(handle, query, "SetPlayerInfo", "i", playerid);
	}
	else
	{
		if(PlayerInfo[playerid][pPassFailed] >= 3)
		{
			KickPlayer(playerid);
		}

		PlayerInfo[playerid][pPassFailed]++;
		SendClientMessageEx(playerid, COLOR_ERROR, "You have %i/3 login attempts remaining", PlayerInfo[playerid][pPassFailed]);

		ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, SERVER_NAME, "{FF2121}You entered an incorrect password!\n{FFFFFF}You have already registered to {00FF22}"SERVER_NAME"{FFFFFF}!\n{FFFFFF}Simply type your password below in order to login.", "Login", "Quit");
	}
	return 1;
}

forward SetPlayerInfo(playerid);
public SetPlayerInfo(playerid)
{
	// DATABASE LOAD
	cache_get_value_name_float(0, "PosX", PlayerInfo[playerid][PX]);
	cache_get_value_name_float(0, "PosY", PlayerInfo[playerid][PY]);
	cache_get_value_name_float(0, "PosZ", PlayerInfo[playerid][PZ]);
	cache_get_value_name_float(0, "PosA", PlayerInfo[playerid][PA]);
	cache_get_value_name_float(0, "Health", PlayerInfo[playerid][pHealth]);
	cache_get_value_name_float(0, "Armour", PlayerInfo[playerid][pArmour]);
	cache_get_value_name_int(0, "Skin", PlayerInfo[playerid][pSkin]);
	cache_get_value_name_int(0, "storeSkin", PlayerInfo[playerid][pStoreSkin]);
	cache_get_value_name_int(0, "Money", PlayerInfo[playerid][pCash]);
	cache_get_value_name_int(0, "Level", PlayerInfo[playerid][pLevel]);
	cache_get_value_name_int(0, "Exp", PlayerInfo[playerid][pExp]);
	cache_get_value_name_int(0, "Exp_Timestamp", _:PlayerInfo[playerid][pExpTimestamp]);
	cache_get_value_name_int(0, "Staff", PlayerInfo[playerid][pStaff]);
	cache_get_value_name_int(0, "Chatmode", PlayerInfo[playerid][pChatmode]);
	cache_get_value_name_int(0, "Accent", PlayerInfo[playerid][pAccent]);
	cache_get_value_name_int(0, "Pms", PlayerInfo[playerid][pPMS]);
	
	PlayerInfo[playerid][pLoggedIn] = true;
	
	SetPlayerHealth(playerid, PlayerInfo[playerid][pHealth]);
	SetPlayerArmour(playerid, PlayerInfo[playerid][pArmour]);
	SetPlayerScore(playerid, PlayerInfo[playerid][pLevel]);

	// Added other modules Load Data Here
	LoadPlayerInventoryData(playerid); // 'player/inventory.pwn'
	LoadPlayerWTData(playerid); // 'player/wt.pwn' [No need to save wt data on disconnect]
	LoadPlayerBankData(playerid); // 'bank/bank.pwn'
	LoadPlayerPhoneData(playerid); // 'player/phone.pwn'

	if(PlayerInfo[playerid][pFirstTime] == 1)
	{
		SendClientMessage(playerid, COLOR_GREEN, "You have successfully registered on "SERVER_NAME", welcome!");
		SendClientMessage(playerid, COLOR_BLUE, "Use /ask if you have a question, use /support if you want a staff member to show you around the server.");
		SendClientMessageToAllEx(COLOR_RED, "%s (ID: %i) has registered on the server. Wish them goodluck!", GetPlayerNameEx(playerid), playerid);
		SetSpawnInfo(playerid, 0, PlayerInfo[playerid][pSkin], 1786.2971, -1892.0979, 13.3939, 267.5381, 0, 0, 0, 0, 0, 0);
	}
	else {
		SetSpawnInfo(playerid, 0, PlayerInfo[playerid][pSkin], PlayerInfo[playerid][PX], PlayerInfo[playerid][PY], PlayerInfo[playerid][PZ],PlayerInfo[playerid][PA], 0, 0, 0, 0, 0, 0);
	}

	TogglePlayerSpectating(playerid, false);
	TogglePlayerControllable(playerid, true);

	DeletePVar(playerid, "Unhashed_Pass");

	new country[45];
	GetPlayerCountry(playerid, country, sizeof(country));

	SendAdminMessage(COLOR_ANTICHEAT, "[Login] %s (%i) logged in! Level %i | Country: %s", GetPlayerNameEx(playerid), playerid, PlayerInfo[playerid][pLevel], country);
	SendClientMessageToAllEx(COLOR_GREY, "* %s (%i) logged in to the server.", GetPlayerNameEx(playerid), playerid);
	SendClientMessageEx(playerid, COLOR_GREEN, "You successfully logged in, %s.", GetPlayerNameEx(playerid));

	PlayerTextDrawShow(playerid, savline_text_armour[playerid]); // armour indicator
	PlayerTextDrawShow(playerid, savline_text_health[playerid]); // health indicator
	TextDrawShowForPlayer(playerid, savline_time); // Server sided clock

    new query[128];  
    mysql_format(handle, query, sizeof(query), "SELECT * FROM group_members WHERE Master_ID = %i LIMIT %i;", PlayerInfo[playerid][pMasterID], MAX_GROUP_SLOTS);
    mysql_tquery(handle, query, "LoadPlayerGroups", "d", playerid);
    
	SpawnPlayer(playerid);

	SetPlayerState(playerid);
	return 1;
}

ResetPlayerInfo(playerid)
{
	PlayerInfo[playerid][pMasterID] = 0;
	PlayerInfo[playerid][PX] = 0;
	PlayerInfo[playerid][PY] = 0;
	PlayerInfo[playerid][PZ] = 0;
	PlayerInfo[playerid][PA] = 0;
	PlayerInfo[playerid][pHealth] = 100;
	PlayerInfo[playerid][pArmour] = 0;
	PlayerInfo[playerid][pSkin] = 0;
	PlayerInfo[playerid][pLevel] = 0;
	PlayerInfo[playerid][pExp] = 0;
	PlayerInfo[playerid][pExpTimestamp] = Timestamp:0;
	PlayerInfo[playerid][pStaff] = 0;
	PlayerInfo[playerid][pAdminDuty] = false;
	PlayerInfo[playerid][pChatmode] = 0;
	PlayerInfo[playerid][pAccent] = 0;
	PlayerInfo[playerid][pPMS] = 0;

	PlayerInfo[playerid][pPublicChat] = 0;
	PlayerInfo[playerid][pAskChat] = 0;

	PlayerInfo[playerid][pFirstTime] = 0;
	PlayerInfo[playerid][pPassFailed] = 0;
	PlayerInfo[playerid][pKicked] = 0;
	PlayerInfo[playerid][pFreeze] = 0;
	PlayerInfo[playerid][pSpecating] = false;
	PlayerInfo[playerid][pVPN] = false;
	PlayerInfo[playerid][pEditingGroup] = 0;
	PlayerInfo[playerid][pEditingGRank] = 0;

	ResetPlayerGroups(playerid);
	return 1;
}