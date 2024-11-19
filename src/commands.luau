-- Cardboard v3.1
-- (C) Copyright 2022 - 2024 Ben3333
-- Cardboard is open-source under BOSL3.
-- https://github.com/bendaws/cardboard

local commands = {}
local console = require("console.luau")

commands.plugins = {
    cardboard = {
        name = "Cardboard",
        version = "3.1",
        description = "Built-in Cardboard commands",
        author = "SirKingBinx",
    }
}

commands.dictionary = {
    {
        name = "help",
        version = commands.plugins.cardboard.version,
        description = "Show a list of basic built-in commands",
        plugin = commands.plugins.cardboard,

        onCommandRun = function()
            
        end,
    },
    {
        name = "exit",
        version = commands.plugins.cardboard.version,
        description = "Close the Cardboard Terminal",
        plugin = commands.plugins.cardboard,

        onCommandRun = function()
            
        end,
    },
}

return commands