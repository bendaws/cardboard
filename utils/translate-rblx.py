files_to_translate = ["src/cardboard.luau", "src/console.luau", "src/debug.luau", "src/workspace.luau", "src/commands.luau"]

definitions = [
    ["require(\"console.luau\")", "require(game.ReplicatedStorage.Cardboard.Console)"],
    ["require(\"debug.luau\")", "require(game.ReplicatedStorage.Cardboard.Debug)"],
    ["require(\"workspace.luau\")", "require(game.ReplicatedStorage.Cardboard.Workspace)"],
    ["require(\"commands.luau\")", "require(game.ReplicatedStorage.Cardboard.Commands)"],
]

for file in files_to_translate:
    with open(file, "r") as file_content:
        modify_content = file_content

        for line in modify_content.readlines():
            if str.find(line, "require"):
                location = str.find(line, "require")

                for definition in definitions:
                    if str.find(line, definition[0]):
                        str.replace(line, definition[0], definition[1])
                        print("Found definition " + definition[0] + " in " + file))
        
        with open(file, "w") as file_write:
            file_content.writelines(modify_content)
            file_content.close()
