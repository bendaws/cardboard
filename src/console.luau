-- Cardboard V3.1
-- (C) Copyright 2022 - 2024 Ben3333
-- Version 3.1 is distributed under the Cardboard Open-Source License V3.

local console = {}

console.config = {
    callbacks = {
        help = "console.config.callbacks: You can set callbacks to your own print functions in case you handle them differently.",
        log = print,
        warn = warn,
        error = error,
    },

    metadata = {
        name = "Null",
        developer = "Null",
        username = "Roblox",
        version = "0.0.0",
        report_url = "https://www.google.com", -- Please set to a form where users can report bugs
    }
}

console.stream = {}

function console.log(text: string, subsystem: string, ...)
    if subsystem then
        console.config.callbacks.log("[" .. console.config.metadata.name .. "|" .. subsystem .. "]: " .. text)
    else
        console.config.callbacks.log("[" .. console.config.metadata.name .. "]: " .. text)
    end

    table.insert(console.stream, "[" .. console.config.metadata.name .. "|" .. subsystem or "game" .. "]: " .. text)
end

function console.warn(text: string, subsystem: string, ...)
    if subsystem then
        console.config.callbacks.warn("[" .. console.config.metadata.name .. "|" .. subsystem .. "]: " .. text)
    else
        console.config.callbacks.warn("[" .. console.config.metadata.name .. "]: " .. text)
    end

    table.insert(console.stream, "[" .. console.config.metadata.name .. "|" .. subsystem or "game" .. "]: " .. text)
end

function console.error(text: string, subsystem: string, ...)
    if subsystem then
        console.config.callbacks.error("[" .. console.config.metadata.name .. "|" .. subsystem .. "]: " .. text)
    else
        console.config.callbacks.error("[" .. console.config.metadata.name .. "]: " .. text)
    end

    table.insert(console.stream, "[" .. console.config.metadata.name .. "|" .. subsystem or "game" .. "]: " .. text)
end

function console.history()
    return console.stream
end

return console