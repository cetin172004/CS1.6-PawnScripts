#include <amxmodx>
#include <fun>
#include <cstrike>

#define PLUGIN_NAME "Buy Grenades"
#define PLUGIN_VERSION "1.0 - Initial"
#define PLUGIN_AUTHOR "cetin172004"

public plugin_init() {

    register_plugin(PLUGIN_NAME, PLUGIN_VERSION, PLUGIN_AUTHOR);

    register_clcmd("buygrenades", "cmd_buygrenades");

}

public cmd_buygrenades(id) {

    new hegrenade_price = 300;
    new smoke_grenade_price = 300;
    new flashbang_price = 200;

    new normal_price = 2 * flashbang_price + hegrenade_price
    + smoke_grenade_price;

    new discounted_price = normal_price - 200;

    if (cs_get_user_money(id) < discounted_price) {
        client_print(id, print_center,
            "You don't have enough money. You need %d more.",
            discounted_price - cs_get_user_money(id));
    }

    else {
        cs_set_user_money(id, cs_get_user_money(id) - discounted_price);
    
        give_item(id, "weapon_flashbang");
        give_item(id, "weapon_flashbang");
        give_item(id, "weapon_smokegrenade");
        give_item(id, "weapon_hegrenade");
             
    }

}
