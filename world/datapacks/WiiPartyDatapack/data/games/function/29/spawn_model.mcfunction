summon item_display ~ ~ ~ {Tags:["29clam","top"],interpolation_duration:6,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.35f,0f],scale:[0.75f,0.75f,0.75f]},item:{id:"minecraft:carrot_on_a_stick",count:1,components:{"minecraft:custom_model_data":29003}}}
summon item_display ~ ~ ~ {Tags:["29clam","bottom"],interpolation_duration:6,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.35f,0f],scale:[0.75f,0.75f,0.75f]},item:{id:"minecraft:carrot_on_a_stick",count:1,components:{"minecraft:custom_model_data":29004}}}
tag @s add temp
execute as @e[type=item_display,tag=29clam,distance=...1] run tp @s @n[tag=temp]
tag @s remove temp

execute as @e[type=item_display,tag=29clam,distance=...1] at @s run tp @s ~ ~ ~ ~90 ~

summon item_display ~ ~ ~ {Tags:["29clam","29pearl"],interpolation_duration:6,transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.45f,0f],scale:[0f,0f,0f]},item:{id:"minecraft:carrot_on_a_stick",count:1,components:{"minecraft:custom_model_data":29005}}}