scoreboard objectives add 42scores dummy

# Sets the ingame score to 1, indicating that the game is starting
scoreboard players set ingame= 42 1

# Sets the global minigame score to the current minigame number, this is to ensure that the tick function is being run
scoreboard players set global minigame 42


# These tellraws explain the game, these will only display if you are playing with tutorials off.
tellraw @a[team=blue] {"nbt":"colors.blue","storage":"minecraft:config","interpret":true,"extra":[{"translate":"game.LoftyLeap"}],"source":"storage","type":"nbt"}
tellraw @a[team=red] {"nbt":"colors.red","storage":"minecraft:config","interpret":true,"extra":[{"translate":"game.LoftyLeap"}],"source":"storage","type":"nbt"}
tellraw @a[team=green] {"nbt":"colors.green","storage":"minecraft:config","interpret":true,"extra":[{"translate":"game.LoftyLeap"}],"source":"storage","type":"nbt"}
tellraw @a[team=orange] {"nbt":"colors.orange","storage":"minecraft:config","interpret":true,"extra":[{"translate":"game.LoftyLeap"}],"source":"storage","type":"nbt"}

# Teleport all players to the minigame
tp @a[tag=ingame,team=blue] 42063 16 42004
tp @a[tag=ingame,team=red] 42063 16 42004
tp @a[tag=ingame,team=green] 42063 16 42004
tp @a[tag=ingame,team=orange] 42063 16 42004

# Ding sound effect
execute as @a[tag=playing] at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 3 0.7

# Give all players the weakness effect to make sure they can't punch other players to throw them off, this effect is cleared when it is their turn to shoot however
effect give @a[tag=ingame] minecraft:weakness infinite 255 true

# Schedules the next segment, which will display a title
schedule function games:42/begin 5s

# Removes all players position tags, just for debugging purposes
function general:reset_tags

# Updates the scoreboard
scoreboard objectives add 42display dummy {"translate":"game.LoftyLeapName","bold":true}
scoreboard players set @a[tag=ingame] 42score 0
scoreboard objectives setdisplay sidebar 42display
function games:42/display

scoreboard objectives add 42score dummy

scoreboard players set direction= 42scores 0
scoreboard players set phase= 42scores 1
scoreboard players set speed= 42scores 1


summon armor_stand 42054 32 42022 {Tags:["42rope"],Marker:1b,Silent:1b,attributes:[{id:"minecraft:generic.scale",base:0.1}],Invisible:1b} 