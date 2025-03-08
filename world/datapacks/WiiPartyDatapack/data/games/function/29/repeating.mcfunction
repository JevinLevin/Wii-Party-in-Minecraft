execute if score init= 29scores matches 0 if loaded 28015 8 27984 if loaded 28015 8 28031 if loaded 27970 8 28031 if loaded 27968 8 27984 run function games:29/init

# Bossbar
scoreboard players operation bossbar= 29scores = maxTime= 29scores
scoreboard players operation bossbar= 29scores -= timer= 29scores

execute if score ingame= 29scores matches 2 store result bossbar minecraft:29bluetimer value run scoreboard players get bossbar= 29scores
execute if score ingame= 29scores matches 2 store result bossbar minecraft:29redtimer value run scoreboard players get bossbar= 29scores
execute if score ingame= 29scores matches 2 store result bossbar minecraft:29greentimer value run scoreboard players get bossbar= 29scores
execute if score ingame= 29scores matches 2 store result bossbar minecraft:29orangetimer value run scoreboard players get bossbar= 29scores
execute if score ingame= 29scores matches 2 store result bossbar minecraft:29spectimer value run scoreboard players get bossbar= 29scores

# Pearl spawning
execute if score ingame= 29scores matches 2 as @e[type=marker,tag=29clam,tag=!29open] at @s run scoreboard players add @s 29timer 1
execute if score ingame= 29scores matches 2 as @e[type=marker,tag=29clam,tag=!29open] at @s if score @s 29timer >= @s 29wait run function games:29/clam_open

# Pearl collecting
execute if score ingame= 29scores matches 2 as @a[tag=ingame] at @s positioned ~-1 ~-1.5 ~-1 if entity @e[type=marker,tag=29clam,tag=29open,dx=1,dy=1,dz=1] run function games:29/clam_collect

execute if score ingame= 29scores matches 2 run scoreboard players add timer= 29scores 1
execute if score ingame= 29scores matches 2 if score timer= 29scores >= maxTime= 29scores run function games:29/finish

# Open clam particles
scoreboard players add slow= 29scores 1
execute if score slow= 29scores matches 3.. run scoreboard players set slow= 29scores 0
execute if score slow= 29scores matches 0 at @e[type=marker,tag=29clam,tag=29open] run particle end_rod ~ ~1 ~ 0.75 0.75 0.75 0.025 1

# Dont attack nearby stunned enemies
execute as @e[type=drowned,tag=29jellyfish] at @s run function games:29/prevent_hit

# Stunned timer
execute as @a[tag=ingame,tag=29stunned] at @s run function games:29/stunned_main
execute as @a[tag=ingame,tag=29recover] at @s run function games:29/recover

# Prevent escape
execute as @a[tag=ingame] at @s if entity @s[y=32,dy=10] run tp @s ~ 31 ~
