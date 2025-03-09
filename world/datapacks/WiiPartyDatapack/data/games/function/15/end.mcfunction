
# Resets the global minigame score after the game ends
execute if score playing= lobby matches 1 if score testing options matches 0 run scoreboard players reset global minigame

# Schedules the the draw segment in 12 ticks
execute if score playing= lobby matches 1 if score testing options matches 0 run schedule function board:draw/startstart 1t

# Return to lobby if playing just minigame
execute if score playing= lobby matches 2 run schedule function lobby:return_to_lobby 1t

# Resets scores


# Remove tags
tag @a remove 15finished

# Kills all entities
tp @e[tag=15sheep] 0 -200 0
kill @e[tag=15sheep]

# Puts all players who have died back into adventure
gamemode adventure @a[tag=ingame]

# Hides the scoreboard
scoreboard objectives setdisplay sidebar

# Clears function scheduled if ended early
schedule clear games:15/start_title
schedule clear games:15/begin
schedule clear games:15/end
schedule clear games:15/play_song
schedule clear games:15/play_intro

clear @a[tag=ingame] wheat

team modify blue collisionRule never
team modify red collisionRule never
team modify green collisionRule never
team modify orange collisionRule never

execute as @a[tag=ingame] run attribute @s minecraft:generic.movement_speed base set 0.1
execute as @a[tag=ingame] run attribute @s minecraft:generic.jump_strength base set 0.41999998688697815
execute as @a[tag=ingame] run attribute @s generic.step_height base set 0.6
execute as @a run attribute @s player.entity_interaction_range base set 3.0