
# Resets the global minigame score after the game ends
execute if score playing= lobby matches 1 if score testing options matches 0 run scoreboard players reset global minigame

# Schedules the the draw segment in 12 ticks
execute if score playing= lobby matches 1 if score testing options matches 0 run schedule function board:draw/startstart 1t

# Return to lobby if playing just minigame
execute if score playing= lobby matches 2 run schedule function lobby:return_to_lobby 1t

# Resets scores
scoreboard players reset @a 29stunned
scoreboard players reset @a 29recover

tag @a remove 29stunned
tag @a remove 29recover

# Kills all entities
kill @e[tag=29clam]
tp @e[type=drowned,tag=29jellyfish] 0 -250 0
kill @e[type=drowned,tag=29jellyfish]
kill @e[type=marker,tag=29stun]

# Puts all players who have died back into adventure
gamemode adventure @a[tag=ingame]

# Hides the scoreboard
scoreboard objectives setdisplay sidebar

# Clears function scheduled if ended early
schedule clear games:29/start_title
schedule clear games:29/begin
schedule clear games:29/end
schedule clear games:29/play_song
schedule clear games:29/play_intro

# Gets rid of all the bossbars
bossbar set minecraft:29bluetimer visible false
bossbar set minecraft:29redtimer visible false
bossbar set minecraft:29greentimer visible false
bossbar set minecraft:29orangetimer visible false
bossbar set minecraft:29spectimer visible false
bossbar set minecraft:29bluetimer players
bossbar set minecraft:29redtimer players
bossbar set minecraft:29greentimer players
bossbar set minecraft:29orangetimer players
bossbar set minecraft:29spectimer players

effect clear @a[tag=playing] night_vision
effect clear @a[tag=playing] dolphins_grace
effect clear @a[tag=playing] resistance