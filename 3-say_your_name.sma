// new name[32]; --> Semicolons recommended

#include <amxmodx>

// CONSTANT VALUES (#define makes constant)
#define PLUGIN_NAME "Say Your Name"
#define PLUGIN_VERSION "1.0"
#define PLUGIN_AUTHOR "cetin172004" 

public plugin_init() {
    register_plugin(PLUGIN_NAME, PLUGIN_VERSION, PLUGIN_AUTHOR);
    register_clcmd("myname", "myname_function");
}

public myname_function(id) { // "id: player identifier"
    
    new name[32]; // index numbers: 0 1 2 3 4 ... 31 (32 in total)

    get_user_name(id, name, 31); // "Use up to index 31"

    client_print(0, print_center, "My name is %s", name);
    // print_chat
    // print_center

}
