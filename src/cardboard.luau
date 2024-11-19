-- Cardboard V3.1
-- (C) Copyright 2022 - 2024 Ben3333
-- Version 3.1 is distributed under the Cardboard Open-Source License V3.

--[[
    NOTICE: Cardboard is Open-Source and Free (Libre software)

    If Cardboard has been sold to you, you have been scammed.
    The versions are avaliable on Git:

            https://github.com/cardboardrbx/cardboardrbx
    
    Thank you!
]]

local cardboard = {
    __VERSION = "3.1.0",
    folder = Instance.new("Configuration"), -- just gives it a cool icon lol
    script = script,

    -- modules
    console = require("console.luau"),
    debug = require("debug.luau"),
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

local Workspace = {} -- Will be a reconstruction of the workspace

for index, instance: Instance in game:GetService("Workspace"):GetChildren() do
    if instance:IsA("Folder") then
        -- treat as a folder
        Workspace[instance.Name] = {
            __CARDBOARD_INSTANCE_TYPE = "Folder",
            __CARDBOARD_PATH = "game.Workspace." .. instance.Name,
            __CARDBOARD_INSTANCE = instance,
        }

        cardboard.console.log("discovered new folder in workspace " .. instance.Name, "workspace_explorer")
        
        for index2, instance2: Instance in instance:GetChildren() do
            Workspace[instance.Name][instance2.Name] = {
                __CARDBOARD_INSTANCE_TYPE = instance2.ClassName,
                __CARDBOARD_PATH = "game.Workspace." .. instance.Name .. "." .. instance2.Name,
                __CARDBOARD_INSTANCE = instance2,

                cardboard.console.log("discovered new item in workspace " .. instance2.Name, "workspace_explorer")
            }
        end
    else
        Workspace[instance.Name] = {
            __CARDBOARD_INSTANCE_TYPE = instance.ClassName,
            __CARDBOARD_PATH = "game.Workspace." .. instance.Name,
            __CARDBOARD_INSTANCE = instance,
        }

        cardboard.console.log("discovered new item in workspace " .. instance.Name, "workspace_explorer")
    end
end

