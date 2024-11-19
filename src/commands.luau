-- Cardboard v3.1
-- (C) Copyright 2022 - 2024 Ben3333
-- Cardboard is open-source under BOSL3.
-- https://github.com/bendaws/cardboard

local commands = {}
local console = require("console.luau")

commands.plugins = {
    cardboard = {
        name = "cardboard",
        version = "3.1",
        description = "Built-in Cardboard commands",
        author = "SirKingBinx",

        commands = {
            {
                name = "help",
                description = "Show a list of basic built-in commands",

                onCommandRun = function(args: {string})
                    console.rlog("Here is a list of commands:")
                    console.rlog("help - Shows the help menu")
                    console.rlog("exit - Quit the postcard terminal")
                    console.rlog("sstop - Stop the server")
                    console.rlog("pi <plugin-name> - Look for information on a plugin")
                    console.rlog("This is not all of the commands.")
                    console.rlog("Contact a server admin for information on commands.")
                end,
            },
            {
                name = "exit",
                description = "Close the Postcard Terminal",

                onCommandRun = function(args: {string})
                    -- nothing lol
                    console.rlog("Exiting..")
                end,
            },
            {
                name = "sstop",
                description = "Close the server",

                onCommandRun = function(args: {string})
                    -- loop to kick everybody (note: only works for SS cardboard plugins)
                    for _, player: Player in game:GetService("Players"):GetPlayers() do
                        player:Kick("The server is being stopped.")
                    end
                end,
            },
            {
                name = "pi",
                description = "Look for metadata for a plugin",

                onCommandRun = function(args: {string})
                    -- look through the command dictionary
                    local matched: boolean = false

                    for _, plugin in commands.plugins do
                        if plugin.name == args[1] then
                            console.rlog("plugin:       " .. plugin.name)
                            console.rlog("description:  " .. plugin.description)
                            console.rlog("version:      " .. plugin.version)
                            console.rlog("developer:    " .. plugin.author)

                            console.rlog("commands:")

                            for _, command in plugin.commands do
                                console.rlog("- " .. command.name .. ": " .. command.description)
                            end

                            matched = true
                        end
                    end

                    if not matched then
                        console.warn("no definitions matched plugin " .. args[1], "cardboard-utils-plugin")
                    end
                end,
            },
        }
    }
    -- Here is how to define plugins
    --[[
    my_first_plugin = require("my_first_plugin.luau")
    ]]
    -- See the example in /examples for this.
}

commands.dictionary = {
}

return commands