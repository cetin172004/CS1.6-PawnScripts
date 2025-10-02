#include <amxmodx>
#include <cstrike> // cs_get_user_money(), cs_set_user_money()

#define PLUGIN_NAME "Am I Rich?"
#define PLUGIN_VERSION "1.0"
#define PLUGIN_AUTHOR "cetin172004"

public plugin_init() {

    register_plugin(PLUGIN_NAME, PLUGIN_VERSION, PLUGIN_AUTHOR);

    register_clcmd("amirich", "cmd_amirich");

    register_clcmd("contributetocharity", "cmd_contributetocharity");

}

public cmd_amirich(id) {

    new money = cs_get_user_money(id);

    if (money < 10000) {
        client_print(id, print_center,
            "Your money is %d. Sorry, you are not rich.", money);
    }

    else {
        client_print(id, print_center,
            "Your money is %d. Yes, you are rich!", money);
    }

    /*
        Format specifiers
        %d  // Integer
        %s  // String
        %f  // Float
    */

}

public cmd_contributetocharity(id) {

    cs_set_user_money(id, cs_get_user_money(id) - 100);

    client_print(id, print_center,
        "Thanks for your contribution to charity!");
    
}
