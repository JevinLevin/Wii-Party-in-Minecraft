

execute if score roll= tiles matches 1.. as @a[tag=turn] run function board:tiles/dino/rolled

execute if score dino= tiles matches 2 run scoreboard players add dinoTimer= tiles 1
execute if score dino= tiles matches 2 if score good= tiles matches 1 as @e[type=phantom,tag=dino] at @s run function board:tiles/dino/good/main1
execute if score dino= tiles matches 2 if score good= tiles matches 2 as @e[type=phantom,tag=dino] at @s run function board:tiles/dino/good/main2
execute if score dino= tiles matches 2 if score bad= tiles matches 1 as @e[type=hoglin,tag=dino] at @s run function board:tiles/dino/bad/main1
execute if score dino= tiles matches 2 if score bad= tiles matches 2 as @e[type=hoglin,tag=dino] at @s run function board:tiles/dino/bad/main2


execute if score dino= tiles matches 1 as @a[tag=turn] at @s if block ~ ~1 ~ void_air at @e[type=area_effect_cloud,tag=tileCloud] run function board:dice_roll/prevent/out_of_bounds