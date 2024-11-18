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
    console = require(game.ReplicatedStorage.Cardboard.Console),
}

-- Game metadata is used for bug reports when errors occur. Please fill out "cardboard.metadata" with
-- the function
--      cardboard.metadata.update_game_metadata(name, developer, username, version)

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

function cardboard.metadata.update_game_metadata(name: string, developer: string, username: string, version: string)
    cardboard.metadata.name = name
    cardboard.metadata.developer = developer
    cardboard.metadata.username = username
    cardboard.metadata.version = version

    cardboard.console.config.metadata.name = name
    cardboard.console.config.metadata.developer = developer
    cardboard.console.config.metadata.username = username
    cardboard.console.config.metadata.version = version
end

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

-- Check if cardboard is in cardboard folder
if cardboard.script.Parent ~= cardboard.folder then
    script.Parent = cardboard.folder
end

return cardboard