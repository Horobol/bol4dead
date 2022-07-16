// Made easy to work with both "Vanilla" and Competitive Servers
// Requires little to no knowledge, everything is explained.

// [General]
// -----------------------------------------------------------------------
hostname "${SV_HOSTNAME}"       // Hostname bit that won't change.

rcon_password "${SV_RCON_PASSWORD}"        	 // Rcon password, used for remote access mostly.
sv_steamgroup "103582791430722904"
sv_search_key "CompetitiveRework"
sv_steamgroup_exclusive "1"              // If set, only members of Steam group will be able to join the server when it's empty, public people will be able to join the server only if it has players.
                                         // (Forcing the IP as a non-group member in lobby, or directly connecting always works)

motdfile "mymotd.txt"                    // This ensures that Valve doesn't overwrite the MoTD every Update.      [Edit this file instead of motd.txt, found in the same folder (/left4dead2)]
hostfile "myhost.txt"                    // This ensures that Valve doesn't overwrite the Hostfile every Update.  [Edit this file instead of host.txt, found in the same folder (/left4dead2)]

// What .cfg files to load on Matchmode load (Plugins, nothing else) - Separate with ;
sm_cvar match_execcfg_plugins "generalfixes.cfg;confogl_plugins.cfg;sharedplugins.cfg"

// [Other Neat Stuff]
// -----------------------------------------------------------------------
sv_allow_lobby_connect_only "0"          // If set to 1, players may only join this server from matchmaking lobby, may not connect directly.

// [File Consistency]
// -----------------------------------------------------------------------
sv_consistency "1"                       // Whether the server enforces file consistency for critical files.
sv_pure "2"                              // The server will force all client files to come from Steam and additional files matching the Server.
sv_pure_kick_clients "1"                 // If set to 1, the server will kick clients with mismatching files.

// [Logging]
// -----------------------------------------------------------------------
log on                                   //Creates a logfile (on | off)
sv_logecho 0                             //default 0; Echo log information to the console.
sv_logfile 1                             //default 1; Log server information in the log file.
sv_log_onefile 0                         //default 0; Log server information to only one file.
sv_logbans 1                             //default 0;Log server bans in the server logs.
sv_logflush 0                            //default 0; Flush the log files to disk on each write (slow).
sv_logsdir logs                          //Folder in the game directory where server logs will be stored.

sv_consistency 0

// [Many Player]
sv_maxplayers 18
sv_removehumanlimit 1
sv_force_unreserved 1
sv_unlock_sb_add 1
sv_visiblemaxplayers 18
l4d_maxplayers 18

// [Friendly Fire]
sm_cvar survivor_friendly_fire_factor_normal "0.1"    //default 0.1
sm_cvar survivor_friendly_fire_factor_hard "0.3"        //default 0.3
sm_cvar survivor_friendly_fire_factor_expert "0.3"    //default 0.5 


// [Addon Disabler]
-----------------------------------------------------------------------
// This Setting will disable/enable the Serverside Addon Disabler.
// -1 = use addonconfig.cfg
// 0 = Disable addons.
// 1 = Enable Addons
///////////////////////////////////////////////////////////////////////
sm_cvar l4d2_addons_eclipse 0

// [Wait Commands]
sm_cvar sv_allow_wait_command 0

// [Networking, Rates]
// - Rates forced to 100 on Clients, for 100 Tick.
// - When using a different Tickrate, modify settings accordingly:
// 1. Change 100000 to (Tickrate * 1000) for Rate and Splitpacket.
// 2. Change 100 to (Tickrate) for Cmd and Update Rates.
// -----------------------------------------------------------------------
sm_cvar sv_minrate 100000                     // Minimum value of rate.
sm_cvar sv_maxrate 100000                     // Maximum Value of rate.
sm_cvar sv_minupdaterate 100                  // Minimum Value of cl_updaterate.
sm_cvar sv_maxupdaterate 100                  // Maximum Value of cl_updaterate.
sm_cvar sv_mincmdrate 100                     // Minimum value of cl_cmdrate.
sm_cvar sv_maxcmdrate 100                     // Maximum value of cl_cmdrate.
sm_cvar sv_client_min_interp_ratio -1         // Minimum value of cl_interp_ratio.
sm_cvar sv_client_max_interp_ratio 0          // Maximum value of cl_interp_ratio.
sm_cvar nb_update_frequency 0.014             // The lower the value, the more often common infected and witches get updated (Pathing, and state), very CPU Intensive. (0.100 is default)
sm_cvar net_splitpacket_maxrate 50000         // Networking Tweaks.
sm_cvar fps_max 0                             // Forces the maximum amount of FPS the CPU has available for the Server.

// Tickrate Fixes
sm_cvar tick_door_speed 1.3

// Slots (This prevents constant resetting of sv_maxplayers on map change)
sm_cvar mv_maxplayers 12

// Some tweaking
sm_cvar mp_autoteambalance 0                  // Prevents some shuffling.
sm_cvar sv_unlag_fixstuck 1                   // Prevent getting stuck when attempting to "unlag" a player.
sm_cvar z_brawl_chance 0                      // Common Infected won't randomly fight eachother.
sm_cvar sv_maxunlag 1                         // Maximum amount of seconds to "unlag", go back in time.
sm_cvar sv_forcepreload 1                     // Pre-loading is always a good thing, force pre-loading on all clients.
sm_cvar sv_client_predict 1                   // This is already set on clients, but force them to predict.
sm_cvar sv_client_cmdrate_difference 0        // Remove the clamp.
sm_cvar sv_max_queries_sec_global 10
sm_cvar sv_max_queries_sec 3
sm_cvar sv_max_queries_window 10
sm_cvar sv_player_stuck_tolerance 5
sm_cvar sv_stats 0                            // Don't need these.
sm_cvar sv_clockcorrection_msecs 25           // This one makes laggy players have less of an advantage regarding hitbox (as the server normally compensates for 60msec, lowering it below 15 will make some players appear stuttery)
