#include <YSI_Coding\y_hooks>

#define MAX_WEED_FIELD 9
#define MAX_WEED_PLANT 10000
new Total_Weed_Plant;

enum WEED_INFO{
    Text3D:TextLabel,
    Timer,
    STREAMER_TAG_OBJECT:Object
};
new Weed_Info[MAX_WEED_PLANT][WEED_INFO];

enum WEED_FIELD{
    AngelPine_Beach,
    Bayside_Hill,
    Missionary_Hill,
    Mount_Chiliad,
    Ocean_Flats,
    Sherman_Hill,
    The_Farm,
    TR_Hill,
    TR_Town,
};
new Weed_Field[WEED_FIELD];


new Float:AngelPine_Points[] = { // Angle Pine
    -2670.0,-2223.0,-2807.0,-2324.0,-2817.0,-2438.0,-2811.0,-2518.0,-2760.0,-2604.0,-2714.0,-2739.0,-2615.0,-2851.0,-2424.0,-2862.0,-2382.0,-2840.0,-2309.0,-2848.0,
    -2255.0,-2833.0,-2093.0,-2844.0,-2007.0,-2845.0,-1844.0,-2759.0,-1801.0,-2736.0,-2004.0,-2790.0,-2153.0,-2807.0,-2259.0,-2799.0,-2453.0,-2723.0,-2514.0,-2724.0,
    -2572.0,-2669.0,-2605.0,-2587.0,-2624.0,-2505.0,-2654.0,-2433.0,-2667.0,-2374.0,-2651.0,-2317.0,-2630.0,-2294.0,-2670.0,-2223.0
};
new Float:Bayside_Hill_Points[] = { // Bayside Hill
    -2119.0,2654.0,-2177.0,2762.0,-2020.0,2822.0,-1839.0,2829.0,-1725.0,2824.0,-1622.0,2819.0,-1625.0,2777.0,-1759.0,2765.0,-1905.0,2693.0,-2015.0,2679.0,
    -2119.0,2654.0
};
new Float:Missionary_Hill_Points[] = { // Missionary Hill
    -2785.0,-515.0,-2843.0,-912.0,-2706.0,-836.0,-2591.0,-804.0,-2360.0,-860.0,-2259.0,-898.0,-2225.0,-777.0,-2347.0,-814.0,-2391.0,-748.0,-2383.0,-698.0,
    -2432.0,-645.0,-2480.0,-640.0,-2484.0,-725.0,-2551.0,-726.0,-2556.0,-608.0,-2666.0,-554.0,-2723.0,-549.0,-2785.0,-515.0
};
new Float:Mount_Chiliad_Points[] = { // Mount Chiliad
    -2790.0,-1210.0,-2824.0,-1302.0,-2850.0,-1358.0,-2855.0,-1414.0,-2894.0,-1481.0,-2888.0,-1542.0,-2852.0,-1619.0,-2843.0,-1662.0,-2843.0,-1717.0,-2808.0,-1762.0,
    -2788.0,-1718.0,-2789.0,-1556.0,-2832.0,-1534.0,-2827.0,-1497.0,-2790.0,-1480.0,-2772.0,-1340.0,-2790.0,-1210.0
};
new Float:Ocean_Flats_Points[] = { // Ocean Flats
    -2963.0,409.0,-2936.0,332.0,-2933.0,160.0,-2941.0,-20.0,-2939.0,-241.0,-2949.0,-370.0,-2964.0,-502.0,-2958.0,-667.0,-2966.0,-693.0,-2978.0,-846.0,
    -2892.0,-908.0,-2896.0,-675.0,-2857.0,-494.0,-2847.0,294.0,-2876.0,340.0,-2892.0,406.0,-2963.0,409.0
};
new Float:Sherman_Hill_Points[] = { // Sherman Hill
    -1163.0,2073.0,-1177.0,2029.0,-1210.0,1998.0,-1158.0,1955.0,-1187.0,1916.0,-1140.0,1848.0,-1077.0,1901.0,-992.0,1900.0,-956.0,1889.0,-987.0,1947.0,
    -1055.0,1983.0,-1095.0,2007.0,-1114.0,2068.0,-1163.0,2073.0
};
new Float:The_Farm_Points[] = { // The Farm
    -1496.0,-1065.0,-1392.0,-1135.0,-1274.0,-1153.0,-1238.0,-1069.0,-1240.0,-898.0,-1339.0,-855.0,-1469.0,-855.0,-1496.0,-1065.0
};
new Float:TR_Hill_Points[] = { // TR Hill
    -1195.0,2489.0,-1173.0,2398.0,-1193.0,2376.0,-1186.0,2266.0,-1219.0,2238.0,-1243.0,2277.0,-1269.0,2274.0,-1318.0,2309.0,-1264.0,2332.0,-1237.0,2387.0,
    -1216.0,2407.0,-1211.0,2460.0,-1195.0,2489.0
};
new Float:TR_Town_Points[] = { // TR Town
    -1791.0,2671.0,-1834.0,2567.0,-1884.0,2466.0,-1803.0,2312.0,-1712.0,2378.0,-1766.0,2458.0,-1752.0,2505.0,-1709.0,2515.0,-1718.0,2630.0,-1791.0,2671.0
};



hook OnGameModeInit(){
    Weed_Field[AngelPine_Beach] = CreateDynamicPolygon(AngelPine_Points);
    Weed_Field[Bayside_Hill] = CreateDynamicPolygon(Bayside_Hill_Points);
    Weed_Field[Missionary_Hill] = CreateDynamicPolygon(Missionary_Hill_Points);
    Weed_Field[Mount_Chiliad] = CreateDynamicPolygon(Mount_Chiliad_Points);
    Weed_Field[Ocean_Flats] = CreateDynamicPolygon(Ocean_Flats_Points);
    Weed_Field[Sherman_Hill] = CreateDynamicPolygon(Sherman_Hill_Points);
    Weed_Field[The_Farm] = CreateDynamicPolygon(The_Farm_Points);
    Weed_Field[TR_Hill] = CreateDynamicPolygon(TR_Hill_Points);
    Weed_Field[TR_Town] = CreateDynamicPolygon(TR_Town_Points);
    return 1;
}

hook OnPlayerEnterDynArea(playerid, areaid){

    if(areaid == Weed_Field[AngelPine_Beach] && PlayerInfo[playerid][pStaff] >= 5){
        SendClientMessage(playerid, -1, "You have entered the Angel Pine Beach Weed Field area.");
    }
    else if(areaid == Weed_Field[Bayside_Hill] && PlayerInfo[playerid][pStaff] >= 5){
        SendClientMessage(playerid, -1, "You have entered the Bayside Hill Weed Field area.");
    }
    else if(areaid == Weed_Field[Missionary_Hill] && PlayerInfo[playerid][pStaff] >= 5){
        SendClientMessage(playerid, -1, "You have entered the Missionary Hill Weed Field area.");
    }
    else if(areaid == Weed_Field[Mount_Chiliad] && PlayerInfo[playerid][pStaff] >= 5){
        SendClientMessage(playerid, -1, "You have entered the Mount Chiliad Weed Field area.");
    }
    else if(areaid == Weed_Field[Ocean_Flats] && PlayerInfo[playerid][pStaff] >= 5){
        SendClientMessage(playerid, -1, "You have entered the Ocean Flats Weed Field area.");
    }
    else if(areaid == Weed_Field[Sherman_Hill] && PlayerInfo[playerid][pStaff] >= 5){
        SendClientMessage(playerid, -1, "You have entered the Sherman Hill Weed Field area.");
    }
    else if(areaid == Weed_Field[The_Farm] && PlayerInfo[playerid][pStaff] >= 5){
        SendClientMessage(playerid, -1, "You have entered the The Farm Weed Field area.");
    }
    else if(areaid == Weed_Field[TR_Hill] && PlayerInfo[playerid][pStaff] >= 5){
        SendClientMessage(playerid, -1, "You have entered the TR Hill Weed Field area.");
    }
    else if(areaid == Weed_Field[TR_Town] && PlayerInfo[playerid][pStaff] >= 5){
        SendClientMessage(playerid, -1, "You have entered the TR Town Weed Field area.");
    }

    return 1;
}

hook OnPlayerLeaveDynArea(playerid, areaid){
    if(areaid == Weed_Field[AngelPine_Beach] && PlayerInfo[playerid][pStaff] >= 5){
        SendClientMessage(playerid, -1, "You have left the Angel Pine Beach Weed Field area.");
    }
    else if(areaid == Weed_Field[Bayside_Hill] && PlayerInfo[playerid][pStaff] >= 5){
        SendClientMessage(playerid, -1, "You have left the Bayside Hill Weed Field area.");
    }
    else if(areaid == Weed_Field[Missionary_Hill] && PlayerInfo[playerid][pStaff] >= 5){
        SendClientMessage(playerid, -1, "You have left the Missionary Hill Weed Field area.");
    }
    else if(areaid == Weed_Field[Mount_Chiliad] && PlayerInfo[playerid][pStaff] >= 5){
        SendClientMessage(playerid, -1, "You have left the Mount Chiliad Weed Field area.");
    }
    else if(areaid == Weed_Field[Ocean_Flats] && PlayerInfo[playerid][pStaff] >= 5){
        SendClientMessage(playerid, -1, "You have left the Ocean Flats Weed Field area.");
    }
    else if(areaid == Weed_Field[Sherman_Hill] && PlayerInfo[playerid][pStaff] >= 5){
        SendClientMessage(playerid, -1, "You have left the Sherman Hill Weed Field area.");
    }
    else if(areaid == Weed_Field[The_Farm] && PlayerInfo[playerid][pStaff] >= 5){
        SendClientMessage(playerid, -1, "You have left the The Farm Weed Field area.");
    }
    else if(areaid == Weed_Field[TR_Hill] && PlayerInfo[playerid][pStaff] >= 5){
        SendClientMessage(playerid, -1, "You have left the TR Hill Weed Field area.");
    }
    else if(areaid == Weed_Field[TR_Town] && PlayerInfo[playerid][pStaff] >= 5){
        SendClientMessage(playerid, -1, "You have left the TR Town Weed Field area.");
    }
    return 1;
}


CMD:weed(playerid, params[])
{
	new select[12];
	if(sscanf(params, "s[12]", select))
		return SendClientMessage(playerid, COLOR_ERROR, "Correct usage: /weed [plant|harvest|rip]");

	else if(!IsPlayerAtWeedField(playerid)) {
		return SendClientMessage(playerid, COLOR_ERROR, "You are not at a Weed Field.");
	}
	else
	{
		if(strfind(select, "plant", true) != -1)
		{
			new Float:x, Float:y, Float:z;
			new Float:x1, Float:y1, Float:z1;
			GetPlayerPos(playerid, x, y, z);
			if(Total_Weed_Plant > MAX_WEED_PLANT)
			{
				return SendClientMessage(playerid, COLOR_ERROR, "The server has reached the maximum amount of plants.");
			}
			else if(pInv[playerid][Weed_Seed] <= 0)
			{
				return SendClientMessage(playerid, COLOR_ERROR, "You don't have enough Weed Seeds to plant Weed.");
			}

			for(new i=0; i < MAX_WEED_PLANT; i++)
			{
				GetDynamicObjectPos(Weed_Info[i][Object], x1, y1, z1);
				if(IsPlayerInRangeOfPoint(playerid, 2.0, x1, y1, z1))
				{
					return SendClientMessage(playerid, COLOR_ERROR, "You can't plant a seed near a weed plant.");
				}
				else if( Weed_Info[i][TextLabel] == Text3D:0 && Weed_Info[i][Object] == 0)
				{
					Weed_Info[i][Timer] = 1;
					pInv[playerid][Weed_Seed] -= 1;
					ApplyAnimation(playerid, "BOMBER", "BOM_PLANT", 4.1, 0, 1, 1, 0, 0, 1);
					Weed_Info[i][TextLabel] = CreateDynamic3DTextLabel("Weed\nState: Seeding\nProgress: 0", COLOR_WEED_ORANGE, x, y, z, 8.5);
					Total_Weed_Plant++;
					Weed_Info[i][Object] = CreateDynamicObject(2247, x, y, z-1, 0, 0, 0);
					return SendClientMessage(playerid, COLOR_BLUE, "You planted a weed seed.");
				}
			}
			return SendClientMessage(playerid, COLOR_ERROR, "The server has reached the maximum amount of plants.");
		}
		else if(strfind(select, "water", true) != -1)
		{
			if(pInv[playerid][Water] <= 0)
			{
				return SendClientMessage(playerid, COLOR_ERROR, "You don't have enough water.");
			}
			for(new i=0; i < MAX_WEED_PLANT; i++)
			{
				new Float:x2, Float:y2, Float:z2;
				GetDynamicObjectPos(Weed_Info[i][Object], x2, y2, z2);
				if(IsPlayerInRangeOfPoint(playerid, 2.0, x2, y2, z2))
				{
					if(Weed_Info[i][Timer] == 21)
					{
						pInv[playerid][Water] -= 1;
						Weed_Info[i][Timer]++;
						UpdateDynamic3DTextLabelText(Text3D:Weed_Info[i][Timer], COLOR_WEED_YELLOW, "Weed\nState: Watering\nProgress: 22");
						return SendClientMessage(playerid, COLOR_BLUE, "You watered a weed plant.");
					}
					else
					{
						return SendClientMessage(playerid, COLOR_ERROR, "This plant doesn't need watering.");
					}
				}
			}
			return SendClientMessage(playerid, COLOR_ERROR, "You are not near a weed plant.");
		}
		else if(strfind(select, "harvest", true) != -1)
		{
			for(new i=0; i < MAX_WEED_PLANT; i++)
			{
				new Float:x3,Float:y3,Float:z3;
				GetDynamicObjectPos(Weed_Info[i][Object], x3, y3, z3);
				if(IsPlayerInRangeOfPoint(playerid, 2.0, x3, y3, z3))
				{
					if(Weed_Info[i][Timer] == 100)
					{
						ApplyAnimation(playerid, "BOMBER", "BOM_PLANT", 4.1, 0, 1, 1, 0, 0, 1);
						DestroyDynamicObject(Weed_Info[i][Object]);
						DestroyDynamic3DTextLabel(Weed_Info[i][TextLabel]);
						pInv[playerid][Weed] += 8;
						pInv[playerid][Weed_Seed] += 2;
						Weed_Info[i][Object] = 0;
						Weed_Info[i][TextLabel] = Text3D:0;
						Weed_Info[i][Timer] = 0;
						Total_Weed_Plant -= 1;
						return SendClientMessage(playerid, COLOR_BLUE, "You harvested a weed plant for 8 grams with 2 weed seeds.");
					}
					// else if(Weed_Info[i][Timer] >= 80)
					// {
					// 	ApplyAnimation(playerid, "BOMBER", "BOM_PLANT", 4.1, 0, 1, 1, 0, 0, 1);
					// 	DestroyDynamicObject(Weed_Info[i][Object]);
					// 	DestroyDynamic3DTextLabel(Weed_Info[i][TextLabel]);
					// 	pInv[playerid][Weed] += 8;
					// 	Weed_Info[i][Object] = 0;
					// 	Weed_Info[i][TextLabel] = Text3D:0;
					// 	Weed_Info[i][Timer] = 0;
					// 	Total_Weed_Plant -= 1;
					// 	return SendClientMessage(playerid, COLOR_BLUE, "You harvested a weed plant for 8 grams.");
					// }
					else
					{
						return SendClientMessage(playerid, COLOR_ERROR, "This plant is not ready to harvest.");
					}
				}
			}
			return SendClientMessage(playerid, COLOR_ERROR, "You are not near a weed plant.");
		}
		else if(strfind(select, "rip", true) != -1)
		{
			for(new i=0;i<MAX_WEED_PLANT;i++)
			{
				new Float:x4, Float:y4, Float:z4;
				GetDynamicObjectPos(Weed_Info[i][Object], x4, y4, z4);
				if(IsPlayerInRangeOfPoint(playerid, 2.0, x4, y4, z4))
				{
					ApplyAnimation(playerid, "BOMBER", "BOM_PLANT", 4.1, 0, 1, 1, 0, 0, 1);
					DestroyDynamicObject(Weed_Info[i][Object]);
					DestroyDynamic3DTextLabel(Weed_Info[i][TextLabel]);
					Weed_Info[i][Object] = 0;
					Weed_Info[i][TextLabel] = Text3D:0;
					Weed_Info[i][Timer] = 0;
					Total_Weed_Plant -= 1;
					return SendClientMessage(playerid, COLOR_BLUE, "You ripped out a weed plant.");
				}
			}
			return SendClientMessage(playerid, COLOR_ERROR, "You are not near a weed plant.");
		}
	}
	return 1;
}

// TASK
task OnTRWeedCheckState[10000]()
{
	for(new i=0; i<(Total_Weed_Plant+1); i++)
	{
		if(Weed_Info[i][Timer] >= 0 && Weed_Info[i][Timer] <= 19) // Seeding
		{
			Weed_Info[i][Timer]++;
			new weedstring[100];
			format(weedstring, sizeof(weedstring), "Weed\nState: Seeding\nProgress: %i%", Weed_Info[i][Timer]);
			UpdateDynamic3DTextLabelText(Weed_Info[i][TextLabel], COLOR_WEED_ORANGE, weedstring);
		}
		else if(Weed_Info[i][Timer] == 20) // Needs water
		{
			Weed_Info[i][Timer]++;
			new Float:x, Float:y, Float:z;
			GetDynamicObjectPos(Weed_Info[i][Object], x, y, z);
			DestroyDynamicObject(Weed_Info[i][Object]);
			Weed_Info[i][Object] = CreateDynamicObject(806, x, y, z, 0, 0, 0);
			new weedstring[100];
			format(weedstring, sizeof(weedstring), "Weed\nState: Needs Water\nProgress: %i%", Weed_Info[i][Timer]);
			UpdateDynamic3DTextLabelText(Weed_Info[i][TextLabel], COLOR_WEED_ORANGE, weedstring);
		}
		else if(Weed_Info[i][Timer] == 21) // Needs water
		{
			UpdateDynamic3DTextLabelText(Weed_Info[i][TextLabel], COLOR_WEED_ORANGE, "Weed\nState: Needs Water\nProgress: 21%");
		}
		else if(Weed_Info[i][Timer] >= 22 && Weed_Info[i][Timer] <= 40) // Watering
		{
			Weed_Info[i][Timer]++;
			new weedstring[100];
			format(weedstring, sizeof(weedstring), "Weed\nState: Watering\nProgress: %i%", Weed_Info[i][Timer]);
			UpdateDynamic3DTextLabelText(Weed_Info[i][TextLabel], COLOR_WEED_YELLOW, weedstring);
		}
		else if(Weed_Info[i][Timer] == 41) // Vegetative
		{
			new Float:x2, Float:y2, Float:z2;
			Weed_Info[i][Timer]++;
			GetDynamicObjectPos(Weed_Info[i][Object], x2, y2, z2);
			DestroyDynamicObject(Weed_Info[i][Object]);
			Weed_Info[i][Object] = CreateDynamicObject(19473, x2, y2, z2, 0, 0, 0);
			new weedstring[100];
			format(weedstring, sizeof(weedstring), "Weed\nState: Vegetative\nProgress: %i%", Weed_Info[i][Timer]);
			UpdateDynamic3DTextLabelText(Weed_Info[i][TextLabel], COLOR_WEED_YELLOW, weedstring);
		}
		else if(Weed_Info[i][Timer] >= 42 && Weed_Info[i][Timer] <= 80) // Vegetative
		{
			Weed_Info[i][Timer]++;
			new weedstring[100];
			format(weedstring, sizeof(weedstring), "Weed\nState: Vegetative\nProgress: %i%", Weed_Info[i][Timer]);
			UpdateDynamic3DTextLabelText(Weed_Info[i][TextLabel], COLOR_WEED_GREEN, weedstring);
		}
		else if(Weed_Info[i][Timer] >= 81 && Weed_Info[i][Timer] <= 99) // Flowering
		{
			Weed_Info[i][Timer]++;
			new weedstring[100];
			format(weedstring, sizeof(weedstring), "Weed\nState: Flowering\nProgress: %i%", Weed_Info[i][Timer]);
			UpdateDynamic3DTextLabelText(Weed_Info[i][TextLabel], COLOR_WEED_GREEN, weedstring);
		}
		else if(Weed_Info[i][Timer] >= 100) // Done
		{
			UpdateDynamic3DTextLabelText(Weed_Info[i][TextLabel], COLOR_WEED_GREEN, "Weed\nState: Flowering\nProgress: Done");
		}
    }
    return 1;
}


// WEED FUNCTIONS
forward IsPlayerAtWeedField(playerid);
public IsPlayerAtWeedField(playerid){
    for(new i = 0; i<MAX_WEED_FIELD; i++){
        if(IsPlayerInDynamicArea(playerid, Weed_Field[WEED_FIELD:i])){
            return 1;
        }
    }
    return 0;
}