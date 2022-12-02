/*

S A V L I N E - R P G
variable.pwn
contains global and player variables for the server

*/

#define SERVER_NAME "Savline RPG"

// the 'savline green' color
#define COLOR_GREEN   		0x00FF22FF
#define COLOR_ORANGE  		0xF06B0CFF

#define COLOR_WHITE   		0xFFFFFFFF
#define COLOR_PURPLE  		0xB00EC9FF
#define COLOR_BLUE    		0x40FFFFFF
#define COLOR_RED 	  		0xFF0000FF
#define COLOR_GREY    		0xB5B5B5FF

#define COLOR_GROUP			0x95B4A2FF

// used in error messages
#define COLOR_ERROR   		0xFF8282FF

// LOCAL is /l | OOC is /b
#define COLOR_LOCAL   		0xD69DE9FF
#define COL_LOCAL     		"{D69DE9}"
#define COLOR_OOC	  		0xC071DAFF
#define COL_OOC       		"{C071DA}"

// used for anticheat and admin alerts
#define COLOR_ANTICHEAT   	0xE4CA78FF
#define COLOR_ALERT   		0xFF4500FF

// WEED COLORS
#define COLOR_WEED_ORANGE 	0xF58E20FF
#define COLOR_WEED_YELLOW 	0xEDE02BFF
#define COLOR_WEED_GREEN 	0x9DED2DFF

// HEROIN COLORS
#define COLOR_HEROIN_RED 	0xF0291AFF
#define COLOR_HEROIN_ORANGE 0xED6C21FF
#define COLOR_HEROIN_YELLOW 0xEDE621FF
#define COLOR_HEROIN_GREEN 	0x3be028FF

// WALKIE TALKIE COLORS

#define COLOR_WALKIE_MSG   	0x81C786FF
#define COLOR_WALKIE_ALERT 	0x467349FF

// PM COLORS

#define COLOR_SENDPM 	   	0xCCA300FF
#define COLOR_RECIVEPM		0xFFCC00FF

// PLAYER COLORS
#define COLOR_HELPER		0x8FDA3EFF
#define COLOR_POLICE		0x136CD1FF
#define COLOR_VOLUNTEER		0x72CAfCFF
#define COLOR_ARMY			0x006D00FF
#define COLOR_FD			0xF27979FF
#define COLOR_EMS			0xF7A6DDFF
#define COLOR_MECHANIC		0xFFFFA3FF
#define COLOR_TAXI			0x81D975FF


#if !defined IsValidVehicle
    native IsValidVehicle(vehicleid);
#endif

// PRESSED(keys)
#define PRESSED(%0) \
    (((newkeys & (%0)) == (%0)) && ((oldkeys & (%0)) != (%0)))

// Vehicle Types
#define TYPE_STATE			0
#define TYPE_PLAYER       	1
#define TYPE_GROUP          2
#define TYPE_JOB           	3

//new const TYPE_NAME[12][] = {"State","Player","Group","Job"};

#define MAX_VEHICLE_KEYS 3;

/////////////////////////////////////////

#define PROPERTY_TYPE_HOUSE		0 // SPECIALITY
#define HOUSE_SPECIALITY_NORMAL	0

/////////////////////////////////////////
/////////////////////////////////////////

#define PROPERTY_TYPE_BUSINESS			1 // SPECIALITY
#define BUSINESS_SPECIALITY_247			0
#define BUSINESS_SPECIALITY_PHARMACY	1
#define BUSINESS_SPECIALITY_TOOLSTORE	2
#define BUSINESS_SPECIALITY_RESTURANT	3
#define BUSINESS_SPECIALITY_CLOTHING	4
#define BUSINESS_SPECIALITY_OFFICE		5
#define BUSINESS_SPECIALITY_AMMUNATION	6
#define BUSINESS_SPECIALITY_PAYNSPRAY	7
#define BUSINESS_SPECIALITY_BAR			8


/////////////////////////////////////////
/////////////////////////////////////////

#define PROPERTY_TYPE_ENTERABLE		2 // SPECIALITY
#define ENTERABLE_SPECIALITY_NORMAL 0

/////////////////////////////////////////


// if(chatVar == 1) chat is off
new publicChat = 0;
new askChat = 0;

// dialog ids
enum
{
	DIALOG_NONE,
	DIALOG_REGISTER,
	DIALOG_LOGIN,
	DIALOG_ACCENT,

	DIALOG_APORT,
	DIALOG_APORTG,
	DIALOG_APORTI,
	DIALOG_APORTJ,

	// help section
	DIALOG_HELP,
	DIALOG_HELP_GOTOMAIN,
	DIALOG_HELP_JOBS,
	DIALOG_HELP_GROUP,
	DIALOG_HELP_PROPERTIES,

	// rules section
	DIALOG_RULES,


	//DRUG DEALER DIALOG
	DIALOG_DRUG_DEALER,
    DIALOG_DRUG_DEALER_SELL,
    DIALOG_DRUG_DEALER_BUY,
    DIALOG_DRUG_DEALER_WEED,
    DIALOG_DRUG_DEALER_HEROIN,
    DIALOG_DRUG_DEALER_METH,
	DIALOG_DRUG_DEALER_ACETONE,
	DIALOG_DRUG_DEALER_CALCIUM,
	DIALOG_DRUG_DEALER_LITHIUM,
	DIALOG_DRUG_DEALER_SODIUM,
	DIALOG_DRUG_DEALER_TOLUENE,
	DIALOG_DRUG_DEALER_WEED_SEED,
    DIALOG_DRUG_DEALER_MARKED_MONEY,


	// BANK DIALOG
	DIALOG_BANK,

	// GROUP DIALOGS
	DIALOG_GROUPRANK,
	DIALOG_GROUPEDITRANK,

	// Property dialogs
	DIALOG_PROPERTY,
	DIALOG_PROPERTYNAME,
	DIALOG_PROPERTYSAFE,
	DIALOG_PROPERTYWITHDRAW,
	DIALOG_PROPERTYDEPOSIT,
	DIALOG_PROPERTYSELL
};

enum e_playerInfo
{
	pMasterID,
	Float:PX,
	Float:PY,
	Float:PZ,
	Float:PA,
	Float:pHealth,
	Float:pArmour,
	pSkin,
	pStoreSkin,
	pLevel,
	pExp,
	Timestamp:pExpTimestamp,
	pCash,
	pStaff,
	bool:pAdminDuty,
	pChatmode,
	pPublicChat,
	pAskChat,
	pAccent,
	pPMS,
	pKnocked,
	pKnockedTime,
	
	/* server checks; */
	bool:pLoggedIn,
	pFirstTime,
	pPassFailed,
	pKicked,
	pFreeze,
	pLastPress,
	bool:pSpecating,
	bool:pVPN,

	/* group invite checks */
	pEditingGroup,
	pEditingGRank
};
new PlayerInfo[MAX_PLAYERS][e_playerInfo];


enum vInfo
{
	vDBID,
	vOwnerID,
	vOwnerType,
	vModel,
	vColor1,
	vColor2,

	// Health
	Float:vHealth,
	vPanelsHealth,
	vDoorsHealth,
	vLightsHealth,
	vTiresHealth,

	// Location
	Float:posX,
	Float:posY,
	Float:posZ,
	Float:posA,
	interior,
	virtualWorld,
};

enum vMods
{
	vSpoiler,
	vHood,
	vRoof,
	vSkirt,
	vLamps,
	vNitro,
	vExhaust,
	vWheel,
	vStereo,
	vHydraulics,
	vFrontBumper,
	vRearBumper,
	vVentRight,
	vVentLeft
};

//new VehicleInfo[MAX_VEHICLES][vInfo];
//new VehicleKeys[MAX_VEHICLES][3];
//new VehicleMods[MAX_VEHICLES][vMods];


// ----- Property Start -----
#define MAX_GASSTATIONS 500
enum e_gasInfo
{
	gasID,
	gasProperty,
	gasLiters,
	gasPrice,
	Float:gasX,
	Float:gasY,
	Float:gasZ,
	Float:gasExists,
	Text3D:gasLabel
};
new GasInfo[MAX_GASSTATIONS][e_gasInfo];

// ----- PLAYER INVENTORY Start -----
//  PLAYER INVENTORY
#define MAX_ITEMS 15
 	// Adding a new item?? Also added in ReturnItemName(item)
enum P_ITEMS{
    Acetone,
    Calcium,
	C4,
	Laptop,
    Lithium,
    Heroin,
    Marked_Money,
    Meth,
	Phone,
    Sodium,
    Toluene,
	Walkie_Talkie,
    Water,
    Weed,
    Weed_Seed,
};
new pInv[MAX_PLAYERS][P_ITEMS];

new const itemNames[][30] = {
	"Acetone",
	"Calcium",
	"C4",
	"Laptop",
	"Lithium",
	"Heroin",
	"Marked_Money",
	"Meth",
	"Phone",
	"Sodium",
	"Toluene",
	"Walkie_Talkie",
	"Water",
	"Weed",
	"Weed_Seed"
};
// ----- PLAYER INVENTORY End -----


// ----- PHONE Start -----
// Phone Info
enum PHONE_INFO{
	Number,
	Speaker,
	Power
};
new pPhone[MAX_PLAYERS][PHONE_INFO];

enum CALL_INFO{
	OnRequest,
	OnCall
};
new pPhoneCall[MAX_PLAYERS][CALL_INFO];
// ----- PHONE End -----


// ----- WT Start -----
// PLAYER Walkie Talkie
#define MAX_PLAYER_WT_SLOT 3

// Slots
enum pWTInfo{
    SLOT1,
    SLOT2,
    SLOT3
};

new Player_WT[MAX_PLAYERS][pWTInfo];

// Ranks
enum pWTRank{
	SLOT1,
	SLOT2,
	SLOT3
};
new Player_WTRank[MAX_PLAYERS][pWTRank];
// ----- WT End -----


// ----- BANK Start -----
#define MAX_PLAYER_BANK_ACC 3
enum PLAYER_BANK_INFO{
	pBankID,
	pBankAmount
};
new pBankInfo[MAX_PLAYERS][MAX_PLAYER_BANK_ACC][PLAYER_BANK_INFO];
/// ----- BANK End -----


// ----- ATM Start -----
#define MAX_ATM 4
enum ATM_INFO{
    Object,
    State,
	Pickup
}
new atmInfo[MAX_ATM][ATM_INFO];
// ----- ATM End -----


// ----- Groups -----
#define MAX_GROUPS 50
#define MAX_GROUP_SLOTS 10
enum e_gInfo
{
	gID,
	gName[50],
	gTag[6],
	gSpeciality,
	gOfficial,
	gRank1[32],
	gRank2[32],
	gRank3[32],
	gRank4[32],
	gRank5[32],
	gRank6[32],
	gRank7[32],
	gRank8[32],
	gRank9[32],
	gRank10[32],
	gRank11[32],
	gRank12[32],
	gRank13[32],
	gRank14[32],
	gRank15[32],
	gPermsInviteKick,
	gPermsRank,
	gPermsManage,
	gPermsStorage,
	gPermsLock,
	gBankAcc,

	Float:gSmuggleVanX,
	Float:gSmuggleVanY,
	Float:gSmuggleVanZ,

	Float:gSpawnX,
	Float:gSpawnY,
	Float:gSpawnZ,

	gExists
};
new GroupInfo[MAX_GROUPS][e_gInfo];

enum player_groups{
	gId,
	gRank,
}
new PlayerGroup[MAX_PLAYERS][MAX_GROUP_SLOTS][player_groups];
// ----- Groups End -----


// ----- Property Start -----
#define MAX_PROPERTIES 500
enum e_propertyInfo
{
	pId,
	pOwnerid,
	pOwnertype,
	pOwnername[50],
	pType,
	pBlipid,
	pSpeciality,
	pName[32],
	pPrice,
	pEntryfee,
	pLocked,
	Float:pEnter_x,
	Float:pEnter_y,
	Float:pEnter_z,
	Float:pEnter_a,
	Float:pExit_x,
	Float:pExit_y,
	Float:pExit_z,
	Float:pExit_a,
	pInterior,
	pVirtualworld,
	pOutsideint,
	pOutsidevw,
	pPropertysafe,
	pStock,

	pPickup,
	pBlip,
	pExists
};
new PropertyInfo[MAX_PROPERTIES][e_propertyInfo];

enum e_propertyStorage {
    Acetone,
    Calcium,
	C4,
	Laptop,
    Lithium,
    Heroin,
    Marked_Money,
    Meth,
	Phone,
    Sodium,
    Toluene,
	Walkie_Talkie,
    Water,
    Weed,
    Weed_Seed,
};
new PropertyStorage[MAX_PROPERTIES][e_propertyStorage];

// --- porperty interiors ids ---
enum intEnum
{
    intName[32],
    intID,
    Float:intX,
    Float:intY,
    Float:intZ,
    Float:intA
}

new const interiorArray[][intEnum] =
{
    {"24/7 1", 17, -25.7220, -187.8215, 1003.5468, 5.0760}, // 0
    {"24/7 2", 10, 6.0854, -28.8966, 1003.5493, 5.0363}, // 1
    {"24/7 3", 18, -30.9874, -89.6806, 1003.5468, 359.8399}, // 2
    {"24/7 4", 16, -26.1856, -140.9163, 1003.5468, 2.9086}, // 3
    {"24/7 5", 4, -27.8439, -26.6737, 1003.5573, 184.3117}, // 4
    {"24/7 6", 6, -26.8339, -55.5844, 1003.5468, 3.9528}, // 5
    {"8-Track", 7, -1403.0114, -250.4526, 1043.5340, 355.8576}, // 6
    {"Abandoned AC Tower", 10, 419.8934, 2537.1154, 10.0000, 67.6537}, // 7
    {"Ammunation 1", 7, 315.2438, -140.8858, 999.6016, 7.4225}, // 8
    {"Ammunation 2", 1, 285.8359, -39.0166, 1001.5156, 0.7529}, // 9
    {"Ammunation 3", 4, 291.7626, -80.1305, 1001.5156, 290.2195}, // 10
    {"Ammunation 4", 6, 297.1440, -109.8702, 1001.5156, 20.2254}, // 11
    {"Ammunation 5", 6, 316.5025, -167.6271, 999.5938, 10.3030}, // 12
    {"Andromada", 9, 315.4544, 976.5972, 1960.8509, 359.6368}, // 13
    {"Angel Pine Trailer", 2, 1.1851, -3.2386, 999.4284, 87.5718}, // 14
    {"Area 69", 0, 215.1515, 1874.0577, 13.1406, 177.5538}, // 15
    {"Atrium", 18, 1727.2851, -1642.9449, 20.2254, 172.4192}, // 16
    {"B Dup's Apartment", 3, 1527.0467, -12.0235, 1002.0971, 350.0013}, // 17
    {"B Dup's Crack Palace", 2, 1523.5096, -47.8209, 1002.2697, 262.7037}, // 18
    {"Bar", 11, 501.9577, -70.5646, 998.7578, 171.5706}, // 19
    {"Barbara's Love nest", 5, 322.5014, 303.6906, 999.1483, 8.1745}, // 20
    {"Barber Shop 1", 3, 418.4666, -80.4595, 1001.8046, 343.2358}, // 21
    {"Barber Shop 2", 12, 411.9707, -51.9216, 1001.8983, 173.3448}, // 22
    {"Barber Shop 3", 2, 414.2987, -18.8043, 1001.8046, 41.4263}, // 23
    {"Big Smoke's Crack Palace", 2, 2536.5322, -1294.8425, 1044.1250, 254.9548}, // 24
    {"Bike School 1", 3, 1494.8587, 1306.4798, 1093.2951, 196.0650}, // 25
    {"Bike School 2", 0, 1168.5118, 1360.1145, 10.9293, 196.5933},// 26
    {"Binco", 15, 207.5218, -109.7446, 1005.1328, 358.6199}, // 27
    {"Blastin' Fools Records", 3, 1037.8276, 0.3970, 1001.2844, 353.9335},// 28
    {"Blood Bowl Stadium", 15, -1417.8927, 932.4481, 1041.5312, 0.7013},// 29
    {"Blueberry Liquor Store", 0, 255.2082, -59.6753, 1.5701, 1.4644}, // 30
    {"Brothel 1", 3, 974.0177, -9.5937, 1001.1483, 22.6044}, // 31
    {"Brothel 2", 3, 961.9307, -51.9071, 1001.1171, 95.5381}, // 32
    {"Budget Inn Motel Room", 12, 446.3247, 509.9660, 1001.4193, 330.5671}, // 33
    {"Burger Shot", 10, 366.0248, -73.3478, 1001.5078, 292.0083}, // 34
    {"Burglary House 1", 15, 295.1390, 1473.3719, 1080.2578, 352.9526}, // 35
    {"Burglary House 2", 3, 234.6087, 1187.8194, 1080.2578, 349.4844}, // 36
    {"Burglary House 3", 5, 227.7559, 1114.3842, 1080.9920, 266.2622}, // 37
    {"Burglary House 4", 4, 261.1163, 1287.2197, 1080.2578, 178.9149}, // 38
    {"Burglary House 5", 4, 221.6766, 1142.4962, 1082.6092, 184.9618}, // 39
    {"Burglary House 6", 10, 24.3768, 1341.1827, 1084.3750, 8.3304}, // 40
    {"Burglary House 7", 4, -262.1759, 1456.6158, 1084.3670, 82.4589}, // 41
    {"Burglary House 8", 5, 22.8610, 1404.9165, 1084.4295, 349.6158}, // 42
    {"Burglary House 9", 5, 140.3679, 1367.8835, 1083.8620, 349.2372}, // 43
    {"Burglary House 10", 6, 234.2825, 1065.2290, 1084.2099, 4.3864}, // 44
    {"Burglary House 11", 6, -68.5145, 1353.8485, 1080.2109, 3.5741}, // 45
    {"Burglary House 12", 2, 225.5706, 1240.0643, 1082.1406, 96.2852}, // 46
    {"Burglary House 13", 15, -285.2510, 1471.1970, 1084.3750, 85.6547}, // 47
    {"Burglary House 14", 8, -42.5265, 1408.2298, 1084.4295, 172.0679}, // 48
    {"Burglary House 15", 9, 84.9244, 1324.2983, 1083.8592, 159.5581}, // 49
    {"Burglary House 16", 9, 260.7420, 1238.2259, 1084.2578, 84.3084}, // 50
    {"Burglary House 17", 1, 224.2879, 1289.1905, 1082.1406, 359.8680}, // 51 
    {"Burglary House 18", 5, 239.2819, 1114.1989, 1080.9920, 270.2654}, // 52
    {"Burglary House 19", 2, 446.6260, 1397.7380, 1084.3045, 343.9645}, // 53
    {"Burning Desire Building", 5, 2350.1596, -1181.0656, 1027.9764, 99.1864}, // 54
    {"Caligula's Casino", 1, 2233.9362, 1711.8038, 1011.6312, 184.3890}, // 55
    {"Caligula's Roof", 1, 2268.5156, 1647.7680, 1084.2342, 99.7331}, // 56
    {"Casino (Redsands West)", 12, 1133.3498, -7.8460, 1000.6796, 165.8482}, // 57
    {"Cemetary", 0, 818.7714, -1102.8687, 25.7940, 91.1437}, // 58
    {"Club", 17, 493.1441, -24.2607, 1000.6796, 356.9862}, // 59
    {"Cluckin' Bell", 9, 366.0002, -9.4336, 1001.8516, 160.5278}, // 60
    {"Cobra Gym", 6, 773.8886, -47.7696, 1000.5858, 10.7159}, // 61
    {"Colonel Furhberger's", 8, 2807.3603, -1171.7048, 1025.5703, 193.7117}, // 62
    {"Crack Den", 5, 227.3921, 1114.6572, 1080.9985, 267.4590}, // 63
    {"Denise's Bedroom", 1, 245.2306, 304.7632, 999.1483, 273.4364}, // 64
    {"Didier Sachs", 14, 204.1658, -165.7678, 1000.5233, 181.7583}, // 65
    {"Dillimore Gas Station", 0, 663.0587, -573.6273, 16.3358, 264.9829}, // 66
    {"Diner 1", 5, 454.9851, -107.2546, 999.4376, 309.0195}, // 67
    {"Dirtbike Stadium", 4, -1421.5616, -663.8261, 1059.5567, 170.9340}, // 68
    {"Driving School", 3, -2031.1196, -115.8285, 1035.1717, 190.1876}, // 69
    {"Fanny Batter's Whore House", 6, 748.4622, 1438.2376, 1102.9531, 0.6068}, // 70
    {"Four Dragons", 10, 2016.1156, 1017.1541, 996.8750, 88.0055}, // 71
    {"Francis International Airport", 14, -1813.2130, -58.0120, 1058.9641, 335.3197}, // 72
    {"Ganton Gym", 5, 770.8032, -0.7031, 1000.7266, 22.8598}, // 73
    {"Helena's Barn", 3, 290.6228, 309.0621, 999.1483, 89.9162}, // 74 
    {"Inside Track Betting", 3, 830.6016, 5.9404, 1004.1796, 125.8149}, // 75
    {"Jay's Diner", 4, 449.0172, -88.9894, 999.5546, 89.6606}, // 76
    {"Jefferson Motel", 15, 2217.2810, -1150.5349, 1025.7967, 273.7326}, // 77
    {"Jet Interior", 1, 1.5491, 23.3183, 1199.5937, 359.9053}, // 78
    {"K.A.C.C. Military Fuels Depot", 0, 2548.4807, 2823.7429, 10.8203, 270.6003}, // 79
    {"Katie's Lovenest", 2, 269.6405, 305.9512, 999.1483, 215.6625}, // 80
    {"Kickstart Stadium", 14, -1420.4277, 1616.9221, 1052.5312, 159.1255}, // 81
    {"Las Venturas Gym", 7, 773.7318, -74.6957, 1000.6541, 5.2304}, // 82
    {"Las Venturas Police Department", 3, 288.4721, 170.0646, 1007.1793, 22.0477}, // 83
    {"Las Venturas Tattoo parlor", 3, -201.2236, -43.2463, 1002.2733, 45.8613}, // 84
    {"Liberty City", 1, -741.8494, 493.0036, 1371.9764, 71.7780}, // 85
    {"Lil' Probe Inn", 18, -227.5702, 1401.5544, 27.7656, 269.2976}, // 86
    {"Loco Low Co", 2, 611.3535, -77.5574, 997.9995, 320.9263}, // 87
    {"Los Santos Airport", 14, -1864.9433, 55.7323, 1055.5274, 85.8541}, // 88
    {"Los Santos Police Department", 6, 246.6694, 65.8039, 1003.6406, 7.9562}, // 89
    {"Los Santos Tattoo Parlor", 16, -202.8419, -24.0324, 1002.2733, 252.8153}, // 90
    {"Lost San Fierro Tattoo parlor", 17, -202.9380, -6.7006, 1002.2733, 204.2693}, // 91
    {"Madd Dogg's Mansion", 5, 1267.8405, -776.9586, 1091.9062, 231.3417}, // 92
    {"Michelle's Love Nest", 4, 306.1965, 307.8190, 1003.3046, 203.1354}, // 93
    {"Millie's Bedroom", 6, 344.9984, 307.1824, 999.1557, 193.6430}, // 94
    {"OG Loc's House", 3, 512.9290, -11.6927, 1001.5653, 198.7669}, // 95
    {"Old Venturas Strip Casino", 2, 2236.6997, -1078.9477, 1049.0234, 2.5706}, // 96
    {"Otto's Autos", 0, -1658.1656, 1215.0002, 7.2500, 103.9074}, // 97
    {"Oval Stadium", 1, -1402.6612, 106.3897, 1032.2734, 105.1354}, // 98
    {"Palamino Bank", 0, 2306.3825, -15.2363, 26.7495, 274.4898},  // 99
    {"Palamino Diner", 0, 2331.8984, 6.7814, 26.5032, 100.2357}, // 100
    {"Pizza Stack", 5, 372.5563, -131.3607, 1001.4921, 354.2283}, // 101
    {"Planning Department", 3, 386.5259, 173.6381, 1008.3828, 63.7397}, // 102
    {"Pro-Laps", 3, 206.4627, -137.7075, 1003.0938, 10.9347}, // 103
    {"RC Battlefield", 10, -1129.8907, 1057.5423, 1346.4139, 274.5267}, // 104
    {"Rosenberg's Office", 2, 2182.2016, 1628.5848, 1043.8723, 224.8601}, // 105
    {"Rusty Brown's Donuts", 17, 378.0260, -190.5155, 1000.6328, 141.0245}, // 106
    {"Ryder's House", 2, 2447.8703, -1704.4509, 1013.5078, 314.5252}, // 107
    {"Safe House (version 1)", 5, 2233.6918, -1112.8105, 1050.8828, 8.6483}, // 108
    {"Safe House (version 2)", 9, 2319.1271, -1023.9561, 1050.2109, 167.3959}, // 109
    {"Safe House (version 3)", 10, 2261.0976, -1137.8833, 1050.6328, 266.8800}, // 110
    {"San Fierro Garage", 1, -2041.2332, 178.3968, 28.8465, 156.2153}, // 111
    {"San Fierro Police Department", 10, 246.0688, 108.9701, 1003.2188, 0.2921}, // 112
    {"Secret Valley Diner", 6, 442.1293, -52.4780, 999.7166, 177.9394}, // 113
    {"Sex Shop", 3, -100.2674, -22.9375, 1000.7188, 17.2849}, // 114
    {"Sherman Dam", 17, -944.2401, 1886.1534, 5.0050, 179.8547}, // 115
    {"Sindacco Abatoir", 1, 963.0584, 2159.7563, 1011.0302, 175.3130}, // 116
    {"SubUrban", 1, 204.1174, -46.8045, 1001.8046, 357.5776}, // 117
    {"Sweet's House", 1, 2527.0175, -1679.2076, 1015.4984, 260.9707}, // 118
    {"The Big Spread Ranch", 3, 1212.1489, -28.5387, 1000.9531, 170.5691}, // 119
    {"The Camel's Toe Safehouse", 1, 2216.1281, -1076.3050, 1050.4842, 86.4280}, // 120
    {"The Johnson House", 3, 2496.0549, -1695.1749, 1014.7421, 179.2174}, // 121
    {"The Pig Pen (strip club 2)", 2, 1204.6689, -13.5429, 1000.9218, 350.0202}, // 122
    {"The Pleasure Domes", 3, -2638.8232, 1407.3393, 906.4608, 94.6792}, // 123
    {"The Welcome Pump", 1, 681.6215, -451.8933, -25.6172, 166.1660}, // 124
    {"Torreno's Ranch", 0, -688.1494, 942.0825, 13.6328, 177.6573}, // 125
    {"Transfenders", 1, 621.4528, -23.7289, 1000.9218, 15.6787}, // 126
    {"Unused Safe House", 12, 2323.7062, -1147.6507, 1050.7099, 206.5352}, // 127
    {"Verdant Bluffs Safehouse", 8, 2365.1088, -1133.0793, 1050.8750, 177.3946}, // 128
    {"Vice Stadium", 16, -1401.0670, 1265.3706, 1039.8670, 178.6483}, // 129
    {"Victim", 5, 225.0305, -9.1836, 1002.2180, 85.5322}, // 130
    {"Wang Cars", 0, -1961.6280, 295.2377, 35.4687, 264.4891}, // 131
    {"Wardrobe/Changing room", 14, 256.9046, -41.6537, 1002.0233, 85.8774}, // 132
    {"Warehouse 1", 18, 1290.4106, 1.9512, 1001.0200, 179.9418}, // 133
    {"Warehouse 2", 1, 1412.1472, -2.2836, 1000.9240, 114.6610}, // 134
    {"Warehouse 3", 0, 2135.2004, -2276.2814, 20.6718, 318.5899}, // 135
    {"Wheel Arch Angels", 3, 612.2191, -123.9028, 997.9921, 266.5704}, // 136
    {"Willowfield Safehouse", 11, 2283.3117, 1139.3070, 1050.8984, 19.7031}, // 137
    {"World of Coq", 1, 445.6003, -6.9822, 1000.7343, 172.2104}, // 138
    {"Wu-Zi Mu's", 1, -2158.6730, 642.0900, 1052.3750, 86.5401}, // 139
    {"Zero's RC Shop", 6, -2240.1027, 136.9730, 1035.4139, 269.0953}, // 140
    {"Zip", 18, 161.4048, -94.2416, 1001.8046, 0.7936}, // 141
    {"Zombotech", 0, -1916.1268, 714.8615, 46.5625, 152.2839} // 142
};

enum aportEnum
{
    aportName[32],
    aportInt,
    aportVW,
    Float:aportX,
    Float:aportY,
    Float:aportZ,
    Float:aportA
}

new const aportArray[][aportEnum] =
{
    {"Admin Area", 0, 0, -980.9395, 3282.5771, 3.4283, 299.1392}, // 0
    {"LS Bank", 0, 0, 1463.2146, -1024.7290, 23.8281, 328.8827}, // 1
    {"Prison", 0, 0, -1810.0505, -1575.2357, 13.4977, 110.1973}, // 2
    {"Main Street", 0, 0, 1356.7035, -1298.1681, 13.2505, 355.2029}, // 3
    {"Los Santos Cityhall", 0, 0, 1481.0864, -1769.1569, 18.7958, 2.7229}, // 4
    {"Las Venturas Cityhall", 0, 0, 2316.9441, 2369.0237, 10.8203, 177.0711}, // 5
    {"San Fierro Cityhall", 0, 0, -2697.8926, 372.4448, 4.3842, 69.2802}, // 6
    {"Fort Carson", 0, 0, -202.2892, 1117.5435, 19.7422, 66.3097} // 7
};

// ----- Property End -----



enum e_reaction_data {
	reactionActive,
	reactionMessage,
	reactionMoney
}
new ReactionInfo[e_reaction_data];


new playerAccents[][32] = {
    "None",
   	"African",
	"American",
	"Arabic",
	"Australian",
	"Austrian",
	"British",
	"Canadian",
	"Chinese",
	"Croatian",
	"Czech",
	"Danish",
	"Dutch",
	"Egyptian",
	"Filipino",
	"French",
	"Gangster",
	"German",
	"Greek",
	"Hungarian",
	"Indian",
	"Irish",
	"Italian",
	"Jamaican",
	"Japanese",
	"Malaysian",
	"Mexican",
	"Mysterious",
	"Nigerian",
	"Norwegian",
	"Pakistani",
	"Polish",
	"Portuguese",
	"Romanian",
	"Russian",
	"Scottish",
	"Spanish",
	"Thai",
	"Turkish",
	"Ukrainian",
	"Welsh",
	"Yorkshire"
};

new const vehicleNames[212][] = {
    "Landstalker", "Bravura", "Buffalo", "Linerunner", "Perrenial", "Sentinel", "Dumper", "Firetruck", "Trashmaster",
    "Stretch", "Manana", "Infernus", "Voodoo", "Pony", "Mule", "Cheetah", "Ambulance", "Leviathan", "Moonbeam",
    "Esperanto", "Taxi", "Washington", "Bobcat", "Whoopee", "BF Injection", "Hunter", "Premier", "Enforcer",
    "Securicar", "Banshee", "Predator", "Bus", "Rhino", "Barracks", "Hotknife", "Article Trailer", "Previon", "Coach",
    "Cabbie", "Stallion", "Rumpo", "RC Bandit", "Romero", "Packer", "Monster", "Admiral", "Squalo", "Seasparrow",
    "Pizzaboy", "Tram", "Article Trailer 2", "Turismo", "Speeder", "Reefer", "Tropic", "Flatbed", "Yankee", "Caddy", "Solair",
    "Berkley's RC Van", "Skimmer", "PCJ-600", "Faggio", "Freeway", "RC Baron", "RC Raider", "Glendale", "Oceanic",
    "Sanchez", "Sparrow", "Patriot", "Quad", "Coastguard", "Dinghy", "Hermes", "Sabre", "Rustler", "ZR-350", "Walton",
    "Regina", "Comet", "BMX", "Burrito", "Camper", "Marquis", "Baggage", "Dozer", "Maverick", "News Chopper", "Rancher",
    "FBI Rancher", "Virgo", "Greenwood", "Jetmax", "Hotring", "Sandking", "Blista Compact", "Police Maverick",
    "Boxville", "Benson", "Mesa", "RC Goblin", "Hotring Racer A", "Hotring Racer B", "Bloodring Banger", "Rancher",
    "Super GT", "Elegant", "Journey", "Bike", "Mountain Bike", "Beagle", "Cropduster", "Stuntplane", "Tanker", "Roadtrain",
    "Nebula", "Majestic", "Buccaneer", "Shamal", "Hydra", "FCR-900", "NRG-500", "HPV1000", "Cement Truck", "Tow Truck",
    "Fortune", "Cadrona", "SWAT Truck", "Willard", "Forklift", "Tractor", "Combine", "Feltzer", "Remington", "Slamvan",
    "Blade", "Streak", "Freight", "Vortex", "Vincent", "Bullet", "Clover", "Sadler", "Firetruck", "Hustler", "Intruder",
    "Primo", "Cargobob", "Tampa", "Sunrise", "Merit", "Utility", "Nevada", "Yosemite", "Windsor", "Monster", "Monster",
    "Uranus", "Jester", "Sultan", "Stratum", "Elegy", "Raindance", "RC Tiger", "Flash", "Tahoma", "Savanna", "Bandito",
    "Freight Flat", "Streak Carriage", "Kart", "Mower", "Dune", "Sweeper", "Broadway", "Tornado", "AT-400", "DFT-30",
    "Huntley", "Stafford", "BF-400", "News Van", "Tug", "Petrol Trailer", "Emperor", "Wayfarer", "Euros", "Hotdog", "Club",
    "Freight Box", "Article Trailer 3", "Andromada", "Dodo", "RC Cam", "Launch", "LSPD Car", "SFPD Car", "LVPD Car",
    "Police Rancher", "Picador", "S.W.A.T", "Alpha", "Phoenix", "Glendale", "Sadler", "Luggage", "Luggage", "Stairs",
    "Boxville", "Tiller", "Utility Trailer"
};

new const PreloadLibs[134][13] = {
	"AIRPORT",      "ATTRACTORS",   "BAR",          "BASEBALL",     "BD_FIRE",
	"BEACH",        "BENCHPRESS",   "BF_INJECTION", "BIKE_DBZ",     "BIKED",
	"BIKEH",        "BIKELEAP",     "BIKES",        "BIKEV",        "BLOWJOBZ",
	"BMX",          "BOMBER",       "BOX",          "BSKTBALL",     "BUDDY",
	"BUS",          "CAMERA",       "CAR",          "CAR_CHAT",     "CARRY",
	"CASINO",       "CHAINSAW",     "CHOPPA",       "CLOTHES",      "COACH",
	"COLT45",       "COP_AMBIENT",  "COP_DVBYZ",    "CRACK",        "CRIB",
	"DAM_JUMP",     "DANCING",      "DEALER",       "DILDO",        "DODGE",
	"DOZER",        "DRIVEBYS",     "FAT",          "FIGHT_B",      "FIGHT_C",
	"FIGHT_D",      "FIGHT_E",      "FINALE",       "FINALE2",      "FLAME",
	"FLOWERS",      "FOOD",         "FREEWEIGHTS",  "GANGS",        "GFUNK",
	"GHANDS",       "GHETTO_DB",    "GOGGLES",      "GRAFFITI",     "GRAVEYARD",
	"GRENADE",      "GYMNASIUM",    "HAIRCUTS",     "HEIST9",       "INT_HOUSE",
	"INT_OFFICE",   "INT_SHOP",     "JST_BUISNESS", "KART",         "KISSING",
	"KNIFE",        "LAPDAN1",      "LAPDAN2",      "LAPDAN3",      "LOWRIDER",
	"MD_CHASE",     "MD_END",       "MEDIC",        "MISC",         "MTB",
	"MUSCULAR",     "NEVADA",       "ON_LOOKERS",   "OTB",          "PARACHUTE",
	"PARK",         "PAULNMAC",     "PED",          "PLAYER_DVBYS", "PLAYIDLES",
	"POLICE",       "POOL",         "POOR",         "PYTHON",       "QUAD",
	"QUAD_DBZ",     "RAPPING",      "RIFLE",        "RIOT",         "ROB_BANK",
	"ROCKET",       "RUNNINGMAN",   "RUSTLER",      "RYDER",        "SCRATCHING",
	"SEX",          "SHAMAL",       "SHOP",         "SHOTGUN",      "SILENCED",
	"SKATE",        "SMOKING",      "SNIPER",       "SNM",          "SPRAYCAN",
	"STRIP",        "SUNBATHE",     "SWAT",         "SWEET",        "SWIM",
	"SWORD",        "TANK",         "TATTOOS",      "TEC",          "TRAIN",
	"TRUCK",        "UZI",          "VAN",          "VENDING",      "VORTEX",
	"WAYFARER",     "WEAPONS",      "WOP",          "WUZI"
};
new PlayerAnim[MAX_PLAYERS];




// ========== JOBS VARIABLES ==========

// ----- Cargobob Smuggle -----
#define MAX_SMUGGLE_MISSION 4

enum CARGOBOB_SMUGGLE{
	Float:rX,
	Float:rY,
	Float:rZ,
    cargobobVeh,
    cargobobContainer,
    cargobobRope,
    cargobobCP
};
new smuggleCargobob[CARGOBOB_SMUGGLE];

// ----- Van Smuggle ----
enum VAN_SMUGGLE{
	veh,
	cp
};
new smuggleVan[VAN_SMUGGLE];


/* TEXTDRAW VARIABLES */

// admin td
new Text:savline_adutyTD;
new Text:savline_hdutyTD;


new PlayerText:savline_text_armour[MAX_PLAYERS];
new PlayerText:savline_text_health[MAX_PLAYERS];

// property textdraw
new PlayerText:propertyTDbackground[MAX_PLAYERS];
new PlayerText:propertyTDRedbackground[MAX_PLAYERS];
new PlayerText:propertyTDenter[MAX_PLAYERS];
new PlayerText:propertyTDvalue[MAX_PLAYERS];
new PlayerText:propertyTDowner[MAX_PLAYERS];
new PlayerText:propertyTDname[MAX_PLAYERS];
new PlayerText:propertyTDpropertyinfo[MAX_PLAYERS];
