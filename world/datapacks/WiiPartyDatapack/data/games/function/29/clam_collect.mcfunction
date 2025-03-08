tag @e[type=marker,tag=29clam,tag=29open,dx=1,dy=1,dz=1] add 29target

tag @e[type=marker,tag=29target] remove 29open

execute at @s as @n[type=item_display,tag=29clam,tag=top] run function games:29/animation_close

execute as @e[type=marker,tag=29target] run function games:29/clam_wait

scoreboard players add @s 29score 1

particle minecraft:wax_off ~ ~1 ~ 0.75 1 0.75 1 20
playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 1 1
playsound block.ender_chest.close master @a ~ ~ ~ 10 1.5

title @s times 3 10 10
title @s title ""
title @s[team=blue] subtitle {"bold":true,"color":"#0088ff","text":"+1"}
title @s[team=red] subtitle {"bold":true,"color":"red","text":"+1"}
title @s[team=green] subtitle {"bold":true,"color":"green","text":"+1"}
title @s[team=orange] subtitle {"bold":true,"color":"gold","text":"+1"}

tag @e remove 29target

function games:29/display