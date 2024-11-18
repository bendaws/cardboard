-- Cardboard V3.1
-- (C) Copyright 2022 - 2024 Ben3333
-- Version 3.1 is distributed under the Cardboard Open-Source License V3.

local debug = {}
local console = require("console.luau")

debug.config = {
    ignores = {
        "0", -- successful runs
        "1", -- unmarked errors
    },

    errors = {
        -- You may add custom error codes to this format table in the
        -- case that your project has special return codes.

        -- Format like this:
        -- {ERR_CODE(str), ERROR_DEF(str)}

        -- example:
        -- For code 0 to be a successful exit code, use:
        -- {"0", "success"}
    },
}

function debug.run(lua_code: string): number
    -- Check if loadstring is enabled
    local _, err = pcall(function()
        loadstring("print(\"hello world\")")
    end)

    if err then
        console.error("loadstring() is not enabled, so debug.run() cannot execute your code.", "cardboard_debug")
        return 1
    end

    local _, code_err = pcall(function()
        local codefn = loadstring(lua_code)
        local output = codefn()

        for item in output do
            console.log(item, "cardboard_debug_code")
        end
    end)

    if code_err then return 1 else return 0 end
end

return debug