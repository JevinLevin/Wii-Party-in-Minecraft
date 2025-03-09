

scoreboard objectives add 41scores dummy

# Sets the ingame score to 1, indicating that the game is starting
scoreboard players set ingame= 41scores 1

# Sets the global minigame score to the current minigame number, this is to ensure that the tick function is being run
scoreboard players set global minigame 41


# These tellraws explain the game
tellraw @a[tag=playing] ""
tellraw @a[team=blue] [{"translate":"game.ChinUpChampsName","color":"#0088ff","bold":true,"underlined": true}]
tellraw @a[team=red] [{"translate":"game.ChinUpChampsName","color":"red","bold":true,"underlined": true}]
tellraw @a[team=green] [{"translate":"game.ChinUpChampsName","color":"green","bold":true,"underlined": true}]
tellraw @a[team=orange] [{"translate":"game.ChinUpChampsName","color":"gold","bold":true,"underlined": true}]
tellraw @a[tag=playing,tag=!ingame] [{"translate":"game.ChinUpChampsName","color":"light_purple","bold":true,"underlined": true}]
tellraw @a[tag=playing] ""
tellraw @a[tag=playing] [{"translate":"game.HowToPlay","color":"gray","bold":true}]
tellraw @a[tag=playing] [{"translate":"game.ChinUpChamps.How.1","color":"gray","with":[{"text":"-"}]}]
tellraw @a[tag=playing] [{"translate":"game.ChinUpChamps.How.2","color":"gray","with":[{"text":"-"}]}]
tellraw @a[tag=playing] ""

# Teleport all players to the minigame
spreadplayers 40997 41002 5 5 false @a[tag=playing,tag=!ingame]
execute as @a[tag=playing,tag=!ingame] at @s run tp @s ~ ~ ~ -90 0
tp @a[team=blue] 41017 19 40996 90 0
tp @a[team=red] 41011 18 40999 90 0
tp @a[team=green] 41011 18 41005 90 0
tp @a[team=orange] 41017 19 41008 90 0



# Ding sound effect
execute as @a[tag=playing] at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 3 0.7

# Give all players the weakness effect to make sure they can't punch other players to throw them off, this effect is cleared when it is their turn to shoot however
effect give @a[tag=ingame] minecraft:weakness infinite 255 true

# Schedules the next segment, which will display a title
schedule function games:41/title1 5s

# Removes all players position tags, just for debugging purposes
function general:reset_tags


# Create scoreboards
scoreboard objectives add 41score dummy
scoreboard players set @a[tag=ingame] 41score 0
scoreboard players set maxTime= 41scores 200
scoreboard players set timer= 41scores 0
scoreboard objectives add 41delay dummy
scoreboard objectives add 41jump minecraft.custom:minecraft.jump
scoreboard objectives add 41sneak minecraft.custom:minecraft.sneak_time
scoreboard objectives add 41sneakTime dummy
scoreboard objectives add 41prev dummy


# Updates the scoreboard
scoreboard objectives add 41display dummy {"translate":"game.ChinUpChampsName","bold":true}
scoreboard objectives modify 41display numberformat blank
scoreboard objectives setdisplay sidebar 41display
function games:41/display


# Removes all tags


schedule function games:41/play_intro 56t

# Bossbar
bossbar add 41bluetimer {"translate":"game.WalkOff.Time","color":"#0088ff","bold":true}
bossbar add 41spectimer {"translate":"game.WalkOff.Time","color":"light_purple","bold":true}
bossbar add 41redtimer {"translate":"game.WalkOff.Time","color":"red","bold":true}
bossbar add 41greentimer {"translate":"game.WalkOff.Time","color":"green","bold":true}
bossbar add 41orangetimer {"translate":"game.WalkOff.Time","color":"gold","bold":true}
bossbar set 41bluetimer color blue
bossbar set 41spectimer color pink
bossbar set 41redtimer color red
bossbar set 41greentimer color green
bossbar set 41orangetimer color yellow
bossbar set 41bluetimer max 200
bossbar set 41spectimer max 200
bossbar set 41redtimer max 200
bossbar set 41greentimer max 200
bossbar set 41orangetimer max 200
bossbar set 41bluetimer value 200
bossbar set 41spectimer value 200
bossbar set 41redtimer value 200
bossbar set 41greentimer value 200
bossbar set 41orangetimer value 200
bossbar set 41bluetimer players @a[team=blue]
bossbar set 41bluetimer visible true
bossbar set 41spectimer players @a[tag=playing,tag=!ingame]
bossbar set 41spectimer visible true
bossbar set 41redtimer players @a[team=red]
bossbar set 41redtimer visible true
bossbar set 41greentimer players @a[team=green]
bossbar set 41greentimer visible true
bossbar set 41orangetimer players @a[team=orange]
bossbar set 41orangetimer visible true

function games:41/spawn_timer

schedule function games:41/spawn_stand 5t

execute as @a[tag=ingame] run attribute @s generic.jump_strength base set 0
execute as @a[tag=ingame] run attribute @s generic.gravity base set 0.01