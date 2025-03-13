# Resets the global minigame score after the game ends
execute if score playing= lobby matches 1 if score testing options matches 0 run scoreboard players reset global minigame

# Schedules the the draw segment in 12 ticks
execute if score playing= lobby matches 1 if score testing options matches 0 run schedule function board:draw/startstart 1t

# Return to lobby if playing just minigame
execute if score playing= lobby matches 2 run schedule function lobby:return_to_lobby 1t


# Resets scores from the minigame
scoreboard players set ingame 6scores 0
scoreboard players reset @a[tag=ingame] 6stamina
scoreboard players reset @a 6timer

# Removes tags from all players
tag @a remove finished

# Puts all players ingame into adventure as some of them might be in spectator if they died
gamemode adventure @a[tag=ingame]

# Gives all players saturation so they stop taking hunger
effect give @a[tag=ingame] minecraft:saturation infinite 255 true

# Gives all players instant health just incase they took damage in the minigame
effect give @a[tag=ingame] minecraft:instant_health 3 10 true


execute as @a[tag=ingame] run ride @s dismount

# Kills all the entities used
tp @e[type=minecraft:horse,tag=racehorse] 0 -100 0
kill @e[type=minecraft:horse,tag=racehorse]
kill @e[type=item,nbt={Item:{id:"minecraft:saddle"}}]


# Removes the scoreboard from the sidebar
scoreboard objectives setdisplay sidebar

scoreboard players set enabled= specOptions 0

schedule clear games:6/countdown/start
schedule clear games:6/countdown/middle
schedule clear games:6/countdown/end
schedule clear games:6/startrace
schedule clear games:6/end
schedule clear games:6/play_song

bossbar set minecraft:6bluestamina players
bossbar set minecraft:6redstamina players
bossbar set minecraft:6greenstamina players
bossbar set minecraft:6orangestamina players

fill 6039 13 5974 6039 13 5975 minecraft:blue_stained_glass_pane[south=true,north=true]
fill 6039 13 5977 6039 13 5978 minecraft:red_stained_glass_pane[south=true,north=true]
fill 6039 13 5980 6039 13 5981 minecraft:green_stained_glass_pane[south=true,north=true]
fill 6039 13 5983 6039 13 5984 minecraft:orange_stained_glass_pane[south=true,north=true]
fill 6039 15 5974 6039 14 5984 minecraft:barrier replace minecraft:air

clear @a[tag=playing]

scoreboard players reset global minigame

ride @a[team=blue,tag=ingame,limit=1,nbt={RootVehicle:{}}] dismount
ride @a[team=red,tag=ingame,limit=1,nbt={RootVehicle:{}}] dismount
ride @a[team=green,tag=ingame,limit=1,nbt={RootVehicle:{}}] dismount
ride @a[team=orange,tag=ingame,limit=1,nbt={RootVehicle:{}}] dismount

kill @e[type=interaction,tag=6interact]

execute as @a run attribute @s player.entity_interaction_range base set 3.0
