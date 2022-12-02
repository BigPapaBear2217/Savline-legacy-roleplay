forward OnCheatDetected(playerid, ip_address[], type, code);
public OnCheatDetected(playerid, ip_address[], type, code)
{
	if(type) BlockIpAddress(ip_address, 0);
	else
	{
		switch(code)
		{
			case 5, 6, 11, 14, 22, 32: return 1;
			case 40: SendClientMessage(playerid, -1, MAX_CONNECTS_MSG);
			case 41: SendClientMessage(playerid, -1, UNKNOWN_CLIENT_MSG);
			default:
			{
				SendReasonCode(playerid, type, code);
			}
		}
		//AntiCheatKickWithDesync(playerid, code);
	}
	return 1;
}

forward SendReasonCode(playerid, type, code);
public SendReasonCode(playerid, type, code)
{
	if(code == 0)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: Airbreak (on foot)", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 1)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: Airbreak (vehicle)", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 2)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: Teleport hack (on foot)", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 3)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: Airbreak (vehicle)", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 4)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: Teleport hacks (between vehicles)", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 5)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: Teleport hacks (vehicle to player)", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 6)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: Teleport hacks (pickups)", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 7)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: Fly hacks (on foot)", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 8)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: Fly hacks (vehicle)", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 9)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: Speedhack (on foot)", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 10)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: Speedhack (vehicle)", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 11)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: Health hack (vehicle)", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 12)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: Health hack (on foot)", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 13)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: Armour hack", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 14)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: Money hack", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 15)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: Qeapon hack", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 16)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: Ammo hack (add)", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 17)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: Ammo hack (infinite)", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 18)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: Special actions hack", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 19)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: Godmode from bullets (on foot)", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 20)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: Godmode from bullets", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 21)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: Invisible hack", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 22)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: Lagcomp-spoof", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 23)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: Tuning hack", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 24)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: Parkour mod", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 25)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: Quick turn", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 26)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: Rapid fire", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 27)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: Fake spawn", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 28)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: Fake kill", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 29)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: Pro aim", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 30)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: CJ run", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 31)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: Carshot", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 32)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: Carjack", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 33)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: Unfreeze", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 34)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: AFK ghost", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 35)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: Full aiming", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 36)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: Fake npc", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 37)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: Reconnect", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 38)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s has a high ping", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 39)
    {
		//SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: dialog hack", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 40)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: protection from sandbox", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 42)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: rcon hack", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 43)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: tuning crasher", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 44)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: invalid seat crasher", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 45)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: dialog crasher", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 46)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: attached object crasher", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 47)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: weapon crasher", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 48)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: protection from connection flood (one slot)", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 49)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: callback functions flood", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 50)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: flood seat changing", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 51)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]: %s could be using: Dos", GetPlayerNameEx(playerid));
		return 1;
	}
	if(code == 52)
    {
		SendAdminMessage(COLOR_ANTICHEAT, "[Anticheat]:  %s could be using: NOPs", GetPlayerNameEx(playerid));
		return 1;
	}
	return 1;
}