tag @s add firstJoined
tag @s remove new

playsound minecraft:entity.generic.explode master @s ~ ~ ~ 3 2

title @s times 5 80 15
title @s title {"translate":"generic.Name","color":"light_purple"}
title @s subtitle {"translate":"generic.Welcome","color":"gray","bold": true}

# playsound music:main_theme_loop_924 voice

execute at @s run function lobby:play_first
