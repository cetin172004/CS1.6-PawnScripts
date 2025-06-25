/*
PAWN Defining Variables

new current_health = get_user_health(id)  	Integer (default)
new Float:health_f = 100.5               	Float
new name[32]                             	String array (32 char)
new bool:is_alive = true                 	Boolean

*/

#include <amxmodx> // register_plugin() register_clcmd() get_user_name() is_user_connected() client_print() 
// client_cmd() PLUGIN_HANDLED constant get_user_health() is_user_alive()
#include <fun> // set_user_health() give_item()  
#include <cstrike> // cs_set_user_bpammo() CSW_GLOCK18 (weapon constants)

#define PLUGIN "Powerup"
#define VERSION "1.0"
#define AUTHOR "cetin172004"

public plugin_init() {
    register_plugin(PLUGIN, VERSION, AUTHOR) // save the plugin to the amxmodx system
    register_clcmd("powerup", "cmd_powerup", -1, "Powerup command")
	// -1 --> open
	// "Powerup command" --> description (optional)
}

public cmd_powerup(id) {
    // check if player is valid
    if (!is_user_connected(id)) {
        return PLUGIN_HANDLED
    }
    
    // check if player is alive
    if (!is_user_alive(id)) {
        client_print(id, print_chat, "You must be alive to use this command!")
        return PLUGIN_HANDLED
    }
    
    // update hp ==> add 50
    new current_health = get_user_health(id)
    new new_health = current_health + 50
    set_user_health(id, new_health)
    
    // drop pistol (except fiveseven)
    new current_weapon = get_user_weapon(id)
    if (current_weapon == CSW_USP || current_weapon == CSW_P228 || 
        current_weapon == CSW_DEAGLE || current_weapon == CSW_ELITE || current_weapon == CSW_GLOCK) {
        client_cmd(id, "drop")
    }
    
    // give glock
    give_item(id, "weapon_fiveseven")
    cs_set_user_bpammo(id, CSW_FIVESEVEN, 50)
    
	
	// message
    new name[32]
    get_user_name(id, name, charsmax(name))
    
    // Show message to everyone in chat
    client_print(0, print_chat, "%s used powerup", name)
    
    // Give info to user
    client_print(id, print_chat, "You used powerup! +50 health, Fiveseven and ammo received.")
    
    return PLUGIN_HANDLED
}