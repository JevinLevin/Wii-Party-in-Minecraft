
# Resets the global minigame score after the game ends
execute if score playing= lobby matches 1 if score testing options matches 0 run scoreboard players reset global minigame

# Schedules the the draw segment in 12 ticks
execute if score playing= lobby matches 1 if score testing options matches 0 run schedule function board:draw/startstart 1t

# Return to lobby if playing just minigame
execute if score playing= lobby matches 2 run schedule function lobby:return_to_lobby 1t

# Resets scores


tag @a remove 21cur
tag @a remove 21taken

effect clear @a[tag=ingame] invisibility
effect clear @a[tag=ingame] speed
effect clear @a[tag=ingame] slowness

# Kills all entities
kill @e[type=armor_stand,tag=21person]

# Puts all players who have died back into adventure
gamemode adventure @a[tag=ingame]

# Hides the scoreboard
scoreboard objectives setdisplay sidebar

# Clears function scheduled if ended early
schedule clear games:21/start_title
schedule clear games:21/begin
schedule clear games:21/end
schedule clear games:21/play_intro

# Gets rid of all the bossbars
bossbar set minecraft:21bluetimer visible false
bossbar set minecraft:21redtimer visible false
bossbar set minecraft:21greentimer visible false
bossbar set minecraft:21orangetimer visible false
bossbar set minecraft:21spectimer visible false
bossbar set minecraft:21bluetimer players
bossbar set minecraft:21redtimer players
bossbar set minecraft:21greentimer players
bossbar set minecraft:21orangetimer players
bossbar set minecraft:21spectimer players

title @a actionbar ""