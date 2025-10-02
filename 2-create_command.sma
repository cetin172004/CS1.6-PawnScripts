#include <amxmodx>
// register_plugin()
// register_clcmd()

public plugin_init() { 
    register_plugin("Create Command", "1.0", "cetin172004")

    // COMMAND FUNCTION
    register_clcmd("hi", "hi_function")
}

public hi_function() {
    client_print(0, print_chat, "Hello!")
    // 0 = send to all players
}

