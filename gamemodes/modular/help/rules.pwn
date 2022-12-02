#include <YSI_Coding\y_hooks>

/*

S A V L I N E - R P G
contains functions related /rules

*/

stock D_RULES(playerid)
{
	ShowPlayerDialog(playerid, DIALOG_RULES, DIALOG_STYLE_LIST, "Rules", "1. Respect.\n2. Abuse of bugs, exploits & c-bugging.\n3. Hacking or usage of cheating tools.\n4. Spamming & Flooding.\n5. Exchange or sale of game items or accounts.\n6. Exchange or sale of game items or accounts.\n7. Use of multiple accounts.\n8. Abuse or misuse of server scripts.\n9. Punishment evasion.\n10. Advertisement.\n11. Abuse of enter/exit, garage & elevator.\n12. Abuse of animations.\n13. Safezones.\n14. Deathmatch.\n15. Metagaming.\n16. Powergaming.\n17. Failure to role-play/poor role-play.\n18. Revenge killing/returning after death.\n19. Scamming.\n20. Forcefully avoiding Roleplay.\n21. Robbery.\n22. Ramming & Carparking.\n23. Inappropriate role-play.\n24. Mission rules.\n25. Copbaiting & cophunting.\n26. Traffic Stop.\n27. Lying to Administration.\n28. Turf rules.\n29. Random robbing.\n30. AFK without tabbing out.\n31. Common sense.", "Select", "Close");
	return 1;
}