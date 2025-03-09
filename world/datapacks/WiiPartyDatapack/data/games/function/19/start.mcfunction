

scoreboard objectives add 19scores dummy

# Sets the ingame score to 1, indicating that the game is starting
scoreboard players set ingame= 19scores 1

# Sets the global minigame score to the current minigame number, this is to ensure that the tick function is being run
scoreboard players set global minigame 19


# These tellraws explain the game
tellraw @a[tag=playing] ""
tellraw @a[team=blue] [{"translate":"game.FeatheredFrenzyName","color":"#0088ff","bold":true,"underlined": true}]
tellraw @a[team=red] [{"translate":"game.FeatheredFrenzyName","color":"red","bold":true,"underlined": true}]
tellraw @a[team=green] [{"translate":"game.FeatheredFrenzyName","color":"green","bold":true,"underlined": true}]
tellraw @a[team=orange] [{"translate":"game.FeatheredFrenzyName","color":"gold","bold":true,"underlined": true}]
tellraw @a[tag=playing,tag=!ingame] [{"translate":"game.FeatheredFrenzyName","color":"light_purple","bold":true,"underlined": true}]
tellraw @a[tag=playing] ""
tellraw @a[tag=playing] [{"translate":"game.HowToPlay","color":"gray","bold":true}]
tellraw @a[tag=playing] [{"translate":"game.FeatheredFrenzy.How.1","color":"gray","with":[{"text":"-"}]}]
tellraw @a[tag=playing] [{"translate":"game.FeatheredFrenzy.How.2","color":"gray","with":[{"text":"-"}]}]
tellraw @a[tag=playing] [{"translate":"game.FeatheredFrenzy.How.3","color":"gray","with":[{"text":"-"}]}]
tellraw @a[tag=playing] ""

# Teleport all players to the minigame
tp @a[tag=playing] 20000 20 20000
spreadplayers 20000 20000 10 10 false @a[tag=playing]



# Ding sound effect
execute as @a[tag=playing] at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 3 0.7

# Give all players the weakness effect to make sure they can't punch other players to throw them off, this effect is cleared when it is their turn to shoot however
effect give @a[tag=ingame] minecraft:weakness infinite 255 true

# Schedules the next segment, which will display a title
schedule function games:19/start_title 5s

# Removes all players position tags, just for debugging purposes
function general:reset_tags


# Create scoreboards
scoreboard objectives add 19score dummy
scoreboard players set @a 19score 0
scoreboard players set maxTime= 19scores 600
scoreboard players set timer= 19scores 0
scoreboard objectives add 19popup dummy
scoreboard players set @a[tag=ingame] 19score 0

# Updates the scoreboard
scoreboard objectives add 19display dummy {"translate":"game.FeatheredFrenzyName","bold":true}
scoreboard objectives modify 19display numberformat blank
scoreboard objectives setdisplay sidebar 19display
function games:19/display


# Removes all tags


schedule function games:19/play_intro 48t

# Bossbar
bossbar add 19bluetimer {"translate":"game.WalkOff.Time","color":"#0088ff","bold":true}
bossbar add 19spectimer {"translate":"game.WalkOff.Time","color":"light_purple","bold":true}
bossbar add 19redtimer {"translate":"game.WalkOff.Time","color":"red","bold":true}
bossbar add 19greentimer {"translate":"game.WalkOff.Time","color":"green","bold":true}
bossbar add 19orangetimer {"translate":"game.WalkOff.Time","color":"gold","bold":true}
bossbar set 19bluetimer color blue
bossbar set 19spectimer color pink
bossbar set 19redtimer color red
bossbar set 19greentimer color green
bossbar set 19orangetimer color yellow
bossbar set 19bluetimer max 600
bossbar set 19spectimer max 600
bossbar set 19redtimer max 600
bossbar set 19greentimer max 600
bossbar set 19orangetimer max 600
bossbar set 19bluetimer value 600
bossbar set 19spectimer value 600
bossbar set 19redtimer value 600
bossbar set 19greentimer value 600
bossbar set 19orangetimer value 600
bossbar set 19bluetimer players @a[team=blue]
bossbar set 19bluetimer visible true
bossbar set 19spectimer players @a[tag=playing,tag=!ingame]
bossbar set 19spectimer visible true
bossbar set 19redtimer players @a[team=red]
bossbar set 19redtimer visible true
bossbar set 19greentimer players @a[team=green]
bossbar set 19greentimer visible true
bossbar set 19orangetimer players @a[team=orange]
bossbar set 19orangetimer visible true

kill @e[type=item_display,tag=19feather]

effect give @a[tag=ingame] speed infinite 2 true
execute as @a[tag=ingame] run attribute @s generic.step_height base set 1