files_to_translate = ["src/cardboard.luau", "src/console.luau", "debug.luau"]

definitions = [
    ["require(\"console.luau\")", "require(game.ReplicatedStorage.Cardboard.Console)"],
    ["require(\"debug.luau\")", "require(game.ReplicatedStorage.Cardboard.Debug)"],
]

for file in files_to_translate:
    with open(file, "rw") as file_content:
        for line in file_content.readlines():
            if str.find(line, "require"):
                location = str.find(line, "require")

                for definition in definitions:
                    if str.find(line, definition[0]):
                        str.replace(line, definition[0], definition[1])