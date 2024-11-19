-- Cardboard v3.1
-- (C) Copyright 2022 - 2024 Ben3333
-- Cardboard is open-source under BOSL3.
-- https://github.com/bendaws/cardboard

local cardboard = {
    __VERSION = "3.1.0",
    folder = Instance.new("Configuration"), -- just gives it a cool icon lol
    script = script,

    -- modules
    console = require("console.luau"),
    debug = require("debug.luau"),
    workspace = require("workspace.luau"),
    commands = require("commands.luau"),
}

cardboard.metadata = {
    name = "Null",
    developer = "Null",
    username = "Roblox",
    version = "0.0.0",
    report_url = "https://www.google.com", -- Please set to a form where users can report bugs
}

-- Meant to be read for bug reports! Do not change this unless you modify source code.

cardboard.cb = {
    name = "Cardboard",
    developer = "Ben3333",
    username = "SirKingBinx",
    version = "3.1.0",
    report_url = "https://github.com/cardboardrbx/cardboardrbx/issues/new",
    -- Unless you modified Cardboard, please leave this as it is.
}

-- update folder information
cardboard.folder.Name = "Cardboard"
cardboard.folder.Parent = game
cardboard.folder.Archivable = false

cardboard.folder.ChildAdded:Connect(function(instance)
    -- Remove unwanted objects from the Cardboard folder
    local fixed_instance_name = string.split(instance.Name, "_")
    
    if fixed_instance_name[1] ~= "CARDBOARD" then
        instance:Destroy()
    end
end)

-- Build critical events
cardboard.events = {}

cardboard.events.ErrorOccurance = Instance.new("RemoteEvent")
cardboard.events.ErrorOccurance.Name = "__CARDBOARD_ERROROCCURANCE"
cardboard.events.ErrorOccurance.Parent = cardboard.folder

cardboard.events.WarningOccurance = Instance.new("RemoteEvent")
cardboard.events.WarningOccurance.Name = "__CARDBOARD_WARNINGOCCURANCE"
cardboard.events.WarningOccurance.Parent = cardboard.folder

print([[
=================================================
|  CDA    |  Cardboard Debugging Engine         |
|  ABR    |  v3.1                               |
|  ROD    |  (C) Copyright 2022 - 2024 Ben3333  |
=================================================
]])

-- Everything is ready to start here

cardboard.workspace.scan()
cardboard.commands.loadplugins()