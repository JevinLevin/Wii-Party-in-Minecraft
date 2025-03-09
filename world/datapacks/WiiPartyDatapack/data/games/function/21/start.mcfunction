

scoreboard objectives add 21scores dummy

# Sets the ingame score to 1, indicating that the game is starting
scoreboard players set ingame= 21scores 1

# Sets the global minigame score to the current minigame number, this is to ensure that the tick function is being run
scoreboard players set global minigame 21


# These tellraws explain the game
tellraw @a[tag=playing] ""
tellraw @a[team=blue] [{"translate":"game.SmileSnapName","color":"#0088ff","bold":true,"underlined": true}]
tellraw @a[team=red] [{"translate":"game.SmileSnapName","color":"red","bold":true,"underlined": true}]
tellraw @a[team=green] [{"translate":"game.SmileSnapName","color":"green","bold":true,"underlined": true}]
tellraw @a[team=orange] [{"translate":"game.SmileSnapName","color":"gold","bold":true,"underlined": true}]
tellraw @a[tag=playing,tag=!ingame] [{"translate":"game.SmileSnapName","color":"light_purple","bold":true,"underlined": true}]
tellraw @a[tag=playing] ""
tellraw @a[tag=playing] [{"translate":"game.HowToPlay","color":"gray","bold":true}]
tellraw @a[tag=playing] [{"translate":"game.SmileSnap.How.1","color":"gray","with":[{"text":"-"}]}]
tellraw @a[tag=playing] [{"translate":"game.SmileSnap.How.2","color":"gray","with":[{"text":"-"}]}]
tellraw @a[tag=playing] [{"translate":"game.SmileSnap.How.3","color":"gray","with":[{"text":"-"}]}]
tellraw @a[tag=playing] ""

# Teleport all players to the minigame
tp @a[tag=playing] 30069 12 29993 90 0



# Ding sound effect
execute as @a[tag=playing] at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 3 0.7

# Give all players the weakness effect to make sure they can't punch other players to throw them off, this effect is cleared when it is their turn to shoot however
effect give @a[tag=ingame] minecraft:weakness infinite 255 true

# Schedules the next segment, which will display a title
schedule function games:21/start_title 5s

# Removes all players position tags, just for debugging purposes
function general:reset_tags


# Create scoreboards
scoreboard objectives add 21score dummy
scoreboard players set @a 21score 0
scoreboard players set maxTime= 21scores 200
scoreboard players set timer= 21scores 0
scoreboard objectives add 21pose dummy
scoreboard objectives add 21posePrev dummy
scoreboard objectives add 21poseTime dummy
scoreboard objectives add 21poseDelay dummy
scoreboard objectives add 21zoom dummy
execute as @a unless score @s 21zoom matches 1.. run scoreboard players set @a 21zoom 5
scoreboard objectives add 21cur_slot dummy
scoreboard objectives add 21last_slot dummy
scoreboard objectives add 21photo dummy
scoreboard objectives add 21photoDelay dummy

# Updates the scoreboard
scoreboard objectives add 21display dummy {"translate":"game.SmileSnapName","bold":true}
scoreboard objectives modify 21display numberformat blank
scoreboard objectives setdisplay sidebar 21display
function games:21/display


# Removes all tags


schedule function games:21/play_intro 3s

# Bossbar
bossbar add 21bluetimer {"translate":"game.WalkOff.Time","color":"#0088ff","bold":true}
bossbar add 21spectimer {"translate":"game.WalkOff.Time","color":"light_purple","bold":true}
bossbar add 21redtimer {"translate":"game.WalkOff.Time","color":"red","bold":true}
bossbar add 21greentimer {"translate":"game.WalkOff.Time","color":"green","bold":true}
bossbar add 21orangetimer {"translate":"game.WalkOff.Time","color":"gold","bold":true}
bossbar set 21bluetimer color blue
bossbar set 21spectimer color pink
bossbar set 21redtimer color red
bossbar set 21greentimer color green
bossbar set 21orangetimer color yellow
bossbar set 21bluetimer max 200
bossbar set 21spectimer max 200
bossbar set 21redtimer max 200
bossbar set 21greentimer max 200
bossbar set 21orangetimer max 200
bossbar set 21bluetimer value 200
bossbar set 21spectimer value 200
bossbar set 21redtimer value 200
bossbar set 21greentimer value 200
bossbar set 21orangetimer value 200
bossbar set 21bluetimer players @a[team=blue]
bossbar set 21bluetimer visible true
bossbar set 21spectimer players @a[tag=playing,tag=!ingame]
bossbar set 21spectimer visible true
bossbar set 21redtimer players @a[team=red]
bossbar set 21redtimer visible true
bossbar set 21greentimer players @a[team=green]
bossbar set 21greentimer visible true
bossbar set 21orangetimer players @a[team=orange]
bossbar set 21orangetimer visible true

scoreboard players set init= 21scores 0

effect give @a[tag=ingame] invisibility infinite 1 true

data remove storage games:21 Photos

