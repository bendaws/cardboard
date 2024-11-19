local my_first_plugin = {
    name = "my-first-plugin", -- Name of your plugin (no spaces / special characters)
    version = "1.0.0", -- Version (if you have a versioning system, otherwise leave as 1.0.0)
    description = "My very first postcard plugin", -- What your plugin does in 50 words or less
    author = "Me", -- Your name

    commands = {
        -- List commands in this format
        {
            name = "hello", -- How to call your command (for example, use "hello" to run this commands
            description = "hello world", -- What this command does in 50 words or less

            onCommandRun = function() -- Code for your command in this function
                print("Hello world")
            end,
        },
        {
            name = "goodbye", -- How to call your command (for example, use "hello" to run this commands
            description = "See you later", -- What this command does in 50 words or less

            onCommandRun = function() -- Code for your command in this function
                print("Goodbye")
            end,
        },
    }
}

return my_first_plugin

--[[
When you are done, just add a line that requires your module to the plugins list.

eg.

commands.plugins = {
    ...
    my_first_plugin = require("my_first_plugin.luau")
}
]]