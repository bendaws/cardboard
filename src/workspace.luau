-- Cardboard v3.1
-- (C) Copyright 2022 - 2024 Ben3333
-- Cardboard is open-source under BOSL3.
-- https://github.com/bendaws/cardboard

local cardboard_workspace = {
    objects = {}
}

local console = require("console.luau")

function cardboard_workspace.scan()
    for index, instance: Instance in game:GetService("Workspace"):GetChildren() do
        if instance:IsA("Folder") then
            -- treat as a folder
            cardboard_workspace.objects[instance.Name] = {
                __CARDBOARD_INSTANCE_TYPE = "Folder",
                __CARDBOARD_PATH = "game.Workspace." .. instance.Name,
                __CARDBOARD_INSTANCE = instance,
            }
    
            console.log("discovered new folder in workspace " .. instance.Name, "workspace_explorer")
            
            for index2, instance2: Instance in instance:GetChildren() do
                cardboard_workspace.objects[instance.Name][instance2.Name] = {
                    __CARDBOARD_INSTANCE_TYPE = instance2.ClassName,
                    __CARDBOARD_PATH = "game.Workspace." .. instance.Name .. "." .. instance2.Name,
                    __CARDBOARD_INSTANCE = instance2,
    
                    console.log("discovered new item in workspace " .. instance2.Name, "workspace_explorer")
                }
            end
        else
            cardboard_workspace.objects[instance.Name] = {
                __CARDBOARD_INSTANCE_TYPE = instance.ClassName,
                __CARDBOARD_PATH = "game.Workspace." .. instance.Name,
                __CARDBOARD_INSTANCE = instance,
            }
    
            console.log("discovered new item in workspace " .. instance.Name, "workspace_explorer")
        end
    end    
end

return cardboard_workspace