execute as @e[type=armor_stand,tag=21person,tag=!21init] run function games:21/set_person
execute if score init= 21scores matches 0 if loaded 30058 12 29993 run function games:21/init

execute if score ingame= 21scores matches 2 run scoreboard players add timer= 21scores 1
execute if score ingame= 21scores matches 2 if score timer= 21scores matches 1 as @a[tag=ingame] at @s run playsound block.note_block.hat master @s ~ ~ ~ 1 0.5
execute if score ingame= 21scores matches 2 if score timer= 21scores matches 20 as @a[tag=ingame] at @s run playsound block.note_block.hat master @s ~ ~ ~ 1 0.55
execute if score ingame= 21scores matches 2 if score timer= 21scores matches 40 as @a[tag=ingame] at @s run playsound block.note_block.hat master @s ~ ~ ~ 1 0.6
execute if score ingame= 21scores matches 2 if score timer= 21scores matches 60 as @a[tag=ingame] at @s run playsound block.note_block.hat master @s ~ ~ ~ 1 0.65
execute if score ingame= 21scores matches 2 if score timer= 21scores matches 80 as @a[tag=ingame] at @s run playsound block.note_block.hat master @s ~ ~ ~ 1 0.7
execute if score ingame= 21scores matches 2 if score timer= 21scores matches 100 as @a[tag=ingame] at @s run playsound block.note_block.hat master @s ~ ~ ~ 1 0.75
execute if score ingame= 21scores matches 2 if score timer= 21scores matches 120 as @a[tag=ingame] at @s run playsound block.note_block.hat master @s ~ ~ ~ 1 0.8
execute if score ingame= 21scores matches 2 if score timer= 21scores matches 140 as @a[tag=ingame] at @s run playsound block.note_block.hat master @s ~ ~ ~ 1 0.85
execute if score ingame= 21scores matches 2 if score timer= 21scores matches 160 as @a[tag=ingame] at @s run playsound block.note_block.hat master @s ~ ~ ~ 1 0.95
execute if score ingame= 21scores matches 2 if score timer= 21scores matches 180 as @a[tag=ingame] at @s run playsound block.note_block.hat master @s ~ ~ ~ 1 1.0
execute if score ingame= 21scores matches 2 if score timer= 21scores >= maxTime= 21scores run function games:21/photo_end
# End photo if all photos taken
execute if score ingame= 21scores matches 2 unless entity @a[tag=ingame,tag=!21taken] run function games:21/photo_end

# Bossbar
scoreboard players operation bossbar= 21scores = maxTime= 21scores
scoreboard players operation bossbar= 21scores -= timer= 21scores

execute if score ingame= 21scores matches 2 store result bossbar minecraft:21bluetimer value run scoreboard players get bossbar= 21scores
execute if score ingame= 21scores matches 2 store result bossbar minecraft:21redtimer value run scoreboard players get bossbar= 21scores
execute if score ingame= 21scores matches 2 store result bossbar minecraft:21greentimer value run scoreboard players get bossbar= 21scores
execute if score ingame= 21scores matches 2 store result bossbar minecraft:21orangetimer value run scoreboard players get bossbar= 21scores
execute if score ingame= 21scores matches 2 store result bossbar minecraft:21spectimer value run scoreboard players get bossbar= 21scores

# Timer sounds and disp[lay]

# Posing
execute if score ingame= 21scores matches 0..2 as @e[type=armor_stand,tag=21person] if score @s 21poseTime matches 0.. run function games:21/posing

execute if score ingame= 21scores matches 0..3 positioned 30065 12 29993 run tp @a[tag=ingame,distance=0.5..] ~ ~ ~ 90 0

# Scroll zooming
execute if score ingame= 21scores matches 0..3 as @a[tag=ingame] run function games:21/zoom_check
# Title for scrolling
title @a[tag=ingame,team=blue] actionbar {"color":"#0088ff","translate":"game.MazeDaze.Scroll"}
title @a[tag=ingame,team=red] actionbar {"color":"red","translate":"game.MazeDaze.Scroll"}
title @a[tag=ingame,team=green] actionbar {"color":"green","translate":"game.MazeDaze.Scroll"}
title @a[tag=ingame,team=orange] actionbar {"color":"gold","translate":"game.MazeDaze.Scroll"}

# Camera overlay
scoreboard players remove @a[tag=ingame,scores={21photoDelay=1..}] 21photoDelay 1
execute if score ingame= 21scores matches 2 as @a[tag=playing] unless score @s 21photoDelay matches 1.. run title @s times 0 10 20
execute if score ingame= 21scores matches 2 as @a[tag=ingame] at @s unless score @s 21photoDelay matches 1.. run function games:21/overlay

# COAS offhand
clear @a[tag=ingame] carrot_on_a_stick
execute if score ingame= 21scores matches 2 run item replace entity @a[tag=ingame] weapon.offhand with carrot_on_a_stick[custom_model_data=1,custom_name='""',hide_tooltip={}]
kill @e[type=item,nbt={Item:{"id":"minecraft:carrot_on_a_stick"}}]

# Take Photo
execute as @a[tag=ingame,tag=!21taken] at @s if score @s rightClick matches 1.. run function games:21/photo_take