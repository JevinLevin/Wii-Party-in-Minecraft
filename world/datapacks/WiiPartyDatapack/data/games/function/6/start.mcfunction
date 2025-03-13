
# Sets the ingame score to 1, indicating that the game is starting
scoreboard players set ingame 6scores 1

# Sets the global minigame score to the current minigame number, this is to ensure that the tick function is being run
scoreboard players set global minigame 6

# These tellraws explain the game
tellraw @a[tag=playing] ""
tellraw @a[team=blue] [{"translate":"game.DerbyDashName","color":"#0088ff","bold":true,"underlined": true}]
tellraw @a[team=red] [{"translate":"game.DerbyDashName","color":"red","bold":true,"underlined": true}]
tellraw @a[team=green] [{"translate":"game.DerbyDashName","color":"green","bold":true,"underlined": true}]
tellraw @a[team=orange] [{"translate":"game.DerbyDashName","color":"gold","bold":true,"underlined": true}]
tellraw @a[tag=playing,tag=!ingame] [{"translate":"game.DerbyDashName","color":"light_purple","bold":true,"underlined": true}]
tellraw @a[tag=playing] ""
tellraw @a[tag=playing] [{"translate":"game.HowToPlay","color":"gray","bold":true}]
tellraw @a[tag=playing] [{"translate":"game.DerbyDash.How.1","color":"gray","with":[{"text":"-"}]}]
tellraw @a[tag=playing] [{"translate":"game.DerbyDash.How.2","color":"gray","with":[{"text":"-"}]}]
tellraw @a[tag=playing] [{"translate":"game.DerbyDash.How.3","color":"gray","with":[{"text":"-"}]}]
tellraw @a[tag=playing] [{"translate":"game.DerbyDash.How.4","color":"gray","with":[{"text":"-"}]}]
tellraw @a[tag=playing] ""

# Teleport all players to the minigame
tp @a[tag=ingame] 6033 13 5978 90 0
spreadplayers 6033 5978 5 5 true @a[tag=playing,tag=!ingame]

# Ding sound effect
execute as @a[tag=playing] at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 3 0.7

# Give all players the weakness effect to make sure they can't punch other players to throw them off, this effect is cleared when it is their turn to shoot however
effect give @a[tag=ingame] minecraft:weakness infinite 255 true


# Schedules the next segment, which will display a title
schedule function games:6/countdown/start 5s

# Removes all players position tags, just for debugging purposes
function general:reset_tags

# Updates the scoreboard
function games:6/display
scoreboard objectives setdisplay sidebar 6display

summon minecraft:horse 6041.5 13 5975.0 {Invulnerable:1b,Tame:1b,Tags:["bluehorse","racehorse"],Attributes:[{Name:"minecraft:generic.movement_speed",Base:0.2d},{Name:"minecraft:generic.jump_strength",Base:0.75d}],SaddleItem:{id:"minecraft:saddle"},Rotation:[90f,0f]}
summon minecraft:horse 6041.5 13 5978.0 {Invulnerable:1b,Tame:1b,Tags:["redhorse","racehorse"],Attributes:[{Name:"minecraft:generic.movement_speed",Base:0.2d},{Name:"minecraft:generic.jump_strength",Base:0.75d}],SaddleItem:{id:"minecraft:saddle"},Rotation:[90f,0f]}
summon minecraft:horse 6041.5 13 5981.0 {Invulnerable:1b,Tame:1b,Tags:["greenhorse","racehorse"],Attributes:[{Name:"minecraft:generic.movement_speed",Base:0.2d},{Name:"minecraft:generic.jump_strength",Base:0.75d}],SaddleItem:{id:"minecraft:saddle"},Rotation:[90f,0f]}
summon minecraft:horse 6041.5 13 5984.0 {Invulnerable:1b,Tame:1b,Tags:["orangehorse","racehorse"],Attributes:[{Name:"minecraft:generic.movement_speed",Base:0.2d},{Name:"minecraft:generic.jump_strength",Base:0.75d}],SaddleItem:{id:"minecraft:saddle"},Rotation:[90f,0f]}
fill 6039 13 5974 6039 13 5975 minecraft:blue_stained_glass_pane[south=true,north=true]
fill 6039 13 5977 6039 13 5978 minecraft:red_stained_glass_pane[south=true,north=true]
fill 6039 13 5980 6039 13 5981 minecraft:green_stained_glass_pane[south=true,north=true]
fill 6039 13 5983 6039 13 5984 minecraft:orange_stained_glass_pane[south=true,north=true]
fill 6039 15 5974 6039 14 5984 minecraft:barrier replace minecraft:air

ride @a[team=blue,tag=ingame,limit=1,nbt={}] mount @e[type=horse,tag=bluehorse,limit=1]
ride @a[team=red,tag=ingame,limit=1,nbt={}] mount @e[type=horse,tag=redhorse,limit=1]
ride @a[team=green,tag=ingame,limit=1,nbt={}] mount @e[type=horse,tag=greenhorse,limit=1]
ride @a[team=orange,tag=ingame,limit=1,nbt={}] mount @e[type=horse,tag=orangehorse,limit=1]


scoreboard objectives add 6timer dummy
scoreboard players set @a 6timer 0

execute as @a[tag=ingame] run attribute @s player.entity_interaction_range base set 0.5