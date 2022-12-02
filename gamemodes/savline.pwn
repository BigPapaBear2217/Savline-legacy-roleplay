/*
 $$$$$$\   $$$$$$\  $$\    $$\ $$\       $$$$$$\ $$\   $$\ $$$$$$$$\                     $$$$$$$\  $$$$$$$\   $$$$$$\  
$$  __$$\ $$  __$$\ $$ |   $$ |$$ |      \_$$  _|$$$\  $$ |$$  _____|                    $$  __$$\ $$  __$$\ $$  __$$\ 
$$ /  \__|$$ /  $$ |$$ |   $$ |$$ |        $$ |  $$$$\ $$ |$$ |                          $$ |  $$ |$$ |  $$ |$$ /  \__|
\$$$$$$\  $$$$$$$$ |\$$\  $$  |$$ |        $$ |  $$ $$\$$ |$$$$$\          $$$$$$\       $$$$$$$  |$$$$$$$  |$$ |$$$$\ 
 \____$$\ $$  __$$ | \$$\$$  / $$ |        $$ |  $$ \$$$$ |$$  __|         \______|      $$  __$$< $$  ____/ $$ |\_$$ |
$$\   $$ |$$ |  $$ |  \$$$  /  $$ |        $$ |  $$ |\$$$ |$$ |                          $$ |  $$ |$$ |      $$ |  $$ |
\$$$$$$  |$$ |  $$ |   \$  /   $$$$$$$$\ $$$$$$\ $$ | \$$ |$$$$$$$$\                     $$ |  $$ |$$ |      \$$$$$$  |
 \______/ \__|  \__|    \_/    \________|\______|\__|  \__|\________|                    \__|  \__|\__|       \______/ 
                                                                                                                       
                                                                                                                       
                                                                                                                       
*/


#include <a_samp> // main SA-MP include
#include <crashdetect> // crash detect to disable long callback warnings

// Configuration
#define YSI_NO_HEAP_MALLOC

// YSI
#include <YSI_Coding\y_inline>
#include <YSI_Visual\y_dialog>
#include <YSI_Coding\y_timers>
#include <YSI_Core\y_utils>
#include <foreach> // standalone compiles quicker

// GeoIP
#include <geolocation> // gets player country | Edited the include to fit the needs for this server

// Plugins
#include <a_mysql> // Currently its R41-4.
#include <bcrypt> // Bcrypt is the best way of encrypting passwords.
#include <streamer> // streamer objects, areas and more
#include <sscanf2> // make it easier to detect params
#include <chrono> // used for time! level system.

// Extras
#include <progress2> // progress bars
#include <iafk> // AFK Detection
#include <izcmd> // I-ZCMD
#include <nex-ac> // nexus anticheat
#include <strlib> // String Fuctions
#include <ChatBreaker> // Cheat Breaker to be able to use 144 characters in chat
#include <map-zones> // map-zones for retriving zone coordinates and names
#include <weapon-config> // we do need this

#pragma warning disable 239 // disable non-const string passed on a const parameter
#pragma dynamic 6000 // increasing stack/heap size


//Defining MySQL stuff here
#include "./modular/mysql.pwn" // so the sql creds dont get leaked

new MySQL:handle; // This connection handle of data type MySQL is required to carry out Mysql operations.


// [===SERVER===]

// public and local variables
#include "./modular/server/variable.pwn"

// server dialogs
#include "./modular/server/dialog.pwn"

// server functions
#include "./modular/server/functions.pwn"

// server events (when they are called)
#include "./modular/server/events.pwn"

// anti cheat
#include "./modular/server/anticheat.pwn"

// textdraws
#include "./modular/server/textdraw.pwn"

// time (system)
#include "./modular/server/time.pwn"

#include "./modular/server/reaction.pwn"

// [===CREATE===]

// mappings
#include "./modular/create/mapping.pwn" // Load Mapping First


// [===PLAYER===]

// player events
#include "./modular/player/events.pwn"

// inventory
#include "./modular/player/inventory.pwn"

// account (load/register/save)
#include "./modular/player/account.pwn"

// player commands
#include "./modular/player/commands.pwn"

// chat
#include "./modular/player/chat.pwn"

// walkie talkie
#include "./modular/player/wt.pwn"

// phone
#include "./modular/player/phone.pwn"

// animations
#include "./modular/player/anims.pwn"



// [===HELP===]

// help
#include "./modular/help/help.pwn"

// rules
#include "./modular/help/rules.pwn"


// [===ADMINS===]
#include "./modular/admin/callback.pwn"
#include "./modular/admin/admin.pwn"
#include "./modular/admin/property.pwn"


// [===BANKS===]

// bank
#include "./modular/bank/bank.pwn"

// atm
#include "./modular/bank/atm.pwn" // not included ATM Job

// atmrob
#include "./modular/bank/atmrob.pwn"


// [===DRUGS===]

// weed
#include "./modular/drug/weed.pwn"

// heroin
#include "./modular/drug/heroin.pwn"

// meth
#include "./modular/drug/meth.pwn"

// drug dealer
#include "./modular/drug/dealer.pwn"


// [===GROUPS===]

// main
#include "./modular/group/group.pwn"

// group commands
#include "./modular/group/commands.pwn"


// [===PROPERTIES===]
#include "./modular/property/property.pwn"
#include "./modular/property/storage.pwn"
#include "./modular/property/commands.pwn"
#include "./modular/property/business.pwn"

// [===VEHICLES===]

#include "./modular/vehicle/functions.pwn"

#include "./modular/vehicle/commands.pwn"

#include "./modular/vehicle/gas.pwn"

// [===JOBS===]

//smuggle (cargobob)
#include "./modular/job/smuggle/cargobob.pwn"

// smuggle (van)
#include "./modular/job/smuggle/van.pwn"

main()
{
	printf("Savline RPG has been initiated");
}
