

scoreboard objectives add 29scores dummy

# Sets the ingame score to 1, indicating that the game is starting
scoreboard players set ingame= 29scores 1

# Sets the global minigame score to the current minigame number, this is to ensure that the tick function is being run
scoreboard players set global minigame 29


# These tellraws explain the game
tellraw @a[tag=playing] ""
tellraw @a[team=blue] [{"translate":"game.PearlPlunderName","color":"#0088ff","bold":true,"underlined": true}]
tellraw @a[team=red] [{"translate":"game.PearlPlunderName","color":"red","bold":true,"underlined": true}]
tellraw @a[team=green] [{"translate":"game.PearlPlunderName","color":"green","bold":true,"underlined": true}]
tellraw @a[team=orange] [{"translate":"game.PearlPlunderName","color":"gold","bold":true,"underlined": true}]
tellraw @a[tag=playing,tag=!ingame] [{"translate":"game.PearlPlunderName","color":"light_purple","bold":true,"underlined": true}]
tellraw @a[tag=playing] ""
tellraw @a[tag=playing] [{"translate":"game.HowToPlay","color":"gray","bold":true}]
tellraw @a[tag=playing] [{"translate":"game.PearlPlunder.How.1","color":"gray","with":[{"text":"-"}]}]
tellraw @a[tag=playing] [{"translate":"game.PearlPlunder.How.2","color":"gray","with":[{"text":"-"}]}]
tellraw @a[tag=playing] [{"translate":"game.PearlPlunder.How.3","color":"gray","with":[{"text":"-"}]}]
tellraw @a[tag=playing] ""

# Teleport all players to the minigame
tp @a 28000 10 28000
spreadplayers 28000 28000 0 5 true @a[tag=playing]
execute as @a[tag=playing] at @s run tp @s ~ 12 ~



# Ding sound effect
execute as @a[tag=playing] at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 3 0.7

# Give all players the weakness effect to make sure they can't punch other players to throw them off, this effect is cleared when it is their turn to shoot however
effect give @a[tag=ingame] minecraft:weakness infinite 255 true
effect give @a[tag=ingame] minecraft:night_vision infinite 255 true
effect give @a[tag=ingame] minecraft:dolphins_grace infinite 255 true

# Schedules the next segment, which will display a title
schedule function games:29/start_title 5s

# Removes all players position tags, just for debugging purposes
function general:reset_tags


# Create scoreboards
scoreboard objectives add 29score dummy
scoreboard players set @a 29score 0
scoreboard players set maxTime= 29scores 600
scoreboard players set timer= 29scores 0
scoreboard players set @a[tag=ingame] 29score 0
scoreboard players set init= 29scores 0
scoreboard objectives add 29wait dummy
scoreboard objectives add 29timer dummy
scoreboard objectives add 29retarget dummy
scoreboard objectives add 29stunned dummy
scoreboard objectives add 29recover dummy

# Updates the scoreboard
scoreboard objectives add 29display dummy {"translate":"game.PearlPlunderName","bold":true}
scoreboard objectives modify 29display numberformat blank
scoreboard objectives setdisplay sidebar 29display
function games:29/display


# Removes all tags


schedule function games:29/play_intro 56t

# Bossbar
bossbar add 29bluetimer {"translate":"game.WalkOff.Time","color":"#0088ff","bold":true}
bossbar add 29spectimer {"translate":"game.WalkOff.Time","color":"light_purple","bold":true}
bossbar add 29redtimer {"translate":"game.WalkOff.Time","color":"red","bold":true}
bossbar add 29greentimer {"translate":"game.WalkOff.Time","color":"green","bold":true}
bossbar add 29orangetimer {"translate":"game.WalkOff.Time","color":"gold","bold":true}
bossbar set 29bluetimer color blue
bossbar set 29spectimer color pink
bossbar set 29redtimer color red
bossbar set 29greentimer color green
bossbar set 29orangetimer color yellow
bossbar set 29bluetimer max 600
bossbar set 29spectimer max 600
bossbar set 29redtimer max 600
bossbar set 29greentimer max 600
bossbar set 29orangetimer max 600
bossbar set 29bluetimer value 600
bossbar set 29spectimer value 600
bossbar set 29redtimer value 600
bossbar set 29greentimer value 600
bossbar set 29orangetimer value 600
bossbar set 29bluetimer players @a[team=blue]
bossbar set 29bluetimer visible true
bossbar set 29spectimer players @a[tag=playing,tag=!ingame]
bossbar set 29spectimer visible true
bossbar set 29redtimer players @a[team=red]
bossbar set 29redtimer visible true
bossbar set 29greentimer players @a[team=green]
bossbar set 29greentimer visible true
bossbar set 29orangetimer players @a[team=orange]
bossbar set 29orangetimer visible true