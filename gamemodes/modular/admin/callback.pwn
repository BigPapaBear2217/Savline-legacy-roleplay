#include <YSI_Coding\y_hooks>


// ---------- ADMIN CALLBACKS ----------
hook OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ){
    if(PlayerInfo[playerid][pStaff] >= 1) {
        if(PlayerInfo[playerid][pAdminDuty] == true) {
        	PreventFall(playerid);
            SetPlayerPosFindZ(playerid, fX, fY, fZ+5);
            return SendClientMessage(playerid, COLOR_BLUE, "You have been teleported to the marked location!");
        }
    }
    return 1;
}