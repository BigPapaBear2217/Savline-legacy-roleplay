// fuzes editor dynamic text fix
stock SetDynamicObjectMaterialTextEx(objectid, const text[], materialindex, materialsize = OBJECT_MATERIAL_SIZE_256x128, const fontface[] = "Arial", fontsize = 24, bold = 1, fontcolor = 0xFFFFFFFF, backcolor = 0, textalignment = 0)
{
	SetDynamicObjectMaterialText(objectid, materialindex, text, materialsize, fontface, fontsize, bold, fontcolor, backcolor, textalignment);
}


hook OnGameModeInit()
{
	mapAdminArea(); // asiania script
	mapBankInterior(); // asiania script

	mapFDint(); // Diego
	mapFDext(); // Diego

	mapNorthRockShack(); // Timeline
	mapHeroinShip(); // Timeline
	mapPanoptionHeroinShack(); // Timeline
	mapBoneCountyShack(); // Timeline
	mapRedCountyShack(); //Timeline

	mapBlockedPNS(); // Timeline
	mapPoliceGarages(); // Timeline
	MapPizzaStacks(); // Macon
	mapLSCHexterior(); // TheonNuts
	mapGS9(); // Diego

	mapArea51(); // TheonNuts

	mapSASP(); // Macon
	mapFBI();

	mapTolls();
}

hook OnPlayerConnect(playerid)
{
	removeMapSmuggle(playerid);
	removeMapArea51(playerid);
	removeMapPizzaStacks(playerid);
	removeMapGS9(playerid);
	removeMapFDext(playerid);
}

stock mapAdminArea() { // BCR TRAINING SERVER LOBBY & ASIANIA RPG ADMIN AREA

	CreateDynamic3DTextLabel("Deku Tree\nwhy are u here again, greedy fuck! - /rewardme", 0xFFFF00FF, -952.85773, 3384.93945, 8.40770, 20.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, -1, -1 );

	// ADMIN BAZA BY LEVU
	new abazal;

	abazal = CreateDynamicObject(7914, -922.85150, 3278.45703, 12.43300,   0.00000, 0.00000, -93.11990);
	SetDynamicObjectMaterialText(abazal, 0, "{FFFFFF}OWNER: Diego & Ragnarok", 130, "Ariel", 22, 1, 0x00000000, 0x00000000, 1);
	abazal = CreateDynamicObject(7914, -922.85150, 3278.45703, 10.32378,   0.00000, 0.00000, -93.11990);
	SetDynamicObjectMaterialText(abazal, 0, "{FFFFFF}DIRECTOR: TBA", 130, "Ariel", 22, 1, 0x00000000, 0x00000000, 1);
	abazal = CreateDynamicObject(7914, -922.85150, 3278.45703, 7.99100,   0.00000, 0.00000, -93.11990);
	SetDynamicObjectMaterialText(abazal, 0, "{FFFFFF}LEADER: Chuck", 130, "Ariel", 22, 1, 0x00000000, 0x00000000, 1);
	abazal = CreateDynamicObject(7914, -922.85150, 3278.45703, 5.64045,   0.00000, 0.00000, -93.11990);
	SetDynamicObjectMaterialText(abazal, 0, "{FFFFFF}SCRIPTER: Diego & Galax", 130, "Ariel", 22, 1, 0x00000000, 0x00000000, 1);
	abazal = CreateDynamicObject(19552, -1041.09961, 3281.58179, 2.42830,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(abazal, 0, 6199, "law_beach2", "ws_carpark2", 0xFFFFFFFF);
	abazal = CreateDynamicObject(8498, -1060.86780, 3296.62036, 11.92870,   0.00000, 0.00000, -110.94000);
	abazal = CreateDynamicObject(19552, -916.11169, 3281.58179, 2.42830,   0.00000, 0.00000, 0.00000);
	SetObjectMaterial(abazal, 0, 6199, "law_beach2", "ws_carpark2", 0xFFFFFFFF);
	abazal = CreateDynamicObject(8498, -895.40479, 3265.90259, 11.90858,   0.00000, 0.00000, -291.54010);
	abazal = CreateDynamicObject(8882, -884.17133, 3274.37207, 34.79500,   0.00000, 0.00000, 23.88000);
	abazal = CreateDynamicObject(8881, -1066.95349, 3288.14941, 34.79500,   0.00000, 0.00000, 24.30001);
	abazal = CreateDynamicObject(9078, -953.70447, 3344.96191, 7.34350,   0.00000, 0.00000, -242.69981);
	abazal = CreateDynamicObject(19547, -952.21899, 3390.32056, -6.52874,   0.00000, 0.00000, -90.72001);
	abazal = CreateDynamicObject(18981, -919.55432, 3285.69824, 3.92650,   0.00000, 0.00000, -3.12000);
	SetDynamicObjectMaterial(abazal, 0, 5134, "wasteland_las2", "ws_sandstone2", 0xFFFFFFFF);
	abazal = CreateDynamicObject(18981, -920.33990, 3271.33545, 3.92650,   0.00000, 0.00000, -3.12000);
	SetDynamicObjectMaterial(abazal, 0, 5134, "wasteland_las2", "ws_sandstone2", 0xFFFFFFFF);
	abazal = CreateDynamicObject(8498, -1053.20007, 3246.49194, 11.90860,   0.00000, 0.00000, -379.32019);
	abazal = CreateDynamicObject(9123, -1046.78918, 3284.99487, 7.07370,   0.00000, 0.00000, -2.70000);
	abazal = CreateDynamicObject(18981, -982.55048, 3219.35840, 14.59470,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(abazal, 0, 5134, "wasteland_las2", "ws_sandstone2", 0xFFFFFFFF);
	abazal = CreateDynamicObject(18981, -957.55200, 3219.35840, 14.59474,   0.00000, 0.00000, 90.00000);
	SetDynamicObjectMaterial(abazal, 0, 5134, "wasteland_las2", "ws_sandstone2", 0xFFFFFFFF);
	abazal = CreateDynamicObject(7588, -986.30823, 3235.13159, 6.72887,   0.00000, 0.00000, 90.06004);
	abazal = CreateDynamicObject(7916, -969.21545, 3240.55615, 3.15230,   0.00000, 0.00000, 196.25990);
	abazal = CreateDynamicObject(7916, -992.15503, 3234.47437, 1.61658,   0.00000, 0.00000, 138.11992);
	abazal = CreateDynamicObject(19547, -1045.07629, 3217.69458, -1.19120,   0.00000, 0.00000, -76.68000);
	abazal = CreateDynamicObject(8498, -878.84174, 3383.12598, 11.92870,   0.00000, 0.00000, -291.23981);
	abazal = CreateDynamicObject(8498, -1016.94061, 3377.20752, 11.92870,   0.00000, 0.00000, -380.82001);
	abazal = CreateDynamicObject(19840, -963.16864, 3245.63550, 1.06000,   0.00000, 0.00000, 202.91995);
	abazal = CreateDynamicObject(19840, -984.75952, 3235.42236, 1.06000,   0.00000, 0.00000, 202.91995);
	abazal = CreateDynamicObject(19840, -1002.80249, 3239.45190, 1.06000,   0.00000, 0.00000, 165.84010);
	abazal = CreateDynamicObject(8498, -901.34363, 3445.99561, 11.90870,   0.00000, 0.00000, -200.57974);
	abazal = CreateDynamicObject(8498, -1016.08911, 3435.06079, 11.90870,   0.00000, 0.00000, -112.25977);
	abazal = CreateDynamicObject(8620, -919.89465, 3278.36377, 9.74550,   0.00000, 0.00000, 86.82000);
	SetDynamicObjectMaterial(abazal, 5, 2361, "shopping_freezers", "white", 0xFF000000);
	abazal = CreateDynamicObject(18981, -853.98181, 3320.57520, 12.36270,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(abazal, 0, 5134, "wasteland_las2", "ws_sandstone2", 0xFFFFFFFF);
	abazal = CreateDynamicObject(18752, -956.70374, 3397.11572, -56.58616,   0.00000, 0.00000, -7.01998);
	abazal = CreateDynamicObject(18981, -947.48529, 3337.33252, -10.00600,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(abazal, 0, 5134, "wasteland_las2", "ws_sandstone2", 0xFFFFFFFF);
	abazal = CreateDynamicObject(18981, -957.73090, 3337.72437, -10.00600,   0.00000, 0.00000, 0.00000);
	SetDynamicObjectMaterial(abazal, 0, 5134, "wasteland_las2", "ws_sandstone2", 0xFFFFFFFF);
	abazal = CreateDynamicObject(726, -952.70245, 3388.60352, 6.13208,   0.00000, 0.00000, 234.71992);
	abazal = CreateDynamicObject(8483, -1051.73181, 3321.14209, 7.74302,   0.00000, 0.00000, -12.30000);
	abazal = CreateDynamicObject(8492, -1030.83093, 3284.37793, 19.89164,   0.00000, 0.00000, 53.40004);
	abazal = CreateDynamicObject(19887, -968.55469, 3238.77271, 2.43110,   0.00000, 0.00000, -90.00000);
	abazal = CreateDynamicObject(19887, -1028.55298, 3238.77271, 2.43110,   0.00000, 0.00000, 90.00000);
	abazal = CreateDynamicObject(3509, -1032.35229, 3232.70801, 6.07921,   0.00000, 0.00000, 0.00000);
	abazal = CreateDynamicObject(3509, -951.80286, 3243.70850, 5.01115,   0.00000, 0.00000, 0.00000);
	abazal = CreateDynamicObject(3510, -997.92871, 3251.70679, 5.01120,   0.00000, 0.00000, 0.00000);
	abazal = CreateDynamicObject(3511, -974.70392, 3233.32324, 5.12349,   0.00000, 0.00000, 0.00000);
	abazal = CreateDynamicObject(1557, -1029.75806, 3282.68848, 2.40740,   0.00000, 0.00000, 87.48010);
	abazal = CreateDynamicObject(1557, -1029.63000, 3285.71387, 2.40740,   0.00000, 0.00000, 267.48010);
	abazal = CreateDynamicObject(3438, -1021.51733, 3283.85449, 1.54510,   0.00000, 0.00000, -2.70000);
	abazal = CreateDynamicObject(3438, -1025.53552, 3284.04541, 1.54510,   0.00000, 0.00000, -2.70000);
	abazal = CreateDynamicObject(3438, -1029.37390, 3284.21533, 1.54510,   0.00000, 0.00000, -2.70000);
}


stock IntBank_CreateDynamicObject( object_id, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz ) {
    return CreateDynamicObject( object_id, x, y, z, rx, ry, rz, 1, 1, -1, 300.000, 300.000);
}

stock mapFDint()
{
	new g_Object[215];
	g_Object[0] = CreateDynamicObject(19379, 1347.5544, -1798.3332, 966.7813, 0.0000, -89.9000, 0.0000); //wall027
	SetDynamicObjectMaterial(g_Object[0], 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	g_Object[1] = CreateDynamicObject(19379, 1337.3343, -1798.3332, 966.7998, 0.0000, -89.9000, 0.0000); //wall027
	SetDynamicObjectMaterial(g_Object[1], 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	g_Object[2] = CreateDynamicObject(19379, 1337.3343, -1807.9321, 966.7998, 0.0000, -89.9000, 0.0000); //wall027
	SetDynamicObjectMaterial(g_Object[2], 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	g_Object[3] = CreateDynamicObject(19379, 1347.5477, -1807.9321, 966.7830, 0.0000, -89.9000, 0.0000); //wall027
	SetDynamicObjectMaterial(g_Object[3], 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	g_Object[4] = CreateDynamicObject(19379, 1337.3177, -1817.1396, 966.8010, 0.0000, -89.9000, 0.0000); //wall027
	SetDynamicObjectMaterial(g_Object[4], 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	g_Object[5] = CreateDynamicObject(19357, 1337.7624, -1793.5238, 968.5960, 0.0000, 0.0000, -90.5998); //wall005
	SetDynamicObjectMaterial(g_Object[5], 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	g_Object[6] = CreateDynamicObject(19357, 1340.9239, -1793.5576, 968.5960, 0.0000, 0.0000, -90.5998); //wall005
	SetDynamicObjectMaterial(g_Object[6], 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	g_Object[7] = CreateDynamicObject(19357, 1344.0843, -1793.5898, 968.5960, 0.0000, 0.0000, -90.5998); //wall005
	SetDynamicObjectMaterial(g_Object[7], 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	g_Object[8] = CreateDynamicObject(19357, 1347.1142, -1793.6214, 968.5960, 0.0000, 0.0000, -90.5998); //wall005
	SetDynamicObjectMaterial(g_Object[8], 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	g_Object[9] = CreateDynamicObject(19357, 1350.1645, -1793.6534, 968.5960, 0.0000, 0.0000, -90.5998); //wall005
	SetDynamicObjectMaterial(g_Object[9], 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	g_Object[10] = CreateDynamicObject(19357, 1353.2546, -1793.6860, 968.5960, 0.0000, 0.0000, -90.5998); //wall005
	g_Object[11] = CreateDynamicObject(7313, 1345.8574, -1793.6815, 969.4556, 0.0000, 0.0000, -0.5999); //vgsN_scrollsgn01
	SetDynamicObjectMaterialTextEx(g_Object[11], "SAFD - State of Savline", 0, OBJECT_MATERIAL_SIZE_256x32, "Arial", 24, 1, 0xFFFFFFFF, 0xFFB22222, 1);
	g_Object[12] = CreateDynamicObject(1569, 1341.0029, -1793.6302, 966.8530, 0.0000, 0.0000, -0.1999); //ADAM_V_DOOR
	g_Object[13] = CreateDynamicObject(7313, 1339.1378, -1793.6103, 969.4556, 0.0000, 0.0000, -0.5999); //vgsN_scrollsgn01
	SetDynamicObjectMaterialTextEx(g_Object[13], "SAFD - State of Savline", 0, OBJECT_MATERIAL_SIZE_256x32, "Arial", 24, 1, 0xFFFFFFFF, 0xFFB22222, 1);
	g_Object[14] = CreateDynamicObject(1569, 1344.0019, -1793.6715, 966.8530, 0.0000, 0.0000, 178.4998); //ADAM_V_DOOR
	g_Object[15] = CreateDynamicObject(19440, 1345.2591, -1807.6960, 967.7412, -0.7997, 90.0998, -0.6998); //wall080
	SetDynamicObjectMaterial(g_Object[15], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[16] = CreateDynamicObject(19357, 1334.6009, -1793.4897, 968.5960, 0.0000, 0.0000, -90.5998); //wall005
	SetDynamicObjectMaterial(g_Object[16], 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	g_Object[17] = CreateDynamicObject(19379, 1326.8608, -1798.3332, 966.8178, 0.0000, -89.9000, 0.0000); //wall027
	SetDynamicObjectMaterial(g_Object[17], 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	g_Object[18] = CreateDynamicObject(19379, 1326.8608, -1807.9381, 966.8178, 0.0000, -89.9000, 0.0000); //wall027
	SetDynamicObjectMaterial(g_Object[18], 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	g_Object[19] = CreateDynamicObject(19379, 1326.8608, -1817.1295, 966.8178, 0.0000, -89.9000, 0.0000); //wall027
	SetDynamicObjectMaterial(g_Object[19], 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	g_Object[20] = CreateDynamicObject(19357, 1335.5860, -1795.0998, 968.5960, 0.0000, 0.0000, -0.0996); //wall005
	SetDynamicObjectMaterial(g_Object[20], 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	g_Object[21] = CreateDynamicObject(19357, 1349.4172, -1795.1241, 968.5960, 0.0000, 0.0000, -0.0996); //wall005
	SetDynamicObjectMaterial(g_Object[21], 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	g_Object[22] = CreateDynamicObject(19357, 1335.5804, -1798.2302, 968.5960, 0.0000, 0.0000, -0.0996); //wall005
	SetDynamicObjectMaterial(g_Object[22], 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	g_Object[23] = CreateDynamicObject(19357, 1335.5770, -1801.3631, 968.5960, 0.0000, 0.0000, -0.0996); //wall005
	SetDynamicObjectMaterial(g_Object[23], 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	g_Object[24] = CreateDynamicObject(19357, 1349.4104, -1798.2552, 968.5960, 0.0000, 0.0000, -0.0996); //wall005
	SetDynamicObjectMaterial(g_Object[24], 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	g_Object[25] = CreateDynamicObject(19357, 1349.4068, -1801.3862, 968.5960, 0.0000, 0.0000, -0.0996); //wall005
	SetDynamicObjectMaterial(g_Object[25], 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	g_Object[26] = CreateDynamicObject(2132, 1331.2922, -1823.7978, 966.8944, 0.0000, 0.0000, 136.1999); //CJ_KITCH2_SINK
	g_Object[27] = CreateDynamicObject(19357, 1349.4000, -1804.4870, 968.5960, 0.0000, 0.0000, -0.0996); //wall005
	SetDynamicObjectMaterial(g_Object[27], 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	g_Object[28] = CreateDynamicObject(19357, 1347.7961, -1810.5145, 968.6060, 0.0000, 0.0000, -90.5998); //wall005
	SetDynamicObjectMaterial(g_Object[28], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[29] = CreateDynamicObject(19357, 1349.3935, -1807.6363, 968.5960, 0.0000, 0.0000, -0.0996); //wall005
	SetDynamicObjectMaterial(g_Object[29], 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	g_Object[30] = CreateDynamicObject(19357, 1349.3879, -1810.7662, 968.5960, 0.0000, 0.0000, -0.0996); //wall005
	SetDynamicObjectMaterial(g_Object[30], 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	g_Object[31] = CreateDynamicObject(19357, 1335.5716, -1804.5034, 968.5960, 0.0000, 0.0000, -0.0996); //wall005
	SetDynamicObjectMaterial(g_Object[31], 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	g_Object[32] = CreateDynamicObject(19357, 1344.6451, -1810.4818, 968.6060, 0.0000, 0.0000, -90.5998); //wall005
	SetDynamicObjectMaterial(g_Object[32], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[33] = CreateDynamicObject(19357, 1341.5057, -1810.4488, 968.6060, 0.0000, 0.0000, -90.5998); //wall005
	SetDynamicObjectMaterial(g_Object[33], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[34] = CreateDynamicObject(14455, 1329.2180, -1799.4864, 968.2957, 0.0000, 0.0000, -91.1996); //Gs_BOOKCASE
	g_Object[35] = CreateDynamicObject(2309, 1332.7209, -1802.5251, 966.8806, 0.0000, 0.0000, 0.0000); //MED_OFFICE_CHAIR2
	g_Object[36] = CreateDynamicObject(19835, 1331.5911, -1800.4735, 967.7327, 0.0000, 0.0000, 0.0000); //CoffeeCup1
	g_Object[37] = CreateDynamicObject(19387, 1336.2871, -1809.7441, 968.5955, 0.0000, 0.0000, 46.2999); //wall035
	SetDynamicObjectMaterial(g_Object[37], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[38] = CreateDynamicObject(1499, 1335.0909, -1813.1120, 966.8861, 0.0000, 0.0000, -136.3000); //Gen_doorINT05
	SetDynamicObjectMaterialTextEx(g_Object[38], "_", 0, OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0xFFB22222, 0);
	SetDynamicObjectMaterialTextEx(g_Object[38], "_", 1, OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFAFA, 0xFFFFFAFA, 0);
	g_Object[39] = CreateDynamicObject(19440, 1348.7583, -1807.7287, 967.7448, -0.0996, 90.0998, -0.6998); //wall080
	SetDynamicObjectMaterial(g_Object[39], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[40] = CreateDynamicObject(19440, 1340.0732, -1807.6572, 966.1057, -0.4999, 179.9002, -0.6998); //wall080
	SetDynamicObjectMaterialTextEx(g_Object[40], "_", 0, OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0xFFFFFFFF, 0);
	g_Object[41] = CreateDynamicObject(19357, 1341.5830, -1808.3785, 966.1157, 0.0000, 0.0000, -90.5998); //wall005
	SetDynamicObjectMaterialTextEx(g_Object[41], "_", 0, OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0xFFFFFFFF, 0);
	SetDynamicObjectMaterialTextEx(g_Object[41], "_", 1, OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0xFFA9A9A9, 0);
	g_Object[42] = CreateDynamicObject(19357, 1344.7524, -1808.4117, 966.1157, 0.0000, 0.0000, -90.5998); //wall005
	SetDynamicObjectMaterialTextEx(g_Object[42], "_", 0, OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0xFFFFFFFF, 0);
	SetDynamicObjectMaterialTextEx(g_Object[42], "_", 1, OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0xFFD3D3D3, 0);
	g_Object[43] = CreateDynamicObject(19357, 1347.9641, -1808.4455, 966.1157, 0.0000, 0.0000, -90.5998); //wall005
	SetDynamicObjectMaterialTextEx(g_Object[43], "_", 0, OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0xFFFFFFFF, 0);
	SetDynamicObjectMaterialTextEx(g_Object[43], "_", 1, OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0xFFD3D3D3, 0);
	g_Object[44] = CreateDynamicObject(19357, 1338.3758, -1810.4178, 968.6060, 0.0000, 0.0000, -90.5998); //wall005
	SetDynamicObjectMaterial(g_Object[44], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[45] = CreateDynamicObject(19357, 1335.5659, -1807.3940, 968.5960, 0.0000, 0.0000, -0.5999); //wall005
	SetDynamicObjectMaterial(g_Object[45], 0, 10398, "countryclub_sfs", "hc_brickwall1", 0x00000000);
	g_Object[46] = CreateDynamicObject(3657, 1346.7757, -1794.3474, 967.3449, 0.0000, 0.0000, -0.2998); //airseata_LAS
	g_Object[47] = CreateDynamicObject(1806, 1332.2010, -1799.0935, 966.8665, 0.0000, 0.0000, -178.8000); //MED_OFFICE_CHAIR
	g_Object[48] = CreateDynamicObject(3657, 1346.7635, -1797.0698, 967.3449, 0.0000, 0.0000, -0.2998); //airseata_LAS
	g_Object[49] = CreateDynamicObject(3657, 1346.7497, -1799.4720, 967.3449, 0.0000, 0.0000, -0.2998); //airseata_LAS
	g_Object[50] = CreateDynamicObject(19440, 1341.7895, -1807.6634, 967.7484, 0.0000, 90.0998, -0.5999); //wall080
	SetDynamicObjectMaterial(g_Object[50], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[51] = CreateDynamicObject(19786, 1342.7314, -1810.4664, 968.8413, 0.0000, 0.0000, 179.6997); //LCDTVBig1
	g_Object[52] = CreateDynamicObject(19357, 1336.2723, -1812.0550, 968.6060, 0.0000, 0.0000, -46.7999); //wall005
	SetDynamicObjectMaterial(g_Object[52], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[53] = CreateDynamicObject(19357, 1333.8260, -1809.7275, 968.6060, 0.0000, 0.0000, -47.7999); //wall005
	SetDynamicObjectMaterial(g_Object[53], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[54] = CreateDynamicObject(19357, 1332.8530, -1815.2657, 968.6060, 0.0000, 0.0000, -46.7999); //wall005
	SetDynamicObjectMaterial(g_Object[54], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[55] = CreateDynamicObject(11729, 1337.7618, -1819.4029, 966.8604, 0.0000, 0.0000, -130.2998); //GymLockerClosed1
	g_Object[56] = CreateDynamicObject(19357, 1331.1745, -1811.3149, 968.6060, 0.0000, 0.0000, -70.0998); //wall005
	SetDynamicObjectMaterial(g_Object[56], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[57] = CreateDynamicObject(19357, 1328.1147, -1811.6195, 968.6060, 0.0000, 0.0000, -98.4001); //wall005
	SetDynamicObjectMaterial(g_Object[57], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[58] = CreateDynamicObject(19357, 1334.7252, -1807.3138, 968.5960, 0.0000, 0.0000, -0.5999); //wall005
	SetDynamicObjectMaterial(g_Object[58], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[59] = CreateDynamicObject(19357, 1334.7578, -1804.1330, 968.5960, 0.0000, 0.0000, -0.5999); //wall005
	SetDynamicObjectMaterial(g_Object[59], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[60] = CreateDynamicObject(19357, 1334.7904, -1801.0030, 968.5960, 0.0000, 0.0000, -0.5999); //wall005
	SetDynamicObjectMaterial(g_Object[60], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[61] = CreateDynamicObject(19357, 1334.8225, -1797.8531, 968.5960, 0.0000, 0.0000, -0.5999); //wall005
	SetDynamicObjectMaterial(g_Object[61], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[62] = CreateDynamicObject(19357, 1333.2064, -1798.5526, 968.5960, 0.0000, 0.0000, -89.9998); //wall005
	SetDynamicObjectMaterial(g_Object[62], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[63] = CreateDynamicObject(19357, 1330.0246, -1798.5526, 968.5960, 0.0000, 0.0000, -89.9998); //wall005
	SetDynamicObjectMaterial(g_Object[63], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[64] = CreateDynamicObject(19357, 1326.8341, -1798.5526, 968.5960, 0.0000, 0.0000, -89.9998); //wall005
	SetDynamicObjectMaterial(g_Object[64], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[65] = CreateDynamicObject(19357, 1324.6119, -1799.7989, 968.5960, 0.0000, 0.0000, -27.1998); //wall005
	SetDynamicObjectMaterial(g_Object[65], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[66] = CreateDynamicObject(19357, 1323.9643, -1802.4813, 968.5960, 0.0000, 0.0000, -0.5999); //wall005
	SetDynamicObjectMaterial(g_Object[66], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[67] = CreateDynamicObject(19357, 1323.9322, -1805.4715, 968.5960, 0.0000, 0.0000, -0.5999); //wall005
	SetDynamicObjectMaterial(g_Object[67], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[68] = CreateDynamicObject(19357, 1323.9000, -1808.6510, 968.5960, 0.0000, 0.0000, -0.5999); //wall005
	SetDynamicObjectMaterial(g_Object[68], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[69] = CreateDynamicObject(19391, 1325.0743, -1810.7467, 968.6176, 0.0000, 0.0000, 66.8000); //wall039
	SetDynamicObjectMaterial(g_Object[69], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[70] = CreateDynamicObject(3657, 1338.2380, -1796.9880, 967.3449, 0.0000, 0.0000, -0.2998); //airseata_LAS
	g_Object[71] = CreateDynamicObject(3657, 1338.2491, -1794.4171, 967.3449, 0.0000, 0.0000, -0.2998); //airseata_LAS
	g_Object[72] = CreateDynamicObject(19357, 1338.0600, -1812.4719, 968.6060, 0.0000, 0.0000, -116.8998); //wall005
	SetDynamicObjectMaterial(g_Object[72], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[73] = CreateDynamicObject(19357, 1340.8160, -1813.8702, 968.6060, 0.0000, 0.0000, -116.8998); //wall005
	SetDynamicObjectMaterial(g_Object[73], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[74] = CreateDynamicObject(19357, 1333.8691, -1816.6258, 968.6060, 0.0000, 0.0000, -132.0997); //wall005
	SetDynamicObjectMaterial(g_Object[74], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[75] = CreateDynamicObject(19357, 1336.2202, -1818.7508, 968.6060, 0.0000, 0.0000, -132.0997); //wall005
	SetDynamicObjectMaterial(g_Object[75], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[76] = CreateDynamicObject(19357, 1341.2513, -1815.9471, 968.6060, 0.0000, 0.0000, -40.0000); //wall005
	SetDynamicObjectMaterial(g_Object[76], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[77] = CreateDynamicObject(19357, 1339.2198, -1818.3680, 968.6060, 0.0000, 0.0000, -40.0000); //wall005
	SetDynamicObjectMaterial(g_Object[77], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[78] = CreateDynamicObject(19357, 1337.2082, -1820.7663, 968.6060, 0.0000, 0.0000, -40.0000); //wall005
	SetDynamicObjectMaterial(g_Object[78], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[79] = CreateDynamicObject(19357, 1338.5659, -1820.8706, 968.6060, 0.0000, 0.0000, -132.0997); //wall005
	SetDynamicObjectMaterial(g_Object[79], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[80] = CreateDynamicObject(2390, 1340.8492, -1815.8785, 968.1760, 0.0000, 0.0000, -131.8000); //CJ_4way_clothes
	g_Object[81] = CreateDynamicObject(11729, 1338.1759, -1818.9145, 966.8604, 0.0000, 0.0000, -130.2998); //GymLockerClosed1
	g_Object[82] = CreateDynamicObject(11730, 1338.5970, -1818.3828, 966.8604, 0.0000, 0.0000, -127.2994); //GymLockerOpen1
	g_Object[83] = CreateDynamicObject(11729, 1339.0234, -1817.9162, 966.8604, 0.0000, 0.0000, -130.2998); //GymLockerClosed1
	g_Object[84] = CreateDynamicObject(11730, 1339.3850, -1817.3481, 966.8604, 0.0000, 0.0000, -127.2994); //GymLockerOpen1
	g_Object[85] = CreateDynamicObject(11730, 1339.7790, -1816.8321, 966.8604, 0.0000, 0.0000, -127.2994); //GymLockerOpen1
	g_Object[86] = CreateDynamicObject(19357, 1339.2198, -1818.3680, 968.6060, 0.0000, 0.0000, -40.0000); //wall005
	SetDynamicObjectMaterial(g_Object[86], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[87] = CreateDynamicObject(11729, 1340.1594, -1816.3620, 966.8604, 0.0000, 0.0000, -130.2998); //GymLockerClosed1
	g_Object[88] = CreateDynamicObject(19331, 1339.6301, -1816.9670, 969.0017, -1.6000, -90.6996, 39.0998); //fire_hat02
	g_Object[89] = CreateDynamicObject(2390, 1341.5959, -1815.0445, 968.1760, 0.0000, 0.0000, -131.8000); //CJ_4way_clothes
	g_Object[90] = CreateDynamicObject(341, 1332.8657, -1815.5006, 968.4503, 0.0000, 0.0000, 39.2999); //chnsaw
	g_Object[91] = CreateDynamicObject(2690, 1335.5152, -1813.0361, 968.2650, 0.0000, 0.0000, 44.1999); //CJ_FIRE_EXT
	g_Object[92] = CreateDynamicObject(2690, 1335.8160, -1812.7436, 968.2650, 0.0000, 0.0000, 44.1999); //CJ_FIRE_EXT
	g_Object[93] = CreateDynamicObject(2690, 1336.1313, -1812.4377, 968.2650, 0.0000, 0.0000, 44.1999); //CJ_FIRE_EXT
	g_Object[94] = CreateDynamicObject(2690, 1336.4610, -1812.1175, 968.2650, 0.0000, 0.0000, 44.1999); //CJ_FIRE_EXT
	g_Object[95] = CreateDynamicObject(19172, 1334.6363, -1801.6229, 968.9754, 0.0000, 0.0000, -90.4999); //SAMPPicture1
	g_Object[96] = CreateDynamicObject(341, 1333.1561, -1815.2236, 968.2301, 0.0000, 0.0000, 39.2999); //chnsaw
	g_Object[97] = CreateDynamicObject(341, 1333.4277, -1815.0019, 967.9597, 0.0000, 0.0000, 39.2999); //chnsaw
	g_Object[98] = CreateDynamicObject(19330, 1338.9764, -1817.9542, 968.9984, -1.0000, -91.0998, 52.8997); //fire_hat01
	g_Object[99] = CreateDynamicObject(2373, 1335.6206, -1818.4558, 966.7854, 0.0000, 0.0000, 137.9001); //CLOTHES_RAIL3
	g_Object[100] = CreateDynamicObject(19357, 1329.0184, -1800.2204, 968.5960, 0.0000, 0.0000, -0.5999); //wall005
	SetDynamicObjectMaterial(g_Object[100], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[101] = CreateDynamicObject(19357, 1328.9864, -1803.2004, 968.5960, 0.0000, 0.0000, -0.5999); //wall005
	SetDynamicObjectMaterial(g_Object[101], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[102] = CreateDynamicObject(19357, 1333.7822, -1804.9298, 968.5960, 0.0000, 0.0000, -91.3999); //wall005
	SetDynamicObjectMaterial(g_Object[102], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[103] = CreateDynamicObject(19387, 1330.5908, -1804.8419, 968.5955, 0.0000, 0.0000, 88.2994); //wall035
	SetDynamicObjectMaterial(g_Object[103], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[104] = CreateDynamicObject(19387, 1327.3806, -1804.7467, 968.5955, 0.0000, 0.0000, 88.2994); //wall035
	SetDynamicObjectMaterial(g_Object[104], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[105] = CreateDynamicObject(19357, 1324.2163, -1804.6662, 968.5960, 0.0000, 0.0000, -91.3999); //wall005
	SetDynamicObjectMaterial(g_Object[105], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[106] = CreateDynamicObject(1808, 1334.4156, -1808.4641, 966.8682, 0.0000, 0.0000, -89.9999); //CJ_WATERCOOLER2
	g_Object[107] = CreateDynamicObject(1726, 1334.0837, -1805.6855, 966.8651, 0.0000, 0.0000, -90.0000); //mrk_seating2
	g_Object[108] = CreateDynamicObject(19173, 1331.1881, -1811.1988, 968.8081, 0.0000, 0.0000, 19.7999); //SAMPPicture2
	g_Object[109] = CreateDynamicObject(2030, 1335.4001, -1821.2264, 967.3062, 0.0000, 0.0000, 0.0000); //MED_DINNING_1
	g_Object[110] = CreateDynamicObject(2309, 1331.7701, -1802.5052, 966.8806, 0.0000, 0.0000, 0.0000); //MED_OFFICE_CHAIR2
	g_Object[111] = CreateDynamicObject(19357, 1344.7585, -1806.9101, 966.1157, 0.0000, 0.0000, -90.5998); //wall005
	SetDynamicObjectMaterialTextEx(g_Object[111], "_", 0, OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0xFFFFFFFF, 0);
	SetDynamicObjectMaterialTextEx(g_Object[111], "_", 1, OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0xFFD3D3D3, 0);
	g_Object[112] = CreateDynamicObject(19357, 1347.7181, -1806.9405, 966.1157, 0.0000, 0.0000, -90.5998); //wall005
	SetDynamicObjectMaterialTextEx(g_Object[112], "_", 0, OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0xFFFFFFFF, 0);
	SetDynamicObjectMaterialTextEx(g_Object[112], "_", 1, OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0xFFA9A9A9, 0);
	g_Object[113] = CreateDynamicObject(19357, 1341.5980, -1806.8780, 966.1157, 0.0000, 0.0000, -90.5998); //wall005
	SetDynamicObjectMaterialTextEx(g_Object[113], "_", 0, OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0xFFFFFFFF, 0);
	SetDynamicObjectMaterialTextEx(g_Object[113], "_", 1, OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0xFFD3D3D3, 0);
	g_Object[114] = CreateDynamicObject(2273, 1332.2226, -1799.1584, 968.6796, 0.0000, 0.0000, 0.0000); //Frame_Fab_1
	g_Object[115] = CreateDynamicObject(1808, 1334.4431, -1798.8664, 966.8836, 0.0000, 0.0000, 0.0000); //CJ_WATERCOOLER2
	g_Object[116] = CreateDynamicObject(19786, 1333.0411, -1804.8298, 968.4943, -2.0999, 0.0000, 179.6999); //LCDTVBig1
	g_Object[117] = CreateDynamicObject(1494, 1329.8000, -1804.8232, 966.8922, 0.0000, 0.2000, -1.6999); //Gen_doorINT03
	SetDynamicObjectMaterial(g_Object[117], 1, 1569, "adam_v_doort", "ws_guardhousedoor", 0x00000000);
	g_Object[118] = CreateDynamicObject(14455, 1328.9072, -1803.8502, 968.2957, 0.0000, 0.0000, 89.4001); //Gs_BOOKCASE
	g_Object[119] = CreateDynamicObject(1494, 1326.5996, -1804.7298, 966.9041, 0.0000, 0.2000, -1.6999); //Gen_doorINT03
	SetDynamicObjectMaterial(g_Object[119], 1, 1569, "adam_v_doort", "ws_guardhousedoor", 0x00000000);
	g_Object[120] = CreateDynamicObject(1663, 1343.7757, -1809.4282, 967.3468, 0.0000, 0.0000, 176.5997); //swivelchair_B
	g_Object[121] = CreateDynamicObject(1702, 1324.6180, -1808.3935, 966.9036, 0.0000, 0.0000, 90.0998); //kb_couch06
	g_Object[122] = CreateDynamicObject(1806, 1326.9333, -1798.9735, 966.8665, 0.0000, -0.1999, -178.8000); //MED_OFFICE_CHAIR
	g_Object[123] = CreateDynamicObject(19893, 1343.1893, -1808.1118, 967.8950, 0.0000, 0.0000, 28.1000); //LaptopSAMP1
	g_Object[124] = CreateDynamicObject(949, 1340.4967, -1793.7336, 967.5427, 0.0000, 0.0000, 0.0000); //Plant_Pot_4
	g_Object[125] = CreateDynamicObject(949, 1344.5079, -1793.7038, 967.5227, 0.0000, 0.0000, 0.0000); //Plant_Pot_4
	g_Object[126] = CreateDynamicObject(2207, 1326.0135, -1800.9105, 966.8637, 0.0000, 0.0000, 0.0000); //MED_OFFICE7_DESK_1
	g_Object[127] = CreateDynamicObject(2309, 1326.8491, -1802.5152, 966.8806, 0.0000, 0.0000, 0.0000); //MED_OFFICE_CHAIR2
	g_Object[128] = CreateDynamicObject(19786, 1346.2347, -1810.4825, 968.8413, 0.0000, 0.0000, 179.6997); //LCDTVBig1
	SetDynamicObjectMaterialTextEx(g_Object[128], "SAFD", 1, OBJECT_MATERIAL_SIZE_256x128, "Arial", 38, 1, 0xFFB22222, 0xFFFFFAFA, 1);
	g_Object[129] = CreateDynamicObject(19357, 1332.8691, -1817.3293, 968.6060, 0.0000, 0.0000, -132.0997); //wall005
	SetDynamicObjectMaterial(g_Object[129], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[130] = CreateDynamicObject(19357, 1335.2209, -1819.4549, 968.6060, 0.0000, 0.0000, -132.0997); //wall005
	SetDynamicObjectMaterial(g_Object[130], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[131] = CreateDynamicObject(19357, 1328.2882, -1819.5775, 968.6060, 0.0000, 0.0000, -46.7999); //wall005
	SetDynamicObjectMaterial(g_Object[131], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[132] = CreateDynamicObject(19387, 1330.5399, -1817.4521, 968.5955, 0.0000, 0.0000, 133.5997); //wall035
	SetDynamicObjectMaterial(g_Object[132], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[133] = CreateDynamicObject(19379, 1326.8857, -1826.6827, 966.8187, 0.0000, -89.9000, 0.0000); //wall027
	SetDynamicObjectMaterial(g_Object[133], 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	g_Object[134] = CreateDynamicObject(19379, 1337.3208, -1826.6827, 966.7998, 0.0000, -89.9000, 0.0000); //wall027
	SetDynamicObjectMaterial(g_Object[134], 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	g_Object[135] = CreateDynamicObject(19357, 1328.3326, -1821.7923, 968.6060, 0.0000, 0.0000, -133.1997); //wall005
	SetDynamicObjectMaterial(g_Object[135], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[136] = CreateDynamicObject(19357, 1330.6501, -1823.9681, 968.6060, 0.0000, 0.0000, -133.1997); //wall005
	SetDynamicObjectMaterial(g_Object[136], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[137] = CreateDynamicObject(19357, 1335.1848, -1823.1794, 968.6060, 0.0000, 0.0000, -40.0000); //wall005
	SetDynamicObjectMaterial(g_Object[137], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[138] = CreateDynamicObject(19357, 1333.1402, -1825.6157, 968.6060, 0.0000, 0.0000, -40.0000); //wall005
	SetDynamicObjectMaterial(g_Object[138], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[139] = CreateDynamicObject(19357, 1332.9748, -1826.1518, 968.6060, 0.0000, 0.0000, -133.1997); //wall005
	SetDynamicObjectMaterial(g_Object[139], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[140] = CreateDynamicObject(19357, 1337.5052, -1821.5196, 968.6060, 0.0000, 0.0000, -132.0997); //wall005
	SetDynamicObjectMaterial(g_Object[140], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[141] = CreateDynamicObject(2339, 1332.0047, -1824.4979, 966.8961, 0.0000, 0.0000, 135.6999); //CJ_KITCH2_COOKER
	g_Object[142] = CreateDynamicObject(2339, 1332.6915, -1825.1689, 966.8961, 0.0000, 0.0000, 135.6999); //CJ_KITCH2_COOKER
	g_Object[143] = CreateDynamicObject(2141, 1329.8562, -1822.4392, 966.8889, 0.0000, 0.0000, 135.3000); //CJ_KITCH2_L
	g_Object[144] = CreateDynamicObject(2500, 1332.3303, -1825.2434, 967.9152, 0.0000, 0.0000, 136.0997); //CJ_FF_COFFEE
	g_Object[145] = CreateDynamicObject(2125, 1334.7666, -1822.5716, 967.1931, 0.0000, 0.0000, 0.0000); //MED_DIN_CHAIR_1
	g_Object[146] = CreateDynamicObject(2125, 1333.9791, -1821.3658, 967.1931, 0.0000, 0.0000, 30.6998); //MED_DIN_CHAIR_1
	g_Object[147] = CreateDynamicObject(2125, 1334.6462, -1820.1700, 967.1931, 0.0000, 0.0000, 0.0000); //MED_DIN_CHAIR_1
	g_Object[148] = CreateDynamicObject(1703, 1328.3017, -1820.4145, 966.8900, 0.0000, 0.0000, 43.3997); //kb_couch02
	g_Object[149] = CreateDynamicObject(1811, 1318.3645, -1812.6634, 967.4970, 0.0000, 0.0000, 0.0000); //MED_DIN_CHAIR_5
	g_Object[150] = CreateDynamicObject(19357, 1322.3835, -1810.2784, 968.5858, 0.0000, 0.0000, -89.9000); //wall005
	SetDynamicObjectMaterial(g_Object[150], 0, 14847, "mp_policesf", "mp_cop_marble", 0x00000000);
	g_Object[151] = CreateDynamicObject(19357, 1325.4919, -1820.6833, 968.6060, 0.0000, 0.0000, -89.9000); //wall005
	SetDynamicObjectMaterial(g_Object[151], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[152] = CreateDynamicObject(19379, 1316.4117, -1817.3797, 966.8361, 0.0000, -89.9000, 0.0000); //wall027
	SetDynamicObjectMaterial(g_Object[152], 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	g_Object[153] = CreateDynamicObject(19379, 1316.4117, -1807.7701, 966.8361, 0.0000, -89.9000, 0.0000); //wall027
	SetDynamicObjectMaterial(g_Object[153], 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	g_Object[154] = CreateDynamicObject(19357, 1322.7320, -1820.6877, 968.6060, 0.0000, 0.0000, -90.1998); //wall005
	SetDynamicObjectMaterial(g_Object[154], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[155] = CreateDynamicObject(19357, 1322.7539, -1810.3685, 968.6060, 0.0000, 0.0000, -89.9000); //wall005
	SetDynamicObjectMaterial(g_Object[155], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[156] = CreateDynamicObject(19357, 1316.0000, -1820.6977, 968.6060, 0.0000, 0.0000, -89.9000); //wall005
	SetDynamicObjectMaterial(g_Object[156], 0, 14847, "mp_policesf", "mp_cop_marble", 0x00000000);
	g_Object[157] = CreateDynamicObject(19357, 1312.8691, -1820.7032, 968.6060, 0.0000, 0.0000, -89.9000); //wall005
	SetDynamicObjectMaterial(g_Object[157], 0, 14847, "mp_policesf", "mp_cop_marble", 0x00000000);
	g_Object[158] = CreateDynamicObject(19357, 1319.2032, -1810.2845, 968.5858, 0.0000, 0.0000, -89.9000); //wall005
	SetDynamicObjectMaterial(g_Object[158], 0, 14847, "mp_policesf", "mp_cop_marble", 0x00000000);
	g_Object[159] = CreateDynamicObject(19357, 1316.0332, -1810.2895, 968.5858, 0.0000, 0.0000, -89.9000); //wall005
	SetDynamicObjectMaterial(g_Object[159], 0, 14847, "mp_policesf", "mp_cop_marble", 0x00000000);
	g_Object[160] = CreateDynamicObject(19357, 1312.9029, -1810.2956, 968.5858, 0.0000, 0.0000, -89.9000); //wall005
	SetDynamicObjectMaterial(g_Object[160], 0, 14847, "mp_policesf", "mp_cop_marble", 0x00000000);
	g_Object[161] = CreateDynamicObject(19357, 1321.1761, -1811.9029, 968.5960, 0.0000, 0.0000, -0.5999); //wall005
	SetDynamicObjectMaterial(g_Object[161], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[162] = CreateDynamicObject(3657, 1338.2263, -1799.4287, 967.3449, 0.0000, 0.0000, -0.2998); //airseata_LAS
	g_Object[163] = CreateDynamicObject(19357, 1321.1207, -1816.1235, 971.0560, 0.0000, 0.0000, -0.6998); //wall005
	SetDynamicObjectMaterial(g_Object[163], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[164] = CreateDynamicObject(19357, 1321.1689, -1812.9925, 971.0560, 0.0998, 0.0000, -1.0997); //wall005
	SetDynamicObjectMaterial(g_Object[164], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[165] = CreateDynamicObject(19379, 1305.9925, -1817.4099, 966.8546, 0.0000, -89.9000, 0.0000); //wall027
	SetDynamicObjectMaterial(g_Object[165], 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	g_Object[166] = CreateDynamicObject(19379, 1305.9925, -1807.8282, 966.8546, 0.0000, -89.9000, 0.0000); //wall027
	SetDynamicObjectMaterial(g_Object[166], 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	g_Object[167] = CreateDynamicObject(19357, 1309.7486, -1820.7064, 968.6060, 0.0000, 0.0000, -89.9000); //wall005
	SetDynamicObjectMaterial(g_Object[167], 0, 14847, "mp_policesf", "mp_cop_marble", 0x00000000);
	g_Object[168] = CreateDynamicObject(19357, 1309.7325, -1810.3015, 968.5858, 0.0000, 0.0000, -89.9000); //wall005
	SetDynamicObjectMaterial(g_Object[168], 0, 14847, "mp_policesf", "mp_cop_marble", 0x00000000);
	g_Object[169] = CreateDynamicObject(11469, 1304.4210, -1816.2114, 963.3477, 0.0000, 1.0000, -178.7998); //des_bullgrill_
	SetDynamicObjectMaterialTextEx(g_Object[169], "_", 0, OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0xFFFFFFFF, 0);
	SetDynamicObjectMaterialTextEx(g_Object[169], "_", 7, OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0xFFFFFFFF, 0);
	g_Object[170] = CreateDynamicObject(19357, 1306.6727, -1810.3066, 968.5960, 0.0000, 0.0000, -89.9000); //wall005
	SetDynamicObjectMaterial(g_Object[170], 0, 14847, "mp_policesf", "mp_cop_marble", 0x00000000);
	g_Object[171] = CreateDynamicObject(19357, 1306.5787, -1820.7115, 968.6060, 0.0000, 0.0000, -89.9000); //wall005
	SetDynamicObjectMaterial(g_Object[171], 0, 14847, "mp_policesf", "mp_cop_marble", 0x00000000);
	g_Object[172] = CreateDynamicObject(19357, 1305.0893, -1819.1097, 968.5960, 0.0000, 0.0000, 0.7001); //wall005
	SetDynamicObjectMaterial(g_Object[172], 0, 14847, "mp_policesf", "mp_cop_marble", 0x00000000);
	g_Object[173] = CreateDynamicObject(19357, 1305.0505, -1815.9200, 968.5960, 0.0000, 0.0000, 0.7001); //wall005
	SetDynamicObjectMaterial(g_Object[173], 0, 14847, "mp_policesf", "mp_cop_marble", 0x00000000);
	g_Object[174] = CreateDynamicObject(19357, 1305.0113, -1812.7103, 968.5960, 0.0000, 0.0000, 0.7001); //wall005
	SetDynamicObjectMaterial(g_Object[174], 0, 14847, "mp_policesf", "mp_cop_marble", 0x00000000);
	g_Object[175] = CreateDynamicObject(19357, 1304.9525, -1809.5310, 968.5960, 0.0000, 0.0000, 1.2000); //wall005
	SetDynamicObjectMaterial(g_Object[175], 0, 14847, "mp_policesf", "mp_cop_marble", 0x00000000);
	g_Object[176] = CreateDynamicObject(14407, 1310.8155, -1820.2497, 964.1900, 0.0000, 0.0000, -88.9000); //carter-stairs01
	SetDynamicObjectMaterialTextEx(g_Object[176], "_", 0, OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0xFFFFFAFA, 0);
	g_Object[177] = CreateDynamicObject(19357, 1307.6839, -1818.3785, 965.6157, 0.0000, 0.0000, -89.9000); //wall005
	SetDynamicObjectMaterial(g_Object[177], 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	g_Object[178] = CreateDynamicObject(19357, 1321.1003, -1819.0533, 968.6760, 0.0000, 0.0000, 0.2001); //wall005
	SetDynamicObjectMaterial(g_Object[178], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[179] = CreateDynamicObject(1811, 1318.3645, -1811.2624, 967.4970, 0.0000, 0.0000, 0.0000); //MED_DIN_CHAIR_5
	g_Object[180] = CreateDynamicObject(1811, 1316.4842, -1811.2624, 967.5070, 0.0000, 0.0000, 0.0000); //MED_DIN_CHAIR_5
	g_Object[181] = CreateDynamicObject(1811, 1320.3862, -1812.6634, 967.4970, 0.0000, 0.0000, 0.0000); //MED_DIN_CHAIR_5
	g_Object[182] = CreateDynamicObject(1811, 1320.3862, -1811.3026, 967.4970, 0.0000, 0.0000, 0.0000); //MED_DIN_CHAIR_5
	g_Object[183] = CreateDynamicObject(1811, 1316.4842, -1812.6927, 967.5070, 0.0000, 0.0000, 0.0000); //MED_DIN_CHAIR_5
	g_Object[184] = CreateDynamicObject(1811, 1314.7226, -1812.6927, 967.5070, 0.0000, 0.0000, 0.0000); //MED_DIN_CHAIR_5
	g_Object[185] = CreateDynamicObject(1811, 1314.7226, -1811.2414, 967.5070, 0.0000, 0.0000, 0.0000); //MED_DIN_CHAIR_5
	g_Object[186] = CreateDynamicObject(1811, 1312.7624, -1812.6927, 967.5070, 0.0000, 0.0000, 0.0000); //MED_DIN_CHAIR_5
	g_Object[187] = CreateDynamicObject(1811, 1312.7624, -1811.2019, 967.5070, 0.0000, 0.0000, 0.0000); //MED_DIN_CHAIR_5
	g_Object[188] = CreateDynamicObject(1811, 1320.3862, -1819.7635, 967.4970, 0.0000, 0.0000, 0.0000); //MED_DIN_CHAIR_5
	g_Object[189] = CreateDynamicObject(1811, 1320.3862, -1818.2927, 967.4970, 0.0000, 0.0000, 0.0000); //MED_DIN_CHAIR_5
	g_Object[190] = CreateDynamicObject(1811, 1318.3645, -1818.2739, 967.4970, 0.0000, 0.0000, 0.0000); //MED_DIN_CHAIR_5
	g_Object[191] = CreateDynamicObject(1811, 1318.3645, -1819.7646, 967.4970, 0.0000, 0.0000, 0.0000); //MED_DIN_CHAIR_5
	g_Object[192] = CreateDynamicObject(1811, 1316.4842, -1818.2324, 967.5070, 0.0000, 0.0000, 0.0000); //MED_DIN_CHAIR_5
	g_Object[193] = CreateDynamicObject(1811, 1316.4842, -1819.7425, 967.5070, 0.0000, 0.0000, 0.0000); //MED_DIN_CHAIR_5
	g_Object[194] = CreateDynamicObject(1811, 1314.7226, -1819.7436, 967.5070, 0.0000, 0.0000, 0.0000); //MED_DIN_CHAIR_5
	g_Object[195] = CreateDynamicObject(1811, 1314.7226, -1818.1728, 967.5070, 0.0000, 0.0000, 0.0000); //MED_DIN_CHAIR_5
	g_Object[196] = CreateDynamicObject(1811, 1312.7624, -1819.7336, 967.5070, 0.0000, 0.0000, 0.0000); //MED_DIN_CHAIR_5
	g_Object[197] = CreateDynamicObject(1811, 1312.7624, -1818.2126, 967.5070, 0.0000, 0.0000, 0.0000); //MED_DIN_CHAIR_5
	g_Object[198] = CreateDynamicObject(19357, 1319.1501, -1820.6921, 968.6060, 0.0000, 0.0000, -89.9000); //wall005
	SetDynamicObjectMaterial(g_Object[198], 0, 14847, "mp_policesf", "mp_cop_marble", 0x00000000);
	g_Object[199] = CreateDynamicObject(1533, 1321.3686, -1818.9272, 966.8123, 0.0000, 0.0000, 96.6996); //Gen_doorEXT12
	g_Object[200] = CreateDynamicObject(1533, 1321.3011, -1813.5095, 966.8123, 0.0000, 0.0000, 86.9999); //Gen_doorEXT12
	g_Object[201] = CreateDynamicObject(1416, 1307.6927, -1815.3116, 967.9160, 0.0000, 0.0000, -89.0998); //DYN_UNIT
	SetDynamicObjectMaterial(g_Object[201], 0, 16640, "a51", "ws_metalpanel1", 0x00000000);
	g_Object[202] = CreateDynamicObject(18981, 1337.2893, -1805.7446, 970.8065, 0.0000, -89.7997, 0.0000); //Concrete1mx25mx25m
	SetDynamicObjectMaterial(g_Object[202], 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	g_Object[203] = CreateDynamicObject(18981, 1312.3792, -1805.7446, 970.8930, 0.0000, -89.7997, 0.0000); //Concrete1mx25mx25m
	SetDynamicObjectMaterial(g_Object[203], 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	g_Object[204] = CreateDynamicObject(18981, 1312.5095, -1830.7148, 970.8922, 0.0000, -89.7997, 0.0000); //Concrete1mx25mx25m
	SetDynamicObjectMaterial(g_Object[204], 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	g_Object[205] = CreateDynamicObject(18981, 1337.4398, -1830.7248, 970.8458, 0.0000, -89.7997, 0.0000); //Concrete1mx25mx25m
	SetDynamicObjectMaterial(g_Object[205], 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	g_Object[206] = CreateDynamicObject(19387, 1334.5798, -1813.6645, 968.5955, 0.0000, 0.0000, 133.5997); //wall035
	SetDynamicObjectMaterial(g_Object[206], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[207] = CreateDynamicObject(1499, 1331.0644, -1816.9610, 966.8560, 0.0000, 0.0000, -136.6999); //Gen_doorINT05
	SetDynamicObjectMaterialTextEx(g_Object[207], "_", 0, OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0xFFB22222, 0);
	SetDynamicObjectMaterialTextEx(g_Object[207], "_", 1, OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFAFA, 0xFFFFFAFA, 0);
	g_Object[208] = CreateDynamicObject(19610, 1307.4631, -1814.7745, 968.5631, 126.1998, -25.7999, -62.7000); //Microphone1
	g_Object[209] = CreateDynamicObject(2894, 1307.6942, -1815.5665, 968.4771, 0.0000, -0.4999, -79.7997); //kmb_rhymesbook
	g_Object[210] = CreateDynamicObject(19786, 1325.2795, -1804.7087, 968.6676, -2.0999, 0.0000, 178.9998); //LCDTVBig1
	g_Object[211] = CreateDynamicObject(19357, 1322.3385, -1820.7973, 968.6060, 0.0000, 0.0000, -93.4999); //wall005
	SetDynamicObjectMaterial(g_Object[211], 0, 14847, "mp_policesf", "mp_cop_marble", 0x00000000);
	g_Object[212] = CreateDynamicObject(19357, 1321.2292, -1809.8630, 971.0612, 0.0998, 0.0000, -1.0997); //wall005
	SetDynamicObjectMaterial(g_Object[212], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[213] = CreateDynamicObject(19357, 1321.2142, -1810.5965, 967.6101, 0.0998, 0.0000, -1.0997); //wall005
	SetDynamicObjectMaterial(g_Object[213], 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
	g_Object[214] = CreateDynamicObject(2207, 1331.3343, -1800.9305, 966.8637, 0.0000, 0.0000, 0.0000); //MED_OFFICE7_DESK_1
}

stock mapFDext()
{
	new g_Object[59];
	g_Object[0] = CreateDynamicObject(3287, 1372.1695, -1856.2690, 15.4099, 0.0000, 0.0000, 88.6997); //cxrf_oiltank
	g_Object[1] = CreateDynamicObject(19861, 1364.4414, -1824.4781, 17.9951, 32.2999, 0.1000, -88.7998); //MIHouse1GarageDoor1
	SetDynamicObjectMaterial(g_Object[1], 0, 10763, "airport1_sfse", "ws_rollerdoor_fire", 0x00000000);
	g_Object[2] = CreateDynamicObject(19805, 1367.8579, -1804.0533, 16.4967, 0.0000, -1.5999, 88.9999); //Whiteboard1
	SetDynamicObjectMaterialTextEx(g_Object[2], "SAFMD", 0, OBJECT_MATERIAL_SIZE_256x128, "Arial", 50, 1, 0xFFFFFFFF, 0x00000000, 1);
	g_Object[3] = CreateDynamicObject(3928, 1358.4470, -1827.5975, 18.3281, 0.0000, 0.0000, 2.0000); //helipad
	SetDynamicObjectMaterial(g_Object[3], 0, -1, "none", "none", 0xFFFFFF00);
	SetDynamicObjectMaterial(g_Object[3], 15, -1, "none", "none", 0xFFF8F8FF);
	g_Object[4] = CreateDynamicObject(14532, 1354.5076, -1812.1883, 13.6716, 0.0000, 0.0000, -177.4998); //tv_stand_driv
	g_Object[5] = CreateDynamicObject(2961, 1361.1582, -1846.4692, 13.9785, 0.0000, 0.0000, 0.0000); //fire_break
	g_Object[6] = CreateDynamicObject(19354, 1363.0731, -1815.3507, 12.6035, 0.1000, -89.6996, 2.0000); //wall002
	SetDynamicObjectMaterialTextEx(g_Object[6], "ENGINE-1", 0, OBJECT_MATERIAL_SIZE_256x128, "Impact", 60, 1, 0xFFFFFFF0, 0x00000000, 1);
	g_Object[7] = CreateDynamicObject(19905, 1358.2147, -1829.1676, 12.4462, 0.0000, -0.1000, 91.1996); //A51Building1
	SetDynamicObjectMaterial(g_Object[7], 1, 18065, "ab_sfammumain", "breezewall", 0x00000000);
	SetDynamicObjectMaterial(g_Object[7], 2, 4835, "airoads_las", "easykerb", 0x00000000);
	g_Object[8] = CreateDynamicObject(3928, 1358.4077, -1817.5625, 18.3281, 0.0000, 0.0000, 2.0000); //helipad
	SetDynamicObjectMaterial(g_Object[8], 0, -1, "none", "none", 0xFFFFFF00);
	SetDynamicObjectMaterial(g_Object[8], 15, -1, "none", "none", 0xFFF8F8FF);
	g_Object[9] = CreateDynamicObject(2666, 1373.0606, -1858.1080, 13.1562, 0.0000, 0.0000, -1.3998); //CJ_PIZ_POSTER2
	g_Object[10] = CreateDynamicObject(19354, 1363.3874, -1824.3459, 12.5879, 0.1000, -89.6996, 2.0000); //wall002
	SetDynamicObjectMaterialTextEx(g_Object[10], "ENGINE-2", 0, OBJECT_MATERIAL_SIZE_256x128, "Impact", 60, 1, 0xFFFFFFF0, 0x00000000, 1);
	g_Object[11] = CreateDynamicObject(19354, 1363.7032, -1833.1407, 12.5710, -0.3998, -89.6996, 1.0000); //wall002
	SetDynamicObjectMaterialTextEx(g_Object[11], "ENGINE-3", 0, OBJECT_MATERIAL_SIZE_256x128, "Impact", 60, 1, 0xFFFFFFF0, 0x00000000, 1);
	g_Object[12] = CreateDynamicObject(3264, 1366.3120, -1828.9256, 12.2971, 0.4999, 0.0000, 91.1998); //privatesign3
	SetDynamicObjectMaterialTextEx(g_Object[12], "E-3 | E-2", 1, OBJECT_MATERIAL_SIZE_128x128, "Arial", 36, 1, 0xFFFFFFFF, 0xFFFF0000, 2);
	g_Object[13] = CreateDynamicObject(3264, 1366.1240, -1819.9355, 12.2971, 0.4999, 0.0000, 91.1998); //privatesign3
	SetDynamicObjectMaterialTextEx(g_Object[13], "E-2 | E-1", 1, OBJECT_MATERIAL_SIZE_128x128, "Arial", 36, 1, 0xFFFFFFFF, 0xFFFF0000, 2);
	g_Object[14] = CreateDynamicObject(8572, 1354.8630, -1847.9942, 14.7669, 0.0000, 0.0000, 1.5000); //vgsSstairs02_lvs
	g_Object[15] = CreateDynamicObject(3264, 1366.4984, -1837.8537, 12.2971, 0.4999, 0.0000, 91.1998); //privatesign3
	SetDynamicObjectMaterialTextEx(g_Object[15], "S-1 | E-3", 1, OBJECT_MATERIAL_SIZE_128x128, "Arial", 36, 1, 0xFFFFFFFF, 0xFFFF0000, 2);
	g_Object[16] = CreateDynamicObject(19354, 1363.8640, -1842.3697, 12.6352, -0.3998, -89.6996, 1.0000); //wall002
	SetDynamicObjectMaterialTextEx(g_Object[16], "SIERRA-1", 0, OBJECT_MATERIAL_SIZE_256x128, "Impact", 55, 1, 0xFFFFFFF0, 0x00000000, 1);
	g_Object[17] = CreateDynamicObject(1428, 1351.0295, -1834.4648, 14.7475, 4.2999, -92.0998, -74.1996); //DYN_LADDER
	g_Object[18] = CreateDynamicObject(7901, 1367.7631, -1787.3004, 21.9767, 0.0000, 0.0000, 90.0999); //vgwestbillbrd02
	SetDynamicObjectMaterialTextEx(g_Object[18], "San Andreas Fire Department", 0, OBJECT_MATERIAL_SIZE_256x128, "Arial", 20, 1, 0xFFFFFFFF, 0x00000000, 1);
	g_Object[19] = CreateDynamicObject(1428, 1351.3480, -1844.5395, 15.1408, 12.5000, 56.2999, 81.4000); //DYN_LADDER
	g_Object[20] = CreateDynamicObject(11710, 1358.7384, -1846.5449, 15.0416, 0.0000, 0.0000, 0.0000); //FireExitSign1
	g_Object[21] = CreateDynamicObject(11713, 1351.1396, -1842.1466, 14.0010, 0.0000, 0.0000, 0.0000); //FireExtPanel1
	g_Object[22] = CreateDynamicObject(1437, 1351.1367, -1828.6579, 14.1407, 0.4999, 89.4999, 82.0998); //DYN_LADDER_2
	g_Object[23] = CreateDynamicObject(11710, 1351.0655, -1840.5013, 15.2877, 0.0000, 0.0000, 91.7002); //FireExitSign1
	g_Object[24] = CreateDynamicObject(1211, 1369.6059, -1854.2545, 12.9534, 0.0000, 0.0000, 14.3999); //fire_hydrant
	g_Object[25] = CreateDynamicObject(1428, 1351.1252, -1834.4813, 13.5817, 4.2999, -92.0998, -74.1996); //DYN_LADDER
	g_Object[26] = CreateDynamicObject(1437, 1351.1456, -1828.6700, 15.2805, 0.4999, 89.4999, 82.0998); //DYN_LADDER_2
	g_Object[27] = CreateDynamicObject(19899, 1352.5544, -1812.2264, 12.6546, 0.0000, 0.0000, -88.3000); //ToolCabinet1
	g_Object[28] = CreateDynamicObject(19900, 1352.5660, -1812.3398, 13.8333, 0.0000, 0.0000, 1.7000); //ToolCabinet2
	g_Object[29] = CreateDynamicObject(1428, 1351.4333, -1845.0444, 15.8556, 12.5000, 56.2999, 81.4000); //DYN_LADDER
	g_Object[30] = CreateDynamicObject(19330, 1360.7497, -1812.1724, 14.0596, -4.5000, -88.4999, 178.6000); //fire_hat01
	g_Object[31] = CreateDynamicObject(2690, 1353.0406, -1812.3758, 14.2109, 0.0000, 0.0000, 0.0000); //CJ_FIRE_EXT
	g_Object[32] = CreateDynamicObject(2690, 1353.5710, -1812.3758, 14.2109, 0.0000, 0.0000, 0.0000); //CJ_FIRE_EXT
	g_Object[33] = CreateDynamicObject(4100, 1365.7906, -1804.3121, 14.3171, 0.0000, 0.0000, 51.1999); //meshfence1_LAn
	g_Object[34] = CreateDynamicObject(19893, 1351.6782, -1812.4713, 14.2597, 0.0000, 0.0000, 0.0000); //LaptopSAMP1
	g_Object[35] = CreateDynamicObject(3465, 1364.6510, -1828.9637, 13.9260, 0.0000, 0.0000, 92.0000); //vegspetrolpump
	g_Object[36] = CreateDynamicObject(3465, 1364.9641, -1837.8990, 13.9260, 0.0000, 0.0000, 90.6999); //vegspetrolpump
	g_Object[37] = CreateDynamicObject(3465, 1364.4018, -1819.9841, 13.9260, 0.0000, 0.0000, 93.0000); //vegspetrolpump
	g_Object[38] = CreateDynamicObject(4100, 1344.6124, -1844.8718, 14.1304, 0.0000, 0.0000, -60.5000); //meshfence1_LAn
	g_Object[39] = CreateDynamicObject(4100, 1349.2224, -1770.4354, 14.2473, 0.0000, 0.0000, 51.1999); //meshfence1_LAn
	g_Object[40] = CreateDynamicObject(4100, 1339.2556, -1761.8443, 14.2308, 0.0000, 0.0000, -42.4999); //meshfence1_LAn
	g_Object[41] = CreateDynamicObject(4100, 1331.8664, -1840.0456, 14.0904, 0.0000, 0.0000, -60.5000); //meshfence1_LAn
	g_Object[42] = CreateDynamicObject(3928, 1358.6947, -1838.6954, 18.3281, 0.0000, 0.0000, 2.0000); //helipad
	SetDynamicObjectMaterial(g_Object[42], 0, -1, "none", "none", 0xFFFFFF00);
	SetDynamicObjectMaterial(g_Object[42], 15, -1, "none", "none", 0xFFF8F8FF);
	g_Object[43] = CreateDynamicObject(19861, 1364.8353, -1842.5040, 17.9685, 32.2999, 0.1000, -88.7998); //MIHouse1GarageDoor1
	SetDynamicObjectMaterial(g_Object[43], 0, 10763, "airport1_sfse", "ws_rollerdoor_fire", 0x00000000);
	g_Object[44] = CreateDynamicObject(19861, 1364.2418, -1815.4383, 18.0084, 32.2999, 0.1000, -88.7998); //MIHouse1GarageDoor1
	SetDynamicObjectMaterial(g_Object[44], 0, 10763, "airport1_sfse", "ws_rollerdoor_fire", 0x00000000);
	g_Object[45] = CreateDynamicObject(19861, 1364.6374, -1833.5047, 17.9818, 32.2999, 0.1000, -88.7998); //MIHouse1GarageDoor1
	SetDynamicObjectMaterial(g_Object[45], 0, 10763, "airport1_sfse", "ws_rollerdoor_fire", 0x00000000);
	g_Object[46] = CreateDynamicObject(19899, 1360.8045, -1812.0294, 12.7041, 0.0000, 0.0000, -89.7998); //ToolCabinet1
	g_Object[47] = CreateDynamicObject(1893, 1358.4984, -1824.8452, 18.1643, 0.0000, 0.0000, 0.0000); //shoplight1
	g_Object[48] = CreateDynamicObject(2690, 1364.4499, -1811.5600, 14.2684, 0.0000, 0.0000, 0.0000); //CJ_FIRE_EXT
	g_Object[49] = CreateDynamicObject(2690, 1363.9703, -1811.5600, 14.2684, 0.0000, 0.0000, 0.0000); //CJ_FIRE_EXT
	g_Object[50] = CreateDynamicObject(2690, 1363.4897, -1811.5600, 14.2684, 0.0000, 0.0000, 0.0000); //CJ_FIRE_EXT
	g_Object[51] = CreateDynamicObject(2690, 1362.9797, -1811.5600, 14.2684, 0.0000, 0.0000, 0.0000); //CJ_FIRE_EXT
	g_Object[52] = CreateDynamicObject(1893, 1358.4984, -1816.7419, 18.1842, 0.0000, 0.0000, 0.0000); //shoplight1
	g_Object[53] = CreateDynamicObject(1893, 1358.4984, -1833.3183, 18.1842, 0.0000, 0.0000, 0.0000); //shoplight1
	g_Object[54] = CreateDynamicObject(19815, 1357.3513, -1811.5711, 14.3399, 0.0000, 0.0000, 1.1000); //ToolBoard1
	g_Object[55] = CreateDynamicObject(1893, 1358.4984, -1842.4514, 18.1842, 0.0000, 0.0000, 0.0000); //shoplight1
	g_Object[56] = CreateDynamicObject(19330, 1361.2203, -1812.1846, 14.0619, -4.9000, -90.4999, 178.9000); //fire_hat01
	g_Object[57] = CreateDynamicObject(19330, 1361.7200, -1812.1959, 14.0550, -4.5000, -88.4999, 178.6000); //fire_hat01
	g_Object[58] = CreateDynamicObject(11008, 1356.5133, -1791.4040, 19.3770, 0.0000, 0.0000, 0.1525); //FIRE BUILDING
	SetDynamicObjectMaterial(g_Object[58], 0, 1569, "adam_v_doort", "ws_guardhousedoor", 0x00000000);
	SetDynamicObjectMaterialTextEx(g_Object[58], " ", 4, OBJECT_MATERIAL_SIZE_256x128, "Arial", 24, 1, 0xFFFFFFFF, 0xFF800000, 0);
	SetDynamicObjectMaterial(g_Object[58], 5, 18065, "ab_sfammumain", "breezewall", 0x00000000);
	SetDynamicObjectMaterial(g_Object[58], 6, 18065, "ab_sfammumain", "breezewall", 0x00000000);
}

stock mapBankInterior() {

	// BANKA ENTERIJER PONY & LEVU
	new tmpobjid;
	tmpobjid = CreateObject(18981, -1746.255859, 791.945312, 143.632797, 0.000000, 90.000000, 90.000000); 
	SetObjectMaterial(tmpobjid, 0, 14533, "pleas_dome", "ab_carpethexi", 0xFF059DCF);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1734.255249, 803.517272, 146.562698, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1739.755249, 804.517272, 146.562698, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1740.755249, 803.517272, 146.562698, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19466, -1734.894531, 798.522583, 145.671005, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 1977, "cooler1", "koen_win", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19466, -1740.130737, 798.522583, 145.671005, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 1977, "cooler1", "koen_win", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(1499, -1739.014282, 798.500610, 144.131103, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0xFF000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(1499, -1736.001953, 798.518615, 144.131103, 0.000000, 0.000000, 180.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0xFF000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19466, -1734.894531, 798.522583, 143.734497, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 1977, "cooler1", "koen_win", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19466, -1740.130737, 798.522583, 143.734497, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 1977, "cooler1", "koen_win", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19466, -1734.894531, 798.522583, 147.607299, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 1977, "cooler1", "koen_win", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19466, -1737.135009, 798.522583, 147.607299, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 1977, "cooler1", "koen_win", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19466, -1739.375000, 798.522583, 147.607299, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 1977, "cooler1", "koen_win", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1738.470947, 803.520385, 147.866043, 90.000000, 0.000000, 990.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1736.470947, 803.518371, 147.867996, 90.000000, 0.000000, 990.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19325, -1733.757202, 794.211181, 146.473709, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 1977, "cooler1", "koen_win", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18762, -1734.255249, 798.019897, 146.606689, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19325, -1733.757202, 787.569213, 146.473693, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 1977, "cooler1", "koen_win", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19325, -1733.757202, 780.927185, 146.473693, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 1977, "cooler1", "koen_win", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1744.664184, 796.110534, 146.562698, 0.000000, 0.000000, 34.200008);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1743.363281, 795.634033, 146.562698, 0.000000, 0.000000, 57.300029);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1743.578857, 794.461547, 146.562698, 0.000000, 0.000000, 68.580017);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1743.387451, 794.544982, 146.562698, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1738.756835, 779.033203, 146.562698, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1748.756835, 779.033203, 146.562698, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1747.893798, 790.044799, 146.562698, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19929, -1755.010375, 779.909118, 144.130294, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1758.756835, 779.033203, 146.562698, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19929, -1755.010375, 782.769104, 144.130294, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19929, -1755.010375, 785.630126, 144.130294, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19940, -1754.421997, 779.545104, 145.110763, 90.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0xFF000000);
	tmpobjid = IntBank_CreateDynamicObject(19325, -1755.010375, 783.768127, 147.997604, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 1977, "cooler1", "koen_win", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19940, -1754.421997, 779.545104, 147.110794, 90.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0xFF000000);
	tmpobjid = IntBank_CreateDynamicObject(19940, -1755.428955, 779.545104, 145.110794, 90.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0xFF000000);
	tmpobjid = IntBank_CreateDynamicObject(19940, -1754.859985, 779.545104, 145.110794, 90.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0xFF000000);
	tmpobjid = IntBank_CreateDynamicObject(19940, -1755.017944, 779.547119, 145.110794, 90.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0xFF000000);
	tmpobjid = IntBank_CreateDynamicObject(19940, -1755.017944, 779.547119, 147.110794, 90.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0xFF000000);
	tmpobjid = IntBank_CreateDynamicObject(19940, -1755.428955, 779.545104, 147.110794, 90.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0xFF000000);
	tmpobjid = IntBank_CreateDynamicObject(19940, -1754.859985, 779.545104, 147.110794, 90.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0xFF000000);
	tmpobjid = IntBank_CreateDynamicObject(19940, -1754.421997, 787.074096, 145.110794, 90.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0xFF000000);
	tmpobjid = IntBank_CreateDynamicObject(19940, -1754.858032, 787.072082, 147.110794, 90.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0xFF000000);
	tmpobjid = IntBank_CreateDynamicObject(19940, -1754.421997, 787.074096, 147.110794, 90.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0xFF000000);
	tmpobjid = IntBank_CreateDynamicObject(19940, -1755.017944, 787.074096, 145.110794, 90.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0xFF000000);
	tmpobjid = IntBank_CreateDynamicObject(19940, -1755.428955, 787.074096, 145.110794, 90.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0xFF000000);
	tmpobjid = IntBank_CreateDynamicObject(19940, -1754.859985, 787.072082, 145.110794, 90.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0xFF000000);
	tmpobjid = IntBank_CreateDynamicObject(19940, -1755.428955, 787.074096, 147.110794, 90.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0xFF000000);
	tmpobjid = IntBank_CreateDynamicObject(19940, -1755.017944, 787.074096, 147.110794, 90.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0xFF000000);
	tmpobjid = IntBank_CreateDynamicObject(19325, -1755.010375, 777.128112, 147.997604, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 1977, "cooler1", "koen_win", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(1499, -1755.010375, 788.593627, 144.105102, 0.000000, 0.000000, -90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0xFF000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19325, -1755.010375, 790.407104, 148.671600, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 1977, "cooler1", "koen_win", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1755.010375, 793.584472, 146.562698, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1757.893798, 790.046813, 146.562698, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19940, -1733.757202, 796.531188, 148.147293, 0.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0xFF000000);
	tmpobjid = IntBank_CreateDynamicObject(18981, -1746.255859, 791.945312, 148.863006, 0.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 2821, "gb_foodwrap01", "sm_marble", 0xFF059DCF);
	tmpobjid = IntBank_CreateDynamicObject(19325, -1733.757202, 794.211181, 142.348403, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 1977, "cooler1", "koen_win", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19325, -1733.757202, 787.569213, 142.348403, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 1977, "cooler1", "koen_win", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19325, -1733.757202, 780.927185, 142.348403, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 1977, "cooler1", "koen_win", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19940, -1733.757202, 794.531188, 148.147293, 0.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0xFF000000);
	tmpobjid = IntBank_CreateDynamicObject(19940, -1733.757202, 792.531188, 148.147293, 0.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0xFF000000);
	tmpobjid = IntBank_CreateDynamicObject(19940, -1733.757202, 790.531188, 148.147293, 0.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0xFF000000);
	tmpobjid = IntBank_CreateDynamicObject(19940, -1733.757202, 788.531188, 148.147293, 0.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0xFF000000);
	tmpobjid = IntBank_CreateDynamicObject(19940, -1733.757202, 786.531188, 148.147293, 0.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0xFF000000);
	tmpobjid = IntBank_CreateDynamicObject(19940, -1733.757202, 784.531188, 148.147293, 0.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0xFF000000);
	tmpobjid = IntBank_CreateDynamicObject(19940, -1733.757202, 782.531188, 148.147293, 0.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0xFF000000);
	tmpobjid = IntBank_CreateDynamicObject(19940, -1733.757202, 780.531188, 148.147293, 0.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0xFF000000);
	tmpobjid = IntBank_CreateDynamicObject(19940, -1733.757202, 796.531188, 144.288619, 0.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19940, -1733.757202, 794.531188, 144.288604, 0.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19940, -1733.757202, 792.531188, 144.288604, 0.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19940, -1733.757202, 790.531188, 144.288604, 0.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19940, -1733.757202, 788.531188, 144.288604, 0.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19940, -1733.757202, 786.531188, 144.288604, 0.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19940, -1733.757202, 784.531188, 144.288604, 0.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19940, -1733.757202, 782.531188, 144.288604, 0.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19940, -1733.757202, 780.531188, 144.288604, 0.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19089, -1733.753173, 797.510681, 148.018218, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19089, -1733.753173, 794.510681, 148.018203, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19089, -1733.753173, 791.510681, 148.018203, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19089, -1733.753173, 788.510681, 148.018203, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19089, -1733.753173, 785.510681, 148.018203, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19089, -1733.753173, 782.510681, 148.018203, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19089, -1733.753173, 779.544677, 148.018203, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19089, -1733.753173, 797.510681, 147.910202, 0.000000, 90.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19089, -1733.753173, 790.510681, 147.910202, 0.000000, 90.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19089, -1733.753173, 783.510681, 147.910202, 0.000000, 90.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19089, -1733.753173, 797.510681, 144.521301, 0.000000, 90.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19089, -1733.753173, 790.510681, 144.521301, 0.000000, 90.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19089, -1733.753173, 783.510681, 144.521301, 0.000000, 90.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19089, -1734.773315, 798.522583, 147.369293, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19089, -1734.749267, 798.522583, 147.369293, 0.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19089, -1740.243286, 798.522583, 147.369293, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19089, -1734.749267, 798.522583, 146.643188, 0.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19089, -1734.749267, 798.522583, 144.146240, 0.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18763, -1748.327148, 784.414489, 142.225296, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3820, "boxhses_sfsx", "stonewall_la", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19466, -1748.706054, 785.910400, 147.223693, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 1977, "cooler1", "koen_win", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18763, -1748.327148, 784.412475, 150.246795, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3820, "boxhses_sfsx", "stonewall_la", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19466, -1748.706054, 785.910400, 145.286895, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 1977, "cooler1", "koen_win", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19466, -1746.466064, 785.910400, 145.286895, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 1977, "cooler1", "koen_win", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19466, -1746.466064, 785.910400, 147.223693, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 1977, "cooler1", "koen_win", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18763, -1746.845092, 784.416503, 142.223297, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3820, "boxhses_sfsx", "stonewall_la", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18763, -1746.845092, 784.416503, 150.248794, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 3820, "boxhses_sfsx", "stonewall_la", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19466, -1745.346069, 784.792602, 145.286895, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 1977, "cooler1", "koen_win", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19466, -1745.348144, 784.038574, 145.286895, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 1977, "cooler1", "koen_win", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19466, -1745.346069, 784.792602, 147.223693, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 1977, "cooler1", "koen_win", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19466, -1745.348144, 784.038574, 147.223693, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 1977, "cooler1", "koen_win", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19466, -1746.468139, 782.918395, 145.286895, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 1977, "cooler1", "koen_win", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19466, -1748.706054, 782.918395, 145.286895, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 1977, "cooler1", "koen_win", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19466, -1749.826049, 784.790588, 145.286895, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 1977, "cooler1", "koen_win", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19466, -1748.706054, 782.918395, 147.223693, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 1977, "cooler1", "koen_win", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19466, -1746.468139, 782.918395, 147.223693, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 1977, "cooler1", "koen_win", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(857, -1746.079467, 784.715881, 144.832000, 0.000000, 0.000000, 17.280000);
	SetDynamicObjectMaterial(tmpobjid, 0, 14570, "traidaqua", "ab_aqua_coral", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(857, -1748.844726, 783.505798, 144.832000, 0.000000, 0.000000, 17.280000);
	SetDynamicObjectMaterial(tmpobjid, 0, 14570, "traidaqua", "ab_aqua_coral", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(857, -1745.881347, 783.705078, 144.849685, 0.000000, 0.000000, 69.360000);
	SetDynamicObjectMaterial(tmpobjid, 0, 14570, "traidaqua", "ab_aqua_coral", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1737.640014, 793.025817, 148.842102, 90.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 2821, "gb_foodwrap01", "sm_marble", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1736.807983, 784.709777, 148.844100, 90.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 2821, "gb_foodwrap01", "sm_marble", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1737.807983, 793.025817, 148.844100, 90.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 2821, "gb_foodwrap01", "sm_marble", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1736.807983, 791.863769, 148.846099, 90.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 2821, "gb_foodwrap01", "sm_marble", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1739.807983, 784.705810, 148.840103, 90.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 2821, "gb_foodwrap01", "sm_marble", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1739.807983, 790.363769, 148.838104, 90.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 2821, "gb_foodwrap01", "sm_marble", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1739.975952, 782.205810, 148.842102, 90.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 2821, "gb_foodwrap01", "sm_marble", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1739.975952, 786.686828, 148.846099, 90.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 2821, "gb_foodwrap01", "sm_marble", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18763, -1740.799804, 794.619995, 150.845565, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 2821, "gb_foodwrap01", "sm_marble", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18763, -1740.203979, 795.919799, 150.843597, 0.000000, 0.000000, -48.900001);
	SetDynamicObjectMaterial(tmpobjid, 0, 2821, "gb_foodwrap01", "sm_marble", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18763, -1746.472534, 787.685729, 150.845703, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 2821, "gb_foodwrap01", "sm_marble", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18763, -1749.472534, 787.685729, 150.845703, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 2821, "gb_foodwrap01", "sm_marble", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18763, -1752.472534, 787.685729, 150.845703, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 2821, "gb_foodwrap01", "sm_marble", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18763, -1752.472534, 784.685729, 150.845703, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 2821, "gb_foodwrap01", "sm_marble", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18763, -1752.472534, 781.685729, 150.845703, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 2821, "gb_foodwrap01", "sm_marble", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18763, -1746.390747, 781.205200, 150.845703, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 2821, "gb_foodwrap01", "sm_marble", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18763, -1749.390747, 781.205200, 150.845703, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 2821, "gb_foodwrap01", "sm_marble", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18763, -1752.470703, 781.205200, 150.849700, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 2821, "gb_foodwrap01", "sm_marble", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18763, -1749.496704, 781.205200, 150.847702, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 2821, "gb_foodwrap01", "sm_marble", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19940, -1755.010375, 786.060119, 147.924896, 0.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0xFF000000);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1755.010375, 783.584472, 150.608306, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19940, -1755.010375, 784.060119, 147.924896, 0.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0xFF000000);
	tmpobjid = IntBank_CreateDynamicObject(19940, -1755.010375, 782.060119, 147.924896, 0.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0xFF000000);
	tmpobjid = IntBank_CreateDynamicObject(19940, -1755.010375, 780.060119, 147.924896, 0.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0xFF000000);
	tmpobjid = IntBank_CreateDynamicObject(19089, -1755.014404, 779.580017, 153.312896, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19089, -1755.010375, 787.068969, 145.931900, 0.000000, 90.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19089, -1755.010375, 780.068969, 145.931900, 0.000000, 90.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19089, -1755.012451, 787.036010, 153.312896, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19089, -1755.012451, 784.536010, 153.312896, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19089, -1755.012451, 782.036010, 153.312896, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19089, -1755.010375, 787.068969, 147.691925, 0.000000, 90.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19089, -1755.010375, 780.068969, 147.691894, 0.000000, 90.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1758.254394, 786.716491, 146.562698, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(14407, -1759.727416, 783.554321, 140.945205, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1761.014770, 776.716308, 143.631500, 90.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1761.754394, 786.716491, 146.562698, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1761.754394, 776.716491, 146.562698, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1761.754394, 783.216491, 141.562698, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1758.314453, 786.716491, 141.633712, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18981, -1762.918090, 787.720886, 139.430480, 0.000000, 90.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 16640, "a51", "concretemanky", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1761.754394, 797.058471, 141.562698, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1764.104370, 798.586608, 141.633697, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1769.502441, 793.825317, 141.633697, 0.000000, 0.000000, -176.999984);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1763.766723, 789.334472, 143.212600, 90.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1768.766723, 789.334472, 143.212600, 90.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1756.307128, 792.558776, 141.562698, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1758.314453, 796.716491, 141.633697, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1763.178344, 784.132995, 145.708801, 55.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1763.178344, 780.632995, 146.708801, 90.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1763.178344, 790.632995, 143.217407, 90.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1763.178344, 786.379028, 144.557693, 55.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19089, -1755.010375, 794.451416, 148.093505, 0.000000, 90.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19089, -1755.010375, 794.451416, 146.625595, 0.000000, 90.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19089, -1755.012451, 787.107971, 154.026794, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19089, -1755.012451, 788.573974, 154.026794, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18762, -1739.971069, 779.065795, 144.482696, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18762, -1737.973144, 779.063781, 146.832504, 90.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18762, -1735.971069, 779.065795, 144.482696, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18762, -1742.031127, 779.065795, 144.482696, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18762, -1744.033081, 779.067810, 146.832504, 90.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18762, -1746.031127, 779.065795, 144.482696, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18763, -1751.720458, 784.685729, 150.847702, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 2821, "gb_foodwrap01", "sm_marble", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18763, -1751.720458, 784.185729, 150.849700, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 2821, "gb_foodwrap01", "sm_marble", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(2311, -1734.420532, 789.288146, 144.032836, 0.000000, 0.000000, 89.800003);
	SetDynamicObjectMaterial(tmpobjid, 0, 14581, "ab_mafiasuitea", "barbersmir1", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19563, -1740.678710, 779.497070, 145.505493, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19563, -1741.326660, 779.497070, 145.505493, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(1933, -1740.664672, 779.419128, 145.706665, 0.000000, 90.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(1933, -1740.664672, 779.419128, 145.564697, 0.000000, 90.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(1933, -1741.316772, 779.419128, 145.564697, 0.000000, 90.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(1933, -1741.316772, 779.419128, 145.706695, 0.000000, 90.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19832, -1737.939697, 779.574768, 147.172531, 90.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19832, -1743.964599, 779.574829, 147.139892, 90.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(2251, -1734.525390, 790.008483, 145.298706, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 17958, "burnsalpha", "plantb256", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 4830, "airport2", "bevflower2", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19450, -1742.974853, 794.363525, 142.513000, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19450, -1742.442382, 796.194213, 142.513000, 0.000000, 0.000000, -21.290100);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19450, -1743.427734, 794.754211, 142.513000, 0.000000, 0.000000, -32.810089);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19450, -1744.275390, 795.868530, 142.513000, 0.000000, 0.000000, -55.828201);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19089, -1742.891479, 790.235107, 146.274703, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19087, -1742.892089, 792.677612, 146.268997, 0.000000, 90.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19089, -1742.891479, 794.735107, 146.274703, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19087, -1742.892089, 794.747619, 146.268997, 0.000000, 90.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(2773, -1753.054443, 781.971984, 144.636703, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "white", 0xFF059DCF);
	tmpobjid = IntBank_CreateDynamicObject(2773, -1753.054443, 784.471984, 144.636703, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "white", 0xFF059DCF);
	tmpobjid = IntBank_CreateDynamicObject(2773, -1753.054443, 786.796020, 144.636703, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "white", 0xFF059DCF);
	tmpobjid = IntBank_CreateDynamicObject(2754, -1743.194946, 790.855590, 145.049316, 0.000000, -15.000000, 180.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 18031, "cj_exp", "mp_cloth_wall", 0xFF059DCF);
	SetDynamicObjectMaterial(tmpobjid, 4, 9818, "ship_brijsfw", "ship_greenscreen1", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(2754, -1743.194946, 792.355590, 145.049301, 0.000000, -15.000000, 180.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 18031, "cj_exp", "mp_cloth_wall", 0xFF059DCF);
	SetDynamicObjectMaterial(tmpobjid, 4, 9818, "ship_brijsfw", "ship_greenscreen1", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(2754, -1743.194946, 793.855590, 145.049301, 0.000000, -15.000000, 180.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 18031, "cj_exp", "mp_cloth_wall", 0xFF059DCF);
	SetDynamicObjectMaterial(tmpobjid, 4, 9818, "ship_brijsfw", "ship_greenscreen1", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19089, -1742.871459, 793.115112, 146.274703, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19089, -1742.881469, 791.609069, 146.274703, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(15038, -1735.410522, 803.298583, 144.626693, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 17958, "burnsalpha", "plantb256", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(15038, -1739.508544, 803.298583, 144.626693, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 17958, "burnsalpha", "plantb256", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(15038, -1735.410522, 799.298583, 144.626693, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 17958, "burnsalpha", "plantb256", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(15038, -1739.508544, 799.298583, 144.626693, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 17958, "burnsalpha", "plantb256", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19787, -1734.721801, 801.342407, 146.262298, 0.000000, 0.000000, -90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19787, -1740.315795, 801.342407, 146.262298, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(638, -1744.864501, 784.416503, 144.454696, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 17958, "burnsalpha", "plantb256", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(638, -1750.313476, 784.416503, 144.454696, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 17958, "burnsalpha", "plantb256", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19466, -1749.826049, 784.790588, 147.223693, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 1977, "cooler1", "koen_win", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19466, -1749.823974, 784.036621, 145.286895, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 1977, "cooler1", "koen_win", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19466, -1749.823974, 784.036621, 147.223693, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 1977, "cooler1", "koen_win", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19450, -1744.635253, 789.635986, 144.022094, 90.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19466, -1733.774291, 797.039672, 145.463500, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 11388, "newhubgrg1_sfse", "ws_hubbeams1", 0xFF000000);
	tmpobjid = IntBank_CreateDynamicObject(19466, -1733.774291, 797.039672, 147.399505, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 11388, "newhubgrg1_sfse", "ws_hubbeams1", 0xFF000000);
	tmpobjid = IntBank_CreateDynamicObject(19466, -1733.774291, 780.039672, 145.463500, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 11388, "newhubgrg1_sfse", "ws_hubbeams1", 0xFF000000);
	tmpobjid = IntBank_CreateDynamicObject(19466, -1733.774291, 780.039672, 147.399505, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 11388, "newhubgrg1_sfse", "ws_hubbeams1", 0xFF000000);
	tmpobjid = IntBank_CreateDynamicObject(2230, -1754.946166, 780.048706, 144.131103, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0xFF059DCF);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0xFF059DCF);
	SetDynamicObjectMaterial(tmpobjid, 2, 18031, "cj_exp", "mp_cloth_wall", 0xFF059DCF);
	tmpobjid = IntBank_CreateDynamicObject(2230, -1755.388183, 780.048706, 144.131103, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0xFF059DCF);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0xFF059DCF);
	SetDynamicObjectMaterial(tmpobjid, 2, 18031, "cj_exp", "mp_cloth_wall", 0xFF059DCF);
	tmpobjid = IntBank_CreateDynamicObject(2230, -1755.506225, 780.046691, 144.129104, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0xFF059DCF);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0xFF059DCF);
	SetDynamicObjectMaterial(tmpobjid, 2, 18031, "cj_exp", "mp_cloth_wall", 0xFF059DCF);
	tmpobjid = IntBank_CreateDynamicObject(2230, -1754.946166, 782.330017, 144.131103, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0xFF059DCF);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0xFF059DCF);
	SetDynamicObjectMaterial(tmpobjid, 2, 18031, "cj_exp", "mp_cloth_wall", 0xFF059DCF);
	tmpobjid = IntBank_CreateDynamicObject(2230, -1754.956176, 784.842712, 144.131103, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0xFF059DCF);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0xFF059DCF);
	SetDynamicObjectMaterial(tmpobjid, 2, 18031, "cj_exp", "mp_cloth_wall", 0xFF059DCF);
	tmpobjid = IntBank_CreateDynamicObject(2230, -1754.946044, 787.180725, 144.131103, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0xFF059DCF);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0xFF059DCF);
	SetDynamicObjectMaterial(tmpobjid, 2, 18031, "cj_exp", "mp_cloth_wall", 0xFF059DCF);
	tmpobjid = IntBank_CreateDynamicObject(2230, -1755.388183, 784.842712, 144.131103, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0xFF059DCF);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0xFF059DCF);
	SetDynamicObjectMaterial(tmpobjid, 2, 18031, "cj_exp", "mp_cloth_wall", 0xFF059DCF);
	tmpobjid = IntBank_CreateDynamicObject(2230, -1755.506225, 784.840698, 144.129104, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0xFF059DCF);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0xFF059DCF);
	SetDynamicObjectMaterial(tmpobjid, 2, 18031, "cj_exp", "mp_cloth_wall", 0xFF059DCF);
	tmpobjid = IntBank_CreateDynamicObject(2230, -1755.506225, 787.178710, 144.129104, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0xFF059DCF);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0xFF059DCF);
	SetDynamicObjectMaterial(tmpobjid, 2, 18031, "cj_exp", "mp_cloth_wall", 0xFF059DCF);
	tmpobjid = IntBank_CreateDynamicObject(2230, -1755.388183, 787.180725, 144.131103, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0xFF059DCF);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0xFF059DCF);
	SetDynamicObjectMaterial(tmpobjid, 2, 18031, "cj_exp", "mp_cloth_wall", 0xFF059DCF);
	tmpobjid = IntBank_CreateDynamicObject(2230, -1755.506225, 782.328002, 144.129104, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0xFF059DCF);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0xFF059DCF);
	SetDynamicObjectMaterial(tmpobjid, 2, 18031, "cj_exp", "mp_cloth_wall", 0xFF059DCF);
	tmpobjid = IntBank_CreateDynamicObject(2230, -1755.388183, 782.330017, 144.131103, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0xFF059DCF);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0xFF059DCF);
	SetDynamicObjectMaterial(tmpobjid, 2, 18031, "cj_exp", "mp_cloth_wall", 0xFF059DCF);
	tmpobjid = IntBank_CreateDynamicObject(19995, -1755.049438, 783.270324, 145.143096, 0.000000, 0.000000, -90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19832, -1755.049438, 783.270263, 144.878097, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19832, -1755.022338, 780.917236, 144.878097, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19832, -1755.024902, 785.764404, 144.878097, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19995, -1755.049438, 780.917175, 145.143096, 0.000000, 0.000000, -90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19995, -1755.049438, 785.764404, 145.143096, 0.000000, 0.000000, -90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(2265, -1754.589477, 785.414428, 145.462203, 0.000000, 90.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(2265, -1755.574584, 786.134887, 145.462203, 0.000000, 90.000000, -90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(2265, -1755.574584, 783.634887, 145.462203, 0.000000, 90.000000, -90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(2265, -1755.574584, 781.270874, 145.462203, 0.000000, 90.000000, -90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "white", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(2265, -1754.589477, 782.914428, 145.462203, 0.000000, 90.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(2265, -1754.589477, 780.552429, 145.462203, 0.000000, 90.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(2195, -1741.005737, 779.870483, 144.605300, 0.000000, 0.000000, 6.239998);
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "grassdry_128HV", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 14650, "ab_trukstpc", "mp_CJ_WOOD5", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 2, 17958, "burnsalpha", "plantb256", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19087, -1746.693847, 789.537719, 146.268997, 0.000000, 90.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19834, -1745.342773, 784.367980, 147.677200, 0.000000, 0.000000, 90.000000);
	SetDynamicObjectMaterialText(tmpobjid, 0, "SAVLINE BANK", 120, "Ariel", 60, 1, 0xFF007BB7, 0x00000000, 1);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1772.236572, 791.650024, 141.633697, 0.000000, 0.000000, 179.799972);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1743.348510, 799.745239, 146.562500, 0.399998, 0.000000, 90.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19450, -1742.934814, 794.363525, 142.513000, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10765, "airportgnd_sfse", "black64", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19482, -1742.796386, 792.430541, 146.732803, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterialText(tmpobjid, 0, "ATM", 130, "Ariel", 50, 1, 0xFF059DCF, 0x00000000, 1);
	tmpobjid = IntBank_CreateDynamicObject(19482, -1742.796386, 792.430541, 146.442794, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterialText(tmpobjid, 0, "SAVLINE BANK", 130, "Segoe Keycaps", 25, 1, 0xFF000000, 0x00000000, 1);
	tmpobjid = IntBank_CreateDynamicObject(19327, -1738.037231, 779.581054, 147.112777, 0.000000, 0.000000, 179.699996);
	SetDynamicObjectMaterialText(tmpobjid, 0, "^", 130, "Ariel", 80, 1, 0xFF1FD215, 0x00000000, 1);
	tmpobjid = IntBank_CreateDynamicObject(19327, -1737.846679, 779.580078, 147.222763, 0.000000, 179.699996, 179.699996);
	SetDynamicObjectMaterialText(tmpobjid, 0, "^", 130, "Ariel", 80, 1, 0xFFF91000, 0x00000000, 1);
	tmpobjid = IntBank_CreateDynamicObject(19327, -1744.057373, 779.582702, 147.195236, 0.000000, 179.699996, 179.699996);
	SetDynamicObjectMaterialText(tmpobjid, 0, "^", 130, "Ariel", 80, 1, 0xFFF91000, 0x00000000, 1);
	tmpobjid = IntBank_CreateDynamicObject(19327, -1743.867431, 779.581665, 147.082794, 0.000000, 0.000000, 179.699996);
	SetDynamicObjectMaterialText(tmpobjid, 0, "^", 130, "Ariel", 80, 1, 0xFF1FD215, 0x00000000, 1);
	tmpobjid = IntBank_CreateDynamicObject(19482, -1747.815673, 789.525146, 146.782775, 0.000000, 0.000000, -89.799995);
	SetDynamicObjectMaterialText(tmpobjid, 0, "SAVLINE", 130, "Ariel", 60, 1, 0xFF007BB7, 0x00000000, 1);
	tmpobjid = IntBank_CreateDynamicObject(19482, -1747.815673, 789.535156, 145.692764, 0.000000, 0.000000, -89.799995);
	SetDynamicObjectMaterialText(tmpobjid, 0, "CENTRAL BANK", 130, "Ariel", 50, 1, 0xFF000000, 0x00000000, 1);
	tmpobjid = IntBank_CreateDynamicObject(19482, -1740.185791, 801.350891, 146.402801, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterialText(tmpobjid, 0, "SAVLINE", 130, "Segoe Keycaps", 25, 1, 0xFF059DCF, 0x00000000, 1);
	tmpobjid = IntBank_CreateDynamicObject(19482, -1740.185791, 801.350891, 146.122817, 0.000000, 0.000000, 0.000000);
	SetDynamicObjectMaterialText(tmpobjid, 0, "BANK", 130, "Segoe Keycaps", 25, 1, 0xFF000000, 0x00000000, 1);
	tmpobjid = IntBank_CreateDynamicObject(19482, -1734.845458, 801.342834, 146.102828, 0.000000, 0.000000, 179.700027);
	SetDynamicObjectMaterialText(tmpobjid, 0, "BANK", 130, "Segoe Keycaps", 25, 1, 0xFF000000, 0x00000000, 1);
	tmpobjid = IntBank_CreateDynamicObject(19482, -1734.845458, 801.342834, 146.402801, 0.000000, 0.000000, 179.700027);
	SetDynamicObjectMaterialText(tmpobjid, 0, "SAVLINE", 130, "Segoe Keycaps", 25, 1, 0xFF007BB7, 0x00000000, 1);
	tmpobjid = IntBank_CreateDynamicObject(19482, -1747.815673, 789.535156, 146.762786, 0.000000, 0.000000, -89.799995);
	SetDynamicObjectMaterialText(tmpobjid, 0, "SAVLINE", 130, "Ariel", 60, 1, 0xFF000000, 0x00000000, 1);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1772.236572, 791.650024, 141.633697, 0.000000, 0.000000, -85.500000);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1767.176513, 799.895446, 141.633697, 0.000000, 0.000000, 178.699966);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(18766, -1768.161254, 792.504150, 141.633697, 0.000000, 0.000000, -176.999984);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicbrikwall01", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 18031, "cj_exp", "mp_cloth_wall", 0x00000000);
	tmpobjid = IntBank_CreateDynamicObject(19550, -1731.28760, 772.43707, 154.57359,   0.00000, 90.00000, -92.39999);
	SetDynamicObjectMaterial(tmpobjid, 0, 1676, "wshxrefpump", "black64", 0xFFFFFFFF);
	tmpobjid = IntBank_CreateDynamicObject(19550, -1730.92139, 909.39459, 154.57359,   0.00000, 90.00000, -59.45998);
	SetDynamicObjectMaterial(tmpobjid, 0, 1676, "wshxrefpump", "black64", 0xFFFFFFFF);
	tmpobjid = IntBank_CreateDynamicObject(902, -1748.040893, 784.453369, 144.558135, 0.000000, 0.000000, -37.799999);
	tmpobjid = IntBank_CreateDynamicObject(1601, -1748.981323, 784.314025, 146.648666, 0.000000, 0.000000, 26.579999);
	tmpobjid = IntBank_CreateDynamicObject(1601, -1746.800781, 783.864501, 147.360290, 0.000000, 0.000000, -41.459999);
	tmpobjid = IntBank_CreateDynamicObject(816, -1746.878051, 783.809020, 144.688858, 0.000000, 0.000000, 140.999969);
	tmpobjid = IntBank_CreateDynamicObject(2634, -1762.057617, 791.084594, 141.364105, 0.000000, 0.000000, -90.000000);
	tmpobjid = IntBank_CreateDynamicObject(2007, -1763.754028, 792.062500, 139.928298, 0.000000, 0.000000, 0.000000);
	tmpobjid = IntBank_CreateDynamicObject(2007, -1764.754028, 792.062500, 139.928298, 0.000000, 0.000000, 0.000000);
	tmpobjid = IntBank_CreateDynamicObject(2007, -1765.754028, 792.062500, 139.928298, 0.000000, 0.000000, 0.000000);
	tmpobjid = IntBank_CreateDynamicObject(2007, -1767.226562, 791.614868, 139.928298, 0.000000, 0.000000, 90.000000);
	tmpobjid = IntBank_CreateDynamicObject(2007, -1767.226562, 790.614929, 139.928298, 0.000000, 0.000000, 90.000000);
	tmpobjid = IntBank_CreateDynamicObject(2007, -1767.226562, 789.614929, 139.928298, 0.000000, 0.000000, 90.000000);
	tmpobjid = IntBank_CreateDynamicObject(2007, -1762.738769, 786.978698, 139.928298, 0.000000, 0.000000, 180.000000);
	tmpobjid = IntBank_CreateDynamicObject(2007, -1763.738769, 786.978698, 139.928298, 0.000000, 0.000000, 180.000000);
	tmpobjid = IntBank_CreateDynamicObject(2007, -1764.738769, 786.978698, 139.928298, 0.000000, 0.000000, 180.000000);
	tmpobjid = IntBank_CreateDynamicObject(2007, -1765.738769, 786.978698, 139.928298, 0.000000, 0.000000, 180.000000);
	tmpobjid = IntBank_CreateDynamicObject(2007, -1766.738769, 786.978698, 139.928298, 0.000000, 0.000000, 180.000000);
	tmpobjid = IntBank_CreateDynamicObject(2007, -1767.226562, 788.614929, 139.928298, 0.000000, 0.000000, 90.000000);
	tmpobjid = IntBank_CreateDynamicObject(2007, -1767.226562, 787.614929, 139.928298, 0.000000, 0.000000, 90.000000);
	tmpobjid = IntBank_CreateDynamicObject(2007, -1767.226562, 786.614929, 139.928298, 0.000000, 0.000000, 90.000000);
	tmpobjid = IntBank_CreateDynamicObject(2007, -1762.738769, 786.978698, 141.318756, 0.000000, 0.000000, 180.000000);
	tmpobjid = IntBank_CreateDynamicObject(2007, -1763.738769, 786.978698, 141.318801, 0.000000, 0.000000, 180.000000);
	tmpobjid = IntBank_CreateDynamicObject(2007, -1765.738769, 786.978698, 141.318801, 0.000000, 0.000000, 180.000000);
	tmpobjid = IntBank_CreateDynamicObject(2007, -1764.738769, 786.978698, 141.318801, 0.000000, 0.000000, 180.000000);
	tmpobjid = IntBank_CreateDynamicObject(2007, -1767.226562, 787.614929, 141.318801, 0.000000, 0.000000, 90.000000);
	tmpobjid = IntBank_CreateDynamicObject(2007, -1766.738769, 786.978698, 141.318801, 0.000000, 0.000000, 180.000000);
	tmpobjid = IntBank_CreateDynamicObject(2007, -1767.226562, 786.614929, 141.318801, 0.000000, 0.000000, 90.000000);
	tmpobjid = IntBank_CreateDynamicObject(2007, -1767.226562, 788.614929, 141.318801, 0.000000, 0.000000, 90.000000);
	tmpobjid = IntBank_CreateDynamicObject(2007, -1767.226562, 791.614929, 141.318801, 0.000000, 0.000000, 90.000000);
	tmpobjid = IntBank_CreateDynamicObject(2007, -1767.226562, 790.614929, 141.318801, 0.000000, 0.000000, 90.000000);
	tmpobjid = IntBank_CreateDynamicObject(2007, -1767.226562, 789.614929, 141.318801, 0.000000, 0.000000, 90.000000);
	tmpobjid = IntBank_CreateDynamicObject(2007, -1765.754028, 792.062500, 141.318801, 0.000000, 0.000000, 0.000000);
	tmpobjid = IntBank_CreateDynamicObject(2007, -1764.754028, 792.062500, 141.318801, 0.000000, 0.000000, 0.000000);
	tmpobjid = IntBank_CreateDynamicObject(2007, -1762.754028, 792.062500, 141.318801, 0.000000, 0.000000, 0.000000);
	tmpobjid = IntBank_CreateDynamicObject(2007, -1763.754028, 792.062500, 141.318801, 0.000000, 0.000000, 0.000000);
	tmpobjid = IntBank_CreateDynamicObject(18756, -1738.006713, 781.372680, 146.035705, 0.000000, 0.000000, 90.000000);
	tmpobjid = IntBank_CreateDynamicObject(18756, -1737.949096, 777.565612, 146.035705, 0.000000, 0.000000, -90.000000);
	tmpobjid = IntBank_CreateDynamicObject(18756, -1744.006713, 781.372680, 146.035705, 0.000000, 0.000000, 90.000000);
	tmpobjid = IntBank_CreateDynamicObject(18756, -1743.949096, 777.565612, 146.035705, 0.000000, 0.000000, -90.000000);
	tmpobjid = IntBank_CreateDynamicObject(1746, -1734.400146, 794.051269, 144.117095, 0.000000, 0.000000, 0.000000);
	tmpobjid = IntBank_CreateDynamicObject(1746, -1734.400146, 793.051269, 144.117095, 0.000000, 0.000000, 0.000000);
	tmpobjid = IntBank_CreateDynamicObject(1746, -1734.400146, 792.051269, 144.117095, 0.000000, 0.000000, 0.000000);
	tmpobjid = IntBank_CreateDynamicObject(1746, -1734.400146, 788.051269, 144.117095, 0.000000, 0.000000, 0.000000);
	tmpobjid = IntBank_CreateDynamicObject(1746, -1734.400146, 787.051269, 144.117095, 0.000000, 0.000000, 0.000000);
	tmpobjid = IntBank_CreateDynamicObject(1746, -1734.400146, 786.051269, 144.117095, 0.000000, 0.000000, 0.000000);
	tmpobjid = IntBank_CreateDynamicObject(1210, -1734.403808, 788.716979, 144.264648, 0.000000, 0.000000, 0.000000);
	tmpobjid = IntBank_CreateDynamicObject(1210, -1734.430419, 792.979919, 144.699295, 90.000000, 0.000000, -51.900001);
	tmpobjid = IntBank_CreateDynamicObject(1569, -1738.970214, 804.051086, 144.026901, 0.000000, 0.000000, 0.000000);
	tmpobjid = IntBank_CreateDynamicObject(1569, -1735.973144, 804.056091, 144.026901, 0.000000, 0.000000, 180.000000);
	tmpobjid = IntBank_CreateDynamicObject(1726, -1739.508544, 800.375793, 144.131393, 0.000000, 0.000000, 90.000000);
	tmpobjid = IntBank_CreateDynamicObject(1726, -1735.410522, 802.405517, 144.131393, 0.000000, 0.000000, 990.000000);
	tmpobjid = IntBank_CreateDynamicObject(1746, -1746.626098, 786.481018, 144.117095, 0.000000, 0.000000, 0.000000);
	tmpobjid = IntBank_CreateDynamicObject(1746, -1747.626098, 786.481018, 144.117095, 0.000000, 0.000000, 0.000000);
	tmpobjid = IntBank_CreateDynamicObject(1746, -1748.626098, 786.481018, 144.117095, 0.000000, 0.000000, 0.000000);
	tmpobjid = IntBank_CreateDynamicObject(1746, -1746.626098, 782.344970, 144.117095, 0.000000, 0.000000, 0.000000);
	tmpobjid = IntBank_CreateDynamicObject(1746, -1747.626098, 782.344970, 144.117095, 0.000000, 0.000000, 0.000000);
	tmpobjid = IntBank_CreateDynamicObject(1746, -1748.626098, 782.344970, 144.117095, 0.000000, 0.000000, 0.000000);
	tmpobjid = IntBank_CreateDynamicObject(1599, -1748.505126, 784.849243, 145.671051, 0.000000, 0.000000, 0.000000);
	tmpobjid = IntBank_CreateDynamicObject(1599, -1749.473022, 783.914306, 145.671051, 0.000000, 0.000000, 123.419998);
	tmpobjid = IntBank_CreateDynamicObject(1599, -1746.632446, 784.372802, 145.671051, 0.000000, 0.000000, 101.939987);
	tmpobjid = IntBank_CreateDynamicObject(1599, -1746.249877, 785.393249, 145.671051, 0.000000, 0.000000, -0.660018);
	tmpobjid = IntBank_CreateDynamicObject(1599, -1748.505126, 784.849243, 147.199981, 0.000000, 0.000000, 0.000000);
	tmpobjid = IntBank_CreateDynamicObject(1599, -1748.747436, 783.693664, 147.199981, 0.000000, 0.000000, 151.739990);
	tmpobjid = IntBank_CreateDynamicObject(11711, -1742.618652, 789.658020, 147.501510, 0.000000, 0.000000, 0.000000);
	IntBank_CreateDynamicObject(19273, -1760.57837, 792.11102, 140.98625,   0.00000, 0.00000, 0.00000);
	IntBank_CreateDynamicObject(4649, -1723.07288, 798.18097, 139.95320,   0.00000, 0.00000, 90.00000);
	IntBank_CreateDynamicObject(4650, -1661.18591, 855.10382, 138.38220,   0.00000, 0.00000, 90.00000);
	IntBank_CreateDynamicObject(4584, -1661.46240, 792.82123, 135.79440,   0.00000, 0.00000, 90.00000);
	IntBank_CreateDynamicObject(4569, -1670.04443, 776.03668, 156.71458,   0.00000, 0.00000, 90.00000);
	IntBank_CreateDynamicObject(4585, -1691.06750, 824.93329, 228.29559,   0.00000, 0.00000, 90.00000);
	IntBank_CreateDynamicObject(4651, -1671.19043, 912.60321, 138.13530,   0.00000, 0.00000, 90.00000);
	IntBank_CreateDynamicObject(4568, -1661.88745, 902.48315, 137.74469,   0.00000, 0.00000, 90.00000);
	IntBank_CreateDynamicObject(4690, -1670.85254, 890.12146, 147.43529,   0.00000, 0.00000, 90.00000);
	IntBank_CreateDynamicObject(4572, -1639.90576, 826.20209, 162.49741,   0.00000, 0.00000, 90.00000);
	IntBank_CreateDynamicObject(4586, -1587.46484, 795.46063, 200.63835,   0.00000, 0.00000, 90.00000);

}

stock mapPoliceGarages() {

	CreateDynamicObject(2957,1590.6200000,-1637.9500000,14.1000000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (1)
	CreateDynamicObject(2957,1586.2300000,-1637.9500000,14.0800000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (2)
	CreateDynamicObject(2952,1584.3101000,-1637.9301000,12.3900000,0.0000000,0.0000000,268.7760000); //object(kmb_gimpdoor) (1)
	CreateDynamicObject(2957,1590.6200000,-1637.9500000,16.0000000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (4)
	CreateDynamicObject(2957,1586.4100000,-1638.0400000,16.0000000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (5)
	CreateDynamicObject(2957,-1638.4200000,688.0800200,7.8100000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (6)
	CreateDynamicObject(2957,-1633.9800000,688.0700100,7.8100000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (7)
	CreateDynamicObject(2957,-1629.5000000,688.1200000,7.8100000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (8)
	CreateDynamicObject(2957,-1625.0699000,688.0700100,7.7900000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (9)
	CreateDynamicObject(2957,-1625.0699000,688.0700100,10.9400000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (10)
	CreateDynamicObject(2957,-1629.5699000,688.1599700,11.0100000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (11)
	CreateDynamicObject(2957,-1634.0601000,688.1099900,10.9400000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (12)
	CreateDynamicObject(2957,-1638.5601000,688.0900300,10.9400000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (13)
	CreateDynamicObject(3352,-1620.5500000,688.1200000,7.4900000,89.4000000,0.0000000,269.1220000); //object(burbdoorrename_me) (1)
	CreateDynamicObject(2957,2334.2800000,2441.8301000,6.4400000,0.0000000,0.0000000,60.6780000); //object(chinatgaragedoor) (14)
	CreateDynamicObject(2957,2336.4800000,2445.7000000,6.4400000,0.0000000,0.0000000,60.9150000); //object(chinatgaragedoor) (15)
	CreateDynamicObject(2957,2334.2800000,2441.8301000,9.6000000,0.0000000,0.0000000,60.6770000); //object(chinatgaragedoor) (16)
	CreateDynamicObject(2957,2336.4800000,2445.7000000,9.6200000,0.0000000,0.0000000,60.9140000); //object(chinatgaragedoor) (17)
}

stock mapBlockedPNS()
{
	CreateDynamicObject(2957,1590.6200000,-1637.9500000,14.1000000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (1)
	CreateDynamicObject(2957,1586.2300000,-1637.9500000,14.0800000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (2)
	CreateDynamicObject(2952,1584.3101000,-1637.9301000,12.3900000,0.0000000,0.0000000,268.7760000); //object(kmb_gimpdoor) (1)
	CreateDynamicObject(2957,1590.6200000,-1637.9500000,16.0000000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (4)
	CreateDynamicObject(2957,1586.4100000,-1638.0400000,16.0000000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (5)
	CreateDynamicObject(2957,-1638.4200000,688.0800200,7.8100000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (6)
	CreateDynamicObject(2957,-1633.9800000,688.0700100,7.8100000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (7)
	CreateDynamicObject(2957,-1629.5000000,688.1200000,7.8100000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (8)
	CreateDynamicObject(2957,-1625.0699000,688.0700100,7.7900000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (9)
	CreateDynamicObject(2957,-1625.0699000,688.0700100,10.9400000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (10)
	CreateDynamicObject(2957,-1629.5699000,688.1599700,11.0100000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (11)
	CreateDynamicObject(2957,-1634.0601000,688.1099900,10.9400000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (12)
	CreateDynamicObject(2957,-1638.5601000,688.0900300,10.9400000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (13)
	CreateDynamicObject(3352,-1620.5500000,688.1200000,7.4900000,89.4000000,0.0000000,269.1220000); //object(burbdoorrename_me) (1)
	CreateDynamicObject(2957,2334.2800000,2441.8301000,6.4400000,0.0000000,0.0000000,60.6780000); //object(chinatgaragedoor) (14)
	CreateDynamicObject(2957,2336.4800000,2445.7000000,6.4400000,0.0000000,0.0000000,60.9150000); //object(chinatgaragedoor) (15)
	CreateDynamicObject(2957,2334.2800000,2441.8301000,9.6000000,0.0000000,0.0000000,60.6770000); //object(chinatgaragedoor) (16)
	CreateDynamicObject(2957,2336.4800000,2445.7000000,9.6200000,0.0000000,0.0000000,60.9140000); //object(chinatgaragedoor) (17)
	CreateDynamicObject(2957,1025.0900000,-1029.4100000,32.7700000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (18)
	CreateDynamicObject(2957,1025.0900000,-1029.4100000,35.9700000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (19)
	CreateDynamicObject(2957,1040.0699000,-1026.0000000,32.7200000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (20)
	CreateDynamicObject(2957,1044.5500000,-1026.0100000,32.6700000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (21)
	CreateDynamicObject(2957,2071.5100000,-1831.3600000,14.1200000,0.0000000,0.0000000,269.0530000); //object(chinatgaragedoor) (22)
	CreateDynamicObject(2957,2071.5100000,-1831.3600000,17.1800000,0.0000000,0.0000000,269.0500000); //object(chinatgaragedoor) (23)
	CreateDynamicObject(2957,1843.2600000,-1856.3101000,13.7400000,0.0000000,0.0000000,270.0000000); //object(chinatgaragedoor) (24)
	CreateDynamicObject(2957,2646.6799000,-2039.1801000,14.0700000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (25)
	CreateDynamicObject(2957,2642.9700000,-2039.1700000,14.0200000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (26)
	CreateDynamicObject(2957,-2716.2200000,215.5099900,4.6800000,0.0000000,0.0000000,270.6350000); //object(chinatgaragedoor) (27)
	CreateDynamicObject(2957,-2716.2900000,219.4800000,4.8200000,0.0000000,0.0000000,271.0840000); //object(chinatgaragedoor) (28)
	CreateDynamicObject(2957,-2716.2200000,215.5099900,7.9500000,0.0000000,0.0000000,270.6320000); //object(chinatgaragedoor) (29)
	CreateDynamicObject(2957,-2716.2900000,219.4800000,7.8900000,0.0000000,0.0000000,271.0820000); //object(chinatgaragedoor) (30)
	CreateDynamicObject(2957,-1937.0900000,238.4400000,34.9300000,0.0000000,0.0000000,0.6780000); //object(chinatgaragedoor) (31)
	CreateDynamicObject(2957,-1933.5900000,238.4800000,34.9300000,0.0000000,0.0000000,0.6760000); //object(chinatgaragedoor) (32)
	CreateDynamicObject(2957,-1933.5900000,238.4800000,38.0900000,0.0000000,0.0000000,0.6760000); //object(chinatgaragedoor) (33)
	CreateDynamicObject(2957,-1937.0900000,238.4900100,38.1100000,0.0000000,0.0000000,0.6760000); //object(chinatgaragedoor) (34)
	CreateDynamicObject(2957,-1906.6100000,277.7300100,41.6700000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (35)
	CreateDynamicObject(2957,-1902.2700000,277.6600000,41.6700000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (36)
	CreateDynamicObject(2957,-1902.2700000,277.6600000,44.8000000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (37)
	CreateDynamicObject(2957,-1906.6100000,277.7300100,44.8500000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (38)
	CreateDynamicObject(2957,488.2000100,-1734.7100000,11.7900000,0.0000000,0.0000000,352.6860000); //object(chinatgaragedoor) (39)
	CreateDynamicObject(2957,488.2300100,-1734.7000000,14.9900000,0.0000000,0.0000000,352.6840000); //object(chinatgaragedoor) (40)
	CreateDynamicObject(2957,-1789.3000000,1209.4301000,25.7400000,0.0000000,0.0000000,359.3220000); //object(chinatgaragedoor) (41)
	CreateDynamicObject(2957,-1784.7900000,1209.3600000,25.7600000,0.0000000,0.0000000,359.3190000); //object(chinatgaragedoor) (42)
	CreateDynamicObject(2957,-1419.2300000,2591.1899000,56.4500000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (43)
	CreateDynamicObject(2957,-1423.7400000,2591.1699000,56.4500000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (44)
	CreateDynamicObject(2957,-1422.2500000,2591.1599000,59.0700000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (45)
	CreateDynamicObject(2957,-1419.2000000,2591.1799000,59.2500000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (46)
	CreateDynamicObject(2957,-101.4300000,1111.3900000,20.3600000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (47)
	CreateDynamicObject(2957,-101.4300000,1111.3900000,23.1700000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (48)
	CreateDynamicObject(2957,-98.5300000,1111.4000000,23.1700000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (49)
	CreateDynamicObject(2957,-96.9800000,1111.4000000,20.2700000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (50)
	CreateDynamicObject(2957,2392.3501000,1483.6100000,11.2700000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (51)
	CreateDynamicObject(2957,2392.3501000,1483.6100000,14.4700000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (54)
	CreateDynamicObject(2957,2395.6201000,1483.6200000,14.4700000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (55)
	CreateDynamicObject(2957,2395.6201000,1483.6200000,11.2200000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (56)
	CreateDynamicObject(2957,2384.8701000,1043.3500000,11.4400000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (57)
	CreateDynamicObject(2957,2389.3301000,1043.3700000,11.4400000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (58)
	CreateDynamicObject(2957,2384.8701000,1043.3500000,14.6400000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (59)
	CreateDynamicObject(2957,2389.3301000,1043.3700000,14.6600000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (60)
	CreateDynamicObject(2957,720.0300300,-462.5900000,16.5400000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (61)
	CreateDynamicObject(2957,720.0300300,-462.5900000,19.0500000,0.0000000,0.0000000,0.0000000); //object(chinatgaragedoor) (62)
}

stock mapNorthRockShack() // Timeline
{

	CreateDynamicObject(3383,2350.2002000,-648.2998000,127.1000000,0.0000000,0.0000000,270.0000000); //object(a51_labtable1_) (1)
	CreateDynamicObject(3383,2350.2000000,-653.0000000,127.1000000,0.0000000,0.0000000,270.0000000); //object(a51_labtable1_) (2)
	CreateDynamicObject(1575,2350.1001000,-654.5999800,128.1700000,0.0000000,0.0000000,0.0000000); //object(drug_white) (1)
	CreateDynamicObject(1550,2350.5000000,-651.5000000,128.5300000,4.5040000,355.9840000,77.7940000); //object(cj_money_bag) (1)
	CreateDynamicObject(1210,2349.6001000,-652.0000000,128.3000000,0.0000000,0.0000000,271.5000000); //object(briefcase) (1)
	CreateDynamicObject(1575,2350.1001000,-654.2000100,128.1700000,0.0000000,0.0000000,0.0000000); //object(drug_white) (2)
	CreateDynamicObject(1575,2350.1001000,-653.7999900,128.1700000,0.0000000,0.0000000,0.0000000); //object(drug_white) (3)
	CreateDynamicObject(2515,2350.0000000,-653.0000000,128.3000000,0.0000000,0.0000000,90.0000000); //object(cj_bs_sink) (1)
	CreateDynamicObject(349,2350.2000000,-649.7999900,128.1700000,83.6770000,251.6320000,115.7230000); //object(1)
	CreateDynamicObject(349,2350.2000000,-649.4000200,128.1700000,83.6720000,251.6310000,115.7190000); //object(2)
	CreateDynamicObject(346,2350.3000000,-651.9000200,128.2000000,274.0000000,0.0000000,0.0000000); //object(3)
	CreateDynamicObject(1575,2350.7000000,-654.5999800,128.1499900,0.0000000,0.0000000,0.0000000); //object(drug_white) (4)
	CreateDynamicObject(1575,2350.7000000,-654.2000100,128.1499900,0.0000000,0.0000000,0.0000000); //object(drug_white) (5)
	CreateDynamicObject(1575,2350.7000000,-653.7999900,128.1499900,0.0000000,0.0000000,0.0000000); //object(drug_white) (6)
	CreateDynamicObject(2908,2349.7000000,-650.0000000,128.2800000,272.0000000,0.0000000,128.0000000); //object(kmb_deadhead) (1)
	CreateDynamicObject(1329,2353.2900000,-646.5399800,127.4900000,0.0000000,0.0000000,0.0000000); //object(binnt13_la) (1)
	CreateDynamicObject(2906,2353.3501000,-646.4600200,127.7100000,355.7270000,180.0000000,180.0000000); //object(kmb_deadarm) (1)
	CreateDynamicObject(1665,2350.7900000,-649.1400100,128.1900000,0.0000000,0.0000000,0.0000000); //object(propashtray1) (1)
	CreateDynamicObject(1544,2350.3601000,-649.1500200,128.1600000,0.0000000,0.0000000,0.0000000); //object(cj_beer_b_1) (1)
	CreateDynamicObject(1544,2349.8701000,-648.8100000,128.2300000,272.4240000,0.0000000,0.0000000); //object(cj_beer_b_1) (2)
	CreateDynamicObject(1544,2350.4800000,-648.9400000,128.2300000,272.4220000,0.0000000,66.8120000); //object(cj_beer_b_1) (3)
	CreateDynamicObject(1544,2350.1299000,-648.5800200,128.2100100,270.6000000,0.0000000,258.0390000); //object(cj_beer_b_1) (4)
	CreateDynamicObject(1736,2352.0000000,-646.5999800,129.6000100,0.0000000,0.0000000,7.0060000); //object(cj_stags_head) (1)
	CreateDynamicObject(3265,2354.1599000,-657.9299900,127.0500000,0.0000000,0.0000000,91.7260000); //object(privatesign4) (1)
	CreateDynamicObject(3264,2359.0100000,-645.4299900,126.3000000,0.0000000,0.0000000,62.0160000); //object(privatesign3) (1)
	CreateDynamicObject(18451,2370.3999000,-644.3800000,127.0700000,0.0000000,0.0000000,193.3960000); //object(cs_oldcarjmp) (1)
	CreateDynamicObject(2695,2354.5200000,-650.9299900,128.3700000,0.0000000,0.0000000,0.0000000); //object(cj_banner12) (1)
	CreateDynamicObject(2641,2353.6101000,-652.6500200,129.0500000,0.0000000,0.0000000,269.4710000); //object(cj_burger_poster) (1)
	CreateDynamicObject(2666,2353.5901000,-650.1099900,128.7200000,0.0000000,0.0000000,271.7470000); //object(cj_piz_poster2) (1)
	CreateDynamicObject(3092,2349.6299000,-657.9699700,128.0000000,0.0000000,0.0000000,272.4250000); //object(dead_tied_cop) (1)
	CreateDynamicObject(932,2350.6699000,-647.5100100,128.1400000,0.0000000,0.0000000,19.8430000); //object(h_wheelchair) (1)
	CreateDynamicObject(1664,2350.5500000,-647.7000100,128.7300000,0.0000000,0.0000000,0.0000000); //object(propwinebotl2) (1)
	CreateDynamicObject(1576,2350.6899000,-652.4400000,128.1300000,0.0000000,0.0000000,0.0000000); //object(drug_orange) (1)
}

stock mapHeroinShip() {
	CreateDynamicObject(8493,-2738.3701000,2096.2900000,14.2500000,0.0000000,0.0000000,170.0000000); //object(pirtshp01_lvs) (1)
	CreateDynamicObject(2637,-2733.8101000,2125.3799000,3.4000000,0.0000000,0.0000000,350.8780000); //object(cj_pizza_table2) (1)
	CreateDynamicObject(2637,-2731.6699000,2125.0601000,3.4000000,0.0000000,0.0000000,350.8760000); //object(cj_pizza_table2) (2)
	CreateDynamicObject(1575,-2734.5000000,2125.5100000,3.8200000,0.0000000,0.0000000,261.4780000); //object(drug_white) (1)
	CreateDynamicObject(1575,-2734.0200000,2125.4600000,3.8200000,0.0000000,0.0000000,261.4750000); //object(drug_white) (2)
	CreateDynamicObject(1575,-2733.5601000,2125.3701000,3.8200000,0.0000000,0.0000000,261.4750000); //object(drug_white) (3)
	CreateDynamicObject(1575,-2733.1101000,2125.2900000,3.8200000,0.0000000,0.0000000,261.4750000); //object(drug_white) (4)
	CreateDynamicObject(350,-2733.8799000,2124.9900000,3.8300000,86.1510000,251.4740000,108.5650000); //object(1)
	CreateDynamicObject(337,-2730.5300000,2124.4500000,3.8300000,355.7610000,172.6820000,163.5210000); //object(2)
	CreateDynamicObject(1946,-2730.7100000,2123.9700000,3.2000000,0.0000000,0.0000000,0.0000000); //object(baskt_ball_hi) (1)
	CreateDynamicObject(3092,-2740.5300000,2081.0801000,1.4200000,352.0770000,180.0000000,176.4370000); //object(dead_tied_cop) (1)
	CreateDynamicObject(1777,-2735.1499000,2123.2100000,3.7800000,0.0000000,0.0000000,80.0000000); //object(cj_cooker1) (1)
	CreateDynamicObject(1371,-2735.4800000,2121.0300000,3.7800000,0.0000000,0.0000000,82.1020000); //object(cj_hippo_bin) (1)
	CreateDynamicObject(1083,-2732.6101000,2126.3301000,7.0400000,0.0000000,0.0000000,76.6290000); //object(wheel_lr2) (1)
	CreateDynamicObject(356,-2730.1499000,2126.0701000,6.6600000,0.0000000,0.0000000,280.0430000); //object(3)
	CreateDynamicObject(356,-2735.1299000,2126.9099000,6.6600000,0.0000000,0.0000000,249.8160000); //object(4)
	CreateDynamicObject(1711,-2742.5400000,2087.0400000,3.7200000,0.0000000,0.0000000,86.8990000); //object(kb_chair01) (1)
	CreateDynamicObject(1711,-2736.3501000,2086.5400000,3.7200000,0.0000000,0.0000000,260.5450000); //object(kb_chair01) (2)
	CreateDynamicObject(1764,-2739.9600000,2089.8601000,3.7400000,0.0000000,0.0000000,350.8780000); //object(low_couch_2) (1)
	CreateDynamicObject(2311,-2740.3601000,2085.1399000,3.7400000,0.0000000,0.0000000,350.8780000); //object(cj_tv_table2) (2)
	CreateDynamicObject(1786,-2739.5500000,2084.8101000,4.2300000,0.0000000,0.0000000,170.0000000); //object(swank_tv_4) (1)
	CreateDynamicObject(11544,-2739.6101000,2107.0200000,0.9300000,0.0000000,0.0000000,261.2280000); //object(des_ntfrescape2) (1)
	CreateDynamicObject(3886,-2751.9500000,2108.8601000,-0.7100000,0.0000000,0.0000000,262.7020000); //object(ws_jettynol_sfx) (1)
	CreateDynamicObject(920,-2738.5000000,2082.9800000,4.1800000,0.0000000,0.0000000,227.1580000); //object(y_generator) (1)
	CreateDynamicObject(2600,-2730.9600000,2126.4700000,6.2100000,0.0000000,0.0000000,352.0400000); //object(cj_view_tele) (1)
	CreateDynamicObject(2600,-2734.3701000,2127.1201000,6.2100000,0.0000000,0.0000000,350.8580000); //object(cj_view_tele) (2)
	CreateDynamicObject(3633,-2737.8601000,2094.6201000,3.3600000,0.0000000,0.0000000,349.5480000); //object(imoildrum4_las) (1)
	CreateDynamicObject(1701,-2735.8101000,2110.6101000,1.8400000,0.0000000,0.0000000,349.9570000); //object(kb_bed_test2) (1)
	CreateDynamicObject(2846,-2733.9299000,2110.6799000,1.9800000,0.0000000,0.0000000,0.0000000); //object(gb_bedclothes05) (1)
	CreateDynamicObject(2845,-2736.0100000,2110.4600000,1.9600000,0.0000000,0.0000000,0.0000000); //object(gb_bedclothes04) (1)
	CreateDynamicObject(2843,-2734.8601000,2110.0901000,1.9600000,0.0000000,0.0000000,0.0000000); //object(gb_bedclothes02) (2)
	CreateDynamicObject(2521,-2737.0601000,2112.1101000,1.9600000,0.0000000,0.0000000,80.0350000); //object(cj_toilet2) (1)
	CreateDynamicObject(2452,-2731.7600000,2132.1201000,5.4400000,0.0000000,0.0000000,350.5080000); //object(cj_ff_fridge2) (1)
	CreateDynamicObject(2958,-2731.4299000,2131.9500000,7.0800000,0.0000000,347.2290000,34.6650000); //object(cutscene_beer) (1)
	CreateDynamicObject(11245,-2736.1899000,2105.3601000,31.5100000,0.5340000,287.0120000,83.5000000); //object(sfsefirehseflag) (1)
	CreateDynamicObject(2048,-2731.1499000,2133.3701000,9.4700000,0.0000000,0.0000000,348.7610000); //object(cj_flag2) (2)
	CreateDynamicObject(3633,-2738.8301000,2096.0901000,3.3600000,0.0000000,0.0000000,349.5470000); //object(imoildrum4_las) (2)
	CreateDynamicObject(3633,-2736.5000000,2095.5601000,3.3100000,0.0000000,0.0000000,349.5470000); //object(imoildrum4_las) (3)
	CreateDynamicObject(932,-2731.8799000,2108.5300000,1.9600000,0.0000000,0.0000000,50.0000000); //object(h_wheelchair) (1)
	CreateDynamicObject(3534,-2733.0801000,2112.7700000,3.1700000,0.0000000,0.0000000,0.0000000); //object(trdlamp01) (1)
	CreateDynamicObject(2921,-2731.3501000,2125.8701000,5.5300000,0.0000000,0.0000000,80.9470000); //object(kmb_cam) (1)
	CreateDynamicObject(2921,-2737.4199000,2095.2000000,9.4900000,0.0000000,0.0000000,103.4660000); //object(kmb_cam) (2)
	CreateDynamicObject(2907,-2735.2900000,2112.5901000,2.6300000,0.0000000,0.0000000,174.5760000); //object(kmb_deadtorso) (1)
	CreateDynamicObject(2908,-2735.2200000,2113.2400000,2.6800000,0.0000000,0.0000000,185.5260000); //object(kmb_deadhead) (1)
	CreateDynamicObject(335,-2735.3401000,2113.2600000,3.0100000,357.5510000,180.0000000,180.0000000); //object(5)
	CreateDynamicObject(2905,-2735.5100000,2111.9199000,2.6400000,0.0000000,0.0000000,160.0000000); //object(kmb_deadleg) (1)
	CreateDynamicObject(2906,-2735.6399000,2112.7400000,2.6000000,0.0000000,0.0000000,120.0000000); //object(kmb_deadarm) (1)
	CreateDynamicObject(2906,-2733.6299000,2112.1799000,2.0300000,0.0000000,85.7510000,39.5730000); //object(kmb_deadarm) (2)
	CreateDynamicObject(2905,-2735.3899000,2110.8501000,2.0000000,0.0000000,176.9760000,145.3350000); //object(kmb_deadleg) (2)
	CreateDynamicObject(2047,-2731.6499000,2125.2000000,3.8400000,272.4240000,0.0000000,352.5250000); //object(cj_flag1) (1)
	CreateDynamicObject(1543,-2734.5601000,2113.1399000,2.6000000,83.3020000,180.0000000,180.0000000); //object(cj_beer_b_2) (1)
	CreateDynamicObject(1543,-2735.8101000,2112.5701000,2.5300000,356.3550000,0.0010000,359.9890000); //object(cj_beer_b_2) (2)
	CreateDynamicObject(1543,-2734.7800000,2112.7900000,2.6000000,83.2980000,179.9950000,209.9940000); //object(cj_beer_b_2) (3)
	CreateDynamicObject(1543,-2734.2700000,2113.2100000,2.6000000,83.2930000,179.9950000,157.0830000); //object(cj_beer_b_2) (4)
	CreateDynamicObject(1543,-2734.3000000,2112.4299000,2.6000000,83.2870000,179.9950000,47.0830000); //object(cj_beer_b_2) (5)
	CreateDynamicObject(1543,-2734.8501000,2112.5300000,2.6000000,83.2820000,179.9950000,4.0380000); //object(cj_beer_b_2) (6)
	CreateDynamicObject(348,-2734.7500000,2112.9199000,2.5700000,88.2000000,180.0000000,340.0000000); //object(6)
	CreateDynamicObject(932,-2732.4099000,2107.0100000,1.9600000,0.0000000,0.0000000,99.9990000); //object(h_wheelchair) (2)
	CreateDynamicObject(1544,-2732.2000000,2107.4600000,1.9600000,0.0000000,0.0000000,0.0000000); //object(cj_beer_b_1) (1)
	CreateDynamicObject(1544,-2732.1001000,2107.7900000,1.9600000,0.0000000,0.0000000,0.0000000); //object(cj_beer_b_1) (2)
	CreateDynamicObject(1233,-2735.2600000,2099.7700000,2.3200000,0.0000000,0.0000000,188.2450000); //object(noparkingsign1) (1)
	CreateDynamicObject(3265,-2756.8799000,2107.5801000,-0.2400000,0.0000000,0.0000000,263.9780000); //object(privatesign4) (1)
	CreateDynamicObject(1433,-2740.8501000,2089.7100000,3.9000000,0.0000000,0.0000000,350.8780000); //object(dyn_table_1) (1)
	CreateDynamicObject(2894,-2740.8999000,2089.8501000,4.4100000,0.0000000,0.0000000,0.0000000); //object(kmb_rhymesbook) (1)
	CreateDynamicObject(1509,-2740.9299000,2089.3301000,4.6100000,0.0000000,0.0000000,0.0000000); //object(dyn_wine_3) (1)
	CreateDynamicObject(1667,-2740.6299000,2089.2600000,4.5000000,0.0000000,0.0000000,0.0000000); //object(propwineglass1) (1)
	CreateDynamicObject(1664,-2741.1399000,2089.3799000,4.5700000,0.0000000,0.0000000,0.0000000); //object(propwinebotl2) (1)
	CreateDynamicObject(1668,-2742.2300000,2086.4399000,3.9100000,0.0000000,0.0000000,0.0000000); //object(propvodkabotl1) (1)
	CreateDynamicObject(1669,-2740.4900000,2085.1399000,4.2900000,270.6000000,0.0000000,0.0000000); //object(propwinebotl1) (1)
	CreateDynamicObject(3265,-2756.3501000,2111.3301000,-0.2400000,0.0000000,0.0000000,267.6230000); //object(privatesign4) (2)
}

stock mapPanoptionHeroinShack()
{
	CreateDynamicObject(3675,-492.2600100,-173.4800000,81.3500000,0.0000000,0.0000000,0.0000000); //object(laxrf_refinerypipe) (2)
	CreateDynamicObject(3383,-533.0800200,-104.3700000,62.3000000,0.0000000,0.0000000,359.5480000); //object(a51_labtable1_) (1)
	CreateDynamicObject(1575,-535.8300200,-100.5100000,66.2000000,0.0000000,0.0000000,0.0000000); //object(drug_white) (1)
	CreateDynamicObject(1575,-531.6099900,-104.6500000,63.3500000,0.0000000,0.0000000,0.0000000); //object(drug_white) (2)
	CreateDynamicObject(1575,-531.5800200,-104.2600000,63.3500000,0.0000000,0.0000000,0.0000000); //object(drug_white) (3)
	CreateDynamicObject(1575,-532.2899800,-104.6500000,63.3500000,0.0000000,0.0000000,0.0000000); //object(drug_white) (4)
	CreateDynamicObject(1575,-532.2800300,-104.2600000,63.3500000,0.0000000,0.0000000,0.0000000); //object(drug_white) (5)
	CreateDynamicObject(1575,-532.9799800,-104.2400000,63.3500000,0.0000000,0.0000000,0.0000000); //object(drug_white) (6)
	CreateDynamicObject(1575,-532.9699700,-104.6600000,63.3500000,0.0000000,0.0000000,0.0000000); //object(drug_white) (7)
	CreateDynamicObject(346,-532.0600000,-103.6800000,63.3500000,86.1510000,108.5260000,249.6110000); //object(1)
	CreateDynamicObject(331,-531.7800300,-103.7600000,63.3300000,76.5510000,288.1010000,71.4240000); //object(2)
	CreateDynamicObject(1664,-533.5000000,-104.3500000,63.4700000,0.0000000,0.0000000,0.0000000); //object(propwinebotl2) (1)
	CreateDynamicObject(1667,-533.6699800,-104.2900000,63.4400000,0.0000000,0.0000000,0.0000000); //object(propwineglass1) (1)
	CreateDynamicObject(1544,-534.9600200,-104.6900000,63.4100000,0.4570000,91.1360000,21.8890000); //object(cj_beer_b_1) (1)
	CreateDynamicObject(1544,-535.4600200,-104.4800000,62.3700000,0.4500000,91.1260000,232.2280000); //object(cj_beer_b_1) (3)
	CreateDynamicObject(1544,-536.1599700,-104.8800000,62.3700000,0.4390000,91.1260000,18.7350000); //object(cj_beer_b_1) (5)
	CreateDynamicObject(1543,-534.9600200,-104.3100000,63.3400000,0.0000000,0.0000000,0.0000000); //object(cj_beer_b_2) (1)
	CreateDynamicObject(1951,-535.8200100,-104.5300000,62.3500000,88.0790000,71.8030000,334.6270000); //object(kb_beer01) (1)
	CreateDynamicObject(1574,-538.9400000,-101.1800000,62.3000000,0.0000000,0.0000000,0.0000000); //object(trashcan) (1)
	CreateDynamicObject(1544,-538.8599900,-101.6300000,62.3700000,0.4450000,91.1260000,212.1540000); //object(cj_beer_b_1) (6)
	CreateDynamicObject(1510,-533.9099700,-104.7100000,63.3400000,0.0000000,0.0000000,0.0000000); //object(dyn_ashtry) (1)
	CreateDynamicObject(1543,-538.6799900,-100.8100000,62.3400000,89.4000000,0.0000000,60.0000000); //object(cj_beer_b_2) (2)
	CreateDynamicObject(1265,-539.0100100,-102.3600000,62.7500000,0.0000000,0.0000000,0.0000000); //object(blackbag2) (1)
	CreateDynamicObject(3008,-538.3200100,-101.6300000,62.1600000,0.0000000,356.3510000,305.2660000); //object(chopcop_armr) (1)
	CreateDynamicObject(2953,-538.4199800,-101.5300000,62.3000000,0.0000000,0.0000000,0.0000000); //object(kmb_paper_code) (1)
	CreateDynamicObject(3119,-538.2800300,-104.0700000,62.5600000,0.0000000,0.0000000,0.0000000); //object(cs_ry_props) (1)
	CreateDynamicObject(2968,-539.0000000,-104.6300000,62.5900000,0.0000000,0.0000000,0.0000000); //object(cm_box) (1)
	CreateDynamicObject(1370,-535.3400300,-104.0300000,62.7700000,0.0000000,0.0000000,131.4860000); //object(cj_flame_drum) (1)
	CreateDynamicObject(1221,-529.8300200,-104.4100000,62.7400000,0.0000000,0.0000000,0.0000000); //object(cardboardbox4) (1)
	CreateDynamicObject(1369,-532.3300200,-101.3600000,62.9200000,0.0000000,0.0000000,0.0000000); //object(cj_wheelchair1) (1)
	CreateDynamicObject(2106,-532.3599900,-101.4300000,62.8800000,0.0000000,0.0000000,0.0000000); //object(cj_mlight15) (1)
	CreateDynamicObject(2108,-528.6200000,-104.6600000,62.2800000,0.0000000,0.0000000,0.0000000); //object(cj_mlight13) (1)
	CreateDynamicObject(335,-529.5399800,-104.7100000,63.4500000,3.0240000,180.0000000,180.0000000); //object(3)
	CreateDynamicObject(365,-529.7299800,-104.6800000,63.3600000,0.0000000,0.0000000,0.0000000); //object(4)
	CreateDynamicObject(2194,-530.0200200,-104.5300000,63.4800000,0.0000000,0.0000000,0.0000000); //object(plant_pot_2) (1)
	CreateDynamicObject(18066,-534.0200200,-100.6700000,64.7300000,354.5260000,0.0000000,0.0000000); //object(posterv) (1)
	CreateDynamicObject(2660,-535.2199700,-100.7000000,63.9300000,0.0000000,0.0000000,0.0000000); //object(cj_banner06) (1)
	CreateDynamicObject(3875,-544.4799800,-95.2700000,66.6900000,0.0000000,0.0000000,0.0000000); //object(sftelepole) (1)
	CreateDynamicObject(2223,-529.7199700,-104.1800000,63.2800000,0.0000000,0.0000000,294.3190000); //object(rustymed) (1)
	CreateDynamicObject(1757,-539.1099900,-99.6500000,62.3000000,0.0000000,0.0000000,91.2080000); //object(low_couch_5) (1)
	CreateDynamicObject(1781,-539.6900000,-102.1400000,63.8700000,0.0000000,0.0000000,85.4830000); //object(med_tv_1) (1)
	CreateDynamicObject(1663,-535.5900300,-99.9700000,62.7400000,0.0000000,0.0000000,230.0000000); //object(swivelchair_b) (1)
	CreateDynamicObject(1526,-537.9600200,-104.9200000,63.6200000,0.0000000,0.0000000,267.6710000); //object(tag_rifa) (1)
	CreateDynamicObject(2765,-530.7999900,-100.2600000,64.5700000,352.7020000,0.0000000,0.0000000); //object(cj_cb_list1) (1)
}

stock mapBoneCountyShack()
{
	CreateDynamicObject(12991,-791.6900000,2428.7400000,156.2100100,0.0000000,0.0000000,238.0370000); //object(sw_shack02) (1)
	CreateDynamicObject(3383,-793.2800300,2429.6799000,155.7000000,0.0000000,0.0000000,237.9920000); //object(a51_labtable1_) (1)
	CreateDynamicObject(1575,-794.3300200,2428.5200000,156.7000000,0.0000000,0.0000000,58.3840000); //object(drug_white) (1)
	CreateDynamicObject(1575,-793.9899900,2428.3601000,156.7000000,0.0000000,0.0000000,58.3810000); //object(drug_white) (2)
	CreateDynamicObject(1575,-793.6500200,2428.1599000,156.7000000,0.0000000,0.0000000,58.3810000); //object(drug_white) (3)
	CreateDynamicObject(1575,-793.3300200,2428.6201000,156.7000000,0.0000000,0.0000000,58.3810000); //object(drug_white) (4)
	CreateDynamicObject(1575,-793.6900000,2428.8301000,156.7000000,0.0000000,0.0000000,58.3810000); //object(drug_white) (5)
	CreateDynamicObject(1575,-794.0100100,2429.0100000,156.7000000,0.0000000,0.0000000,58.3810000); //object(drug_white) (6)
	CreateDynamicObject(1575,-793.7299800,2429.4900000,156.7000000,0.0000000,0.0000000,58.3810000); //object(drug_white) (7)
	CreateDynamicObject(1575,-793.3900100,2429.3000000,156.7000000,0.0000000,0.0000000,58.3810000); //object(drug_white) (8)
	CreateDynamicObject(1575,-793.0100100,2429.0701000,156.7000000,0.0000000,0.0000000,58.3810000); //object(drug_white) (9)
	CreateDynamicObject(1575,-792.7399900,2429.5500000,156.7000000,0.0000000,0.0000000,58.3810000); //object(drug_white) (10)
	CreateDynamicObject(1575,-793.0800200,2429.7600000,156.7000000,0.0000000,0.0000000,58.3810000); //object(drug_white) (11)
	CreateDynamicObject(1575,-793.4099700,2429.9800000,156.7000000,0.0000000,0.0000000,58.3810000); //object(drug_white) (12)
	CreateDynamicObject(2515,-792.6099900,2430.5701000,156.8500100,1.8240000,0.0000000,58.3840000); //object(cj_bs_sink) (1)
	CreateDynamicObject(2741,-792.2100200,2431.7200000,156.9600100,0.0000000,0.0000000,330.8410000); //object(cj_soap_disp) (1)
	CreateDynamicObject(1646,-789.0800200,2428.4299000,156.5500000,0.0000000,0.0000000,330.5660000); //object(lounge_towel_up) (1)
	CreateDynamicObject(1704,-791.6699800,2426.6599000,156.2100100,0.0000000,0.0000000,147.6840000); //object(kb_chair03) (1)
	CreateDynamicObject(3785,-794.8800000,2428.7700000,157.8700000,0.0000000,0.0000000,334.2350000); //object(bulkheadlight) (1)
	CreateDynamicObject(1210,-789.5000000,2429.7500000,156.3100000,88.7750000,180.0000000,148.8070000); //object(briefcase) (1)
	CreateDynamicObject(1486,-789.0499900,2429.5300000,156.3500100,0.0000000,0.0000000,0.0000000); //object(dyn_beer_1) (1)
	CreateDynamicObject(1486,-789.1699800,2429.4299000,156.3500100,0.0000000,0.0000000,0.0000000); //object(dyn_beer_1) (2)
	CreateDynamicObject(3264,-786.9000200,2429.8301000,155.7700000,0.0000000,0.0000000,20.0690000); //object(privatesign3) (1)
	CreateDynamicObject(3265,-791.3100000,2424.7700000,156.1400000,0.0000000,0.0000000,54.7350000); //object(privatesign4) (1)
}

stock mapSASP() // by Macon
{
	new tmpobjid;
	tmpobjid = CreateDynamicObject(19377, 1329.773681, -882.441589, 6.785439, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10806, "airfence_sfse", "ws_oldpainted", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1333.744140, -890.212524, 10.416780, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1327.626220, -888.229980, 14.124699, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1308.769897, -893.190429, 11.822999, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14615, "abatoir_daylite", "ab_volumelight", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1319.289062, -882.485839, 6.785439, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10806, "airfence_sfse", "ws_oldpainted", 0x00000000);
	tmpobjid = CreateDynamicObject(19393, 1330.196166, -885.045288, 8.623700, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14584, "ab_abbatoir01", "ab_concFloor", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 1334.941162, -886.705932, 8.623700, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "ws_carparkwall1", 0x00000000);
	tmpobjid = CreateDynamicObject(19393, 1315.685913, -873.726501, 12.249099, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14584, "ab_abbatoir01", "ab_concFloor", 0x00000000);
	tmpobjid = CreateDynamicObject(19393, 1322.081054, -873.728942, 8.623700, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14584, "ab_abbatoir01", "ab_concFloor", 0x00000000);
	tmpobjid = CreateDynamicObject(19393, 1325.288574, -873.727050, 8.623700, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14584, "ab_abbatoir01", "ab_concFloor", 0x00000000);
	tmpobjid = CreateDynamicObject(19393, 1328.499877, -873.727172, 8.623700, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14584, "ab_abbatoir01", "ab_concFloor", 0x00000000);
	tmpobjid = CreateDynamicObject(19393, 1330.188964, -875.417480, 8.623700, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14584, "ab_abbatoir01", "ab_concFloor", 0x00000000);
	tmpobjid = CreateDynamicObject(19393, 1330.190795, -878.627624, 8.623700, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14584, "ab_abbatoir01", "ab_concFloor", 0x00000000);
	tmpobjid = CreateDynamicObject(19393, 1330.192138, -881.836914, 8.623700, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14584, "ab_abbatoir01", "ab_concFloor", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 1335.064086, -878.694396, 8.623700, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "ws_carparkwall1", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 1317.263061, -868.933776, 8.623700, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "ws_carparkwall1", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 1320.485473, -868.970642, 8.623700, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "ws_carparkwall1", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 1323.697875, -868.923767, 8.623700, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "ws_carparkwall1", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 1326.898437, -868.972412, 8.623700, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "ws_carparkwall1", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 1330.187500, -868.998229, 8.623700, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "ws_carparkwall1", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 1335.011108, -877.014709, 8.623700, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "ws_carparkwall1", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 1334.985107, -873.795715, 8.623700, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "ws_carparkwall1", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 1334.994262, -880.244323, 8.623700, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "ws_carparkwall1", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 1335.009887, -883.444335, 8.623700, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "ws_carparkwall1", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 1314.145751, -868.827026, 8.623700, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "ws_carparkwall1", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 1328.572509, -867.994689, 8.623700, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "ws_carparkwall1", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 1335.078979, -888.301574, 8.623700, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "ws_carparkwall1", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1319.298828, -872.858947, 6.785439, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10806, "airfence_sfse", "ws_oldpainted", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1314.042846, -897.144104, 2.215640, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14584, "ab_abbatoir01", "ab_concFloor", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1314.105712, -869.910583, 11.331250, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14584, "ab_abbatoir01", "ab_concFloor", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 1318.950439, -867.998107, 8.623700, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "ws_carparkwall1", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1335.335937, -888.239501, 14.079799, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1329.826049, -870.951782, 10.416780, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	tmpobjid = CreateDynamicObject(19393, 1318.871337, -873.730712, 8.623700, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14584, "ab_abbatoir01", "ab_concFloor", 0x00000000);
	tmpobjid = CreateDynamicObject(19393, 1322.081054, -873.728881, 12.249099, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14584, "ab_abbatoir01", "ab_concFloor", 0x00000000);
	tmpobjid = CreateDynamicObject(19393, 1325.288574, -873.727111, 12.249099, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14584, "ab_abbatoir01", "ab_concFloor", 0x00000000);
	tmpobjid = CreateDynamicObject(19393, 1328.499877, -873.727172, 12.249099, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14584, "ab_abbatoir01", "ab_concFloor", 0x00000000);
	tmpobjid = CreateDynamicObject(19393, 1330.188964, -875.417480, 12.249099, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14584, "ab_abbatoir01", "ab_concFloor", 0x00000000);
	tmpobjid = CreateDynamicObject(19393, 1330.190795, -878.627624, 12.249099, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14584, "ab_abbatoir01", "ab_concFloor", 0x00000000);
	tmpobjid = CreateDynamicObject(19393, 1330.192138, -881.836914, 12.249099, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14584, "ab_abbatoir01", "ab_concFloor", 0x00000000);
	tmpobjid = CreateDynamicObject(19393, 1330.196166, -885.045288, 12.249099, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14584, "ab_abbatoir01", "ab_concFloor", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1333.744384, -880.590148, 10.416780, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	tmpobjid = CreateDynamicObject(19393, 1318.871337, -873.730712, 12.249099, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14584, "ab_abbatoir01", "ab_concFloor", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 1318.950439, -867.998107, 12.249099, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "ws_carparkwall1", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 1320.485473, -868.970581, 12.249099, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "ws_carparkwall1", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 1323.697875, -868.923828, 12.249099, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "ws_carparkwall1", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 1326.898437, -868.972412, 12.249099, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "ws_carparkwall1", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 1328.572509, -867.994689, 12.249099, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "ws_carparkwall1", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 1330.187500, -868.998229, 12.249099, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "ws_carparkwall1", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 1334.985107, -873.795715, 12.249099, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "ws_carparkwall1", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 1335.011108, -877.014709, 12.249099, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "ws_carparkwall1", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 1334.994262, -880.244323, 12.249099, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "ws_carparkwall1", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 1335.064086, -878.694396, 12.249099, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "ws_carparkwall1", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 1335.078979, -888.301574, 12.249099, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "ws_carparkwall1", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 1334.941162, -886.705871, 12.249099, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "ws_carparkwall1", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 1335.009887, -883.444274, 12.249099, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "ws_carparkwall1", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 1317.263061, -868.933776, 12.249099, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 4835, "airoads_las", "ws_carparkwall1", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1319.334228, -870.951049, 10.416780, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1319.411010, -869.006958, 14.079799, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1329.909057, -869.007019, 14.079799, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1335.334594, -878.616577, 14.079799, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1314.104248, -879.540893, 11.331250, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14584, "ab_abbatoir01", "ab_concFloor", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1325.340087, -886.728698, 11.331299, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14584, "ab_abbatoir01", "ab_concFloor", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1320.611206, -891.458435, 11.331299, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14584, "ab_abbatoir01", "ab_concFloor", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1319.289428, -892.110412, 6.785439, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10806, "airfence_sfse", "ws_oldpainted", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1318.781372, -896.330810, 11.331299, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14584, "ab_abbatoir01", "ab_concFloor", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1314.103637, -885.028320, 11.331299, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14584, "ab_abbatoir01", "ab_concFloor", 0x00000000);
	tmpobjid = CreateDynamicObject(19376, 1318.841674, -894.211669, 11.823670, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14615, "abatoir_daylite", "ab_volumelight", 0x00000000);
	tmpobjid = CreateDynamicObject(1649, 1314.030883, -890.130310, 12.364700, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(1649, 1314.035400, -894.567871, 9.037648, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(1649, 1314.035400, -894.567871, 9.047698, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(1649, 1314.035400, -894.567871, 12.364700, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(1649, 1314.035400, -894.567871, 12.364700, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(1649, 1314.030883, -890.130249, 12.364700, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 18065, "ab_sfammumain", "shelf_glas", 0x00000000);
	tmpobjid = CreateDynamicObject(19456, 1312.452514, -873.730102, 8.623700, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 14584, "ab_abbatoir01", "ab_concFloor", 0x00000000);
	tmpobjid = CreateDynamicObject(19376, 1309.167114, -896.331359, 11.823699, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	tmpobjid = CreateDynamicObject(19376, 1309.192626, -889.520996, 11.823699, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	tmpobjid = CreateDynamicObject(19376, 1307.605102, -893.158020, 11.823699, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 2755, "ab_dojowall", "mp_apt1_roomfloor", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1309.081054, -893.508605, 6.785439, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10806, "airfence_sfse", "ws_oldpainted", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1329.809082, -872.837341, 6.785439, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10806, "airfence_sfse", "ws_oldpainted", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1324.881713, -878.594604, 14.124699, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1314.382202, -878.593444, 14.124699, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	tmpobjid = CreateDynamicObject(19377, 1317.151977, -888.196594, 14.124699, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	tmpobjid = CreateDynamicObject(19376, 1318.942016, -889.495544, 17.127500, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	tmpobjid = CreateDynamicObject(14411, 1314.357543, -877.758605, 7.270679, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19456, 1313.757568, -868.473205, 12.249099, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(983, 1325.375854, -875.640747, 11.180800, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(984, 1328.582519, -882.029296, 11.134400, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(983, 1319.597167, -875.642700, 11.180800, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19303, 1330.178344, -884.911804, 11.747799, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19303, 1315.772949, -873.751220, 11.747799, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19303, 1316.285766, -888.684143, 8.121199, 0.000000, 0.000000, 243.534225, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19303, 1322.161132, -873.722167, 11.747799, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19303, 1325.382568, -873.713195, 11.747799, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19303, 1328.571899, -873.720031, 11.747799, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19303, 1330.174682, -875.298828, 11.747799, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19303, 1330.162963, -878.502807, 11.747799, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19303, 1330.169799, -881.701049, 11.747799, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19303, 1318.953735, -873.723876, 11.747799, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19303, 1322.161132, -873.722229, 8.121199, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19303, 1325.382568, -873.713195, 8.121199, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19303, 1328.571899, -873.719970, 8.121199, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19303, 1330.174682, -875.298828, 8.121199, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19303, 1330.162963, -878.502807, 8.121199, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19303, 1330.169799, -881.700988, 8.121199, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19303, 1330.178344, -884.911804, 8.121199, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19303, 1318.953735, -873.723876, 8.121199, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19304, 1319.442993, -889.445922, 11.222999, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19303, 1320.147827, -889.448181, 8.121199, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19303, 1315.051025, -889.452880, 8.121199, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19303, 1318.397949, -889.448303, 8.121199, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19304, 1315.941528, -889.445617, 11.229200, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19304, 1319.442993, -889.445861, 9.984700, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19304, 1315.941528, -889.445556, 9.984700, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1535, 1315.726440, -896.291931, 6.789370, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1535, 1318.746459, -896.254272, 6.789400, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2161, 1307.703125, -894.435058, 6.870399, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2161, 1307.705200, -895.755004, 6.870399, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2164, 1307.712890, -893.101806, 6.871799, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(631, 1308.285766, -890.142639, 7.783599, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2606, 1311.285888, -896.266357, 7.901770, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2609, 1308.912841, -896.161926, 7.576720, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2609, 1309.364257, -896.162658, 7.576720, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2180, 1310.784057, -895.974975, 6.872340, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1714, 1310.932006, -895.190429, 6.872479, 0.000000, 0.000000, 9.900839, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2609, 1307.772094, -891.347045, 7.576700, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2256, 1307.725341, -892.865295, 9.765500, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(19174, 1310.843505, -896.218566, 9.910810, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1999, 1309.739379, -890.140930, 6.871490, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1714, 1310.438720, -891.264526, 6.872499, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2007, 1312.361450, -890.014160, 6.871719, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1771, 1326.067626, -869.613159, 7.476500, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2525, 1326.291625, -871.764404, 6.873600, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2670, 1325.264404, -871.669372, 6.956799, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2670, 1324.387329, -869.316101, 6.956799, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1771, 1319.600463, -869.402587, 7.476500, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2670, 1318.006347, -869.169860, 6.956799, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2670, 1318.595825, -871.569274, 6.956799, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1771, 1321.257812, -869.438964, 7.476500, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2675, 1322.111694, -871.097717, 6.935900, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2670, 1322.253051, -872.414550, 6.956799, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2525, 1323.134277, -871.459350, 6.873600, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1771, 1333.665039, -882.625366, 7.476500, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2525, 1331.959350, -880.821777, 6.872900, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2674, 1333.996093, -881.290710, 6.882699, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2670, 1332.208862, -881.810729, 6.956799, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1771, 1333.646240, -876.218811, 7.476500, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2674, 1333.443969, -875.002929, 6.882699, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2670, 1331.893554, -875.491333, 6.956799, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2525, 1331.838012, -874.327209, 6.872900, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1771, 1333.332031, -879.516357, 7.476500, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2525, 1331.634643, -877.596191, 6.872900, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2676, 1332.626586, -878.863403, 6.977600, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2670, 1333.583984, -877.899841, 6.963699, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1771, 1333.607177, -885.932495, 7.476500, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2676, 1332.929321, -885.398559, 6.977600, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2670, 1333.168579, -884.705627, 6.963699, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2525, 1331.916992, -884.027221, 6.872900, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1771, 1329.417114, -869.374328, 7.476500, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2525, 1329.631347, -871.674438, 6.873600, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2674, 1327.917114, -869.098144, 6.882699, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2676, 1328.526367, -871.941101, 6.977600, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2525, 1319.911132, -871.928771, 6.873600, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1771, 1314.912353, -869.825866, 11.034979, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2525, 1316.749633, -871.906921, 10.501999, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2670, 1316.335327, -869.926879, 10.586000, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2670, 1318.006347, -869.169921, 10.586000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2675, 1322.111694, -871.097717, 10.586000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2670, 1322.253051, -872.414611, 10.586000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1771, 1321.257812, -869.439025, 11.034999, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2525, 1320.036010, -871.406982, 10.494999, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1771, 1326.067626, -869.613220, 11.034999, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2670, 1324.387329, -869.316101, 10.586000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2670, 1325.264404, -871.669372, 10.586000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2525, 1326.291625, -871.764404, 10.494999, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2676, 1328.526367, -871.941101, 10.586000, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2674, 1327.917114, -869.098083, 10.586000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1771, 1329.417114, -869.374328, 11.034999, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2525, 1329.631347, -871.674377, 10.494999, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1771, 1333.646240, -876.218811, 11.034999, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2674, 1333.443969, -875.002929, 10.586000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2670, 1331.893554, -875.491271, 10.586000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2525, 1331.838012, -874.327209, 10.494999, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2676, 1332.626586, -878.863403, 10.609999, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2670, 1333.583984, -877.899780, 10.586000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1771, 1333.332031, -879.516418, 11.034999, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2525, 1331.634643, -877.596191, 10.494999, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2525, 1331.959350, -880.821777, 10.494999, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2670, 1332.208862, -881.810729, 10.597999, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1771, 1333.665039, -882.625427, 11.034999, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2674, 1333.996093, -881.290710, 10.586000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2525, 1331.916992, -884.027221, 10.494999, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2676, 1332.929321, -885.398620, 10.609999, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1771, 1333.521362, -885.931579, 11.034999, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2670, 1333.168579, -884.705627, 10.586000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2525, 1323.134277, -871.459411, 10.494999, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1771, 1318.086669, -869.822265, 11.034979, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2670, 1318.595825, -871.569274, 10.586000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2525, 1319.911132, -871.928771, 10.501999, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2670, 1315.576904, -871.949951, 10.586000, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(18662, 1326.999267, -871.260314, 12.478799, 3.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(18662, 1317.362182, -870.983215, 8.892900, 3.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(18662, 1320.586669, -870.630493, 12.478799, 3.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(18659, 1333.807373, -880.337097, 12.306099, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(18659, 1333.243041, -873.897094, 12.306099, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(18665, 1333.493286, -883.552307, 11.765500, 5.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(18665, 1333.306396, -886.611938, 11.765500, 5.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(18662, 1326.804321, -870.541015, 12.261460, 3.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(18661, 1320.393798, -870.100402, 11.740090, 5.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(18661, 1314.199951, -871.290405, 12.244099, 5.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(18661, 1317.161132, -869.121887, 11.740090, 5.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(18662, 1323.596679, -870.527465, 11.757450, 3.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1594, 1328.346923, -885.043640, 7.336699, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1594, 1326.464843, -880.762023, 7.336699, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1594, 1324.475708, -885.016296, 7.336699, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1594, 1322.349853, -880.981079, 7.336699, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1594, 1320.613891, -885.132873, 7.336699, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1529, 1326.507202, -886.617126, 7.876299, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1531, 1322.155639, -886.629577, 8.115409, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2845, 1317.775146, -871.872558, 10.516400, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2845, 1334.320190, -883.144592, 7.677100, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2845, 1320.718872, -869.994323, 11.234900, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2845, 1329.052734, -869.705383, 7.677130, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2845, 1333.026977, -876.649719, 7.677100, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2845, 1332.605102, -883.211608, 6.871089, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2846, 1333.150390, -886.426086, 7.672100, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2846, 1332.836303, -880.049316, 7.672100, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2846, 1325.609741, -869.993469, 7.672100, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2845, 1320.718139, -870.159179, 7.677130, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2846, 1325.609741, -869.993530, 11.234900, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2845, 1329.052734, -869.705383, 11.234900, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2845, 1333.026977, -876.649719, 11.234900, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2846, 1332.836303, -880.049316, 11.234900, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2845, 1334.320190, -883.144592, 11.234900, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2846, 1333.150390, -886.426086, 11.234900, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2845, 1317.467773, -870.818908, 6.873139, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2845, 1324.304809, -871.890808, 10.516400, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(18662, 1317.362182, -870.983215, 12.478799, 3.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(18661, 1320.393798, -870.100402, 8.591899, 5.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(18662, 1323.596679, -870.527526, 9.095910, 3.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(18662, 1320.586669, -870.630493, 8.692899, 3.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(18662, 1326.804321, -870.541015, 8.993900, 3.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(18662, 1326.999267, -871.260314, 8.489890, 3.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(18659, 1333.243041, -873.897094, 8.792900, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(18659, 1333.807373, -880.337097, 8.792900, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(18665, 1333.493286, -883.552307, 7.979790, 5.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(18665, 1333.306396, -886.611877, 8.792900, 5.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1271, 1314.868774, -874.794372, 7.168920, 0.000000, 0.000000, 12.388819, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1271, 1310.927001, -877.285034, 7.168920, 0.000000, 0.000000, 12.388819, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1271, 1314.710327, -875.881347, 7.168920, 0.000000, 0.000000, 12.388819, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1431, 1314.982055, -877.688598, 7.371389, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1431, 1316.542114, -874.309936, 7.371399, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2858, 1322.213500, -881.022277, 7.737199, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2858, 1328.231201, -885.085449, 7.737199, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2821, 1320.576904, -885.006042, 7.727540, 0.000000, 0.000000, 11.302189, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2867, 1324.399291, -885.087829, 7.728660, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2221, 1326.530273, -880.805603, 7.812099, 0.000000, 0.000000, 4.888639, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2671, 1321.005249, -884.350524, 6.884099, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2671, 1323.857788, -880.806274, 6.884099, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(2671, 1326.593017, -885.197448, 6.884099, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1893, 1316.610839, -879.940856, 14.071396, 0.000000, 0.000000, -89.999977, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1893, 1319.621337, -879.940856, 14.071396, 0.000000, 0.000000, -89.999977, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1893, 1322.511474, -879.940856, 14.071396, 0.000000, 0.000000, -89.999977, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1893, 1325.761108, -879.940856, 14.071396, 0.000000, 0.000000, -89.999977, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1893, 1316.796264, -892.079101, 11.788544, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1893, 1310.406127, -890.459350, 11.788544, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
	tmpobjid = CreateDynamicObject(1893, 1310.406127, -895.329467, 11.788544, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
}

stock mapFBI() // Macon
{
	//Objects////////////////////////////////////////////////////////////////////////////////////////////////////////
	new tmpobjid, object_world = -1, object_int = -1;
	tmpobjid = CreateDynamicObject(19650, 659.723876, 2534.577880, -90.656410, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 2423, "cj_ff_counters", "CJ_Laminate1", 0x00000000);
	tmpobjid = CreateDynamicObject(19650, 659.723876, 2559.475585, -90.656410, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 2423, "cj_ff_counters", "CJ_Laminate1", 0x00000000);
	tmpobjid = CreateDynamicObject(19650, 683.223876, 2549.295654, -90.656410, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 2423, "cj_ff_counters", "CJ_Laminate1", 0x00000000);
	tmpobjid = CreateDynamicObject(2667, 666.884338, 2546.402587, -87.074913, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	SetDynamicObjectMaterialText(tmpobjid, 0, "Staff ", 140, "Arial", 100, 0, 0xFF136592, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(2667, 666.884338, 2546.402587, -87.274909, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	SetDynamicObjectMaterialText(tmpobjid, 0, "Room", 140, "Arial", 100, 0, 0xFF136592, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(2790, 670.826293, 2539.941650, -87.416343, 0.000000, 0.000000, -89.799957, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_church_grass_alt", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	SetDynamicObjectMaterialText(tmpobjid, 1, "Federal Bureau", 140, "Arial Narrow", 70, 1, 0xFF072871, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(2790, 670.796325, 2539.941650, -87.966339, 0.000000, 0.000000, -89.499969, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_church_grass_alt", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	SetDynamicObjectMaterialText(tmpobjid, 1, "Of", 140, "Arial Narrow", 70, 1, 0xFF072871, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(2790, 670.826354, 2539.941650, -88.536338, 0.000000, 0.000000, -89.499969, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_church_grass_alt", 0x00000000);
	SetDynamicObjectMaterial(tmpobjid, 1, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	SetDynamicObjectMaterialText(tmpobjid, 1, "Investigation", 140, "Arial Narrow", 70, 1, 0xFF072871, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(2667, 670.656982, 2543.815917, -87.164916, 0.000000, 0.000000, -92.599975, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	SetDynamicObjectMaterialText(tmpobjid, 0, "Weaponary", 140, "Arial", 100, 0, 0xFF136592, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(2667, 670.656982, 2543.815917, -87.374900, 0.000000, 0.000000, -92.599975, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	SetDynamicObjectMaterialText(tmpobjid, 0, "Room", 140, "Arial", 100, 0, 0xFF136592, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(2667, 664.824096, 2533.669921, -88.614906, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	SetDynamicObjectMaterialText(tmpobjid, 0, "Supervisory", 140, "Arial", 100, 0, 0xFF136592, 0x00000000, 1);
	tmpobjid = CreateDynamicObject(2667, 664.824096, 2533.669921, -88.814918, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_Abpave_Gen", 0x00000000);
	SetDynamicObjectMaterialText(tmpobjid, 0, "Room", 140, "Arial", 100, 0, 0xFF136592, 0x00000000, 1);
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	tmpobjid = CreateDynamicObject(19376, 666.860229, 2532.298583, -90.541076, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 666.860229, 2532.298583, -90.541076, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 666.860229, 2541.928710, -90.531074, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 666.860229, 2532.309082, -90.531074, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 656.390197, 2532.309082, -90.531074, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 656.390197, 2541.908691, -90.531074, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 656.390197, 2522.704589, -90.531074, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 666.883483, 2522.704589, -90.531074, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 656.390197, 2551.566650, -90.501075, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 656.390197, 2551.566650, -90.501075, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 665.511657, 2550.575927, -90.501075, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 665.511657, 2560.094970, -90.501068, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 677.340148, 2541.648437, -90.531074, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 679.320495, 2541.648437, -90.531074, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 656.362854, 2541.928710, -90.541076, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 656.361816, 2532.298339, -85.407066, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 651.230712, 2541.876708, -90.456871, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 651.220092, 2532.267333, -90.456871, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 658.477539, 2546.527832, -82.710548, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19929, 652.743774, 2544.451660, -91.071418, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 647.348205, 2546.528076, -90.456901, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 658.477111, 2546.533691, -94.812896, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 661.388183, 2546.531005, -90.456901, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1897, 656.628112, 2546.504394, -89.070800, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 658.951599, 2551.344238, -90.456871, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 654.151245, 2552.647949, -90.456901, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19929, 655.602600, 2544.454101, -90.155288, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19925, 657.466430, 2544.455810, -90.155296, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19929, 652.744018, 2544.447509, -84.891899, 180.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19929, 655.602661, 2544.452148, -91.071403, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19925, 657.467163, 2544.454101, -91.071403, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 649.710876, 2533.551269, -90.456901, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1566, 651.317504, 2539.136962, -89.555946, 0.000000, 0.000000, 89.900039, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 668.949218, 2533.541259, -90.456901, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1566, 651.305847, 2539.157226, -89.555946, 0.000000, 0.000000, -89.299926, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19325, 659.308166, 2533.538818, -87.601699, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1897, 653.609313, 2546.541992, -89.070800, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 656.002624, 2533.565917, -80.465728, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 656.361816, 2532.298339, -90.541076, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 656.362915, 2541.928710, -85.407096, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19362, 657.590332, 2533.533447, -91.316001, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19362, 660.801879, 2533.532470, -91.316001, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19362, 661.023681, 2533.534179, -91.314002, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 659.281188, 2528.713867, -90.456871, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 649.717956, 2533.557128, -94.813476, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 676.113281, 2531.929687, -86.616096, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 676.132080, 2541.568603, -86.338691, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 656.361145, 2522.667968, -90.541076, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 666.858032, 2522.667724, -90.541076, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1495, 670.807006, 2535.183349, -90.486740, 0.000000, 0.000000, 89.799995, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1897, 655.933898, 2533.551025, -86.234382, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1897, 655.934082, 2533.549072, -88.455673, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1897, 662.680236, 2533.525146, -86.488906, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1897, 662.679565, 2533.525146, -88.455703, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19087, 658.498718, 2533.541992, -89.441047, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19087, 660.952392, 2533.542724, -89.441047, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19087, 662.572509, 2533.542724, -89.441047, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19087, 660.952392, 2533.542724, -89.291000, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19087, 658.498718, 2533.541992, -89.291000, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19087, 658.498718, 2533.541992, -89.191001, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19087, 660.952392, 2533.542724, -89.191001, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19087, 662.572509, 2533.542724, -89.191001, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 668.575073, 2528.701416, -90.456871, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 650.459533, 2527.719238, -90.456901, 0.000000, 0.000000, 70.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 654.746459, 2526.090576, -90.456901, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 664.073059, 2526.227539, -90.456901, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 666.857971, 2522.667724, -85.407096, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 656.361083, 2522.667968, -85.407096, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1495, 662.635986, 2533.523193, -90.468475, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19929, 652.743774, 2544.453613, -90.155288, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19929, 655.602600, 2544.454101, -85.673103, 180.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19925, 657.466369, 2544.455810, -85.673103, 180.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 675.714172, 2546.440185, -85.794837, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 666.860595, 2551.562500, -90.541076, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 666.861999, 2561.194824, -90.541076, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 656.911315, 2556.094482, -90.456901, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 661.639465, 2560.823486, -90.456871, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 666.465576, 2565.479492, -90.456901, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 670.728881, 2551.257568, -90.456871, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 670.728210, 2560.885498, -90.456871, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19929, 652.743774, 2544.453613, -85.673072, 180.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19929, 655.602661, 2544.447998, -84.891899, 180.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19925, 657.469238, 2544.450439, -84.891899, 180.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1495, 654.495056, 2533.523193, -90.468475, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 670.880310, 2530.415283, -90.456871, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1495, 652.134948, 2546.504394, -90.468475, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(14411, 673.935485, 2534.822998, -93.649299, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 675.768310, 2533.547607, -90.456901, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19362, 670.880981, 2538.312011, -88.744056, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19362, 670.880004, 2541.513183, -85.249496, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1495, 666.185668, 2546.504394, -90.468475, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 670.846740, 2549.427978, -90.456871, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1495, 670.834533, 2543.114013, -90.486740, 0.000000, 0.000000, 89.799995, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 666.859252, 2541.930664, -90.541076, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 675.608093, 2536.970947, -96.319816, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 676.103271, 2541.685791, -90.537101, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 684.494995, 2547.747558, -95.690399, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 684.495483, 2557.380371, -95.690399, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 685.388366, 2533.541503, -90.456901, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 672.511779, 2546.523925, -90.456901, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 685.347961, 2546.441894, -85.794837, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 685.668457, 2532.077392, -91.155410, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 675.608032, 2536.794189, -85.794837, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 685.229980, 2536.792480, -85.794837, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 690.002929, 2550.644042, -91.942550, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 680.443847, 2547.885986, -96.416549, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 684.445983, 2541.704589, -85.794799, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 684.825622, 2531.422851, -96.263969, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 680.442321, 2557.513671, -96.416549, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19362, 684.784301, 2539.583496, -90.357498, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19302, 684.781188, 2542.054931, -94.392997, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19362, 684.735107, 2544.529541, -93.857696, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19302, 685.377807, 2546.757568, -94.392997, 0.000000, 0.000000, 46.790290, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19362, 684.734436, 2549.496337, -93.857696, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19302, 684.797668, 2551.979003, -94.392997, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19362, 684.742370, 2554.453369, -93.857696, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19362, 684.784301, 2539.583496, -93.857696, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19362, 684.735107, 2544.529541, -90.357498, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19362, 684.734375, 2549.496337, -90.357498, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19362, 684.742370, 2554.453369, -90.357498, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 673.993530, 2541.327636, -95.690406, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 675.315612, 2541.626953, -95.814559, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 679.330322, 2541.706542, -90.539100, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 679.530090, 2541.696777, -91.155410, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19302, 685.356628, 2537.337646, -94.392997, 0.000000, 0.000000, 309.138275, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19304, 684.789428, 2542.605224, -92.515602, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19304, 684.782714, 2547.407226, -92.515602, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19304, 684.788757, 2552.620361, -92.515602, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19304, 684.805725, 2537.878906, -92.515602, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 684.495727, 2538.114013, -95.690406, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 690.002441, 2541.014404, -91.942550, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 684.849670, 2550.862304, -86.605201, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 684.841735, 2538.115478, -86.605201, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 679.534606, 2551.308837, -91.155410, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 690.005432, 2531.389404, -91.942550, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 689.477844, 2554.572509, -90.456901, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 689.528503, 2539.685302, -90.456901, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 689.476806, 2544.529785, -90.456901, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 689.616210, 2550.554199, -90.456901, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 689.801025, 2549.689453, -96.416549, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 689.805419, 2540.059570, -96.416549, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 689.804809, 2530.428710, -96.416549, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 679.921447, 2554.856445, -96.416496, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 675.714660, 2543.157470, -96.416496, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19362, 670.871459, 2541.513916, -91.310501, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19362, 670.881042, 2538.312255, -85.249496, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 665.634826, 2533.567382, -80.465728, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 675.257812, 2533.568115, -80.465728, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 651.235473, 2538.453125, -80.465698, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 651.232177, 2548.043945, -80.465698, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 670.852844, 2538.333984, -80.465698, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 670.835632, 2547.038818, -80.465698, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 662.601013, 2546.518310, -80.465698, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 672.201293, 2546.514648, -80.465698, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 651.233764, 2538.418212, -94.813499, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 651.231689, 2548.041259, -94.813499, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 668.942810, 2533.542480, -94.813476, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 658.473754, 2546.522949, -94.813476, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 647.351867, 2546.525878, -94.813476, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 661.390075, 2546.525390, -94.813476, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 672.509704, 2546.518066, -94.813476, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 670.836242, 2549.426513, -94.813499, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 670.872680, 2530.415039, -94.813499, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19362, 670.878051, 2541.513183, -88.739906, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19362, 670.871887, 2538.315917, -91.310501, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 664.060302, 2526.230957, -94.813476, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 668.570556, 2528.706298, -94.813499, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 659.283996, 2528.625244, -94.813499, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 654.442260, 2526.093505, -94.813499, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 652.666320, 2526.920410, -94.813499, 0.000000, 0.000000, 70.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 659.280456, 2528.628417, -94.813499, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 651.223144, 2528.767089, -94.813499, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19362, 657.592590, 2533.536621, -91.314002, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 649.716247, 2533.544189, -94.813499, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19362, 661.024047, 2533.536132, -91.316001, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19362, 660.801879, 2533.536376, -91.316001, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 654.428710, 2526.091796, -80.465728, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 664.093017, 2526.257568, -80.465728, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 668.550048, 2528.710693, -80.465698, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 663.798278, 2533.512207, -80.465728, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 654.309326, 2533.513427, -80.465728, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 659.285949, 2528.708007, -80.465698, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 659.268249, 2528.642578, -80.465698, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 651.244567, 2528.645751, -80.465698, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 653.834777, 2526.510253, -80.465698, 0.000000, 0.000000, 70.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 675.610778, 2536.791015, -90.456901, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 670.876281, 2530.414794, -90.456871, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19362, 652.904663, 2546.534667, -86.366645, 90.299964, -0.199993, 90.300064, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 676.166259, 2531.935058, -88.161201, 0.000000, -55.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 666.860229, 2532.298583, -85.407096, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 661.391357, 2546.535644, -94.813476, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 672.508911, 2546.528808, -94.813476, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 656.911621, 2556.089111, -94.813476, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 661.643249, 2560.819580, -94.813499, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 670.724975, 2560.646240, -94.813499, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 670.723022, 2551.382324, -94.813499, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 666.860595, 2551.562500, -85.407096, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 656.363098, 2551.558349, -85.407096, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 666.861999, 2561.194824, -85.407096, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 665.916198, 2546.536132, -80.465698, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 656.297424, 2546.526123, -80.465698, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 656.913696, 2556.092041, -80.465698, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 666.519592, 2565.472656, -80.465698, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 658.959167, 2551.374755, -80.465698, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 670.720886, 2551.437744, -80.465698, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 670.721740, 2561.000732, -80.465698, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 658.952575, 2551.400634, -94.813499, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 661.646545, 2560.822265, -80.465698, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 661.388244, 2546.527099, -90.456901, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 672.511901, 2546.520019, -90.456901, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 651.546691, 2551.413574, -94.813499, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 647.351257, 2546.546386, -94.813476, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 658.950561, 2551.393554, -94.813499, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 654.118347, 2552.643310, -94.813476, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 646.710754, 2546.525634, -80.465698, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 656.282348, 2546.533935, -80.465698, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 654.084838, 2552.637207, -80.465698, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 658.943115, 2551.265869, -80.465698, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 651.549072, 2551.325683, -80.465698, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 666.859313, 2541.930664, -85.407096, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 686.623046, 2541.605468, -86.338691, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 675.683654, 2546.433349, -81.375740, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 685.262451, 2546.435058, -81.375740, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 675.701843, 2536.800292, -81.375740, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 685.330688, 2536.798828, -81.375740, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19362, 666.725036, 2546.558105, -86.438995, 90.299964, -0.199993, 90.300064, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 670.838684, 2549.427490, -90.456871, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19362, 670.874023, 2541.513183, -88.739906, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19362, 670.877014, 2538.312255, -88.744056, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19362, 670.875976, 2541.513183, -85.249496, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19362, 670.877014, 2538.312255, -85.249496, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 689.583374, 2541.578613, -89.982803, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19362, 655.480957, 2549.728515, -90.539001, 0.000000, 90.000000, 45.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 661.787536, 2538.537353, -92.198699, 0.000000, 0.000000, 45.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 664.513427, 2538.865234, -92.196701, 0.000000, 0.000000, -45.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 664.057250, 2538.411621, -92.198699, 0.000000, 0.000000, -45.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 662.120605, 2541.262207, -92.196701, 0.000000, 0.000000, -45.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 661.664428, 2540.808593, -92.198699, 0.000000, 0.000000, -45.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2310, 660.230895, 2546.066650, -89.957298, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2310, 660.810791, 2546.065917, -89.957298, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2310, 661.374816, 2546.062500, -89.957298, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2310, 661.934875, 2546.057861, -89.957298, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2310, 662.502807, 2546.062500, -89.957298, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(638, 670.229187, 2539.886962, -89.902099, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(631, 670.358398, 2542.050781, -89.537902, 0.000000, 0.000000, 45.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(631, 670.374023, 2537.808105, -89.537902, 0.000000, 0.000000, 45.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19362, 664.306640, 2533.568603, -86.425949, 90.299964, -0.199993, 90.300064, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(13187, 684.382751, 2541.569091, -88.667541, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19087, 662.572509, 2533.542724, -89.291000, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19362, 656.306091, 2533.556884, -86.384010, 90.299964, -0.199993, 90.300064, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19362, 659.785827, 2533.562988, -86.402214, 90.299964, -0.199993, 90.300064, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19362, 663.196166, 2533.568115, -86.420089, 90.299964, -0.199993, 90.300064, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19362, 670.848022, 2535.130615, -86.400291, 90.299964, -0.199993, 0.200066, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19362, 670.848022, 2544.843505, -86.349411, 90.299964, -0.199993, 0.200066, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 684.429809, 2541.581054, -81.375701, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 689.582275, 2541.461425, -87.368911, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 689.152282, 2545.037597, -85.337356, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 689.154235, 2538.233398, -85.337356, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1713, 656.638671, 2547.105712, -90.453903, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 657.247131, 2540.935791, -92.196701, 0.000000, 0.000000, -45.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19362, 658.343139, 2539.631591, -90.539001, 0.000000, 90.000000, 45.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 657.041320, 2540.729003, -92.198699, 0.000000, 0.000000, -45.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 657.167846, 2538.458496, -92.198699, 0.000000, 0.000000, 45.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 659.437255, 2538.328857, -92.198699, 0.000000, 0.000000, -45.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 659.893432, 2538.782470, -92.196701, 0.000000, 0.000000, -45.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 659.517028, 2540.808349, -92.198699, 0.000000, 0.000000, 45.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2616, 662.606811, 2526.368164, -88.598808, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2611, 659.149108, 2527.713134, -88.597290, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1761, 658.555969, 2532.668457, -90.454299, 0.000000, 0.000000, 272.160095, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(631, 658.795837, 2529.498779, -89.573997, 0.000000, 0.000000, 45.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2267, 659.160827, 2531.740478, -88.086997, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2686, 659.168884, 2526.573730, -88.822601, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2611, 652.212524, 2527.247558, -88.093292, 0.000000, 0.000000, 160.445785, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2612, 653.804321, 2526.664306, -88.677886, 0.000000, 0.000000, 160.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2261, 653.350402, 2532.970214, -88.677619, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2261, 652.088928, 2532.942871, -87.968566, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1761, 666.810852, 2526.844238, -90.454299, 0.000000, 0.000000, 180.759262, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(631, 667.855102, 2526.915039, -89.571998, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2611, 660.656616, 2526.357666, -88.093299, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2261, 663.049316, 2526.806884, -87.505599, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2611, 659.418090, 2530.297119, -88.595291, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19814, 660.967773, 2526.320800, -89.728500, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19814, 657.538635, 2526.169921, -89.728500, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19814, 664.257202, 2526.322509, -89.728500, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2267, 665.477478, 2526.333984, -87.844367, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2281, 667.130798, 2526.798828, -88.745903, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2056, 659.401977, 2528.684326, -89.225601, 0.000000, 4.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2056, 659.395324, 2529.124755, -89.225601, 0.000000, -2.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2619, 668.467102, 2528.344726, -87.911743, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2056, 668.435913, 2527.928955, -88.603233, 0.000000, 4.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1761, 668.919738, 2534.193847, -90.454299, 0.000000, 0.000000, 180.759262, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2310, 663.083374, 2546.061767, -89.957298, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2267, 686.770568, 2544.644531, -93.716667, 0.000000, 90.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 688.723876, 2531.449951, -90.456901, 0.000000, 0.000000, 54.167839, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2277, 689.223388, 2546.664550, -93.766899, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2273, 688.748413, 2545.103759, -94.038917, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2277, 689.210510, 2545.223632, -93.262893, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2056, 688.801452, 2547.966064, -94.488601, 0.000000, 10.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2056, 688.807495, 2537.105712, -94.488601, 0.000000, 10.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2268, 689.225952, 2535.070312, -94.042427, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2277, 689.229431, 2535.804199, -93.766899, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2277, 689.216552, 2534.363281, -93.262893, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2267, 686.773315, 2533.682617, -93.526672, 0.000000, 90.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19787, 677.938354, 2543.013916, -93.641403, 10.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19787, 676.399353, 2542.881591, -93.641403, 10.000000, 0.000000, 10.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19787, 679.469055, 2542.878417, -93.641403, 10.000000, 0.000000, -10.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18762, 680.156250, 2544.724365, -93.546958, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18762, 680.167968, 2552.844970, -93.546958, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18762, 682.680358, 2555.182128, -93.546958, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18762, 680.146545, 2548.571777, -93.546958, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19972, 681.410705, 2536.864013, -90.664176, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2266, 668.487609, 2545.937500, -88.497398, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(13187, 675.842102, 2546.946044, -90.438697, 0.000000, 90.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(13187, 675.842102, 2546.946044, -89.759613, 0.000000, 90.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(13187, 675.842102, 2546.946044, -89.157623, 0.000000, 90.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(13187, 675.842102, 2546.946044, -87.742576, 0.000000, 90.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(13187, 672.417114, 2546.944824, -91.083000, 90.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(13187, 679.204223, 2546.948242, -91.083000, 90.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(13187, 675.855041, 2546.344970, -89.095497, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2280, 678.634338, 2537.395263, -88.232696, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2280, 660.200988, 2545.947265, -88.232696, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2283, 674.944824, 2536.908203, -88.377098, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19972, 677.227050, 2536.864013, -91.291763, 0.000000, 2.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 665.977722, 2565.473144, -94.813476, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 665.615600, 2551.485839, -80.265701, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19439, 664.829101, 2549.704345, -83.765998, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19439, 664.862487, 2553.915771, -83.765998, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19439, 667.450683, 2553.909179, -84.708396, 90.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19439, 667.414184, 2549.704589, -84.708396, 90.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19381, 665.616577, 2557.688720, -80.263702, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19439, 667.294677, 2558.169921, -84.708396, 90.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19439, 667.327453, 2562.407470, -84.708396, 90.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19439, 664.744934, 2558.167724, -83.763999, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19439, 664.763793, 2562.417480, -83.763999, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2167, 661.751892, 2557.529785, -90.455703, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2167, 670.668334, 2558.857910, -90.455703, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2164, 670.632263, 2557.882324, -90.455398, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1761, 664.666870, 2547.214843, -90.454299, 0.000000, 0.000000, 180.759262, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1761, 662.266906, 2558.668701, -90.454299, 0.000000, 0.000000, 90.759300, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(631, 661.989318, 2555.824218, -89.567901, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(631, 670.061035, 2549.453857, -89.567901, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2266, 667.171508, 2561.577880, -89.530799, -4.000000, 0.000000, 87.883018, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1902, 666.671508, 2561.602539, -89.681999, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19814, 666.656677, 2561.608642, -89.646003, 90.000000, 0.000000, 87.529426, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2266, 666.218017, 2561.641601, -89.594802, 4.000000, 0.000000, 8187.025878, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2266, 667.106384, 2557.073730, -89.530799, -4.000000, 0.000000, 94.025802, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1902, 666.615844, 2557.046386, -89.681999, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19814, 666.620666, 2557.056396, -89.646003, 90.000000, 0.000000, 94.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2266, 666.152099, 2557.026367, -89.594802, 4.000000, 0.000000, 994.025817, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2266, 667.164184, 2552.768066, -89.530799, -4.000000, 0.000000, 94.025802, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1902, 666.673583, 2552.741699, -89.690002, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19814, 666.666564, 2552.750000, -89.646003, 90.000000, 0.000000, 94.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2266, 666.209899, 2552.720703, -89.594802, 4.000000, 0.000000, 994.025817, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2266, 667.157287, 2555.598876, -89.530799, -4.000000, 0.000000, 87.883018, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1902, 666.667724, 2555.638427, -89.690002, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19814, 666.666259, 2555.628173, -89.646003, 90.000000, 0.000000, 87.529426, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2266, 666.203796, 2555.662597, -89.594802, 4.000000, 0.000000, 8187.025878, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2266, 667.198791, 2559.776855, -89.530799, -4.000000, 0.000000, 87.883018, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1902, 666.709716, 2559.812500, -89.694000, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19814, 666.712951, 2559.808593, -89.646003, 90.000000, 0.000000, 87.529426, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2266, 666.245300, 2559.840576, -89.594802, 4.000000, 0.000000, 8187.025878, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2266, 667.237548, 2551.263427, -89.530799, -4.000000, 0.000000, 87.883018, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2266, 666.284057, 2551.327148, -89.594802, 4.000000, 0.000000, 8187.025878, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19814, 666.747680, 2551.288085, -89.646003, 90.000000, 0.000000, 87.529426, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1902, 666.746276, 2551.281005, -89.690002, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19808, 667.001098, 2551.253662, -89.626403, 0.000000, 0.000000, 84.962471, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19808, 666.990966, 2552.759033, -89.626403, 0.000000, 0.000000, 98.966316, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19808, 666.956604, 2555.614013, -89.626403, 0.000000, 0.000000, 84.962471, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19808, 666.982421, 2557.137207, -89.626403, 0.000000, 0.000000, 93.318206, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19808, 666.947631, 2559.822509, -89.626403, 0.000000, 0.000000, 84.962471, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19808, 666.973144, 2561.617675, -89.626403, 0.000000, 0.000000, 93.318206, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2266, 665.264648, 2561.522460, -89.534797, -4.000000, 0.000000, 8187.025878, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2266, 666.227905, 2561.454345, -89.602798, 4.000000, 0.000000, 87.410896, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19814, 665.755676, 2561.487548, -89.646003, 90.000000, 0.000000, 87.529426, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1902, 665.748046, 2561.489990, -89.690002, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19814, 665.799499, 2551.402099, -89.646003, 90.000000, 0.000000, 87.529426, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2266, 665.308471, 2551.437011, -89.534797, -4.000000, 0.000000, 8187.025878, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1902, 665.791870, 2551.404541, -89.702003, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2266, 666.271728, 2551.368896, -89.602798, 4.000000, 0.000000, 87.410896, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19814, 665.745544, 2553.012451, -89.646003, 90.000000, 0.000000, 87.529426, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2266, 665.254516, 2553.047363, -89.534797, -4.000000, 0.000000, 8187.025878, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1902, 665.733947, 2553.014404, -89.697998, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2266, 666.217773, 2552.979248, -89.602798, 4.000000, 0.000000, 87.410896, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19814, 665.765319, 2557.101806, -89.646003, 90.000000, 0.000000, 87.529426, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2266, 665.274291, 2557.136718, -89.534797, -4.000000, 0.000000, 8187.025878, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1902, 665.741577, 2557.105224, -89.697998, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2266, 666.237548, 2557.068603, -89.602798, 4.000000, 0.000000, 87.410896, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19814, 665.853210, 2560.180419, -89.646003, 90.000000, 0.000000, 87.529426, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2266, 665.362182, 2560.215332, -89.534797, -4.000000, 0.000000, 8187.025878, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1902, 665.837524, 2560.182861, -89.690002, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2266, 666.325439, 2560.147216, -89.602798, 4.000000, 0.000000, 87.410896, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19808, 665.579223, 2560.202880, -89.626403, 0.000000, 0.000000, 272.571655, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19808, 665.502136, 2561.485839, -89.626403, 0.000000, 0.000000, 265.113525, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19808, 665.492248, 2557.144042, -89.626403, 0.000000, 0.000000, 265.113525, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19808, 665.496154, 2552.999755, -89.626403, 0.000000, 0.000000, 272.571655, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19808, 665.537353, 2551.120849, -89.626403, 0.000000, 0.000000, 272.571655, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2611, 664.439880, 2565.336669, -87.933547, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2611, 659.103454, 2553.880615, -88.134498, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2612, 660.586669, 2546.681640, -88.018898, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2611, 659.102294, 2549.625244, -88.435493, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2056, 670.576904, 2561.328125, -88.741203, 0.000000, 10.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2611, 670.601928, 2554.885009, -87.933502, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2616, 670.566650, 2550.396484, -87.936698, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2267, 668.864074, 2565.359619, -87.855552, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2267, 660.327331, 2555.972656, -87.855552, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2260, 659.518432, 2551.532226, -87.842826, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2260, 662.207885, 2562.633789, -88.346839, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2261, 666.028686, 2564.893798, -88.049636, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2261, 670.135009, 2556.141357, -89.005287, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19174, 663.691589, 2546.640625, -87.892303, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2267, 654.393737, 2544.066406, -89.726898, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 668.949218, 2533.531250, -94.816909, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2266, 670.245849, 2545.397460, -88.497398, 0.000000, 0.000000, -89.999984, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19482, 661.116027, 2533.551513, -88.915130, 0.000000, 0.000000, 89.900016, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19482, 657.705505, 2533.555175, -88.915130, 0.000000, 0.000000, 89.900016, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 656.410705, 2551.562500, -90.531074, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2261, 654.571899, 2526.862304, -89.859008, 0.000000, -13.000000, 160.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19087, 670.772949, 2543.121582, -85.488624, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2280, 666.517395, 2534.135742, -87.972694, 0.000000, 0.000000, 179.500000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 689.578857, 2533.551513, -90.456901, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2266, 670.280883, 2534.569335, -88.497398, 0.000000, 0.000000, -89.500022, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 651.541320, 2551.404296, -90.456871, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19376, 656.363098, 2551.558349, -90.541076, 0.000000, 90.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(11711, 651.272216, 2538.927001, -87.455146, 0.000000, 0.000000, -89.400054, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 651.535888, 2551.366210, -90.456871, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18084, 655.144287, 2545.656250, -89.217903, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2191, 675.938415, 2540.464355, -95.603599, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 675.606994, 2536.792236, -90.456901, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19377, 675.768554, 2533.545654, -90.456901, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18075, 661.737854, 2540.131347, -85.500640, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1893, 654.584106, 2537.164306, -84.995002, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1893, 668.404968, 2537.245849, -84.995002, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 656.654846, 2550.905273, -92.198699, 0.000000, 0.000000, 45.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 654.305664, 2548.555419, -92.198699, 0.000000, 0.000000, 45.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 654.179138, 2550.825927, -92.198699, 0.000000, 0.000000, -45.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 654.384948, 2551.032714, -92.196701, 0.000000, 0.000000, -45.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 656.780578, 2548.636230, -92.196701, 0.000000, 0.000000, -45.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19366, 656.575073, 2548.425781, -92.198699, 0.000000, 0.000000, -45.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2161, 652.150939, 2552.536376, -90.453887, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2009, 657.350524, 2552.020263, -90.455299, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1714, 657.854003, 2551.335449, -90.455001, 0.000000, 0.000000, 70.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2161, 653.487060, 2552.534179, -90.453887, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2161, 652.550354, 2552.530029, -89.105499, -0.004000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2161, 654.823059, 2552.534912, -90.453887, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2164, 658.796020, 2547.962158, -90.455703, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2200, 651.708862, 2549.580322, -90.454803, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2199, 651.674987, 2548.177734, -90.454299, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1893, 657.245544, 2549.031250, -85.499900, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1893, 653.706665, 2549.036132, -85.499900, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2002, 664.179687, 2545.891113, -90.453720, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2167, 658.839233, 2549.221923, -90.453697, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2173, 657.642333, 2528.139648, -90.455093, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1714, 658.230773, 2526.741699, -90.454101, 0.000000, 0.000000, 193.530914, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2193, 651.769531, 2531.980224, -90.453521, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2615, 662.936096, 2526.402343, -88.465560, 0.000000, 3.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2612, 658.157226, 2526.241210, -88.980941, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2606, 654.442016, 2552.427246, -88.880599, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18636, 657.585998, 2528.363281, -89.590202, 0.000000, 0.000000, 317.317108, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19834, 656.184509, 2526.186523, -89.423896, 0.000000, 1.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2816, 658.539245, 2528.217529, -89.655433, 0.000000, 0.000000, 10.470990, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19807, 657.558593, 2527.979003, -89.603401, 0.000000, 0.000000, 349.242462, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2311, 656.925720, 2530.899414, -90.454200, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1892, 652.385742, 2539.315429, -90.454299, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1892, 652.384826, 2537.645996, -90.454299, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2066, 655.674560, 2526.006835, -90.935600, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2191, 651.779968, 2530.485595, -90.454597, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2066, 656.258483, 2526.010253, -90.935600, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2199, 651.396606, 2528.311767, -90.454002, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2281, 658.715637, 2530.024414, -87.903709, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(16779, 654.855102, 2530.318359, -85.500076, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2686, 655.175842, 2526.204345, -88.822601, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2221, 656.940979, 2531.059082, -89.877502, 0.000000, 0.000000, 1.105669, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2059, 656.784912, 2531.985595, -89.925697, 0.000000, 0.000000, 83.055343, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2197, 652.064941, 2529.625488, -90.656196, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1714, 652.634704, 2532.703369, -90.454101, 0.000000, 0.000000, 193.530914, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19172, 651.305114, 2530.594726, -87.563903, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2671, 657.621948, 2526.592041, -90.441596, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2261, 654.565063, 2526.844238, -87.849029, 0.000000, 0.000000, 160.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2173, 659.866210, 2528.156982, -90.455093, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1714, 659.904846, 2526.652343, -90.454101, 0.000000, 0.000000, 164.053390, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19807, 659.734191, 2528.075195, -89.603401, 0.000000, 0.000000, 349.242462, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18636, 659.576171, 2528.495605, -89.590202, 0.000000, 0.000000, 312317.312500, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2311, 665.017700, 2528.420654, -90.454406, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2222, 666.337768, 2528.424316, -89.883300, 0.000000, 0.000000, 81.609687, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2828, 660.996154, 2528.169189, -89.654502, 0.000000, 0.000000, 135.786422, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2616, 656.102844, 2526.240234, -88.598808, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2615, 656.369018, 2526.248779, -88.465560, 0.000000, 3.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2612, 659.406555, 2527.653808, -88.880912, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2261, 659.894714, 2529.004638, -88.374588, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2066, 661.497314, 2526.238281, -90.481498, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19623, 661.704711, 2526.536132, -89.002899, 0.008000, 0.000000, 111.524803, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19918, 662.081970, 2526.589355, -90.454277, 0.000000, 0.000000, 352.367279, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2199, 668.390808, 2532.857910, -90.454002, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1742, 668.577636, 2531.473632, -90.454200, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1742, 668.580200, 2530.031982, -90.454200, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(16779, 663.643615, 2529.474121, -85.500076, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1893, 660.880676, 2529.027587, -85.094299, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1893, 666.399108, 2528.757324, -85.094299, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2609, 668.293090, 2528.756835, -90.047157, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2608, 668.368225, 2530.050292, -87.833503, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2737, 666.234436, 2533.393798, -88.538307, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1744, 659.216064, 2531.730468, -88.770500, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2345, 659.832580, 2532.205322, -88.648399, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2345, 659.671508, 2532.381347, -88.648399, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2083, 669.468750, 2533.568603, -90.453872, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2252, 669.917724, 2534.058349, -89.685203, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2249, 669.845214, 2534.041992, -89.513481, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1893, 654.644226, 2541.721923, -84.995002, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1893, 668.467712, 2541.353759, -84.995002, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19834, 662.925415, 2526.320556, -89.423896, 0.000000, 1.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2308, 676.920349, 2537.537353, -95.604598, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2165, 679.317687, 2538.541992, -95.603500, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1714, 678.170166, 2537.477050, -95.602699, 0.000000, 0.000000, 104.003852, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1738, 685.693298, 2550.301757, -95.060897, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2816, 676.455261, 2537.424072, -94.813842, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2067, 675.768188, 2539.666503, -95.605003, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1893, 678.111755, 2539.545654, -91.049102, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1893, 682.143371, 2553.060058, -91.049102, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1893, 681.926757, 2545.452148, -91.049102, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1893, 681.900756, 2540.101806, -91.049102, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1893, 681.687255, 2534.711669, -91.049102, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2528, 685.384277, 2545.700439, -95.603500, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2524, 687.234375, 2545.081054, -95.602600, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2205, 689.159973, 2546.453369, -95.603302, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2846, 687.483154, 2549.382324, -95.602378, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1744, 689.850036, 2546.240478, -94.491600, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1811, 687.666992, 2545.652587, -94.884597, 0.000000, 0.000000, 199.086654, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2059, 689.007446, 2545.806884, -94.648498, 0.000000, 0.000000, 80.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2268, 689.219909, 2545.930664, -94.042427, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1529, 689.716430, 2548.801269, -94.424400, 3.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18661, 687.214172, 2550.449462, -94.602470, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1800, 688.900939, 2546.880859, -94.648300, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1800, 688.901000, 2546.880859, -95.603538, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2843, 688.426696, 2548.652587, -94.824096, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2056, 689.339843, 2545.230712, -94.365600, 0.000000, -7.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1738, 685.699340, 2539.441406, -95.060897, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18661, 687.220214, 2539.589111, -94.602470, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2846, 687.489196, 2538.521972, -95.602378, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1800, 688.907043, 2536.020507, -95.603538, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1800, 688.906982, 2536.020507, -94.648300, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2843, 688.432739, 2537.792236, -93.882057, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1744, 689.856079, 2535.380126, -94.491600, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2205, 689.166015, 2535.593017, -95.603302, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2059, 689.013488, 2534.946533, -94.648498, 0.000000, 0.000000, 80.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2056, 689.345886, 2534.370361, -94.365600, 0.000000, -7.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2273, 688.738098, 2534.121093, -94.038917, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1811, 687.673034, 2534.792236, -94.884597, 0.000000, 0.000000, 199.086654, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2524, 687.240051, 2534.137695, -95.602600, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2528, 685.390319, 2534.840087, -95.603500, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1529, 689.722473, 2537.940917, -94.424400, 3.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2671, 686.915161, 2549.070556, -95.590797, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2671, 689.114013, 2545.602050, -95.590797, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2610, 689.629943, 2547.207519, -95.113296, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19940, 678.966369, 2543.215087, -94.034301, 0.000000, 0.000000, -100.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19940, 676.873596, 2543.186523, -94.034301, 0.000000, 0.000000, 100.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2654, 678.537719, 2537.173095, -90.232101, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2145, 672.772155, 2537.040771, -90.450897, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1566, 680.725891, 2546.349121, -89.132942, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18094, 679.687500, 2537.170654, -89.032470, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(11729, 672.175842, 2537.070800, -90.449302, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(11738, 684.221740, 2537.583251, -90.403602, 0.000000, 0.000000, 89.300003, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19940, 682.221801, 2537.063476, -90.075103, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19940, 682.221496, 2537.057373, -89.631103, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19940, 682.221496, 2537.057373, -89.145103, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19940, 680.222839, 2537.057128, -89.631103, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19940, 680.221496, 2537.057373, -89.145103, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19940, 680.221801, 2537.063476, -90.075103, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19940, 676.579895, 2537.144042, -89.597099, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19940, 674.583435, 2537.144287, -89.597099, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2654, 683.654296, 2537.073242, -90.232101, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(14401, 677.873229, 2540.885742, -90.134597, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2371, 673.149291, 2539.875488, -90.454689, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2392, 673.524841, 2540.020507, -89.751403, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2394, 672.857116, 2540.446533, -89.743186, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(11729, 671.226379, 2539.677001, -90.449302, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(11729, 671.225891, 2538.994384, -90.449302, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(11729, 671.226989, 2538.315673, -90.449302, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(11729, 671.225402, 2541.029541, -90.449302, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(11729, 671.225891, 2541.712158, -90.449302, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(11729, 671.226501, 2540.350830, -90.449302, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2387, 676.112854, 2538.759521, -90.449478, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2387, 680.615478, 2538.714111, -90.449478, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2694, 681.260986, 2537.076660, -89.509803, 0.000000, 0.000000, 96.269203, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2694, 681.260986, 2537.076660, -89.021797, 0.000000, 0.000000, 96.269172, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(14793, 680.244079, 2541.793212, -86.519798, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(11738, 683.931518, 2537.588623, -90.403602, 0.000000, 0.000000, 89.300003, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18105, 690.287963, 2537.336425, -88.484001, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19940, 684.142272, 2536.928955, -89.290100, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2040, 674.114624, 2546.037841, -90.288696, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2358, 675.150085, 2546.026611, -90.043800, 0.000000, 0.000000, 10.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19142, 672.765808, 2545.957275, -89.500396, 0.000000, 270.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19141, 676.658325, 2546.104492, -89.638298, 0.000000, 270.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18637, 678.127807, 2545.507568, -89.890800, 80.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18637, 678.129089, 2545.676757, -89.890800, 80.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18637, 678.128662, 2545.620361, -89.890800, 80.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18637, 678.128234, 2545.563964, -89.890800, 80.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18637, 678.685974, 2545.507568, -89.890800, 80.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18637, 678.686828, 2545.620361, -89.890800, 80.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18637, 678.687255, 2545.676757, -89.890800, 80.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18637, 678.686401, 2545.563964, -89.890800, 80.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2040, 675.917846, 2546.039794, -89.615699, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2040, 674.585998, 2546.033935, -90.288696, 0.000000, 0.000000, 20.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2040, 673.882934, 2546.023925, -90.288696, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2040, 673.662536, 2546.035888, -90.288696, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2040, 673.380859, 2546.009521, -90.288696, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2040, 673.120239, 2546.002197, -90.288696, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2040, 672.900512, 2546.012939, -90.288696, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2040, 672.659851, 2546.004638, -90.288696, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2358, 675.970153, 2546.086914, -90.288803, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2358, 676.279418, 2545.990966, -90.055801, 0.000000, 0.000000, 357.435577, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2358, 677.510314, 2545.967285, -90.288803, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2358, 675.150085, 2546.026611, -90.288803, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2358, 676.770202, 2546.047119, -90.288803, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19142, 673.226379, 2546.053955, -89.500396, 0.000000, 270.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19142, 673.705688, 2545.988037, -89.500396, 0.000000, 270.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19142, 674.207153, 2546.101806, -89.500396, 0.000000, 270.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19142, 674.645080, 2545.956054, -89.500396, 0.000000, 270.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19142, 675.119628, 2546.094970, -89.500396, 0.000000, 270.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19142, 675.583312, 2545.904296, -89.500396, 0.000000, 270.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2040, 674.340820, 2546.046142, -90.288696, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2040, 676.137817, 2546.040039, -89.615699, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2040, 676.357910, 2546.020263, -89.615699, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19141, 676.752685, 2545.828369, -89.638298, 0.000000, 270.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19141, 676.980773, 2546.060302, -89.638298, 0.000000, 270.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19141, 677.094055, 2545.805175, -89.638298, 0.000000, 270.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19141, 677.238159, 2546.113281, -89.638298, 0.000000, 270.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19141, 677.392456, 2545.840332, -89.638298, 0.000000, 270.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2654, 678.355712, 2546.135009, -89.497100, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2694, 675.385925, 2546.056640, -89.021797, 0.000000, 0.000000, 277.114135, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2694, 674.740173, 2545.928710, -89.021797, 0.000000, 0.000000, 272.948089, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2390, 672.844970, 2545.416015, -88.242202, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2399, 673.507995, 2545.418457, -88.233222, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2399, 674.088012, 2545.404785, -88.233222, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2389, 675.789611, 2545.446533, -88.183502, 0.000000, 0.000000, 0.808000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2383, 676.321533, 2545.467041, -88.190986, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2694, 677.352478, 2545.979003, -89.021797, 0.000000, 0.000000, 277.114135, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2390, 678.689453, 2545.412841, -88.242202, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2390, 678.169250, 2545.411132, -88.242202, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18075, 666.254333, 2558.172363, -85.500640, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(18075, 666.248840, 2553.860351, -85.496597, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2191, 662.231140, 2562.114013, -90.458099, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2172, 665.598205, 2564.940429, -90.458831, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2193, 662.244323, 2563.841064, -90.456619, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2199, 667.657775, 2565.316162, -90.455909, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2002, 670.119567, 2552.507812, -90.456199, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2067, 659.324035, 2553.567138, -90.456298, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2197, 664.118530, 2564.339111, -90.455711, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2161, 659.050537, 2549.771484, -90.455703, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2193, 659.566833, 2554.487304, -90.456619, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2193, 669.195739, 2564.895263, -90.456596, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2193, 670.136108, 2548.101074, -90.456596, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2193, 660.523803, 2547.093994, -90.456596, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2191, 659.482055, 2552.132324, -90.458099, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2191, 670.134704, 2551.147460, -90.458099, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2191, 670.138427, 2560.382568, -90.458099, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2197, 660.078247, 2551.284179, -90.455703, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2067, 661.271301, 2546.692871, -90.456298, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2610, 670.531860, 2563.156738, -90.422698, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2183, 666.902099, 2559.285400, -90.454696, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2183, 666.884216, 2554.978271, -90.454696, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2183, 666.901062, 2550.613525, -90.454696, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1714, 669.429138, 2547.798339, -90.452972, 0.000000, 0.000000, 350.131011, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1714, 660.135986, 2547.685058, -90.452972, 0.000000, 0.000000, 238.606231, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1714, 660.288330, 2554.704345, -90.452972, 0.000000, 0.000000, 238.606231, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1714, 662.816040, 2564.247070, -90.452972, 0.000000, 0.000000, 164.510467, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1714, 669.515930, 2564.174072, -90.452972, 0.000000, 0.000000, 164.510467, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1806, 664.893859, 2559.697021, -90.453193, 0.000000, 0.000000, 305.074066, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1806, 665.011596, 2557.347412, -90.453193, 0.000000, 0.000000, 250.148147, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1806, 665.085754, 2555.801025, -90.453193, 0.000000, 0.000000, 282.054351, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1806, 664.974548, 2561.679443, -90.453193, 0.000000, 0.000000, 250.148147, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1806, 664.863464, 2553.088867, -90.453193, 0.000000, 0.000000, 261.271026, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1806, 664.825805, 2551.046142, -90.453193, 0.000000, 0.000000, 269.988525, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1806, 667.525390, 2551.072509, -90.453201, 0.000000, 0.000000, 76.233810, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1806, 667.632141, 2559.895996, -90.453201, 0.000000, 0.000000, 76.233810, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1806, 667.349426, 2557.335449, -90.453201, 0.000000, 0.000000, 130.516937, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1806, 667.197387, 2552.825927, -90.453201, 0.000000, 0.000000, 120.844673, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1806, 667.378601, 2555.604736, -90.453201, 0.000000, 0.000000, 76.233810, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(1806, 667.445007, 2561.788574, -90.453201, 0.000000, 0.000000, 104.170928, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2612, 670.574645, 2562.116699, -88.018898, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2612, 670.552795, 2559.153808, -87.715888, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2611, 661.786376, 2563.991210, -88.134498, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2855, 665.783447, 2557.747314, -89.646400, 0.000000, 0.000000, 324.621582, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2855, 666.763854, 2562.311523, -89.646400, 0.000000, 0.000000, 3324.621582, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2056, 670.609741, 2551.932617, -88.741203, 0.000000, 10.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2615, 669.390075, 2546.671142, -88.105697, 0.000000, 0.000000, 180.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2615, 670.555114, 2550.811279, -87.605712, 0.000000, 0.000000, 270.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19174, 661.728332, 2559.649169, -87.892303, 0.000000, 0.000000, 90.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2221, 665.957885, 2553.653076, -89.568298, 0.000000, 0.000000, 12.388817, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2768, 666.657714, 2557.860595, -89.569503, 0.000000, 0.000000, 30.673700, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(2768, 666.866943, 2557.963867, -89.569503, 0.000000, 0.000000, 3320.673583, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(11738, 683.951538, 2537.588378, -90.403602, 0.000000, 0.000000, 75.200019, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19087, 670.792968, 2543.121582, -85.488624, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	tmpobjid = CreateDynamicObject(19777, 670.718566, 2539.960449, -86.847801, 93.100021, 0.000000, -87.700012, object_world, object_int, -1, 300.00, 300.00);
}

mapTolls()
{
	new object_world = -1, object_int = -1;
	CreateDynamicObject(9623, 1751.903808, 533.012634, 28.906692, -3.799999, 0.000000, -18.100000, object_world, object_int, -1, 300.00, 300.00); 
	CreateDynamicObject(9623, 1734.812377, 538.599548, 28.906692, -3.799999, 0.000000, -18.100000, object_world, object_int, -1, 300.00, 300.00); 
	CreateDynamicObject(968, 1740.482177, 530.115112, 27.389951, -1.700000, -90.500022, -18.100000, object_world, object_int, -1, 300.00, 300.00); 
	CreateDynamicObject(1237, 1733.488891, 532.355285, 26.602788, 0.000000, 0.000000, 72.499977, object_world, object_int, -1, 300.00, 300.00); 
	CreateDynamicObject(1237, 1740.469482, 530.153686, 26.602788, 0.000000, 0.000000, 72.499977, object_world, object_int, -1, 300.00, 300.00); 
	CreateDynamicObject(968, 1731.500000, 533.048461, 27.307518, -1.700000, -90.500022, -18.100000, object_world, object_int, -1, 300.00, 300.00); 
	CreateDynamicObject(1237, 1731.543212, 532.969116, 26.602788, 0.000000, 0.000000, 72.499977, object_world, object_int, -1, 300.00, 300.00); 
	CreateDynamicObject(1237, 1724.723144, 535.213684, 26.602788, 0.000000, 0.000000, 72.499977, object_world, object_int, -1, 300.00, 300.00); 
	CreateDynamicObject(968, 1752.742675, 539.194213, 26.817792, -1.700000, -90.500022, -18.100000, object_world, object_int, -1, 300.00, 300.00); 
	CreateDynamicObject(1237, 1752.595825, 539.281066, 25.742786, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	CreateDynamicObject(1237, 1745.876098, 541.361450, 25.742786, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	CreateDynamicObject(968, 1761.402465, 536.366638, 26.897256, -1.700000, -90.500022, -18.100000, object_world, object_int, -1, 300.00, 300.00); 
	CreateDynamicObject(1237, 1761.537353, 536.290832, 25.742786, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	CreateDynamicObject(1237, 1754.467041, 538.621093, 25.742786, 0.000000, 0.000000, 0.000000, object_world, object_int, -1, 300.00, 300.00); 
	CreateDynamicObject(1237, 544.401000, 439.431732, 17.919153, 0.000000, 0.000000, 34.399997, object_world, object_int, -1, 300.00, 300.00); 
	CreateDynamicObject(1237, 543.658447, 438.923095, 17.919153, 0.000000, 0.000000, 34.399997, object_world, object_int, -1, 300.00, 300.00); 
	CreateDynamicObject(1237, 538.666320, 435.505310, 17.919153, 0.000000, 0.000000, 34.399997, object_world, object_int, -1, 300.00, 300.00); 
	CreateDynamicObject(1237, 549.236206, 442.742279, 17.919153, 0.000000, 0.000000, 34.399997, object_world, object_int, -1, 300.00, 300.00); 
	CreateDynamicObject(968, 549.401000, 442.758361, 18.958890, -1.199999, -90.200057, 34.700004, object_world, object_int, -1, 300.00, 300.00); 
	CreateDynamicObject(968, 538.540222, 435.345214, 18.964376, -1.199999, -90.200057, -145.999984, object_world, object_int, -1, 300.00, 300.00); 
	CreateDynamicObject(1237, -176.934677, 331.918090, 11.061244, 0.000000, 0.000000, -13.000000, object_world, object_int, -1, 300.00, 300.00); 
	CreateDynamicObject(1237, -177.743423, 332.104797, 11.061244, 0.000000, 0.000000, -13.000000, object_world, object_int, -1, 300.00, 300.00); 
	CreateDynamicObject(1237, -183.589889, 333.454345, 11.061244, 0.000000, 0.000000, -13.000000, object_world, object_int, -1, 300.00, 300.00); 
	CreateDynamicObject(1237, -171.030059, 330.554718, 11.061244, 0.000000, 0.000000, -13.000000, object_world, object_int, -1, 300.00, 300.00); 
	CreateDynamicObject(968, -170.903182, 330.449554, 12.085076, 0.000000, -90.100006, -13.799997, object_world, object_int, -1, 300.00, 300.00); 
	CreateDynamicObject(968, -183.862594, 333.530822, 12.084276, 0.000000, -90.100006, 166.100006, object_world, object_int, -1, 300.00, 300.00); 
	CreateDynamicObject(1237, -964.008911, -327.511474, 35.208145, 0.000000, 0.000000, -11.999998, object_world, object_int, -1, 300.00, 300.00); 
	CreateDynamicObject(1237, -964.713073, -327.361694, 35.208145, 0.000000, 0.000000, -11.999998, object_world, object_int, -1, 300.00, 300.00); 
	CreateDynamicObject(1237, -970.631469, -326.104095, 35.438140, 0.000000, 0.000000, -11.999998, object_world, object_int, -1, 300.00, 300.00); 
	CreateDynamicObject(1237, -957.964050, -328.796417, 35.318138, 0.000000, 0.000000, -11.999998, object_world, object_int, -1, 300.00, 300.00); 
	CreateDynamicObject(968, -957.737243, -328.854156, 36.323223, 0.000000, -90.499977, -12.599999, object_world, object_int, -1, 300.00, 300.00); 
	CreateDynamicObject(968, -970.863647, -326.013549, 36.333087, 0.000000, -90.499977, 167.400070, object_world, object_int, -1, 300.00, 300.00);
}

stock mapRedCountyShack()
{
	CreateDynamicObject(12991,895.2700200,19.0700000,90.6300000,354.5290000,1.8330000,132.1150000); //object(sw_shack02) (1)
	CreateDynamicObject(3383,896.1099900,18.1700000,90.5300000,1.8240000,358.1750000,33.9800000); //object(a51_labtable1_) (1)
	CreateDynamicObject(1576,897.3599900,19.0700000,91.6100000,0.0000000,0.0000000,305.2660000); //object(drug_orange) (1)
	CreateDynamicObject(1576,896.9299900,18.8200000,91.5900000,0.0000000,0.0000000,304.5680000); //object(drug_orange) (2)
	CreateDynamicObject(1576,896.5100100,18.5600000,91.5900000,0.0000000,0.0000000,299.7890000); //object(drug_orange) (3)
	CreateDynamicObject(1576,896.0900300,18.2800000,91.5700000,0.0000000,0.0000000,299.7890000); //object(drug_orange) (4)
	CreateDynamicObject(335,895.6900000,17.3300000,91.8300000,0.6250000,180.0000000,183.6490000); //object(1)
	CreateDynamicObject(347,895.2800300,16.9600000,91.5400000,87.8030000,123.8570000,285.3850000); //object(2)
	CreateDynamicObject(2515,894.9400000,17.8400000,91.6900000,0.0000000,0.0000000,208.3770000); //object(cj_bs_sink) (1)
	CreateDynamicObject(1544,895.2600100,17.8100000,91.6700000,0.0000000,0.0000000,0.0000000); //object(cj_beer_b_1) (1)
	CreateDynamicObject(1544,895.0600000,17.9000000,91.6200000,86.9510000,180.0000000,129.8510000); //object(cj_beer_b_1) (2)
	CreateDynamicObject(11245,897.6400100,15.0400000,90.2400000,0.5010000,277.8820000,229.3800000); //object(sfsefirehseflag) (1)
	CreateDynamicObject(3265,890.7399900,19.3000000,90.1000000,356.3510000,0.0000000,326.2820000); //object(privatesign4) (1)
	CreateDynamicObject(3264,899.0200200,12.6700000,89.6700000,7.2980000,0.0000000,0.6780000); //object(privatesign3) (1)
	CreateDynamicObject(2717,893.2100200,16.6700000,91.3100000,3.6490000,0.0000000,311.6920000); //object(cj_don_poster2) (1)
	CreateDynamicObject(1773,895.9199800,21.6800000,91.5000000,7.2940000,358.1610000,308.7130000); //object(cj_cooker2) (1)
	CreateDynamicObject(1739,896.5499900,20.7400000,91.6500000,3.6490000,0.0000000,34.6650000); //object(swank_din_chair_5) (1)
	CreateDynamicObject(1369,897.9600200,24.0300000,91.4800000,0.0000000,0.0000000,182.7710000); //object(cj_wheelchair1) (1)
	CreateDynamicObject(2665,893.2399900,20.8000000,92.4900000,0.0000000,5.4730000,222.8590000); //object(cj_ff_list04) (1)
}

stock removeMapFDext(playerid)
{
    RemoveBuildingForPlayer(playerid, 4194, 1360.3828, -1840.6172, 26.8047, 0.25);
    RemoveBuildingForPlayer(playerid, 4226, 1359.2813, -1796.4688, 24.3438, 0.25);
    RemoveBuildingForPlayer(playerid, 4193, 1360.3828, -1840.6172, 26.8047, 0.25);
    RemoveBuildingForPlayer(playerid, 4023, 1359.2813, -1796.4688, 24.3438, 0.25);
}

stock removeMapGS9(playerid)
{
	RemoveBuildingForPlayer(playerid, 1412, 1917.3203, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1912.0547, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1906.7734, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1927.8516, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1922.5859, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1938.3906, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1933.1250, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1676, 1941.6563, -1778.4531, 14.1406, 0.25);
	RemoveBuildingForPlayer(playerid, 1676, 1941.6563, -1774.3125, 14.1406, 0.25);
	RemoveBuildingForPlayer(playerid, 1676, 1941.6563, -1771.3438, 14.1406, 0.25);
	RemoveBuildingForPlayer(playerid, 1676, 1941.6563, -1767.2891, 14.1406, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1951.6094, -1821.1250, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1951.6094, -1815.8594, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1951.6094, -1810.5938, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1951.6094, -1805.3281, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1948.9844, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1943.6875, -1797.4219, 13.8125, 0.25);
	RemoveBuildingForPlayer(playerid, 1412, 1951.6094, -1800.0625, 13.8125, 0.25);
}

stock mapGS9()
{
	// pd thing, dw abt it.
	new g_Object[1];
	g_Object[0] = CreateObject(2666, 1555.8464, -1675.6132, 18.7854, 0.0000, 0.0000, 89.9999);
	SetObjectMaterial(g_Object[0], 0, 7009, "vgndwntwn1", "newpolice_sa", 0x00000000);

    // GS9 Exterior
	CreateDynamicObject(3465, 1941.70215, -1778.56470, 13.92730,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3465, 1941.70215, -1776.49707, 13.92730,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3465, 1941.70215, -1774.37769, 13.92730,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3465, 1941.70215, -1771.19824, 13.92730,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3465, 1941.70215, -1769.17456, 13.92730,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(3465, 1941.70215, -1767.18933, 13.92730,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(11706, 1941.65381, -1780.72009, 12.63478,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1929.56653, -1797.34045, 13.09055,   0.00000, 0.00000, 179.89525);
	CreateDynamicObject(970, 1925.40784, -1797.33228, 13.09060,   0.00000, 0.00000, 179.89520);
	CreateDynamicObject(970, 1921.25720, -1797.32080, 13.09060,   0.00000, 0.00000, 179.89520);
	CreateDynamicObject(970, 1917.10205, -1797.32568, 13.09060,   0.00000, 0.00000, 179.89520);
	CreateDynamicObject(970, 1951.64795, -1765.70386, 13.09060,   0.00000, 0.00000, 90.01520);
	CreateDynamicObject(2240, 1951.62317, -1768.22009, 13.00190,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(2240, 1951.65320, -1763.05273, 13.00490,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1951.64795, -1770.73486, 13.09060,   0.00000, 0.00000, 90.01520);
	CreateDynamicObject(2240, 1951.62317, -1773.25610, 13.02890,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1951.64795, -1775.79492, 13.09060,   0.00000, 0.00000, 90.01520);
	CreateDynamicObject(2240, 1951.62317, -1778.30408, 13.02890,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(970, 1925.26501, -1762.43604, 13.09060,   0.00000, 0.00000, 180.61520);
	CreateDynamicObject(970, 1929.42395, -1762.39404, 13.09060,   0.00000, 0.00000, 180.61520);
}

stock removeMapPizzaStacks(playerid)
{
	// Pizzeria Exterieur MrToinou
	RemoveBuildingForPlayer(playerid, 1408, 2099.8516, -1813.9063, 13.1016, 0.25);
	RemoveBuildingForPlayer(playerid, 1408, 2099.8594, -1819.3594, 13.1016, 0.25);
	RemoveBuildingForPlayer(playerid, 1408, 2099.8594, -1799.4219, 13.1016, 0.25);
	RemoveBuildingForPlayer(playerid, 1408, 2102.6016, -1822.0781, 13.1172, 0.25);
	RemoveBuildingForPlayer(playerid, 1408, 2099.8516, -1793.9766, 13.1016, 0.25);
	RemoveBuildingForPlayer(playerid, 712, 2100.8125, -1764.3750, 21.3906, 0.25);
	RemoveBuildingForPlayer(playerid, 1408, 2102.6641, -1791.3281, 13.1016, 0.25);
	RemoveBuildingForPlayer(playerid, 620, 2105.0859, -1765.6094, 10.8047, 0.25);
}

stock MapPizzaStacks()
{
	CreateDynamicObject(869, 2094.85132, -1789.25012, 12.78920,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, 2097.39600, -1788.58801, 12.78920,   0.00000, 0.00000, 83.94339);
	CreateDynamicObject(869, 2095.91382, -1785.96204, 12.78920,   0.00000, 0.00000, 49.54421);
	CreateDynamicObject(869, 2096.87915, -1783.10657, 12.78920,   0.00000, 0.00000, 66.38068);
	CreateDynamicObject(869, 2097.43457, -1779.48303, 12.78920,   0.00000, 0.00000, 66.38068);
	CreateDynamicObject(869, 2097.99829, -1776.23291, 12.78920,   0.00000, 0.00000, 66.38068);
	CreateDynamicObject(869, 2103.75635, -1763.87378, 12.78920,   0.00000, 0.00000, 173.24792);
	CreateDynamicObject(869, 2103.55029, -1766.12854, 12.78920,   0.00000, 0.00000, 173.24792);
	CreateDynamicObject(869, 2100.58521, -1767.99622, 12.78920,   0.00000, 0.00000, 173.24792);
	CreateDynamicObject(869, 2101.11304, -1764.43933, 12.78920,   0.00000, 0.00000, 56.18097);
	CreateDynamicObject(869, 2099.36157, -1770.57532, 12.78920,   0.00000, 0.00000, 240.44533);
	CreateDynamicObject(673, 2103.15210, -1765.23096, 12.65048,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1359, 2100.10620, -1767.34998, 13.19060,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(673, 2096.04126, -1781.47339, 12.65048,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1280, 2097.98315, -1771.40442, 12.88080,   0.00000, 0.00000, 346.73807);
	CreateDynamicObject(1280, 2096.26758, -1778.38794, 12.88080,   0.00000, 0.00000, 337.56235);
	CreateDynamicObject(1359, 2097.35815, -1789.96729, 13.26890,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(1345, 2118.61426, -1790.23596, 13.31730,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1345, 2115.50366, -1790.27991, 13.31730,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1438, 2112.27319, -1789.64575, 12.54620,   0.00000, 0.00000, 180.00000);
	CreateDynamicObject(1338, 2120.75220, -1790.19763, 13.22770,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19357, 2121.86499, -1782.09021, 10.63780,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19357, 2121.86499, -1779.09021, 10.63980,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19357, 2121.86499, -1776.09021, 10.64380,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19357, 2121.86499, -1773.09021, 10.64380,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19357, 2121.86499, -1770.09021, 10.64780,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19357, 2119.68872, -1784.15210, 10.63780,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19357, 2116.68872, -1784.15210, 10.63780,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19357, 2113.68872, -1784.15210, 10.63780,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19357, 2110.68872, -1784.15210, 10.63780,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19357, 2107.68872, -1784.15210, 10.63780,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(19357, 2104.68872, -1784.15210, 10.63780,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(869, 2098.57617, -1773.59448, 12.78920,   0.00000, 0.00000, 66.38068);
	CreateDynamicObject(869, 2098.25806, -1787.34998, 12.78920,   0.00000, 0.00000, 142.45052);
	CreateDynamicObject(869, 2096.25757, -1783.66260, 12.78920,   0.00000, 0.00000, 250.78398);
	CreateDynamicObject(869, 2095.34277, -1786.74426, 12.78920,   0.00000, 0.00000, 250.78398);
	CreateDynamicObject(983, 2099.24023, -1794.19482, 13.19510,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(983, 2099.24023, -1798.96375, 13.19510,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(983, 2099.24023, -1814.94373, 13.19510,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(983, 2099.24023, -1819.71069, 13.19510,   0.00000, 0.00000, 0.00000);
	CreateDynamicObject(983, 2120.84253, -1786.15515, 13.19510,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(983, 2114.44653, -1786.15515, 13.19510,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(983, 2108.07642, -1786.15515, 13.19510,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19357, 2101.58765, -1777.08044, 10.65180,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19357, 2101.97681, -1774.12622, 10.65180,   0.00000, 0.00000, 90.00000);
	CreateDynamicObject(19357, 2102.36157, -1771.11230, 10.65180,   0.00000, 0.00000, 90.00000);
}

stock mapLSCHexterior()
{
	new g_Object[38];
	g_Object[0] = CreateDynamicObject(19325, 1493.5760, -1751.6446, 16.8964, 89.2537, 0.0000, 89.8199); //no comment
	SetDynamicObjectMaterial(g_Object[0], 0, -1, "none", "none", 0xFF696969);
	g_Object[1] = CreateDynamicObject(19325, 1485.3371, -1751.6179, 16.7893, 89.2537, 0.0000, 89.8199); //no comment
	SetDynamicObjectMaterial(g_Object[1], 0, -1, "none", "none", 0xFF696969);
	g_Object[2] = CreateDynamicObject(19325, 1481.1333, -1751.6179, 23.4095, 89.2537, 0.0000, 89.8199); //no comment
	SetDynamicObjectMaterial(g_Object[2], 0, -1, "none", "none", 0xFF696969);
	g_Object[3] = CreateDynamicObject(1416, 1481.1031, -1751.2142, 15.0562, 0.5000, 90.5400, 180.5399); //no comment
	g_Object[4] = CreateDynamicObject(1416, 1481.0992, -1751.1827, 15.0099, -178.9756, 90.7397, 0.4397); //no comment
	g_Object[5] = CreateDynamicObject(1952, 1481.1202, -1751.3172, 15.8832, 106.9598, -90.1287, -0.8999); //no comment
	g_Object[6] = CreateDynamicObject(19325, 1475.9370, -1751.6496, 16.7893, 89.2537, 0.0000, 89.8199); //no comment
	SetDynamicObjectMaterial(g_Object[6], 0, -1, "none", "none", 0xFF696969);
	g_Object[7] = CreateDynamicObject(19325, 1471.8109, -1751.6357, 16.7373, 89.2537, 0.0000, 89.8199); //no comment
	SetDynamicObjectMaterial(g_Object[7], 0, -1, "none", "none", 0xFF696969);
	g_Object[8] = CreateDynamicObject(19325, 1467.6849, -1751.6236, 16.7373, 89.2537, 0.0000, 89.8199); //no comment
	SetDynamicObjectMaterial(g_Object[8], 0, -1, "none", "none", 0xFF696969);
	g_Object[9] = CreateDynamicObject(19325, 1489.4565, -1751.6313, 16.8428, 89.2537, 0.0000, 89.8199); //no comment
	SetDynamicObjectMaterial(g_Object[9], 0, -1, "none", "none", 0xFF696969);
	g_Object[10] = CreateDynamicObject(19325, 1481.1516, -1759.6762, 19.8047, 90.0538, 0.0000, 89.8199); //no comment
	SetDynamicObjectMaterial(g_Object[10], 0, -1, "none", "none", 0xFF696969);
	g_Object[11] = CreateDynamicObject(19325, 1481.1588, -1759.6762, 26.4447, 90.0538, 0.0000, 89.8199); //no comment
	SetDynamicObjectMaterial(g_Object[11], 0, -1, "none", "none", 0xFF696969);
	g_Object[12] = CreateDynamicObject(19325, 1485.2512, -1751.6179, 23.4286, 89.2537, 0.0000, 89.8199); //no comment
	SetDynamicObjectMaterial(g_Object[12], 0, -1, "none", "none", 0xFF696969);
	g_Object[13] = CreateDynamicObject(19325, 1489.3614, -1751.6328, 23.4822, 89.2537, 0.0000, 89.8199); //no comment
	SetDynamicObjectMaterial(g_Object[13], 0, -1, "none", "none", 0xFF696969);
	g_Object[14] = CreateDynamicObject(19325, 1493.4809, -1751.6472, 23.5359, 89.2537, 0.0000, 89.8199); //no comment
	SetDynamicObjectMaterial(g_Object[14], 0, -1, "none", "none", 0xFF696969);
	g_Object[15] = CreateDynamicObject(19325, 1467.5993, -1751.6236, 23.3367, 89.3538, 0.0000, 89.8199); //no comment
	SetDynamicObjectMaterial(g_Object[15], 0, -1, "none", "none", 0xFF696969);
	g_Object[16] = CreateDynamicObject(19325, 1471.6993, -1751.6374, 23.3528, 89.3538, 0.0000, 89.8199); //no comment
	SetDynamicObjectMaterial(g_Object[16], 0, -1, "none", "none", 0xFF696969);
	g_Object[17] = CreateDynamicObject(19325, 1475.8084, -1751.6501, 23.3992, 89.3538, 0.0000, 89.8199); //no comment
	SetDynamicObjectMaterial(g_Object[17], 0, -1, "none", "none", 0xFF696969);
	g_Object[18] = CreateDynamicObject(1215, 1511.0333, -1742.1054, 12.9997, 0.0000, 0.0000, 0.0000); //bollardlight
	g_Object[19] = CreateDynamicObject(1215, 1450.9517, -1742.0885, 13.0425, 0.0000, 0.0000, 0.0000); //bollardlight
	g_Object[20] = CreateDynamicObject(1215, 1478.2614, -1742.1303, 13.1220, 0.0000, 0.0000, 0.0000); //bollardlight
	g_Object[21] = CreateDynamicObject(970, 1453.1937, -1742.0637, 13.0755, 0.0000, 0.0000, -0.5000); //fencesmallb
	g_Object[22] = CreateDynamicObject(970, 1457.3542, -1742.0999, 13.0755, 0.0000, 0.0000, -0.5000); //fencesmallb
	g_Object[23] = CreateDynamicObject(970, 1461.5030, -1742.1365, 13.0755, 0.0000, 0.0000, -0.5000); //fencesmallb
	g_Object[24] = CreateDynamicObject(970, 1465.6424, -1742.1483, 13.0755, 0.0000, 0.0000, 0.0999); //fencesmallb
	g_Object[25] = CreateDynamicObject(970, 1469.8121, -1742.1406, 13.0755, 0.0000, 0.0000, 0.0999); //fencesmallb
	g_Object[26] = CreateDynamicObject(970, 1473.9422, -1742.1328, 13.0755, 0.0000, 0.0000, 0.0999); //fencesmallb
	g_Object[27] = CreateDynamicObject(970, 1476.0618, -1742.1361, 13.0755, 0.0000, 0.0000, -0.0000); //fencesmallb
	g_Object[28] = CreateDynamicObject(19978, 1470.6166, -1737.6667, 12.4793, 0.0000, 0.0000, 179.8000); //SAMPRoadSign31
	g_Object[29] = CreateDynamicObject(970, 1508.8029, -1742.0189, 13.0553, 0.0000, 0.0000, 179.8999); //fencesmallb
	g_Object[30] = CreateDynamicObject(970, 1504.6726, -1742.0114, 13.0553, 0.0000, 0.0000, 179.8999); //fencesmallb
	g_Object[31] = CreateDynamicObject(970, 1500.5620, -1742.0042, 13.0553, 0.0000, 0.0000, 179.8999); //fencesmallb
	g_Object[32] = CreateDynamicObject(970, 1496.4418, -1741.9970, 13.0553, 0.0000, 0.0000, 179.8999); //fencesmallb
	g_Object[33] = CreateDynamicObject(970, 1492.3028, -1741.9892, 13.0553, 0.0000, 0.0000, 179.8999); //fencesmallb
	g_Object[34] = CreateDynamicObject(970, 1488.1823, -1741.9826, 13.0553, 0.0000, 0.0000, 179.8999); //fencesmallb
	g_Object[35] = CreateDynamicObject(970, 1486.1419, -1741.9785, 13.0553, 0.0000, 0.0000, 179.8999); //fencesmallb
	g_Object[36] = CreateDynamicObject(1215, 1483.8906, -1742.0002, 13.1220, 0.0000, 0.0000, 0.0000); //bollardlight
	g_Object[37] = CreateDynamicObject(19978, 1499.1696, -1737.5356, 12.4793, 0.0000, 0.0000, 179.8000); //SAMPRoadSign31
}

stock removeMapArea51(playerid)
{
	RemoveBuildingForPlayer(playerid, 1411, 347.1950, 1799.2700, 18.7577, 0.10); // DYN_MESH_1
	RemoveBuildingForPlayer(playerid, 1411, 342.9379, 1796.2900, 18.7577, 0.10); // DYN_MESH_1
	RemoveBuildingForPlayer(playerid, 16670, 330.7890, 1813.2199, 17.8281, 0.10); // a51_extfence02
	RemoveBuildingForPlayer(playerid, 16095, 279.1329, 1829.7800, 16.6327, 0.10); // des_a51guardbox02
	RemoveBuildingForPlayer(playerid, 16094, 191.1410, 1870.0400, 21.4766, 0.10); // des_a51infenc
	RemoveBuildingForPlayer(playerid, 16671, 193.9530, 2051.8000, 20.1797, 0.10); // a51_extfence01
	RemoveBuildingForPlayer(playerid, 3268, 276.6560, 2023.7600, 16.6327, 0.10); // mil_hangar1_
	RemoveBuildingForPlayer(playerid, 3366, 276.6560, 2023.7600, 16.6327, 0.10); // LOD Model of mil_hangar1_
	RemoveBuildingForPlayer(playerid, 3268, 276.6560, 1989.5500, 16.6327, 0.10); // mil_hangar1_
	RemoveBuildingForPlayer(playerid, 3366, 276.6560, 1989.5500, 16.6327, 0.10); // LOD Model of mil_hangar1_
	RemoveBuildingForPlayer(playerid, 3268, 276.6560, 1955.7700, 16.6327, 0.10); // mil_hangar1_
	RemoveBuildingForPlayer(playerid, 3366, 276.6560, 1955.7700, 16.6327, 0.10); // LOD Model of mil_hangar1_
	RemoveBuildingForPlayer(playerid, 16668, 357.9379, 2049.4199, 16.8437, 0.10); // a51_extfence04
	RemoveBuildingForPlayer(playerid, 16669, 380.2579, 1914.9599, 17.4297, 0.10); // a51_extfence05
}

stock mapArea51()
{
	new g_Object[536];
	g_Object[0] = CreateDynamicObject(19913, -80.5671, 2033.2739, 20.9323, 0.0000, 0.0000, 89.9000); //SAMPBigFence1
	g_Object[1] = CreateDynamicObject(8171, 300.3999, 2060.1772, 16.6751, 0.0000, -0.0998, 0.0000); //vgsSairportland06
	g_Object[2] = CreateDynamicObject(19913, -80.5671, 2033.2739, 20.9323, 0.0000, 0.0000, 89.9000); //SAMPBigFence1
	g_Object[3] = CreateDynamicObject(19913, -80.6544, 1983.3020, 20.9323, 0.0000, 0.0000, 89.9000); //SAMPBigFence1
	g_Object[4] = CreateDynamicObject(19913, -80.7416, 1933.3712, 20.9323, 0.0000, 0.0000, 89.9000); //SAMPBigFence1
	g_Object[5] = CreateDynamicObject(19913, -80.8289, 1883.3714, 20.9323, 0.0000, 0.0000, 89.9000); //SAMPBigFence1
	g_Object[6] = CreateDynamicObject(19913, -80.9160, 1833.3913, 20.9323, 0.0000, 0.0000, 89.9000); //SAMPBigFence1
	g_Object[7] = CreateDynamicObject(19913, -81.0034, 1783.3990, 20.9323, 0.0000, 0.0000, 89.9000); //SAMPBigFence1
	g_Object[8] = CreateDynamicObject(19913, -81.0906, 1733.3968, 20.9323, 0.0000, 0.0000, 89.9000); //SAMPBigFence1
	g_Object[9] = CreateDynamicObject(19913, -81.1779, 1683.4370, 20.9323, 0.0000, 0.0000, 89.9000); //SAMPBigFence1
	g_Object[10] = CreateDynamicObject(19913, -81.2209, 1658.7232, 20.9323, 0.0000, 0.0000, 89.9000); //SAMPBigFence1
	g_Object[11] = CreateDynamicObject(19913, -56.2907, 1633.7243, 20.9323, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[12] = CreateDynamicObject(19913, -6.2609, 1633.7243, 20.9323, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[13] = CreateDynamicObject(19913, 43.7391, 1633.7243, 20.9323, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[14] = CreateDynamicObject(19913, 93.7089, 1633.7243, 20.9323, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[15] = CreateDynamicObject(19913, 143.7091, 1633.7243, 20.9323, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[16] = CreateDynamicObject(19913, 193.6793, 1633.7243, 20.9323, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[17] = CreateDynamicObject(19913, 243.6694, 1633.7243, 20.9323, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[18] = CreateDynamicObject(19913, 293.6094, 1633.7243, 20.9323, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[19] = CreateDynamicObject(19913, 310.9696, 1633.7243, 20.9323, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[20] = CreateDynamicObject(19913, 336.0096, 1658.6850, 20.9323, 0.0000, 0.0000, 90.0000); //SAMPBigFence1
	g_Object[21] = CreateDynamicObject(19913, 336.0096, 1708.6849, 20.9323, 0.0000, 0.0000, 90.0000); //SAMPBigFence1
	g_Object[22] = CreateDynamicObject(19913, 360.9995, 1733.6943, 20.9323, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[23] = CreateDynamicObject(19913, 385.9895, 1758.6738, 20.9323, 0.0000, 0.0000, 90.0000); //SAMPBigFence1
	g_Object[24] = CreateDynamicObject(19913, 385.9895, 1808.6335, 20.9323, 0.0000, 0.0000, 90.0000); //SAMPBigFence1
	g_Object[25] = CreateDynamicObject(19913, 410.9595, 1833.5642, 20.9323, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[26] = CreateDynamicObject(19913, 435.9200, 1858.5548, 20.9323, 0.0000, 0.0000, 90.0000); //SAMPBigFence1
	g_Object[27] = CreateDynamicObject(19913, 435.9200, 1908.5343, 20.9323, 0.0000, 0.0000, 90.0000); //SAMPBigFence1
	g_Object[28] = CreateDynamicObject(19913, 435.9200, 1958.5234, 20.9323, 0.0000, 0.0000, 90.0000); //SAMPBigFence1
	g_Object[29] = CreateDynamicObject(19913, 435.9200, 2008.4935, 20.9323, 0.0000, 0.0000, 90.0000); //SAMPBigFence1
	g_Object[30] = CreateDynamicObject(19913, 435.9200, 2058.4536, 20.9323, 0.0000, 0.0000, 90.0000); //SAMPBigFence1
	g_Object[31] = CreateDynamicObject(19913, 435.9200, 2108.4511, 20.9323, 0.0000, 0.0000, 90.0000); //SAMPBigFence1
	g_Object[32] = CreateDynamicObject(19913, 435.9200, 2108.4511, 20.9323, 0.0000, 0.0000, 90.0000); //SAMPBigFence1
	g_Object[33] = CreateDynamicObject(19913, 435.9200, 2120.1203, 20.9323, 0.0000, 0.0000, 90.0000); //SAMPBigFence1
	g_Object[34] = CreateDynamicObject(19354, 254.3486, 2026.2482, 55.9607, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[34], 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	g_Object[35] = CreateDynamicObject(19913, 410.9500, 2145.0927, 20.9323, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[36] = CreateDynamicObject(19913, 360.9800, 2145.0927, 20.9323, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[37] = CreateDynamicObject(19913, 310.9800, 2145.0927, 20.9323, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[38] = CreateDynamicObject(19913, 260.9802, 2145.0927, 20.9323, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[39] = CreateDynamicObject(19913, 211.0102, 2145.0927, 20.9323, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[40] = CreateDynamicObject(19913, 161.0502, 2145.0927, 20.9323, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[41] = CreateDynamicObject(19913, 111.0702, 2145.0927, 20.9323, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[42] = CreateDynamicObject(19913, 61.0903, 2145.0927, 20.9323, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[43] = CreateDynamicObject(19913, 11.0902, 2145.0927, 20.9323, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[44] = CreateDynamicObject(19913, -80.6500, 2094.7358, 20.9323, 0.0000, 0.0000, 89.9000); //SAMPBigFence1
	g_Object[45] = CreateDynamicObject(19913, -80.6056, 2120.0866, 20.9323, 0.0000, 0.0000, 89.9000); //SAMPBigFence1
	g_Object[46] = CreateDynamicObject(19913, -38.9095, 2145.0927, 20.9323, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[47] = CreateDynamicObject(19913, -55.6195, 2145.0927, 20.9323, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[48] = CreateDynamicObject(16098, 247.7962, 2069.9809, 21.1860, 0.0000, 0.0000, 29.5999); //des_by_hangar_
	g_Object[49] = CreateDynamicObject(8171, 300.3999, 1921.8752, 16.6751, 0.0000, -0.0998, 0.0000); //vgsSairportland06
	g_Object[50] = CreateDynamicObject(8171, 300.3999, 1783.6269, 16.6751, 0.0000, -0.0998, 179.9998); //vgsSairportland06
	g_Object[51] = CreateDynamicObject(7980, 298.5726, 2141.6555, 17.4102, 0.0000, 0.0000, 89.5000); //airprtbits12_lvS
	g_Object[52] = CreateDynamicObject(3268, 348.1001, 2076.5830, 16.5634, 0.0000, 0.0000, 0.0000); //mil_hangar1_
	g_Object[53] = CreateDynamicObject(19354, 249.1684, 2026.2482, 55.9907, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[53], 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	g_Object[54] = CreateDynamicObject(16782, 254.3588, 2029.6560, 57.1068, -0.3999, -90.1000, -90.2000); //a51_radar_scan
	g_Object[55] = CreateDynamicObject(7980, 298.6751, 1699.5102, 18.4302, 0.0000, 0.0000, 89.5000); //airprtbits12_lvS
	g_Object[56] = CreateDynamicObject(19354, 252.6585, 2026.2482, 55.9907, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[56], 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	g_Object[57] = CreateDynamicObject(19354, 254.3486, 2029.4483, 55.9607, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[57], 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	g_Object[58] = CreateDynamicObject(19354, 254.3486, 2032.0595, 55.9707, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[58], 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	g_Object[59] = CreateDynamicObject(19354, 252.6585, 2029.4581, 55.9907, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[59], 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	g_Object[60] = CreateDynamicObject(19354, 252.6585, 2032.0478, 56.0007, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[60], 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	g_Object[61] = CreateDynamicObject(19354, 249.1684, 2029.4390, 55.9907, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[61], 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	g_Object[62] = CreateDynamicObject(19354, 249.1684, 2031.9782, 56.0107, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[62], 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	g_Object[63] = CreateDynamicObject(19354, 247.6635, 2029.0484, 57.7783, 0.0000, 0.0000, -0.5999); //wall002
	SetDynamicObjectMaterial(g_Object[63], 0, 4829, "airport_las", "liftdoorsac256", 0x00000000);
	g_Object[64] = CreateDynamicObject(19354, 251.4484, 2024.4178, 57.8030, 0.0000, -0.8999, 89.2000); //wall002
	SetDynamicObjectMaterial(g_Object[64], 0, 10871, "blacksky_sfse", "ws_glass_balustrade", 0x00000000);
	g_Object[65] = CreateDynamicObject(19354, 247.4598, 2025.8406, 57.7783, 0.0000, 0.0000, -0.5999); //wall002
	SetDynamicObjectMaterial(g_Object[65], 0, 10101, "2notherbuildsfe", "sl_vicwall02", 0x00000000);
	g_Object[66] = CreateDynamicObject(19354, 247.4934, 2029.0402, 57.7783, 0.0000, 0.0000, -0.5999); //wall002
	SetDynamicObjectMaterial(g_Object[66], 0, 10101, "2notherbuildsfe", "sl_vicwall02", 0x00000000);
	g_Object[67] = CreateDynamicObject(8171, 300.3999, 2060.1772, 16.6751, 0.0000, -0.0997, 0.0000); //vgsSairportland06
	g_Object[68] = CreateDynamicObject(19913, -80.6544, 1983.3020, 20.9323, 0.0000, 0.0000, 89.9000); //SAMPBigFence1
	g_Object[69] = CreateDynamicObject(19913, -80.7416, 1933.3712, 20.9323, 0.0000, 0.0000, 89.9000); //SAMPBigFence1
	g_Object[70] = CreateDynamicObject(19913, -80.8289, 1883.3714, 20.9323, 0.0000, 0.0000, 89.9000); //SAMPBigFence1
	g_Object[71] = CreateDynamicObject(19913, -80.9160, 1833.3913, 20.9323, 0.0000, 0.0000, 89.9000); //SAMPBigFence1
	g_Object[72] = CreateDynamicObject(19913, -81.0034, 1783.3990, 20.9323, 0.0000, 0.0000, 89.9000); //SAMPBigFence1
	g_Object[73] = CreateDynamicObject(19913, -81.0905, 1733.3968, 20.9323, 0.0000, 0.0000, 89.9000); //SAMPBigFence1
	g_Object[74] = CreateDynamicObject(19913, -81.1779, 1683.4370, 20.9323, 0.0000, 0.0000, 89.9000); //SAMPBigFence1
	g_Object[75] = CreateDynamicObject(19913, -81.2209, 1658.7231, 20.9323, 0.0000, 0.0000, 89.9000); //SAMPBigFence1
	g_Object[76] = CreateDynamicObject(19913, -56.2906, 1633.7242, 20.9323, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[77] = CreateDynamicObject(19913, -6.2609, 1633.7242, 20.9323, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[78] = CreateDynamicObject(19913, 43.7391, 1633.7242, 20.9323, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[79] = CreateDynamicObject(19913, 93.7089, 1633.7242, 20.9323, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[80] = CreateDynamicObject(19913, 143.7091, 1633.7242, 20.9323, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[81] = CreateDynamicObject(19913, 193.6793, 1633.7242, 20.9323, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[82] = CreateDynamicObject(19913, 243.6694, 1633.7242, 20.9323, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[83] = CreateDynamicObject(19913, 293.6094, 1633.7242, 20.9323, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[84] = CreateDynamicObject(19913, 310.9696, 1633.7242, 20.9323, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[85] = CreateDynamicObject(19913, 336.0096, 1658.6850, 20.9323, 0.0000, 0.0000, 90.0000); //SAMPBigFence1
	g_Object[86] = CreateDynamicObject(19913, 336.0096, 1708.6849, 20.9323, 0.0000, 0.0000, 90.0000); //SAMPBigFence1
	g_Object[87] = CreateDynamicObject(19913, 360.9995, 1733.6943, 20.9323, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[88] = CreateDynamicObject(19913, 385.9895, 1758.6738, 20.9323, 0.0000, 0.0000, 90.0000); //SAMPBigFence1
	g_Object[89] = CreateDynamicObject(19913, 385.9895, 1808.6335, 20.9323, 0.0000, 0.0000, 90.0000); //SAMPBigFence1
	g_Object[90] = CreateDynamicObject(19913, 410.9595, 1833.5642, 20.9323, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[91] = CreateDynamicObject(19913, 435.9200, 1858.5548, 20.9323, 0.0000, 0.0000, 90.0000); //SAMPBigFence1
	g_Object[92] = CreateDynamicObject(19913, 435.9200, 1908.5343, 20.9323, 0.0000, 0.0000, 90.0000); //SAMPBigFence1
	g_Object[93] = CreateDynamicObject(19913, 435.9200, 1958.5234, 20.9323, 0.0000, 0.0000, 90.0000); //SAMPBigFence1
	g_Object[94] = CreateDynamicObject(19913, 435.9200, 2008.4935, 20.9323, 0.0000, 0.0000, 90.0000); //SAMPBigFence1
	g_Object[95] = CreateDynamicObject(19913, 435.9200, 2058.4536, 20.9323, 0.0000, 0.0000, 90.0000); //SAMPBigFence1
	g_Object[96] = CreateDynamicObject(19913, 435.9200, 2108.4511, 20.9323, 0.0000, 0.0000, 90.0000); //SAMPBigFence1
	g_Object[97] = CreateDynamicObject(19913, 435.9200, 2108.4511, 20.9323, 0.0000, 0.0000, 90.0000); //SAMPBigFence1
	g_Object[98] = CreateDynamicObject(19913, 435.9200, 2120.1203, 20.9323, 0.0000, 0.0000, 90.0000); //SAMPBigFence1
	g_Object[99] = CreateDynamicObject(19913, 410.9500, 2145.0927, 20.9323, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[100] = CreateDynamicObject(19913, 360.9800, 2145.0927, 20.9323, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[101] = CreateDynamicObject(19913, 310.9800, 2145.0927, 20.9323, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[102] = CreateDynamicObject(19913, 260.9801, 2145.0927, 20.9323, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[103] = CreateDynamicObject(19913, 211.0101, 2145.0927, 20.9323, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[104] = CreateDynamicObject(19913, 161.0502, 2145.0927, 20.9323, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[105] = CreateDynamicObject(19913, 165.8658, 1941.3094, 21.5421, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[106] = CreateDynamicObject(19913, 61.0903, 2145.0927, 20.9323, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[107] = CreateDynamicObject(19913, 11.0902, 2145.0927, 20.9323, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[108] = CreateDynamicObject(19913, -80.6500, 2094.7358, 20.9323, 0.0000, 0.0000, 89.9000); //SAMPBigFence1
	g_Object[109] = CreateDynamicObject(19913, -80.6055, 2120.0866, 20.9323, 0.0000, 0.0000, 89.9000); //SAMPBigFence1
	g_Object[110] = CreateDynamicObject(19913, -38.9095, 2145.0927, 20.9323, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[111] = CreateDynamicObject(19913, -55.6194, 2145.0927, 20.9323, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[112] = CreateDynamicObject(3268, 348.1001, 2110.7343, 16.5634, 0.0000, 0.0000, 0.0000); //mil_hangar1_
	g_Object[113] = CreateDynamicObject(8171, 300.3999, 1921.8752, 16.6751, 0.0000, -0.0997, 0.0000); //vgsSairportland06
	g_Object[114] = CreateDynamicObject(8171, 300.3999, 1783.6269, 16.6751, 0.0000, -0.0997, 179.9998); //vgsSairportland06
	g_Object[115] = CreateDynamicObject(7980, 298.5726, 2141.6555, 17.4102, 0.0000, 0.0000, 89.5000); //airprtbits12_lvS
	g_Object[116] = CreateDynamicObject(19354, 247.5658, 2032.1401, 57.7783, 0.0000, 0.0000, -0.8999); //wall002
	SetDynamicObjectMaterial(g_Object[116], 0, 10101, "2notherbuildsfe", "sl_vicwall02", 0x00000000);
	g_Object[117] = CreateDynamicObject(19354, 251.5850, 2033.4927, 57.8276, 0.0000, 1.7999, 89.2000); //wall002
	SetDynamicObjectMaterial(g_Object[117], 0, 10871, "blacksky_sfse", "ws_glass_balustrade", 0x00000000);
	g_Object[118] = CreateDynamicObject(8038, 252.7061, 1997.7437, 36.6860, 0.0000, 0.0000, 179.3000); //arprtermnl01_lvs
	g_Object[119] = CreateDynamicObject(7980, 298.6751, 1699.5102, 18.4302, 0.0000, 0.0000, 89.5000); //airprtbits12_lvS
	g_Object[120] = CreateDynamicObject(19354, 249.1951, 2033.5251, 57.8276, 0.0000, 1.7999, 89.2000); //wall002
	SetDynamicObjectMaterial(g_Object[120], 0, 10871, "blacksky_sfse", "ws_glass_balustrade", 0x00000000);
	g_Object[121] = CreateDynamicObject(19354, 254.6481, 2024.3741, 57.8130, 0.0000, -0.8999, 89.2000); //wall002
	SetDynamicObjectMaterial(g_Object[121], 0, 10871, "blacksky_sfse", "ws_glass_balustrade", 0x00000000);
	g_Object[122] = CreateDynamicObject(19354, 249.0386, 2024.4514, 57.8230, 0.0000, -0.8999, 89.2000); //wall002
	SetDynamicObjectMaterial(g_Object[122], 0, 10871, "blacksky_sfse", "ws_glass_balustrade", 0x00000000);
	g_Object[123] = CreateDynamicObject(19354, 249.1344, 2025.7977, 59.5415, -0.0999, 90.0000, -0.4999); //wall002
	SetDynamicObjectMaterial(g_Object[123], 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	g_Object[124] = CreateDynamicObject(19354, 256.2243, 2029.0480, 57.8382, 0.0000, 0.0000, -0.5999); //wall002
	SetDynamicObjectMaterial(g_Object[124], 0, 10871, "blacksky_sfse", "ws_glass_balustrade", 0x00000000);
	g_Object[125] = CreateDynamicObject(19354, 254.7546, 2033.4495, 57.8275, 0.0000, 1.7999, 89.2000); //wall002
	SetDynamicObjectMaterial(g_Object[125], 0, 10871, "blacksky_sfse", "ws_glass_balustrade", 0x00000000);
	g_Object[126] = CreateDynamicObject(19354, 256.2546, 2031.9182, 57.8282, 0.0000, 0.0000, -0.5999); //wall002
	SetDynamicObjectMaterial(g_Object[126], 0, 10871, "blacksky_sfse", "ws_glass_balustrade", 0x00000000);
	g_Object[127] = CreateDynamicObject(19354, 256.1908, 2025.8583, 57.8282, 0.0000, 0.0000, -0.5999); //wall002
	SetDynamicObjectMaterial(g_Object[127], 0, 10871, "blacksky_sfse", "ws_glass_balustrade", 0x00000000);
	g_Object[128] = CreateDynamicObject(3763, 251.3262, 2007.5228, 59.1224, 0.0000, 0.0000, 0.0000); //CE_radarmast3
	g_Object[129] = CreateDynamicObject(19354, 252.5543, 2025.7686, 59.5115, -0.0999, 90.0000, -0.4999); //wall002
	SetDynamicObjectMaterial(g_Object[129], 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	g_Object[130] = CreateDynamicObject(19354, 254.7039, 2025.7482, 59.5415, -0.0999, 90.0000, -0.4999); //wall002
	SetDynamicObjectMaterial(g_Object[130], 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	g_Object[131] = CreateDynamicObject(19354, 254.7318, 2028.9385, 59.5360, -0.0999, 90.0000, -0.4999); //wall002
	SetDynamicObjectMaterial(g_Object[131], 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	g_Object[132] = CreateDynamicObject(19354, 254.7596, 2032.1298, 59.5304, -0.0999, 90.0000, -0.4999); //wall002
	SetDynamicObjectMaterial(g_Object[132], 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	g_Object[133] = CreateDynamicObject(19354, 251.2696, 2032.1597, 59.5604, -0.0999, 90.0000, -0.4999); //wall002
	SetDynamicObjectMaterial(g_Object[133], 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	g_Object[134] = CreateDynamicObject(19354, 249.1798, 2032.1783, 59.5304, -0.0999, 90.0000, -0.4999); //wall002
	SetDynamicObjectMaterial(g_Object[134], 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	g_Object[135] = CreateDynamicObject(19354, 251.2319, 2028.9688, 59.5360, -0.0999, 90.0000, -0.4999); //wall002
	SetDynamicObjectMaterial(g_Object[135], 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	g_Object[136] = CreateDynamicObject(19354, 249.1621, 2028.9874, 59.5160, -0.0999, 90.0000, -0.4999); //wall002
	SetDynamicObjectMaterial(g_Object[136], 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	g_Object[137] = CreateDynamicObject(1682, 253.2794, 2028.0006, 65.9457, 0.0000, 0.0000, -130.7999); //ap_radar1_01
	g_Object[138] = CreateDynamicObject(1694, 251.6355, 1981.4855, 34.2709, 0.0000, 0.0000, 0.0000); //roofstuff13
	g_Object[139] = CreateDynamicObject(3763, 251.3262, 1966.8216, 59.1224, 0.0000, 0.0000, 0.0000); //CE_radarmast3
	g_Object[140] = CreateDynamicObject(19166, 247.6598, 2032.0111, 57.7993, 90.2000, 86.1000, 2.7999); //GTASAMap3
	g_Object[141] = CreateDynamicObject(2002, 255.4111, 2032.5754, 56.2158, 0.0000, 0.0000, -51.6999); //water_coolnu
	g_Object[142] = CreateDynamicObject(3388, 255.6600, 2031.7774, 53.9967, 0.0000, 0.0000, 0.0000); //a51_srack4_
	g_Object[143] = CreateDynamicObject(19354, 254.4486, 2031.1898, 55.2207, 0.0000, 0.0000, 90.0000); //wall002
	SetDynamicObjectMaterial(g_Object[143], 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	g_Object[144] = CreateDynamicObject(3394, 250.0886, 2032.6655, 56.0480, 0.0000, 0.0000, 88.8999); //a51_sdsk_2_
	g_Object[145] = CreateDynamicObject(3389, 248.0322, 2025.4442, 55.9392, 0.0000, 0.0000, 179.8000); //a51_srack1_
	g_Object[146] = CreateDynamicObject(3386, 248.0723, 2026.6484, 55.9365, 0.0000, 0.0000, 179.5000); //a51_srack2_
	g_Object[147] = CreateDynamicObject(19354, 252.9287, 2029.6689, 55.2207, 0.0000, 0.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[147], 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	g_Object[148] = CreateDynamicObject(19354, 254.3559, 2029.6699, 56.9284, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[148], 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	g_Object[149] = CreateDynamicObject(19354, 254.4686, 2028.1483, 55.2207, 0.0000, 0.0000, 90.0000); //wall002
	SetDynamicObjectMaterial(g_Object[149], 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	g_Object[150] = CreateDynamicObject(19354, 255.9987, 2029.6789, 55.2207, 0.0000, 0.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[150], 0, 16640, "a51", "ws_stationfloor", 0x00000000);
	g_Object[151] = CreateDynamicObject(1714, 249.2565, 2030.9490, 56.0823, 0.0000, 0.0000, 165.0000); //kb_swivelchair1
	g_Object[152] = CreateDynamicObject(3397, 251.4379, 2025.2744, 56.0565, 0.0000, 0.0000, -90.7999); //a51_sdsk_1_
	g_Object[153] = CreateDynamicObject(367, 252.7963, 2028.3295, 57.0367, 0.0000, 0.0000, 68.4000); //camera
	g_Object[154] = CreateDynamicObject(1714, 250.9989, 2027.1026, 56.0423, 0.0000, 0.0000, 35.5000); //kb_swivelchair1
	g_Object[155] = CreateDynamicObject(16613, 403.7176, 2060.6821, 20.6403, 0.0000, 0.0000, 157.7999); //des_bigtelescope
	g_Object[156] = CreateDynamicObject(1806, 251.5775, 2028.8802, 56.0379, 0.0000, 0.0000, -37.3999); //MED_OFFICE_CHAIR
	g_Object[157] = CreateDynamicObject(2066, 253.1792, 2032.5264, 56.0747, 0.0000, 0.0000, 0.0000); //CJ_M_FILEING2
	g_Object[158] = CreateDynamicObject(2609, 254.7507, 2025.0249, 56.7859, 0.0000, 0.0000, 178.6999); //CJ_P_FILEING1
	g_Object[159] = CreateDynamicObject(2894, 252.8502, 2030.4570, 57.0067, 0.0000, 0.0000, 86.9000); //kmb_rhymesbook
	g_Object[160] = CreateDynamicObject(974, 268.8215, 1801.4719, 19.3072, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[161] = CreateDynamicObject(1806, 251.6230, 2030.6669, 56.0379, 0.0000, 0.0000, -110.3999); //MED_OFFICE_CHAIR
	g_Object[162] = CreateDynamicObject(19825, 247.6900, 2032.1654, 59.0067, 0.0000, 0.0000, 85.8999); //SprunkClock1
	g_Object[163] = CreateDynamicObject(974, 268.8215, 1794.8033, 19.3072, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[164] = CreateDynamicObject(16293, 355.8671, 2028.7280, 20.7369, 0.0000, 0.0000, -139.1999); //a51_extfence03
	g_Object[165] = CreateDynamicObject(16293, 188.3571, 2081.9760, 21.7531, 0.0000, 0.0000, 118.3997); //a51_extfence03
	g_Object[166] = CreateDynamicObject(19913, 104.3358, 1941.3094, 21.5421, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[167] = CreateDynamicObject(19913, 54.3157, 1941.3094, 21.5421, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[168] = CreateDynamicObject(19913, 4.3558, 1941.3094, 21.5421, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[169] = CreateDynamicObject(19913, -45.6041, 1941.3094, 21.5421, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[170] = CreateDynamicObject(19913, -46.8141, 1941.3094, 21.5421, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[171] = CreateDynamicObject(19913, 190.7917, 1966.4042, 21.5421, 0.0000, 0.0000, 90.0999); //SAMPBigFence1
	g_Object[172] = CreateDynamicObject(19913, 192.3728, 2016.1370, 21.5421, 0.0000, 0.0000, 86.5000); //SAMPBigFence1
	g_Object[173] = CreateDynamicObject(19913, 168.9529, 2041.0775, 21.5421, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[174] = CreateDynamicObject(19913, 143.9829, 2066.0976, 21.5421, 0.0000, 0.0000, 90.0000); //SAMPBigFence1
	g_Object[175] = CreateDynamicObject(19913, 143.9829, 2111.1191, 21.5421, 0.0000, 0.0000, 90.0000); //SAMPBigFence1
	g_Object[176] = CreateDynamicObject(18850, 359.7612, 1982.6490, 5.2763, 0.0000, 0.0000, 0.0000); //HeliPad1
	g_Object[177] = CreateDynamicObject(18850, 359.7612, 1947.4774, 5.2763, 0.0000, 0.0000, 0.0000); //HeliPad1
	g_Object[178] = CreateDynamicObject(18850, 359.7612, 1911.8763, 5.2763, 0.0000, 0.0000, 0.0000); //HeliPad1
	g_Object[179] = CreateDynamicObject(18850, 359.7612, 1876.2159, 5.2763, 0.0000, 0.0000, 0.0000); //HeliPad1
	g_Object[180] = CreateDynamicObject(19913, 79.3258, 1910.7587, 21.5421, 0.0000, 0.0000, 90.0000); //SAMPBigFence1
	g_Object[181] = CreateDynamicObject(19913, 79.3258, 1866.3587, 21.5421, 0.0000, 0.0000, 90.0000); //SAMPBigFence1
	g_Object[182] = CreateDynamicObject(19913, 79.3258, 1816.4395, 21.5421, 0.0000, 0.0000, 90.0000); //SAMPBigFence1
	g_Object[183] = CreateDynamicObject(19913, 104.3058, 1791.4000, 21.5421, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[184] = CreateDynamicObject(19913, 154.2658, 1791.4000, 21.5421, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[185] = CreateDynamicObject(19913, 204.2459, 1791.4000, 21.5421, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[186] = CreateDynamicObject(19913, 243.8559, 1791.4000, 21.5421, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[187] = CreateDynamicObject(19384, 79.3026, 1743.6342, 18.2706, 0.0000, 0.0000, 0.0000); //wall032
	SetDynamicObjectMaterial(g_Object[187], 0, 16093, "a51_ext", "ws_whitewall2_top", 0x00000000);
	g_Object[188] = CreateDynamicObject(974, 268.8215, 1808.1616, 19.3072, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[189] = CreateDynamicObject(3279, 427.7201, 2137.5000, 19.3989, 0.0000, 0.0000, 0.0000); //a51_spottower
	g_Object[190] = CreateDynamicObject(974, 268.8014, 1812.2719, 19.3072, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[191] = CreateDynamicObject(974, 268.8014, 1830.5316, 19.3072, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[192] = CreateDynamicObject(974, 268.8014, 1837.1810, 19.3072, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[193] = CreateDynamicObject(974, 268.8014, 1843.8604, 19.3072, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[194] = CreateDynamicObject(974, 268.8014, 1850.5310, 19.3072, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[195] = CreateDynamicObject(974, 268.8014, 1857.2110, 19.3072, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[196] = CreateDynamicObject(974, 268.8014, 1863.8806, 19.3072, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[197] = CreateDynamicObject(974, 268.8014, 1870.5303, 19.3072, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[198] = CreateDynamicObject(974, 272.1115, 1873.8812, 19.3072, 0.0000, 0.0000, 0.0000); //tall_fence
	g_Object[199] = CreateDynamicObject(974, 275.4313, 1877.2504, 19.3072, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[200] = CreateDynamicObject(974, 275.4313, 1883.9302, 19.3072, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[201] = CreateDynamicObject(974, 275.4313, 1890.5610, 19.3072, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[202] = CreateDynamicObject(974, 275.4313, 1897.2408, 19.3072, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[203] = CreateDynamicObject(974, 275.4313, 1903.9305, 19.3072, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[204] = CreateDynamicObject(974, 275.4313, 1910.6302, 19.3072, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[205] = CreateDynamicObject(974, 275.4313, 1917.3004, 19.3072, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[206] = CreateDynamicObject(974, 275.4313, 1924.0103, 19.3072, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[207] = CreateDynamicObject(974, 275.4313, 1930.6506, 19.3072, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[208] = CreateDynamicObject(974, 275.4313, 1937.3498, 19.3072, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[209] = CreateDynamicObject(974, 275.4313, 1944.0601, 19.3072, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[210] = CreateDynamicObject(974, 275.4313, 1950.7406, 19.3072, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[211] = CreateDynamicObject(974, 275.4313, 1957.3605, 19.3072, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[212] = CreateDynamicObject(974, 272.1013, 1960.6809, 19.3072, 0.0000, 0.0000, 0.0000); //tall_fence
	g_Object[213] = CreateDynamicObject(974, 265.4714, 1960.6809, 19.3072, 0.0000, 0.0000, 0.0000); //tall_fence
	g_Object[214] = CreateDynamicObject(19913, 201.7731, 2041.0775, 21.5421, 0.0000, 0.0000, 0.0000); //SAMPBigFence1
	g_Object[215] = CreateDynamicObject(974, 230.0703, 2041.0823, 19.2975, 0.0000, 0.0000, 0.0000); //tall_fence
	g_Object[216] = CreateDynamicObject(974, 242.0877, 2039.7659, 19.2975, 0.0000, 0.0000, -11.7000); //tall_fence
	g_Object[217] = CreateDynamicObject(974, 245.3388, 2039.0924, 19.2975, 0.0000, 0.0000, -11.7000); //tall_fence
	g_Object[218] = CreateDynamicObject(3279, -70.3659, 1642.8405, 19.5111, 0.0000, 0.0000, 0.0000); //a51_spottower
	g_Object[219] = CreateDynamicObject(3279, -71.7959, 1778.9311, 16.0911, 0.0000, 0.0000, 0.0000); //a51_spottower
	g_Object[220] = CreateDynamicObject(3279, -70.3659, 1899.3603, 16.0411, 0.0000, 0.0000, 0.0000); //a51_spottower
	g_Object[221] = CreateDynamicObject(3279, -70.3659, 2053.8718, 16.7411, 0.0000, 0.0000, 0.0000); //a51_spottower
	g_Object[222] = CreateDynamicObject(3279, -70.3659, 2076.2524, 16.7411, 0.0000, 0.0000, 0.0000); //a51_spottower
	g_Object[223] = CreateDynamicObject(3279, -70.3659, 2135.9333, 19.2611, 0.0000, 0.0000, 0.0000); //a51_spottower
	g_Object[224] = CreateDynamicObject(16093, -54.4338, 2078.2207, 20.4856, 0.0000, 0.0000, 2.4999); //a51_gatecontrol
	g_Object[225] = CreateDynamicObject(3279, 430.7301, 2006.6705, 15.9989, 0.0000, 0.0000, 0.0000); //a51_spottower
	g_Object[226] = CreateDynamicObject(3279, 430.7301, 1840.2894, 19.0489, 0.0000, 0.0000, 177.3000); //a51_spottower
	g_Object[227] = CreateDynamicObject(3279, 379.6485, 1739.3433, 19.3689, 0.0000, 0.0000, 177.3000); //a51_spottower
	g_Object[228] = CreateDynamicObject(3279, 210.2398, 1637.8170, 17.6682, 0.0000, 2.5000, 89.9000); //a51_spottower
	g_Object[229] = CreateDynamicObject(3279, 60.4101, 1638.0450, 16.9189, 0.0000, 2.5000, 89.9000); //a51_spottower
	g_Object[230] = CreateDynamicObject(5837, -89.3654, 2055.6616, 18.0871, -4.0999, 0.0000, 1.6000); //ci_guardhouse1
	g_Object[231] = CreateDynamicObject(3264, -121.0606, 2069.8833, 16.2774, 0.0000, 0.0000, -65.4000); //privatesign3
	g_Object[232] = CreateDynamicObject(16638, -54.3218, 2077.3352, 18.6582, 0.0000, 0.0000, 2.0000); //a51_gatecon_a
	g_Object[233] = CreateDynamicObject(16093, 147.5537, 1949.4953, 22.4041, 0.0000, 0.0000, -90.0000); //a51_gatecontrol
	g_Object[234] = CreateDynamicObject(16638, 146.5897, 1949.4132, 20.6405, 0.0000, 0.0000, -90.0000); //a51_gatecon_a
	g_Object[235] = CreateDynamicObject(19425, -110.7434, 2065.4550, 16.4416, 0.0000, 0.0000, 90.0000); //speed_bump01
	g_Object[236] = CreateDynamicObject(19425, -112.2734, 2065.4550, 16.4416, 0.0000, 0.0000, 90.0000); //speed_bump01
	g_Object[237] = CreateDynamicObject(19425, -113.9434, 2065.4550, 16.4416, 0.0000, 0.0000, 90.0000); //speed_bump01
	g_Object[238] = CreateDynamicObject(19425, -115.5634, 2065.4550, 16.4416, 0.0000, 0.0000, 90.0000); //speed_bump01
	g_Object[239] = CreateDynamicObject(19425, -108.8334, 2065.4550, 16.4416, 0.0000, 0.0000, 90.0000); //speed_bump01
	g_Object[240] = CreateDynamicObject(19425, -106.9534, 2065.4550, 16.4416, 0.0000, 0.0000, 90.0000); //speed_bump01
	g_Object[241] = CreateDynamicObject(19425, -106.9534, 2059.6230, 16.4416, 0.0000, 0.0000, 90.0000); //speed_bump01
	g_Object[242] = CreateDynamicObject(19425, -108.8534, 2059.6230, 16.4416, 0.0000, 0.0000, 90.0000); //speed_bump01
	g_Object[243] = CreateDynamicObject(19425, -110.7634, 2059.6230, 16.4416, 0.0000, 0.0000, 90.0000); //speed_bump01
	g_Object[244] = CreateDynamicObject(19425, -112.3134, 2059.6230, 16.4416, 0.0000, 0.0000, 90.0000); //speed_bump01
	g_Object[245] = CreateDynamicObject(19425, -113.9534, 2059.6230, 16.4416, 0.0000, 0.0000, 90.0000); //speed_bump01
	g_Object[246] = CreateDynamicObject(19425, -115.5434, 2059.6230, 16.4416, 0.0000, 0.0000, 90.0000); //speed_bump01
	g_Object[247] = CreateDynamicObject(12959, 70.7983, 1874.3952, 16.7611, 0.0000, 0.0000, -90.0000); //sw_library
	g_Object[248] = CreateDynamicObject(3265, -131.8640, 2053.8457, 16.3468, 0.0000, 0.0000, -132.5998); //privatesign4
	g_Object[249] = CreateDynamicObject(3265, -153.4617, 2049.0620, 16.3468, 0.0000, 0.0000, -132.5998); //privatesign4
	g_Object[250] = CreateDynamicObject(19982, -143.8654, 2052.5866, 15.9048, 0.0000, 0.0000, -99.2000); //SAMPRoadSign35
	g_Object[251] = CreateDynamicObject(1616, -94.3187, 2055.2832, 20.3116, 0.0000, 0.0000, 0.0000); //nt_securecam1_01
	g_Object[252] = CreateDynamicObject(7313, 255.7046, 2029.3643, 58.4389, 0.0000, 0.0000, -90.1999); //vgsN_scrollsgn01
	SetDynamicObjectMaterialTextEx(g_Object[252], "PATH IS CLEAR", 0, OBJECT_MATERIAL_SIZE_256x128, "Arial", 30, 1, 0xFF006400, 0xFF000000, 1);
	g_Object[253] = CreateDynamicObject(16564, 59.1560, 1834.5476, 16.6393, 0.0000, 0.0000, 90.4000); //des_stmedicentre_
	g_Object[254] = CreateDynamicObject(19427, 66.6651, 1871.6002, 22.6881, -89.9000, -0.0999, 0.0000); //wall067
	SetDynamicObjectMaterial(g_Object[254], 0, 12855, "cunte_cop", "sw_brick05", 0x00000000);
	g_Object[255] = CreateDynamicObject(4988, 66.5490, 1875.0112, 22.7384, 0.0000, 0.0000, 100.1000); //lasbillbrd1_las
	SetDynamicObjectMaterialTextEx(g_Object[255], "Academy", 0, OBJECT_MATERIAL_SIZE_256x128, "Arial", 30, 1, 0xFF006400, 0x00000000, 1);
	g_Object[256] = CreateDynamicObject(4199, 73.4008, 1906.6391, 18.7048, 0.0000, 0.0000, 180.0000); //garages1_LAn
	g_Object[257] = CreateDynamicObject(19427, 66.6590, 1875.0809, 22.6942, -89.9000, -0.0999, 0.0000); //wall067
	SetDynamicObjectMaterial(g_Object[257], 0, 12855, "cunte_cop", "sw_brick05", 0x00000000);
	g_Object[258] = CreateDynamicObject(19427, 66.6529, 1878.5809, 22.7003, -89.9000, -0.0999, 0.0000); //wall067
	SetDynamicObjectMaterial(g_Object[258], 0, 12855, "cunte_cop", "sw_brick05", 0x00000000);
	g_Object[259] = CreateDynamicObject(19913, 179.2960, 1766.4306, 21.5421, 0.0000, 0.0000, 90.0000); //SAMPBigFence1
	g_Object[260] = CreateDynamicObject(19913, 179.2960, 1716.4704, 21.5421, 0.0000, 0.0000, 90.0000); //SAMPBigFence1
	g_Object[261] = CreateDynamicObject(19913, 179.2960, 1676.1417, 21.5421, 0.0000, 0.0000, 90.0000); //SAMPBigFence1
	g_Object[262] = CreateDynamicObject(13077, -12.6973, 1923.9482, 21.5173, 0.0000, 0.0000, 180.0000); //CE_townware
	g_Object[263] = CreateDynamicObject(19905, -8.6536, 1856.1113, 16.4646, 0.0000, 0.0000, 90.0000); //A51Building1
	g_Object[264] = CreateDynamicObject(11245, 2.2229, 1856.7526, 21.7355, 0.0000, 0.0000, 0.0000); //sfsefirehseflag
	g_Object[265] = CreateDynamicObject(19905, -8.6536, 1817.1300, 16.4646, 0.0000, 0.0000, 90.0000); //A51Building1
	g_Object[266] = CreateDynamicObject(19907, -7.4307, 1776.5838, 16.6318, 0.0000, 0.0000, 179.6000); //A51Building2
	g_Object[267] = CreateDynamicObject(19907, 23.5361, 1752.1343, 16.7618, 0.0000, 0.0000, -87.3999); //A51Building2
	g_Object[268] = CreateDynamicObject(19907, 50.9281, 1781.7507, 16.5618, 0.0000, 0.0000, -3.9999); //A51Building2
	g_Object[269] = CreateDynamicObject(19354, 79.3334, 1750.0531, 18.2808, 0.0000, 0.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[269], 0, 16093, "a51_ext", "ws_whitewall2_top", 0x00000000);
	g_Object[270] = CreateDynamicObject(11245, 2.2229, 1817.3022, 21.7355, 0.0000, 0.0000, 0.0000); //sfsefirehseflag
	g_Object[271] = CreateDynamicObject(11245, 3.8029, 1772.1619, 23.7855, 0.0000, 0.0000, 0.0000); //sfsefirehseflag
	g_Object[272] = CreateDynamicObject(11245, 27.1068, 1763.5399, 24.6455, 0.0000, 0.0000, 91.7000); //sfsefirehseflag
	g_Object[273] = CreateDynamicObject(11245, 40.0361, 1786.7851, 24.1955, 0.0000, 0.0000, 174.8001); //sfsefirehseflag
	g_Object[274] = CreateDynamicObject(974, 79.3295, 1788.1009, 19.3063, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[275] = CreateDynamicObject(974, 79.3295, 1781.4711, 19.3063, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[276] = CreateDynamicObject(974, 79.3295, 1774.8713, 19.3063, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[277] = CreateDynamicObject(974, 79.3295, 1768.2406, 19.3063, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[278] = CreateDynamicObject(974, 79.3295, 1761.5908, 19.3063, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[279] = CreateDynamicObject(974, 79.3295, 1754.9501, 19.3063, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[280] = CreateDynamicObject(19327, 90.3851, 1737.8306, 19.4949, 0.0000, 0.0000, -121.6999); //7_11_sign02
	SetDynamicObjectMaterialTextEx(g_Object[280], "Weapons Usage", 0, OBJECT_MATERIAL_SIZE_256x128, "Arial", 30, 1, 0xFFFFFFFF, 0x00000000, 1);
	g_Object[281] = CreateDynamicObject(1499, 79.3101, 1742.9019, 16.5103, 0.0000, 0.0000, 90.0000); //Gen_doorINT05
	g_Object[282] = CreateDynamicObject(2040, 88.6193, 1751.2484, 18.9306, 0.0000, 0.0000, 90.0000); //AMMO_BOX_M1
	g_Object[283] = CreateDynamicObject(19354, 79.3334, 1746.8433, 18.2808, 0.0000, 0.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[283], 0, 16093, "a51_ext", "ws_whitewall2_top", 0x00000000);
	g_Object[284] = CreateDynamicObject(19354, 79.3334, 1740.4238, 18.2808, 0.0000, 0.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[284], 0, 16093, "a51_ext", "ws_whitewall2_top", 0x00000000);
	g_Object[285] = CreateDynamicObject(19354, 79.3334, 1737.2440, 18.2808, 0.0000, 0.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[285], 0, 16093, "a51_ext", "ws_whitewall2_top", 0x00000000);
	g_Object[286] = CreateDynamicObject(19354, 80.8633, 1735.6529, 18.2808, 0.0000, 0.0000, 90.0000); //wall002
	SetDynamicObjectMaterial(g_Object[286], 0, 16093, "a51_ext", "ws_whitewall2_top", 0x00000000);
	g_Object[287] = CreateDynamicObject(19354, 84.0533, 1735.6529, 18.2808, 0.0000, 0.0000, 90.0000); //wall002
	SetDynamicObjectMaterial(g_Object[287], 0, 16093, "a51_ext", "ws_whitewall2_top", 0x00000000);
	g_Object[288] = CreateDynamicObject(19354, 87.2534, 1735.6529, 18.2808, 0.0000, 0.0000, 90.0000); //wall002
	SetDynamicObjectMaterial(g_Object[288], 0, 16093, "a51_ext", "ws_whitewall2_top", 0x00000000);
	g_Object[289] = CreateDynamicObject(19354, 90.4533, 1735.6529, 18.2808, 0.0000, 0.0000, 90.0000); //wall002
	SetDynamicObjectMaterial(g_Object[289], 0, 16093, "a51_ext", "ws_whitewall2_top", 0x00000000);
	g_Object[290] = CreateDynamicObject(19354, 91.9633, 1737.1840, 18.2808, 0.0000, 0.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[290], 0, 16093, "a51_ext", "ws_whitewall2_top", 0x00000000);
	g_Object[291] = CreateDynamicObject(19384, 91.9626, 1743.5742, 18.2806, 0.0000, 0.0000, 0.0000); //wall032
	SetDynamicObjectMaterial(g_Object[291], 0, 16093, "a51_ext", "ws_whitewall2_top", 0x00000000);
	g_Object[292] = CreateDynamicObject(19354, 91.9633, 1740.3839, 18.2808, 0.0000, 0.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[292], 0, 16093, "a51_ext", "ws_whitewall2_top", 0x00000000);
	g_Object[293] = CreateDynamicObject(1499, 92.0100, 1742.8319, 16.5103, 0.0000, 0.0000, 90.0000); //Gen_doorINT05
	g_Object[294] = CreateDynamicObject(19354, 81.0134, 1751.5734, 18.2808, 0.0000, 0.0000, 90.0000); //wall002
	SetDynamicObjectMaterial(g_Object[294], 0, 16093, "a51_ext", "ws_whitewall2_top", 0x00000000);
	g_Object[295] = CreateDynamicObject(19354, 84.2033, 1751.5734, 18.2808, 0.0000, 0.0000, 90.0000); //wall002
	SetDynamicObjectMaterial(g_Object[295], 0, 16093, "a51_ext", "ws_whitewall2_top", 0x00000000);
	g_Object[296] = CreateDynamicObject(19354, 87.3934, 1751.5734, 18.2808, 0.0000, 0.0000, 90.0000); //wall002
	SetDynamicObjectMaterial(g_Object[296], 0, 16093, "a51_ext", "ws_whitewall2_top", 0x00000000);
	g_Object[297] = CreateDynamicObject(19354, 90.4434, 1751.5734, 18.2808, 0.0000, 0.0000, 90.0000); //wall002
	SetDynamicObjectMaterial(g_Object[297], 0, 16093, "a51_ext", "ws_whitewall2_top", 0x00000000);
	g_Object[298] = CreateDynamicObject(19354, 91.9633, 1746.7652, 18.2808, 0.0000, 0.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[298], 0, 16093, "a51_ext", "ws_whitewall2_top", 0x00000000);
	g_Object[299] = CreateDynamicObject(19354, 91.9633, 1749.9470, 18.2808, 0.0000, 0.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[299], 0, 16093, "a51_ext", "ws_whitewall2_top", 0x00000000);
	g_Object[300] = CreateDynamicObject(19354, 90.1281, 1737.1893, 16.5989, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[300], 0, 16640, "a51", "concretegroundl1_256", 0x00000000);
	g_Object[301] = CreateDynamicObject(19354, 90.1281, 1740.3894, 16.5989, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[301], 0, 16640, "a51", "concretegroundl1_256", 0x00000000);
	g_Object[302] = CreateDynamicObject(19354, 90.1281, 1743.5895, 16.5989, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[302], 0, 16640, "a51", "concretegroundl1_256", 0x00000000);
	g_Object[303] = CreateDynamicObject(19354, 90.1281, 1746.7985, 16.5989, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[303], 0, 16640, "a51", "concretegroundl1_256", 0x00000000);
	g_Object[304] = CreateDynamicObject(19354, 90.1281, 1749.9896, 16.5989, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[304], 0, 16640, "a51", "concretegroundl1_256", 0x00000000);
	g_Object[305] = CreateDynamicObject(19354, 86.6281, 1749.9793, 16.6189, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[305], 0, 16640, "a51", "concretegroundl1_256", 0x00000000);
	g_Object[306] = CreateDynamicObject(19354, 83.1581, 1749.9896, 16.5989, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[306], 0, 16640, "a51", "concretegroundl1_256", 0x00000000);
	g_Object[307] = CreateDynamicObject(19354, 81.1381, 1749.9896, 16.5889, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[307], 0, 16640, "a51", "concretegroundl1_256", 0x00000000);
	g_Object[308] = CreateDynamicObject(19354, 86.6281, 1743.6093, 16.6189, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[308], 0, 16640, "a51", "concretegroundl1_256", 0x00000000);
	g_Object[309] = CreateDynamicObject(19354, 83.1681, 1737.1893, 16.5989, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[309], 0, 16640, "a51", "concretegroundl1_256", 0x00000000);
	g_Object[310] = CreateDynamicObject(19354, 81.1582, 1737.1893, 16.5889, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[310], 0, 16640, "a51", "concretegroundl1_256", 0x00000000);
	g_Object[311] = CreateDynamicObject(19354, 81.1582, 1740.3791, 16.5889, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[311], 0, 16640, "a51", "concretegroundl1_256", 0x00000000);
	g_Object[312] = CreateDynamicObject(19354, 81.1582, 1743.5895, 16.5889, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[312], 0, 16640, "a51", "concretegroundl1_256", 0x00000000);
	g_Object[313] = CreateDynamicObject(19354, 81.1582, 1746.8006, 16.5889, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[313], 0, 16640, "a51", "concretegroundl1_256", 0x00000000);
	g_Object[314] = CreateDynamicObject(19354, 83.1681, 1740.3995, 16.5989, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[314], 0, 16640, "a51", "concretegroundl1_256", 0x00000000);
	g_Object[315] = CreateDynamicObject(19354, 83.1681, 1743.6102, 16.5989, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[315], 0, 16640, "a51", "concretegroundl1_256", 0x00000000);
	g_Object[316] = CreateDynamicObject(19354, 83.1681, 1746.8106, 16.5989, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[316], 0, 16640, "a51", "concretegroundl1_256", 0x00000000);
	g_Object[317] = CreateDynamicObject(19354, 86.6281, 1740.4086, 16.6189, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[317], 0, 16640, "a51", "concretegroundl1_256", 0x00000000);
	g_Object[318] = CreateDynamicObject(19354, 86.6281, 1737.1961, 16.6189, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[318], 0, 16640, "a51", "concretegroundl1_256", 0x00000000);
	g_Object[319] = CreateDynamicObject(19354, 90.1281, 1749.9896, 19.9389, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[319], 0, 16640, "a51", "concretegroundl1_256", 0x00000000);
	g_Object[320] = CreateDynamicObject(19354, 86.6281, 1746.7985, 16.6189, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[320], 0, 16640, "a51", "concretegroundl1_256", 0x00000000);
	g_Object[321] = CreateDynamicObject(19354, 90.1281, 1746.7989, 19.9389, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[321], 0, 16640, "a51", "concretegroundl1_256", 0x00000000);
	g_Object[322] = CreateDynamicObject(19354, 90.1281, 1743.5986, 19.9389, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[322], 0, 16640, "a51", "concretegroundl1_256", 0x00000000);
	g_Object[323] = CreateDynamicObject(19354, 90.1281, 1740.3884, 19.9389, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[323], 0, 16640, "a51", "concretegroundl1_256", 0x00000000);
	g_Object[324] = CreateDynamicObject(19354, 90.1281, 1737.1956, 19.9389, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[324], 0, 16640, "a51", "concretegroundl1_256", 0x00000000);
	g_Object[325] = CreateDynamicObject(19354, 86.6381, 1749.9896, 19.9389, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[325], 0, 16640, "a51", "concretegroundl1_256", 0x00000000);
	g_Object[326] = CreateDynamicObject(19354, 83.1381, 1749.9896, 19.9389, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[326], 0, 16640, "a51", "concretegroundl1_256", 0x00000000);
	g_Object[327] = CreateDynamicObject(19354, 81.1381, 1749.9896, 19.9089, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[327], 0, 16640, "a51", "concretegroundl1_256", 0x00000000);
	g_Object[328] = CreateDynamicObject(19354, 81.1381, 1746.7893, 19.9089, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[328], 0, 16640, "a51", "concretegroundl1_256", 0x00000000);
	g_Object[329] = CreateDynamicObject(19354, 81.1381, 1743.6096, 19.9089, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[329], 0, 16640, "a51", "concretegroundl1_256", 0x00000000);
	g_Object[330] = CreateDynamicObject(19354, 81.1381, 1740.4195, 19.9089, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[330], 0, 16640, "a51", "concretegroundl1_256", 0x00000000);
	g_Object[331] = CreateDynamicObject(19354, 81.1381, 1737.2193, 19.9089, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[331], 0, 16640, "a51", "concretegroundl1_256", 0x00000000);
	g_Object[332] = CreateDynamicObject(19354, 84.6382, 1737.2193, 19.9089, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[332], 0, 16640, "a51", "concretegroundl1_256", 0x00000000);
	g_Object[333] = CreateDynamicObject(19354, 88.1281, 1737.2193, 19.9089, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[333], 0, 16640, "a51", "concretegroundl1_256", 0x00000000);
	g_Object[334] = CreateDynamicObject(19354, 88.1281, 1740.4388, 19.9089, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[334], 0, 16640, "a51", "concretegroundl1_256", 0x00000000);
	g_Object[335] = CreateDynamicObject(19354, 88.1281, 1743.6295, 19.9089, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[335], 0, 16640, "a51", "concretegroundl1_256", 0x00000000);
	g_Object[336] = CreateDynamicObject(19354, 88.1281, 1746.8404, 19.9089, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[336], 0, 16640, "a51", "concretegroundl1_256", 0x00000000);
	g_Object[337] = CreateDynamicObject(19354, 84.6281, 1746.8404, 19.9089, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[337], 0, 16640, "a51", "concretegroundl1_256", 0x00000000);
	g_Object[338] = CreateDynamicObject(19354, 84.6281, 1743.6406, 19.9089, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[338], 0, 16640, "a51", "concretegroundl1_256", 0x00000000);
	g_Object[339] = CreateDynamicObject(19354, 84.6281, 1740.4395, 19.9089, 0.0000, 90.0000, 0.0000); //wall002
	SetDynamicObjectMaterial(g_Object[339], 0, 16640, "a51", "concretegroundl1_256", 0x00000000);
	g_Object[340] = CreateDynamicObject(1744, 88.9050, 1751.6475, 17.3175, 0.0000, 0.0000, 0.0000); //MED_SHELF
	g_Object[341] = CreateDynamicObject(1744, 84.9750, 1751.6475, 17.3175, 0.0000, 0.0000, 0.0000); //MED_SHELF
	g_Object[342] = CreateDynamicObject(1744, 81.0450, 1751.6475, 17.3175, 0.0000, 0.0000, 0.0000); //MED_SHELF
	g_Object[343] = CreateDynamicObject(1744, 88.9050, 1751.6475, 18.4675, 0.0000, 0.0000, 0.0000); //MED_SHELF
	g_Object[344] = CreateDynamicObject(1744, 84.9550, 1751.6475, 18.5175, 0.0000, 0.0000, 0.0000); //MED_SHELF
	g_Object[345] = CreateDynamicObject(1744, 81.0550, 1751.6475, 18.5175, 0.0000, 0.0000, 0.0000); //MED_SHELF
	g_Object[346] = CreateDynamicObject(356, 88.6311, 1751.2349, 17.9015, -175.3000, 90.0000, 90.4999); //m4
	g_Object[347] = CreateDynamicObject(356, 88.9748, 1751.2377, 17.9335, -175.3000, 90.0000, 90.4999); //m4
	g_Object[348] = CreateDynamicObject(356, 89.1957, 1751.2392, 17.9354, -175.3000, 90.0000, 90.4999); //m4
	g_Object[349] = CreateDynamicObject(356, 89.3352, 1751.2407, 17.9239, -175.3000, 90.0000, 90.4999); //m4
	g_Object[350] = CreateDynamicObject(356, 89.4963, 1751.2423, 17.9307, -175.3000, 90.0000, 90.4999); //m4
	g_Object[351] = CreateDynamicObject(356, 89.6865, 1751.2445, 17.9251, -175.3000, 90.0000, 90.4999); //m4
	g_Object[352] = CreateDynamicObject(356, 89.9887, 1751.2468, 17.9404, -175.3000, 90.0000, 90.4999); //m4
	g_Object[353] = CreateDynamicObject(19832, 85.5512, 1751.3211, 18.8341, 0.0000, 0.0000, 0.0000); //AmmoBox1
	g_Object[354] = CreateDynamicObject(2040, 89.3294, 1751.2484, 18.9306, 0.0000, 0.0000, 90.0000); //AMMO_BOX_M1
	g_Object[355] = CreateDynamicObject(2040, 90.0294, 1751.2484, 18.9306, 0.0000, 0.0000, 90.0000); //AMMO_BOX_M1
	g_Object[356] = CreateDynamicObject(349, 84.6439, 1751.3416, 17.9624, -7.1999, -80.0000, -88.1000); //chromegun
	g_Object[357] = CreateDynamicObject(349, 84.7953, 1751.3438, 17.9631, -7.1999, -80.0000, -88.1000); //chromegun
	g_Object[358] = CreateDynamicObject(349, 84.9367, 1751.3450, 17.9651, -7.1999, -80.0000, -88.1000); //chromegun
	g_Object[359] = CreateDynamicObject(349, 85.0980, 1751.3474, 17.9646, -7.1999, -80.0000, -88.1000); //chromegun
	g_Object[360] = CreateDynamicObject(349, 85.3299, 1751.3504, 17.9651, -7.1999, -80.0000, -88.1000); //chromegun
	g_Object[361] = CreateDynamicObject(349, 85.4614, 1751.3515, 17.9684, -7.1999, -80.0000, -88.1000); //chromegun
	g_Object[362] = CreateDynamicObject(349, 85.5929, 1751.3526, 17.9716, -7.1999, -80.0000, -88.1000); //chromegun
	g_Object[363] = CreateDynamicObject(349, 85.7542, 1751.3553, 17.9711, -7.1999, -80.0000, -88.1000); //chromegun
	g_Object[364] = CreateDynamicObject(349, 85.9551, 1751.3588, 17.9656, -7.1999, -80.0000, -88.1000); //chromegun
	g_Object[365] = CreateDynamicObject(3077, 90.4343, 1737.8359, 16.6576, 0.0000, 0.0000, -121.6999); //nf_blackboard
	g_Object[366] = CreateDynamicObject(19832, 84.8812, 1751.3211, 18.8441, 0.0000, 0.0000, 0.0000); //AmmoBox1
	g_Object[367] = CreateDynamicObject(19142, 80.9547, 1751.3043, 17.9204, 0.0000, -90.0000, 180.0000); //SWATArmour1
	g_Object[368] = CreateDynamicObject(19142, 81.4447, 1751.3043, 17.9204, 0.0000, -90.0000, 180.0000); //SWATArmour1
	g_Object[369] = CreateDynamicObject(19142, 82.0548, 1751.3043, 17.9204, 0.0000, -90.0000, 180.0000); //SWATArmour1
	g_Object[370] = CreateDynamicObject(19142, 82.0548, 1751.3043, 19.1204, 0.0000, -90.0000, 180.0000); //SWATArmour1
	g_Object[371] = CreateDynamicObject(19142, 81.4448, 1751.3043, 19.1204, 0.0000, -90.0000, 180.0000); //SWATArmour1
	g_Object[372] = CreateDynamicObject(19142, 80.8848, 1751.3043, 19.1204, 0.0000, -90.0000, 180.0000); //SWATArmour1
	g_Object[373] = CreateDynamicObject(2977, 83.4626, 1750.8349, 16.4698, 0.0000, 0.0000, 0.0000); //kmilitary_crate
	g_Object[374] = CreateDynamicObject(2977, 87.4026, 1750.8349, 16.4698, 0.0000, 0.0000, 0.0000); //kmilitary_crate
	g_Object[375] = CreateDynamicObject(3015, 90.5762, 1751.0471, 16.7590, 0.0000, 0.0000, 0.0000); //cr_cratestack
	g_Object[376] = CreateDynamicObject(3015, 89.4562, 1750.6567, 16.7590, 0.0000, 0.0000, 0.0000); //cr_cratestack
	g_Object[377] = CreateDynamicObject(3015, 90.1962, 1750.0261, 16.7590, 0.0000, 0.0000, 0.0000); //cr_cratestack
	g_Object[378] = CreateDynamicObject(11730, 80.0011, 1736.2381, 16.6620, 0.0000, 0.0000, 151.0999); //GymLockerOpen1
	g_Object[379] = CreateDynamicObject(11729, 80.8211, 1736.1632, 16.6570, 0.0000, 0.0000, 177.4000); //GymLockerClosed1
	g_Object[380] = CreateDynamicObject(11729, 81.6202, 1736.1268, 16.6570, 0.0000, 0.0000, 177.4000); //GymLockerClosed1
	g_Object[381] = CreateDynamicObject(11729, 82.4294, 1736.0899, 16.6570, 0.0000, 0.0000, 177.4000); //GymLockerClosed1
	g_Object[382] = CreateDynamicObject(1687, 83.8888, 1742.8668, 20.6583, 0.0000, 0.0000, 0.0000); //gen_roofbit1
	g_Object[383] = CreateDynamicObject(1687, 89.7237, 1739.0395, 20.6783, 0.0000, 0.0000, 87.5999); //gen_roofbit1
	g_Object[384] = CreateDynamicObject(1689, 81.0675, 1743.9287, 21.1715, 0.0000, 0.0000, 91.2999); //gen_roofbit3
	g_Object[385] = CreateDynamicObject(1689, 90.3168, 1744.1572, 21.2115, 0.0000, 0.0000, -90.8000); //gen_roofbit3
	g_Object[386] = CreateDynamicObject(11729, 83.2585, 1736.0522, 16.6570, 0.0000, 0.0000, 177.4000); //GymLockerClosed1
	g_Object[387] = CreateDynamicObject(11729, 84.0876, 1736.0145, 16.6570, 0.0000, 0.0000, 177.4000); //GymLockerClosed1
	g_Object[388] = CreateDynamicObject(1368, 83.1330, 1739.3514, 17.3523, 0.0000, 0.0000, 88.2000); //CJ_BLOCKER_BENCH
	g_Object[389] = CreateDynamicObject(1368, 82.2530, 1739.3614, 17.3523, 0.0000, 0.0000, -90.0000); //CJ_BLOCKER_BENCH
	g_Object[390] = CreateDynamicObject(964, 80.9785, 1748.8138, 16.6850, 0.0000, 0.0000, 44.3999); //CJ_METAL_CRATE
	g_Object[391] = CreateDynamicObject(964, 85.2154, 1749.5898, 16.6450, 0.0000, 0.0000, 44.3999); //CJ_METAL_CRATE
	g_Object[392] = CreateDynamicObject(964, 90.0110, 1747.6799, 16.6450, 0.0000, 0.0000, 44.3999); //CJ_METAL_CRATE
	g_Object[393] = CreateDynamicObject(964, 87.1375, 1748.1131, 16.6450, 0.0000, 0.0000, 44.3999); //CJ_METAL_CRATE
	g_Object[394] = CreateDynamicObject(964, 83.8936, 1748.2950, 16.6450, 0.0000, 0.0000, 44.3999); //CJ_METAL_CRATE
	g_Object[395] = CreateDynamicObject(19991, 107.5989, 1757.6691, 16.4758, 0.0000, 0.0000, -84.8000); //SAMPRoadSign44
	SetDynamicObjectMaterial(g_Object[395], 2, 18064, "ab_sfammuunits", "gun_targetc", 0x00000000);
	g_Object[396] = CreateDynamicObject(1811, 87.2542, 1739.6466, 17.2291, 0.0000, 0.0000, 134.6000); //MED_DIN_CHAIR_5
	g_Object[397] = CreateDynamicObject(1811, 88.0587, 1740.4411, 17.2291, 0.0000, 0.0000, 134.6000); //MED_DIN_CHAIR_5
	g_Object[398] = CreateDynamicObject(1811, 88.7992, 1741.1728, 17.2291, 0.0000, 0.0000, 134.6000); //MED_DIN_CHAIR_5
	g_Object[399] = CreateDynamicObject(1811, 87.6547, 1742.3337, 17.2291, 0.0000, 0.0000, 134.6000); //MED_DIN_CHAIR_5
	g_Object[400] = CreateDynamicObject(1811, 86.9641, 1741.6513, 17.2291, 0.0000, 0.0000, 134.6000); //MED_DIN_CHAIR_5
	g_Object[401] = CreateDynamicObject(1811, 86.0883, 1740.7866, 17.2291, 0.0000, 0.0000, 134.6000); //MED_DIN_CHAIR_5
	g_Object[402] = CreateDynamicObject(19327, 90.3851, 1737.8306, 19.1749, 0.0000, 0.0000, -121.6999); //7_11_sign02
	SetDynamicObjectMaterialTextEx(g_Object[402], "Sniper For long range", 0, OBJECT_MATERIAL_SIZE_256x128, "Arial", 20, 1, 0xFFFFFFFF, 0x00000000, 1);
	g_Object[403] = CreateDynamicObject(19327, 90.3851, 1737.8306, 18.8449, 0.0000, 0.0000, -121.6999); //7_11_sign02
	SetDynamicObjectMaterialTextEx(g_Object[403], "M4 Carbon for medium range", 0, OBJECT_MATERIAL_SIZE_256x128, "Arial", 18, 1, 0xFFFFFFFF, 0x00000000, 1);
	g_Object[404] = CreateDynamicObject(19327, 90.3851, 1737.8306, 18.5649, 0.0000, 0.0000, -121.6999); //7_11_sign02
	SetDynamicObjectMaterialTextEx(g_Object[404], "Shotgun for close range", 0, OBJECT_MATERIAL_SIZE_256x128, "Arial", 18, 1, 0xFFFFFFFF, 0x00000000, 1);
	g_Object[405] = CreateDynamicObject(19327, 90.3851, 1737.8306, 18.1848, 0.0000, 0.0000, -121.6999); //7_11_sign02
	SetDynamicObjectMaterialTextEx(g_Object[405], "Deagle for close range", 0, OBJECT_MATERIAL_SIZE_256x128, "Arial", 18, 1, 0xFFFFFFFF, 0x00000000, 1);
	g_Object[406] = CreateDynamicObject(3865, 122.9136, 1727.4986, 17.1366, 0.0000, 0.0000, 90.4999); //concpipe_SFXRF
	g_Object[407] = CreateDynamicObject(974, 79.3295, 1732.2108, 19.3063, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[408] = CreateDynamicObject(974, 79.3295, 1725.6002, 19.3063, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[409] = CreateDynamicObject(974, 79.3295, 1718.9697, 19.3063, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[410] = CreateDynamicObject(974, 79.3295, 1712.3684, 19.3063, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[411] = CreateDynamicObject(974, 79.3295, 1705.7189, 19.3063, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[412] = CreateDynamicObject(974, 79.3295, 1699.0693, 19.3063, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[413] = CreateDynamicObject(974, 79.3295, 1692.4492, 19.3063, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[414] = CreateDynamicObject(974, 79.3295, 1685.8192, 19.3063, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[415] = CreateDynamicObject(974, 79.3295, 1679.1594, 19.3063, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[416] = CreateDynamicObject(974, 79.3295, 1672.5394, 19.3063, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[417] = CreateDynamicObject(974, 79.3295, 1665.9387, 19.3063, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[418] = CreateDynamicObject(974, 79.3295, 1659.2978, 19.3063, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[419] = CreateDynamicObject(974, 79.3295, 1652.6475, 19.3063, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[420] = CreateDynamicObject(974, 79.3295, 1645.9968, 19.3063, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[421] = CreateDynamicObject(974, 79.3295, 1639.3560, 19.3063, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[422] = CreateDynamicObject(974, 79.3095, 1637.0744, 19.3063, 0.0000, 0.0000, 90.0000); //tall_fence
	g_Object[423] = CreateDynamicObject(16770, 87.7480, 1759.0541, 18.1471, 0.0000, 0.0000, 0.0000); //des_gunbldg01
	g_Object[424] = CreateDynamicObject(16770, 87.7480, 1781.3863, 18.1471, 0.0000, 0.0000, 0.0000); //des_gunbldg01
	g_Object[425] = CreateDynamicObject(3498, 108.7444, 1746.1335, 14.1829, 0.0000, 0.0000, 0.0000); //wdpillar01_lvs
	g_Object[426] = CreateDynamicObject(19991, 107.9787, 1753.4967, 16.4758, 0.0000, 0.0000, -84.8000); //SAMPRoadSign44
	SetDynamicObjectMaterial(g_Object[426], 2, 18064, "ab_sfammuunits", "gun_targetc", 0x00000000);
	g_Object[427] = CreateDynamicObject(19991, 107.2527, 1761.4739, 16.4758, 0.0000, 0.0000, -84.8000); //SAMPRoadSign44
	SetDynamicObjectMaterial(g_Object[427], 2, 18064, "ab_sfammuunits", "gun_targetc", 0x00000000);
	g_Object[428] = CreateDynamicObject(19991, 106.8176, 1766.2550, 16.4758, 0.0000, 0.0000, -84.8000); //SAMPRoadSign44
	SetDynamicObjectMaterial(g_Object[428], 2, 18064, "ab_sfammuunits", "gun_targetc", 0x00000000);
	g_Object[429] = CreateDynamicObject(19991, 105.9465, 1775.8253, 16.4758, 0.0000, 0.0000, -84.8000); //SAMPRoadSign44
	SetDynamicObjectMaterial(g_Object[429], 2, 18064, "ab_sfammuunits", "gun_targetc", 0x00000000);
	g_Object[430] = CreateDynamicObject(19991, 105.6256, 1779.3507, 16.4758, 0.0000, 0.0000, -84.8000); //SAMPRoadSign44
	SetDynamicObjectMaterial(g_Object[430], 2, 18064, "ab_sfammuunits", "gun_targetc", 0x00000000);
	g_Object[431] = CreateDynamicObject(19991, 105.3365, 1782.5277, 16.4758, 0.0000, 0.0000, -84.8000); //SAMPRoadSign44
	SetDynamicObjectMaterial(g_Object[431], 2, 18064, "ab_sfammuunits", "gun_targetc", 0x00000000);
	g_Object[432] = CreateDynamicObject(19991, 104.9159, 1787.1486, 16.4758, 0.0000, 0.0000, -84.8000); //SAMPRoadSign44
	SetDynamicObjectMaterial(g_Object[432], 2, 18064, "ab_sfammuunits", "gun_targetc", 0x00000000);
	g_Object[433] = CreateDynamicObject(19991, 115.2938, 1754.6546, 16.4758, 0.0000, 0.0000, -84.8000); //SAMPRoadSign44
	SetDynamicObjectMaterial(g_Object[433], 2, 18050, "ammu_2flrprops", "gun_target1", 0x00000000);
	g_Object[434] = CreateDynamicObject(19991, 113.0511, 1756.7905, 16.4758, 0.0000, 0.0000, -84.8000); //SAMPRoadSign44
	SetDynamicObjectMaterial(g_Object[434], 2, 18050, "ammu_2flrprops", "gun_target1", 0x00000000);
	g_Object[435] = CreateDynamicObject(19991, 114.4483, 1763.9464, 16.4758, 0.0000, 0.0000, -84.8000); //SAMPRoadSign44
	SetDynamicObjectMaterial(g_Object[435], 2, 18050, "ammu_2flrprops", "gun_target1", 0x00000000);
	g_Object[436] = CreateDynamicObject(19991, 114.9584, 1768.7119, 16.4758, 0.0000, 0.0000, -84.8000); //SAMPRoadSign44
	SetDynamicObjectMaterial(g_Object[436], 2, 18050, "ammu_2flrprops", "gun_target1", 0x00000000);
	g_Object[437] = CreateDynamicObject(19991, 114.3919, 1774.9360, 16.4758, 0.0000, 0.0000, -84.8000); //SAMPRoadSign44
	SetDynamicObjectMaterial(g_Object[437], 2, 18050, "ammu_2flrprops", "gun_target1", 0x00000000);
	g_Object[438] = CreateDynamicObject(19991, 115.3467, 1778.0144, 16.4758, 0.0000, 0.0000, -84.8000); //SAMPRoadSign44
	SetDynamicObjectMaterial(g_Object[438], 2, 18050, "ammu_2flrprops", "gun_target1", 0x00000000);
	g_Object[439] = CreateDynamicObject(19991, 113.9920, 1781.0946, 16.4758, 0.0000, 0.0000, -84.8000); //SAMPRoadSign44
	SetDynamicObjectMaterial(g_Object[439], 2, 18050, "ammu_2flrprops", "gun_target1", 0x00000000);
	g_Object[440] = CreateDynamicObject(19991, 113.7010, 1784.2915, 16.4758, 0.0000, 0.0000, -84.8000); //SAMPRoadSign44
	SetDynamicObjectMaterial(g_Object[440], 2, 18050, "ammu_2flrprops", "gun_target1", 0x00000000);
	g_Object[441] = CreateDynamicObject(19991, 114.0347, 1788.4593, 16.4758, 0.0000, 0.0000, -84.8000); //SAMPRoadSign44
	SetDynamicObjectMaterial(g_Object[441], 2, 18050, "ammu_2flrprops", "gun_target1", 0x00000000);
	g_Object[442] = CreateDynamicObject(19991, 135.9997, 1761.1582, 16.4758, 0.0000, 0.0000, -84.8000); //SAMPRoadSign44
	SetDynamicObjectMaterial(g_Object[442], 2, 3018, "targetmx", "target4", 0x00000000);
	g_Object[443] = CreateDynamicObject(19991, 138.4382, 1756.7609, 16.4758, 0.0000, 0.0000, -84.8000); //SAMPRoadSign44
	SetDynamicObjectMaterial(g_Object[443], 2, 3018, "targetmx", "target4", 0x00000000);
	g_Object[444] = CreateDynamicObject(19991, 140.5484, 1759.1728, 16.4758, 0.0000, 0.0000, -84.8000); //SAMPRoadSign44
	SetDynamicObjectMaterial(g_Object[444], 2, 3018, "targetmx", "target4", 0x00000000);
	g_Object[445] = CreateDynamicObject(19991, 139.9702, 1765.5266, 16.4758, 0.0000, 0.0000, -84.8000); //SAMPRoadSign44
	SetDynamicObjectMaterial(g_Object[445], 2, 3018, "targetmx", "target4", 0x00000000);
	g_Object[446] = CreateDynamicObject(19991, 136.3686, 1766.9259, 16.4758, 0.0000, 0.0000, -84.8000); //SAMPRoadSign44
	SetDynamicObjectMaterial(g_Object[446], 2, 3018, "targetmx", "target4", 0x00000000);
	g_Object[447] = CreateDynamicObject(19991, 136.6087, 1764.2864, 16.4758, 0.0000, 0.0000, -84.8000); //SAMPRoadSign44
	SetDynamicObjectMaterial(g_Object[447], 2, 3018, "targetmx", "target4", 0x00000000);
	g_Object[448] = CreateDynamicObject(19991, 135.5184, 1776.2668, 16.4758, 0.0000, 0.0000, -84.8000); //SAMPRoadSign44
	SetDynamicObjectMaterial(g_Object[448], 2, 3018, "targetmx", "target4", 0x00000000);
	g_Object[449] = CreateDynamicObject(19991, 135.2230, 1779.5133, 16.4758, 0.0000, 0.0000, -84.8000); //SAMPRoadSign44
	SetDynamicObjectMaterial(g_Object[449], 2, 3018, "targetmx", "target4", 0x00000000);
	g_Object[450] = CreateDynamicObject(19991, 134.8460, 1783.6558, 16.4758, 0.0000, 0.0000, -84.8000); //SAMPRoadSign44
	SetDynamicObjectMaterial(g_Object[450], 2, 3018, "targetmx", "target4", 0x00000000);
	g_Object[451] = CreateDynamicObject(19991, 134.5061, 1787.3908, 16.4758, 0.0000, 0.0000, -84.8000); //SAMPRoadSign44
	SetDynamicObjectMaterial(g_Object[451], 2, 3018, "targetmx", "target4", 0x00000000);
	g_Object[452] = CreateDynamicObject(19991, 138.2690, 1785.5445, 16.4758, 0.0000, 0.0000, -84.8000); //SAMPRoadSign44
	SetDynamicObjectMaterial(g_Object[452], 2, 3018, "targetmx", "target4", 0x00000000);
	g_Object[453] = CreateDynamicObject(19991, 138.9751, 1777.7867, 16.4758, 0.0000, 0.0000, -84.8000); //SAMPRoadSign44
	SetDynamicObjectMaterial(g_Object[453], 2, 3018, "targetmx", "target4", 0x00000000);
	g_Object[454] = CreateDynamicObject(19991, 165.4013, 1760.3792, 16.4758, 0.0000, 0.0000, -84.8000); //SAMPRoadSign44
	SetDynamicObjectMaterial(g_Object[454], 2, 18064, "ab_sfammuunits", "gun_targetb", 0x00000000);
	g_Object[455] = CreateDynamicObject(19991, 165.7910, 1756.0969, 16.4758, 0.0000, 0.0000, -84.8000); //SAMPRoadSign44
	SetDynamicObjectMaterial(g_Object[455], 2, 18064, "ab_sfammuunits", "gun_targetb", 0x00000000);
	g_Object[456] = CreateDynamicObject(19991, 169.3651, 1758.7518, 16.4758, 0.0000, 0.0000, -84.8000); //SAMPRoadSign44
	SetDynamicObjectMaterial(g_Object[456], 2, 18064, "ab_sfammuunits", "gun_targetb", 0x00000000);
	g_Object[457] = CreateDynamicObject(19991, 168.7940, 1765.0258, 16.4758, 0.0000, 0.0000, -84.8000); //SAMPRoadSign44
	SetDynamicObjectMaterial(g_Object[457], 2, 18064, "ab_sfammuunits", "gun_targetb", 0x00000000);
	g_Object[458] = CreateDynamicObject(19991, 164.9499, 1764.6756, 16.4758, 0.0000, 0.0000, -84.8000); //SAMPRoadSign44
	SetDynamicObjectMaterial(g_Object[458], 2, 18064, "ab_sfammuunits", "gun_targetb", 0x00000000);
	g_Object[459] = CreateDynamicObject(19991, 164.4551, 1770.1127, 16.4758, 0.0000, 0.0000, -84.8000); //SAMPRoadSign44
	SetDynamicObjectMaterial(g_Object[459], 2, 18064, "ab_sfammuunits", "gun_targetb", 0x00000000);
	g_Object[460] = CreateDynamicObject(19991, 166.7979, 1772.7260, 16.4758, 0.0000, 0.0000, -84.8000); //SAMPRoadSign44
	SetDynamicObjectMaterial(g_Object[460], 2, 18064, "ab_sfammuunits", "gun_targetb", 0x00000000);
	g_Object[461] = CreateDynamicObject(19991, 164.3731, 1775.2071, 16.4758, 0.0000, 0.0000, -84.8000); //SAMPRoadSign44
	SetDynamicObjectMaterial(g_Object[461], 2, 18064, "ab_sfammuunits", "gun_targetb", 0x00000000);
	g_Object[462] = CreateDynamicObject(19991, 164.0749, 1778.4836, 16.4758, 0.0000, 0.0000, -84.8000); //SAMPRoadSign44
	SetDynamicObjectMaterial(g_Object[462], 2, 18064, "ab_sfammuunits", "gun_targetb", 0x00000000);
	g_Object[463] = CreateDynamicObject(19991, 163.5791, 1783.9309, 16.4758, 0.0000, 0.0000, -84.8000); //SAMPRoadSign44
	SetDynamicObjectMaterial(g_Object[463], 2, 18064, "ab_sfammuunits", "gun_targetb", 0x00000000);
	g_Object[464] = CreateDynamicObject(19991, 165.8110, 1781.6937, 16.4758, 0.0000, 0.0000, -84.8000); //SAMPRoadSign44
	SetDynamicObjectMaterial(g_Object[464], 2, 18064, "ab_sfammuunits", "gun_targetb", 0x00000000);
	g_Object[465] = CreateDynamicObject(19991, 168.7944, 1779.6951, 16.4758, 0.0000, 0.0000, -84.8000); //SAMPRoadSign44
	SetDynamicObjectMaterial(g_Object[465], 2, 18064, "ab_sfammuunits", "gun_targetb", 0x00000000);
	g_Object[466] = CreateDynamicObject(11441, 105.2824, 1681.7385, 16.6972, 0.0000, 0.0000, 0.0000); //des_pueblo5
	g_Object[467] = CreateDynamicObject(11441, 110.5825, 1677.2287, 16.6972, 0.0000, 0.0000, 0.0000); //des_pueblo5
	g_Object[468] = CreateDynamicObject(11441, 102.1758, 1676.3750, 16.6972, 0.0000, 0.0000, -84.2000); //des_pueblo5
	g_Object[469] = CreateDynamicObject(11442, 111.8809, 1665.1361, 16.2955, 0.0000, 0.0000, 70.4999); //des_pueblo3
	g_Object[470] = CreateDynamicObject(11444, 164.3963, 1671.7315, 16.5182, 0.0000, 0.0000, -93.6999); //des_pueblo2
	g_Object[471] = CreateDynamicObject(11446, 126.1606, 1674.0255, 16.7571, 0.0000, 0.0000, 0.0000); //des_pueblo07
	g_Object[472] = CreateDynamicObject(11444, 92.3102, 1671.7938, 16.5182, 0.0000, 0.0000, 90.8000); //des_pueblo2
	g_Object[473] = CreateDynamicObject(11446, 119.7906, 1670.0554, 16.6071, 0.0000, 0.0000, 62.1000); //des_pueblo07
	g_Object[474] = CreateDynamicObject(11446, 118.9858, 1679.2850, 16.6071, 0.0000, 0.0000, 62.1000); //des_pueblo07
	g_Object[475] = CreateDynamicObject(11441, 121.2008, 1662.4078, 16.4201, 0.0000, 0.0000, 0.0000); //des_pueblo5
	g_Object[476] = CreateDynamicObject(11440, 140.6596, 1678.3439, 16.0034, 0.0000, 0.0000, 175.5999); //des_pueblo1
	g_Object[477] = CreateDynamicObject(11441, 131.2177, 1658.1618, 16.1669, 0.0000, 0.0000, 0.0000); //des_pueblo5
	g_Object[478] = CreateDynamicObject(11442, 130.2074, 1689.1776, 16.2955, 0.0000, 0.0000, 70.4999); //des_pueblo3
	g_Object[479] = CreateDynamicObject(11442, 103.4919, 1693.6680, 16.2955, 0.0000, 0.0000, -147.4999); //des_pueblo3
	g_Object[480] = CreateDynamicObject(11441, 154.5776, 1668.3319, 16.1669, 0.0000, 0.0000, 0.0000); //des_pueblo5
	g_Object[481] = CreateDynamicObject(11441, 150.2807, 1661.2148, 16.1669, 0.0000, 0.0000, 103.5999); //des_pueblo5
	g_Object[482] = CreateDynamicObject(11441, 152.9508, 1675.8221, 16.1669, 0.0000, 0.0000, 103.5999); //des_pueblo5
	g_Object[483] = CreateDynamicObject(19446, 113.1365, 1744.3831, 18.6545, 0.6000, 90.0000, 86.7000); //wall086
	SetDynamicObjectMaterial(g_Object[483], 0, 2068, "cj_ammo_net", "CJ_cammonet", 0x00000000);
	g_Object[484] = CreateDynamicObject(2050, 113.0547, 1660.1181, 18.1126, 0.0000, 0.0000, -136.7000); //CJ_TARGET2
	g_Object[485] = CreateDynamicObject(19446, 122.7101, 1743.8310, 18.5541, 0.6000, 90.0000, 86.7000); //wall086
	SetDynamicObjectMaterial(g_Object[485], 0, 2068, "cj_ammo_net", "CJ_cammonet", 0x00000000);
	g_Object[486] = CreateDynamicObject(3498, 108.7444, 1743.1929, 14.1829, 0.0000, 0.0000, 0.0000); //wdpillar01_lvs
	g_Object[487] = CreateDynamicObject(3498, 114.6844, 1742.9628, 14.1829, 0.0000, 0.0000, 0.0000); //wdpillar01_lvs
	g_Object[488] = CreateDynamicObject(3498, 114.6844, 1745.7932, 14.1829, 0.0000, 0.0000, 0.0000); //wdpillar01_lvs
	g_Object[489] = CreateDynamicObject(3498, 120.9343, 1745.3627, 14.1229, 0.0000, 0.0000, 0.0000); //wdpillar01_lvs
	g_Object[490] = CreateDynamicObject(3498, 127.3343, 1745.0524, 14.0429, 0.0000, 0.0000, 0.0000); //wdpillar01_lvs
	g_Object[491] = CreateDynamicObject(3498, 120.9343, 1742.6228, 14.0729, 0.0000, 0.0000, 0.0000); //wdpillar01_lvs
	g_Object[492] = CreateDynamicObject(3498, 126.9243, 1742.2519, 14.0429, 0.0000, 0.0000, 0.0000); //wdpillar01_lvs
	g_Object[493] = CreateDynamicObject(19377, 140.5505, 1741.8200, 12.7432, 0.0000, 0.0000, 0.0000); //wall025
	SetDynamicObjectMaterial(g_Object[493], 0, 16322, "a51_stores", "des_ghotwood1", 0x00000000);
	g_Object[494] = CreateDynamicObject(19377, 145.3304, 1741.8200, 13.5032, 0.0000, 0.0000, 0.0000); //wall025
	SetDynamicObjectMaterial(g_Object[494], 0, 16322, "a51_stores", "des_ghotwood1", 0x00000000);
	g_Object[495] = CreateDynamicObject(19377, 149.0804, 1741.8200, 14.5632, 0.0000, 0.0000, 0.0000); //wall025
	SetDynamicObjectMaterial(g_Object[495], 0, 16322, "a51_stores", "des_ghotwood1", 0x00000000);
	g_Object[496] = CreateDynamicObject(19377, 155.1604, 1741.8200, 15.2432, 0.0000, 0.0000, 0.0000); //wall025
	SetDynamicObjectMaterial(g_Object[496], 0, 16322, "a51_stores", "des_ghotwood1", 0x00000000);
	g_Object[497] = CreateDynamicObject(1327, 160.7600, 1725.0383, 17.1750, 180.0000, 91.5000, 90.0000); //junk_tyre
	g_Object[498] = CreateDynamicObject(1327, 158.0900, 1722.5887, 17.1109, 180.0000, 91.5000, 90.0000); //junk_tyre
	g_Object[499] = CreateDynamicObject(1327, 155.9400, 1726.3271, 17.2088, 180.0000, 91.5000, 90.0000); //junk_tyre
	g_Object[500] = CreateDynamicObject(1327, 152.2501, 1726.6674, 17.2177, 180.0000, 91.5000, 90.0000); //junk_tyre
	g_Object[501] = CreateDynamicObject(1327, 149.3001, 1724.7583, 17.1677, 180.0000, 91.5000, 90.0000); //junk_tyre
	g_Object[502] = CreateDynamicObject(1327, 146.2901, 1727.4678, 17.2386, 180.0000, 91.5000, 90.0000); //junk_tyre
	g_Object[503] = CreateDynamicObject(1327, 142.2802, 1727.5677, 17.2412, 180.0000, 91.5000, 90.0000); //junk_tyre
	g_Object[504] = CreateDynamicObject(3865, 132.0233, 1727.5780, 17.1366, 0.0000, 0.0000, 90.4999); //concpipe_SFXRF
	g_Object[505] = CreateDynamicObject(3865, 113.9140, 1727.4201, 17.1366, 0.0000, 0.0000, 90.4999); //concpipe_SFXRF
	g_Object[506] = CreateDynamicObject(2050, 130.9773, 1693.3662, 18.0797, 0.0000, 0.6999, 43.9999); //CJ_TARGET2
	g_Object[507] = CreateDynamicObject(14781, 86.0793, 1720.6539, 17.5815, 0.0000, 0.0000, 0.0000); //in_bxing05
	g_Object[508] = CreateDynamicObject(14781, 86.0793, 1711.7342, 17.5815, 0.0000, 0.0000, 0.0000); //in_bxing05
	g_Object[509] = CreateDynamicObject(2627, 91.2917, 1734.5095, 16.6071, 0.0000, 0.0000, 0.0000); //gym_treadmill
	g_Object[510] = CreateDynamicObject(2627, 89.9817, 1734.5095, 16.6071, 0.0000, 0.0000, 0.0000); //gym_treadmill
	g_Object[511] = CreateDynamicObject(2627, 88.7017, 1734.5095, 16.6071, 0.0000, 0.0000, 0.0000); //gym_treadmill
	g_Object[512] = CreateDynamicObject(2628, 86.1022, 1735.0065, 16.6104, 0.0000, 0.0000, 0.0000); //gym_bench2
	g_Object[513] = CreateDynamicObject(2628, 84.3922, 1735.0065, 16.6104, 0.0000, 0.0000, 0.0000); //gym_bench2
	g_Object[514] = CreateDynamicObject(2628, 82.6622, 1735.0065, 16.6104, 0.0000, 0.0000, 0.0000); //gym_bench2
	g_Object[515] = CreateDynamicObject(2629, 80.1211, 1729.0864, 16.6634, 0.0999, 0.0000, 89.1999); //gym_bench1
	g_Object[516] = CreateDynamicObject(2629, 80.0969, 1727.3565, 16.6634, 0.0999, 0.0000, 89.1999); //gym_bench1
	g_Object[517] = CreateDynamicObject(2629, 80.1509, 1731.2260, 16.6634, 0.0999, 0.0000, 89.1999); //gym_bench1
	g_Object[518] = CreateDynamicObject(11711, 91.8665, 1743.5991, 19.3765, 0.0000, 0.0000, 89.6999); //ExitSign1
	g_Object[519] = CreateDynamicObject(2050, 110.6539, 1666.2235, 18.1126, 0.0000, 0.0000, -136.7000); //CJ_TARGET2
	g_Object[520] = CreateDynamicObject(2050, 119.5164, 1669.2717, 18.1126, 0.0000, 0.6999, -145.8000); //CJ_TARGET2
	g_Object[521] = CreateDynamicObject(2050, 111.5038, 1677.4514, 18.1203, 0.0000, 0.6999, -51.8000); //CJ_TARGET2
	g_Object[522] = CreateDynamicObject(2050, 118.8504, 1678.3076, 18.1114, 0.0000, 0.6999, -160.0000); //CJ_TARGET2
	g_Object[523] = CreateDynamicObject(2050, 125.1879, 1673.8149, 18.1683, 0.0000, 0.6999, 123.9999); //CJ_TARGET2
	g_Object[524] = CreateDynamicObject(2050, 137.6508, 1672.2281, 21.3069, 0.0000, 0.6999, -94.6000); //CJ_TARGET2
	g_Object[525] = CreateDynamicObject(2050, 131.9940, 1683.8897, 19.0661, 0.0000, 0.6999, 63.7999); //CJ_TARGET2
	g_Object[526] = CreateDynamicObject(2050, 143.0250, 1669.5958, 20.2597, 0.0000, 0.6999, 84.1999); //CJ_TARGET2
	g_Object[527] = CreateDynamicObject(2050, 143.5636, 1673.8516, 18.8669, 0.0000, 0.6999, 122.9999); //CJ_TARGET2
	g_Object[528] = CreateDynamicObject(2050, 152.4304, 1676.7215, 18.1334, 0.0000, 0.6999, 68.3998); //CJ_TARGET2
	g_Object[529] = CreateDynamicObject(2050, 149.8162, 1662.1033, 18.0612, 0.0000, 0.6999, 68.3998); //CJ_TARGET2
	g_Object[530] = CreateDynamicObject(11711, 92.0367, 1743.6286, 19.3765, 0.0000, 0.0000, 89.6999); //ExitSign1
	g_Object[531] = CreateDynamicObject(3928, -51.3537, 1780.4670, 16.6311, 0.0000, 0.0000, 0.0000); //helipad
	g_Object[532] = CreateDynamicObject(19327, 79.1866, 1743.7103, 19.3448, 0.0000, 0.0000, -89.7999); //7_11_sign02
	SetDynamicObjectMaterialTextEx(g_Object[532], "Training Ground", 0, OBJECT_MATERIAL_SIZE_256x128, "Arial", 25, 1, 0xFF000000, 0x00000000, 1);
	g_Object[533] = CreateDynamicObject(3928, -51.3537, 1817.7171, 16.7311, 0.0000, 0.0000, 0.0000); //helipad
	g_Object[534] = CreateDynamicObject(3928, -51.3537, 1798.8574, 16.6511, 0.0000, 0.0000, 0.0000); //helipad
	g_Object[535] = CreateDynamicObject(3928, -51.3537, 1835.1278, 16.7311, 0.0000, 0.0000, 0.0000); //helipad
}

stock removeMapSmuggle(playerid) {
	RemoveBuildingForPlayer(playerid, 1334, -2174.8601, -2365.2700, 30.7968, 0.10); // BinNt04_LA (For van smuggle)
}