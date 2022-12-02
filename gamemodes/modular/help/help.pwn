#include <YSI_Coding\y_hooks>

/*

S A V L I N E - R P G
contains functions related /help

*/

stock D_HELP(playerid)
{
	ShowPlayerDialog(playerid, DIALOG_HELP, DIALOG_STYLE_LIST, "Main", "-> Account\n-> Jobs\n-> Economy\n-> Groups\n-> Properties\n-> Vehicles\n-> Criminal\n-> Commands\n[!] {fc7e00}Rules", "Select", "Close");
	return 1;
}

stock D_HELP_ACCOUNT(playerid)
{
	ShowPlayerDialog(playerid, DIALOG_HELP_GOTOMAIN, DIALOG_STYLE_MSGBOX, "Account", "(working)", "Back", "Exit");
	return 1;
}

stock D_HELP_JOBS(playerid)
{
	ShowPlayerDialog(playerid, DIALOG_HELP_JOBS, DIALOG_STYLE_LIST, "Jobs", "(will be updated)\n{ff0000}Go back", "Select", "Exit");
	return 1;
}

stock D_HELP_ECONOMY(playerid)
{
	ShowPlayerDialog(playerid, DIALOG_HELP_GOTOMAIN, DIALOG_STYLE_MSGBOX, "Economy", "(will be updated)", "Back", "Exit");
	return 1;
}

stock D_HELP_GROUP(playerid)
{
	ShowPlayerDialog(playerid, DIALOG_HELP_GROUP, DIALOG_STYLE_LIST, "Groups", "-> Group Information 1/4\n-> Group Information 2/4\n->Group Information 3/4\n-> Group Information 4/4\n-> Group Commands\n   {ff0000}Go back", "Select", "Exit");
	return 1;
}

stock D_HELP_GROUP_1(playerid)
{
	ShowPlayerDialog(playerid, DIALOG_HELP_GOTOMAIN, DIALOG_STYLE_MSGBOX, "Group Information (1/5) - How to create group ?", "(Will be updated)", "Back", "Exit");
	return 1;
}

stock D_HELP_GROUP_2(playerid)
{
	ShowPlayerDialog(playerid, DIALOG_HELP_GOTOMAIN, DIALOG_STYLE_MSGBOX, "Group Information (2/5) - Group types and Information", "(Will be updated)", "Back", "Exit");
	return 1;
}

stock D_HELP_GROUP_3(playerid)
{
	ShowPlayerDialog(playerid, DIALOG_HELP_GOTOMAIN, DIALOG_STYLE_MSGBOX, "Group Information (3/5) - Group points", "(Will be updated)", "Back", "Exit");
	return 1;
}

stock D_HELP_GROUP_4(playerid)
{
	ShowPlayerDialog(playerid, DIALOG_HELP_GOTOMAIN, DIALOG_STYLE_MSGBOX, "Group Information (4/5) - Group Official Information", "(Will be updated)", "Back", "Exit");
	return 1;
}

stock D_HELP_GROUP_5(playerid)
{
	ShowPlayerDialog(playerid, DIALOG_HELP_GOTOMAIN, DIALOG_STYLE_MSGBOX, "Group Information (5/5) - Group Headquarters", "(Will be updated)", "Back", "Exit");
	return 1;
}

stock D_HELP_GROUP_COMMANDS(playerid)
{
	ShowPlayerDialog(playerid, DIALOG_HELP_GOTOMAIN, DIALOG_STYLE_MSGBOX, "Group Commands", "(Will be updated)", "Back", "Exit");
	return 1;
}

stock D_HELP_PROPERTIES(playerid)
{
	ShowPlayerDialog(playerid, DIALOG_HELP_PROPERTIES, DIALOG_STYLE_LIST, "Property", "-> Player Houses\n-> Businesses\n-> Group Headquarters\n   {ff0000}Go back", "Back", "Exit");
	return 1;
}