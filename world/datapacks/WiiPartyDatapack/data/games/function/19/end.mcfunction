
# Resets the global minigame score after the game ends
execute if score playing= lobby matches 1 if score testing options matches 0 run scoreboard players reset global minigame

# Schedules the the draw segment in 12 ticks
execute if score playing= lobby matches 1 if score testing options matches 0 run schedule function board:draw/startstart 1t

# Return to lobby if playing just minigame
execute if score playing= lobby matches 2 run schedule function lobby:return_to_lobby 1t

# Resets scores


# Kills all entities
kill @e[type=item_display,tag=19feather]

# Puts all players who have died back into adventure
gamemode adventure @a[tag=ingame]

# Hides the scoreboard
scoreboard objectives setdisplay sidebar

# Clears function scheduled if ended early
schedule clear games:19/start_title
schedule clear games:19/begin
schedule clear games:19/end
schedule clear games:19/play_song
schedule clear games:19/play_intro

# Gets rid of all the bossbars
bossbar set minecraft:19bluetimer visible false
bossbar set minecraft:19redtimer visible false
bossbar set minecraft:19greentimer visible false
bossbar set minecraft:19orangetimer visible false
bossbar set minecraft:19spectimer visible false
bossbar set minecraft:19bluetimer players
bossbar set minecraft:19redtimer players
bossbar set minecraft:19greentimer players
bossbar set minecraft:19orangetimer players
bossbar set minecraft:19spectimer players

effect clear @a[tag=ingame] speed
execute as @a[tag=ingame] run attribute @s generic.step_height base set 0.6