tag @s add 29open

# data modify entity @s item.components."minecraft:custom_model_data" set value 29002

execute at @s as @n[type=item_display,tag=29clam,tag=top] run function games:29/animation_open

playsound block.ender_chest.open master @a ~ ~ ~ 10 1.5