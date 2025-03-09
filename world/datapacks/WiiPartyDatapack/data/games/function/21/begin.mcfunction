# Clears the subtitle incase one is already being displayed
title @a[tag=ingame] title " "

# # Displays Start! for all players, the colour dependant on their team
# title @a[team=blue] subtitle {"nbt":"colors.blue","storage":"minecraft:config","interpret":true,"extra":[{"translate":"generic.Go","bold":true}],"source":"storage","type":"nbt"}
# title @a[team=red] subtitle {"nbt":"colors.red","storage":"minecraft:config","interpret":true,"extra":[{"translate":"generic.Go","bold":true}],"source":"storage","type":"nbt"}
# title @a[team=green] subtitle {"nbt":"colors.green","storage":"minecraft:config","interpret":true,"extra":[{"translate":"generic.Go","bold":true}],"source":"storage","type":"nbt"}
# title @a[team=orange] subtitle {"nbt":"colors.orange","storage":"minecraft:config","interpret":true,"extra":[{"translate":"generic.Go","bold":true}],"source":"storage","type":"nbt"}
# title @a[tag=playing,tag=!ingame] subtitle {"nbt":"colors.spectator","storage":"minecraft:config","interpret":true,"extra":[{"translate":"generic.Go","bold":true}],"source":"storage","type":"nbt"}

# Ping sound effect for all players
execute as @a[tag=playing] at @s run playsound minecraft:block.note_block.pling master @a ~ ~ ~ 1 2
execute as @a[tag=playing] at @s run playsound ouo:start master @s ~ ~ ~ 3 1

# Sets the ingame score to 2, this signifies that the game has actually started
scoreboard players set ingame= 21scores 2


title @a[tag=playing] times 0 10 20

scoreboard players set timer= 21scores 0
