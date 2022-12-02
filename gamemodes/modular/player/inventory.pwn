#include <YSI_Coding\y_hooks>

forward LoadPlayerInventoryData(playerid);
public LoadPlayerInventoryData(playerid){
    new query[128];
    mysql_format(handle, query, sizeof(query), "SELECT * FROM player_inventory WHERE Master_ID = %d;", PlayerInfo[playerid][pMasterID]);
    mysql_tquery(handle, query, "OnPlayerInventoryDataLoad", "d", playerid);
    return 1;
}

forward SavePlayerInventoryData(playerid);
public SavePlayerInventoryData(playerid){

    new query[380];
    mysql_format(handle, query, sizeof(query), "UPDATE player_inventory SET Acetone = %d, Calcium = %d, C4 = %d, Laptop = %d, Lithium = %d, Heroin = %d, Marked_Money = %d, Meth = %d, Phone = %d, Sodium = %d, Toluene = %d, Walkie_Talkie = %d, Water = %d, Weed = %d, Weed_Seed = %d WHERE Master_ID = %d;", pInv[playerid][Acetone], pInv[playerid][Calcium], pInv[playerid][C4], pInv[playerid][Laptop], pInv[playerid][Lithium], pInv[playerid][Heroin], pInv[playerid][Marked_Money], pInv[playerid][Meth], pInv[playerid][Phone], pInv[playerid][Sodium], pInv[playerid][Toluene], pInv[playerid][Walkie_Talkie], pInv[playerid][Water], pInv[playerid][Weed], pInv[playerid][Weed_Seed], PlayerInfo[playerid][pMasterID]);
    mysql_tquery(handle, query, "ResetPlayerInventoryData", "d", playerid);
    return 1;
}

forward ResetPlayerInventoryData(playerid);
public ResetPlayerInventoryData(playerid) {
    for(new i =0; i<MAX_ITEMS;i++){
        pInv[playerid][P_ITEMS:i] = 0;
    }
    return 1;
}

forward OnPlayerInventoryDataLoad(playerid);
public OnPlayerInventoryDataLoad(playerid){
    if(cache_num_rows()){
        for(new i = 0; i < MAX_ITEMS; i++){
            cache_get_value_name_int(0, itemNames[i], pInv[playerid][P_ITEMS:i]);
        }
        // cache_get_value_name_int(0, "Acetone", pInv[playerid][Acetone]);
        // cache_get_value_name_int(0, "Calcium", pInv[playerid][Calcium]);
        // cache_get_value_name_int(0, "C4", pInv[playerid][C4]);
        // cache_get_value_name_int(0, "Laptop", pInv[playerid][Laptop]);
        // cache_get_value_name_int(0, "Lithium", pInv[playerid][Lithium]);
        // cache_get_value_name_int(0, "Heroin", pInv[playerid][Heroin]);
        // cache_get_value_name_int(0, "Marked_Money", pInv[playerid][Marked_Money]);
        // cache_get_value_name_int(0, "Meth", pInv[playerid][Meth]);
        // cache_get_value_name_int(0, "Phone", pInv[playerid][Phone]);
        // cache_get_value_name_int(0, "Sodium", pInv[playerid][Sodium]);
        // cache_get_value_name_int(0, "Toluene", pInv[playerid][Toluene]);
        // cache_get_value_name_int(0, "Walkie_Talkie", pInv[playerid][Walkie_Talkie]);
        // cache_get_value_name_int(0, "Water", pInv[playerid][Water]);
        // cache_get_value_name_int(0, "Weed", pInv[playerid][Weed]);
        // cache_get_value_name_int(0, "Weed_Seed", pInv[playerid][Weed_Seed]);
        print("Player inventory data loaded!");
    }
    else{
        new query[128];
        mysql_format(handle, query, sizeof(query), "INSERT INTO player_inventory (Master_ID) VALUES ('%i');", PlayerInfo[playerid][pMasterID]);
        mysql_tquery(handle, query);
    }
    return 1;
}

GivePlayerItem(playerid, itemid, amount)
{
    new query[128];
    
    if(itemid >= sizeof(itemNames))
        return 0;
    
    pInv[playerid][P_ITEMS:itemid] += amount;

    // Update the database after player disconnect
    mysql_format(handle, query, sizeof(query), "UPDATE player_inventory SET %s = %i WHERE Master_ID = '%e';", ReturnItemName(itemid), pInv[playerid][P_ITEMS:itemid], PlayerInfo[playerid][pMasterID]);
    mysql_tquery(handle, query);
    return 1;
}

CMD:items(playerid) return cmd_inventory(playerid);
CMD:inventory(playerid){
    // print("Executing inventory....");
    new string[256];
    new empty, select, giveplayerid, giveamount;
    format(string, sizeof string, "Item\tQuantity\n");
    // print("ITEMS CALL 1");
    for(new i=0;i < MAX_ITEMS;i++)
    {
        new string2[42];
        if(pInv[playerid][P_ITEMS:i] > 0)
        {
            format(string2, sizeof(string2), "%s\t%i\n", ReturnItemName(i), pInv[playerid][P_ITEMS:i]);
            // printf("ITEMS CALL 2: %s", string2);
            strcat(string, string2);
        }
        else if(pInv[playerid][P_ITEMS:i] <= 0)
        {
            empty++;
            if(empty == MAX_ITEMS)
            {
                return SendClientMessage(playerid, COLOR_ERROR, "You don't have any items in your inventory.");
            }
        }
    }
    
    // Amount Dialog response
    inline const ResponseGiveI(pid, dialogid, response, listitem, string:inputtext[])
    {
        #pragma unused pid, dialogid, listitem
        if(response)
        {
            if(!sscanf(inputtext, "d", giveamount))
            {
                for(new i=select;i<MAX_ITEMS;i++)
                {
                    if(pInv[playerid][P_ITEMS:i] > 0)
                    {
                        if(giveamount < 0)
                        {
                            return SendClientMessage(playerid, COLOR_ERROR, "You have a entered a invalid amount.");
                        }
                        else if(giveamount > pInv[playerid][P_ITEMS:i])
                        {
                            return SendClientMessageEx(playerid, COLOR_ERROR, "You have only (%d) %s to give.", pInv[playerid][P_ITEMS:i], ReturnItemName(i));
                        }
                        else if(giveplayerid == playerid){
                            return SendClientMessage(playerid, COLOR_ERROR, "You can't give items to yourself.");
                        }
                        pInv[giveplayerid][P_ITEMS:i] += giveamount;
                        pInv[playerid][P_ITEMS:i] -= giveamount;
                        SendClientMessageEx(giveplayerid, COLOR_GREEN, "%s has just give you %s in amount of %d", ReturnPlayerName(playerid), ReturnItemName(i), giveamount);
                        return SendClientMessageEx(playerid, COLOR_GREEN, "You just give %s to %s in amount of %d", ReturnItemName(i), ReturnPlayerName(giveplayerid), giveamount);
                    }
                }
            }
            else
            {
                return SendClientMessage(playerid, COLOR_ERROR, "You have a entered a invalid amount.");
            }
        }
    }

    // Player Name or ID Input
    inline const ResponseGiveP(pid, dialogid, response, listitem, string:inputtext[])
    {
        #pragma unused pid, dialogid, listitem
        if(response)
        {
            if(!sscanf(inputtext, "u", giveplayerid))
            {
                if(giveplayerid == INVALID_PLAYER_ID)
                {
                    return SendClientMessage(playerid, COLOR_ERROR, "You have entered a invalid playerid.");
                }
 
                return Dialog_ShowCallback(playerid, using inline ResponseGiveI, DIALOG_STYLE_INPUT, "Amount", "Please enter the amount of item to give.", "Okay", "Close");
            }
            else
            {
                return SendClientMessage(playerid, COLOR_ERROR, "You have entered a invalid playerid.");
            }
        }
    }

    // Give, Drop, Use Selection
    inline const ResponseIO(pid, dialogid, response, listitem, string:inputtext[])
    {
        #pragma unused pid, dialogid, inputtext
        if(response)
        {
            switch(listitem)
            {
                // Give
                case 0:
                {
                    for(new i=select;i<MAX_ITEMS;i++)
                    {
                        if(pInv[playerid][P_ITEMS:i] > 0)
                        {
                            if(P_ITEMS:i == P_ITEMS:Phone || P_ITEMS:i == P_ITEMS:Walkie_Talkie) return SendClientMessage(playerid, COLOR_ERROR, "Item is not give-able.");
                            return Dialog_ShowCallback(playerid, using inline ResponseGiveP, DIALOG_STYLE_INPUT, "Player", "Enter the Player (ID or Name).", "Okay", "Close");
                        }
                    }
                }
                // Drop
                case 1:
                {
                    for(new i=select;i<MAX_ITEMS;i++)
                    {
                        if(pInv[playerid][P_ITEMS:i] > 0)
                        {
                            SendClientMessageEx(playerid, -1, "You selected: %d | Drop", listitem);
                            return SendClientMessageEx(playerid, -1, "You have %s : %d", ReturnItemName(i), pInv[playerid][P_ITEMS:i]);
                        }
                    }
                }
                // Use
                case 2:
                {
                    for(new i=select;i<MAX_ITEMS;i++)
                    {
                        if(pInv[playerid][P_ITEMS:i] > 0)
                        {
                            SendClientMessageEx(playerid, -1, "You selected: %d | Use", listitem);
                            return SendClientMessageEx(playerid, -1, "You have %s : %d", ReturnItemName(i), pInv[playerid][P_ITEMS:i]);
                        }
                    }
                }
            }
        }
    }
    // Items Selection
    inline const Response(pid, dialogid, response, listitem, string:inputtext[])
    {
        #pragma unused pid, inputtext, dialogid
        if(response)
        {
            select = GetCurrentCaseItem(playerid, listitem);
            return Dialog_ShowCallback(playerid, using inline ResponseIO, DIALOG_STYLE_LIST, "Option", "Give\nDrop\nUse", "Okay", "Close");
        }
    }

    Dialog_ShowCallback(playerid, using inline Response, DIALOG_STYLE_TABLIST_HEADERS, "Inventory", string, "Okay", "Close");
    return 1;
}

// public GetRealItem(current_case, previous_case){
//     if(TotalItemFromCurrentCase(current_case) > 1){
//         for(new i = 0; i < MAX_ITEMS; i++){

//         }
//     }
// }

// forward TotalItemFromCurrentCase(current_case);
// public TotalItemFromCurrentCase(current_case){
//     new total_item = 0;
//     for(new i = current_case; i<MAX_ITEMS; i++){
//         if(pInv[playerid][P_ITEMS:i] > 0){
//             total_item++;
//         }
//     }
// }

forward GetCurrentCaseItem(playerid, current_case);
public GetCurrentCaseItem(playerid, current_case){
    new find_item = 0;
    for(new i = 0; i< MAX_ITEMS; i++){
        if(pInv[playerid][P_ITEMS:i] > 0){
            if(find_item == current_case){
                return i;
            }
            find_item++;
        }
    }
    return -1;
}

forward GetPlayerTotalItems(playerid);
public GetPlayerTotalItems(playerid){
    new total_item = 0;
    for(new i = 0; i<MAX_ITEMS; i++){
        if(pInv[playerid][P_ITEMS:i] > 0){
            total_item++;
        }
    }
    return total_item;
}

// stock GetItemName(itemid, removeUnderscores = false)
// {
//     new itemName[30];
// 	if(itemid > MAX_ITEMS) return itemName;
//     // new size = sizeof(itemNames[itemid]);
// 	if(removeUnderscores){
//         format(itemName, sizeof(itemName), "%s", ReplaceUnderscoresWithSpaces(itemNames[itemid]));
//     }
//  	else{
//     	itemName = itemNames[itemid];
//     }
//     return itemName;
// }

stock GetItemID(const itemString[])
{
	for(new i = 0; i < MAX_ITEMS; ++i)
	{
	    if(!strcmp(itemString, itemNames[i], true))
	        return i;
	}
	return -1;
}


// stock ReplaceUnderscoresWithSpaces(const str[])
// {
// 	new output[10][30], finalstring[30];
//     new count;
//     count = strexplode(output, str, "_");
// 	for(new i = 0;i < count; i++){
//         print(output[i]);
//     }
//     strimplode(" ", finalstring, sizeof(finalstring), output);
//     print(finalstring);
//     return finalstring;
// }

stock ReturnItemName(item){
    new string[30];
    switch(item){
        case 0: string = "Acetone";
        case 1: string = "Calcium";
        case 2: string = "C4";
        case 3: string = "Laptop";
        case 4: string = "Lithium";
        case 5: string = "Heroin";
        case 6: string = "Marked Money";
        case 7: string = "Meth";
        case 8: string = "Phone";
        case 9: string = "Sodium";
        case 10: string = "Toluene";
        case 11: string = "Walkie Talkie";
        case 12: string = "Water";
        case 13: string = "Weed";
        case 14: string = "Weed Seed";
    }
    return string;
}