function games:16/ray/start_ray

execute unless entity @a[tag=16rayHit] run return 0

# Summon market at target facing shooter
summon marker ~ ~ ~ {Tags:["16rotCheck"]}
execute at @p[tag=16rayHit] run tp @n[tag=16rotCheck] ~ ~ ~
tag @s add 16temp
execute as @n[tag=16rotCheck] at @s run tp @s ~ ~ ~ facing entity @p[tag=16temp]
tag @s remove 16temp

# Compare rotation with targets rotation
execute store result score rot1= 16scores run data get entity @p[tag=16rayHit] Rotation[0]
execute store result score rot2= 16scores run data get entity @n[tag=16rotCheck] Rotation[0]
scoreboard players operation result= 16scores = rot1= 16scores
# Subtract rot from target
scoreboard players operation result= 16scores -= rot2= 16scores
# Get abs value
scoreboard players operation result= 16scores *= -1 Numbers
# Offset to range from 0-maxX2
scoreboard players operation result= 16scores += halfDelta= 16scores
# Mod from range of 0-360
scoreboard players operation result= 16scores %= 360 Numbers 

# execute store result storage general:debug print double 1 run scoreboard players get rot1= 16scores
# function general:debug/print with storage general:debug



# Play miss animaton if missed
execute if score result= 16scores >= 0 Numbers if score result= 16scores <= maxDelta= 16scores at @p[tag=16rayHit] run function games:16/miss

tag @a remove 16rayHit
kill @e[type=marker,tag=16rotCheck]

execute if score result= 16scores >= 0 Numbers if score result= 16scores <= maxDelta= 16scores run return 0
return 1