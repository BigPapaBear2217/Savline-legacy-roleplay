/*
NOTE: Jobs such as DoorDash, Fisherman and Uber are counted as a side-mission (i.e no duty point like irl)
NOTE: the first 5 jobs are linked to groups
*/

stock GetJobName(jobid)
{
	new string[30];
	switch(rankid)
	{
		case 0:	string = "Civilian";
		case 1: string = "SAPD";
		case 2: string = "SWAT";
		case 3: string = "FBI";
		case 4: string = "SAFD";
		case 5: string = "EMS";
		case 6: string = "ARMY";
		case 7: string = "Mechanic";
		case 8: string = "Trucking";
		case 9: string = "Fuel Carrier";
		case 10: string = "Miner";
		case 11: string = "Sanitation";
		case 12: string = "Bus Driver";
		case 13: string = "Taxi Driver";
		case 14: string = "Pilot";
	}
	return string;
}