

scoreboard objectives add 15scores dummy

# Sets the ingame score to 1, indicating that the game is starting
scoreboard players set ingame= 15scores 1

# Sets the global minigame score to the current minigame number, this is to ensure that the tick function is being run
scoreboard players set global minigame 15


# These tellraws explain the game
tellraw @a[tag=playing] ""
tellraw @a[team=blue] [{"translate":"game.RamJamName","color":"#0088ff","bold":true,"underlined": true}]
tellraw @a[team=red] [{"translate":"game.RamJamName","color":"red","bold":true,"underlined": true}]
tellraw @a[team=green] [{"translate":"game.RamJamName","color":"green","bold":true,"underlined": true}]
tellraw @a[team=orange] [{"translate":"game.RamJamName","color":"gold","bold":true,"underlined": true}]
tellraw @a[tag=playing,tag=!ingame] [{"translate":"game.RamJamName","color":"light_purple","bold":true,"underlined": true}]
tellraw @a[tag=playing] ""
tellraw @a[tag=playing] [{"translate":"game.HowToPlay","color":"gray","bold":true}]
tellraw @a[tag=playing] [{"translate":"game.RamJam.How.1","color":"gray","with":[{"text":"-"}]}]
tellraw @a[tag=playing] [{"translate":"game.RamJam.How.2","color":"gray","with":[{"text":"-"}]}]
tellraw @a[tag=playing] [{"translate":"game.RamJam.How.3","color":"gray","with":[{"text":"-"}]}]
tellraw @a[tag=playing] ""

# Teleport all players to the minigame
tp @a[tag=playing] 15944 19 16002 -90 0
tp @a[tag=ingame,team=blue] 15944 20 16001.0 -90 0
tp @a[tag=ingame,team=red] 15944 20 16002.0 -90 0
tp @a[tag=ingame,team=green] 15944 20 16003.0 -90 0
tp @a[tag=ingame,team=orange] 15944 20 16004.0 -90 0
execute as @a[tag=playing] at @s run tp @s @s
execute as @a[tag=playing] at @s run tp @s @s
execute as @a[tag=playing] at @s run tp @s @s
schedule function games:15/remove_momentum 1t



# Ding sound effect
execute as @a[tag=playing] at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 3 0.7

# Give all players the weakness effect to make sure they can't punch other players to throw them off, this effect is cleared when it is their turn to shoot however
effect give @a[tag=ingame] minecraft:weakness infinite 255 true

# Schedules the next segment, which will display a title
schedule function games:15/start_title 5s

# Removes all players position tags, just for debugging purposes
function general:reset_tags


# Create scoreboards
scoreboard objectives add 15score dummy
scoreboard objectives add 15id dummy
scoreboard players set val= 15id 0 
scoreboard players set init= 15scores 0
scoreboard objectives add 15timer dummy
scoreboard players set @a[tag=ingame] 15timer 0

team add 15sheep
team modify 15sheep collisionRule pushOwnTeam
team add 15sheepLeader
team modify 15sheepLeader collisionRule pushOtherTeams

# Removes all tags
tag @a remove 15finished

# Updates the scoreboard
scoreboard objectives add 15display dummy {"translate":"game.RamJamName","bold":true}
scoreboard objectives modify 15display numberformat blank
scoreboard objectives setdisplay sidebar 15display
function games:15/display




schedule function games:15/play_intro 20t

execute as @a[tag=ingame] run attribute @s minecraft:generic.movement_speed base set 0
execute as @a[tag=ingame] run attribute @s minecraft:generic.jump_strength base set 0
execute as @a[tag=ingame] run attribute @s player.entity_interaction_range base set 0