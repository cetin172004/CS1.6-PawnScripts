#include <amxmodx>
#include <fun> // give_item()
#include <cstrike> // cs_set_user_bpammo()

#define PLUGIN_NAME "Give AK47"
#define PLUGIN_VERSION "Initial"
#define PLUGIN_AUTHOR "cetin172004"


public plugin_init() {

    register_plugin(PLUGIN_NAME, PLUGIN_VERSION, PLUGIN_AUTHOR);

    register_clcmd("give", "cmd_give");

}


public cmd_give(id) {
    
    new name[32];
    // can contains 31 characters + \0 (null, end of the string)
    get_user_name(id, name, 31);

    give_item(id, "weapon_ak47");
    
    cs_set_user_bpammo(id, CSW_AK47, 500);
    
    client_print(id, print_console, "You received AK-47 %s!", name);
    // print_chat, print_center, print_console

}
