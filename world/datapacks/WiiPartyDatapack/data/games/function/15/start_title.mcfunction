

title @a[tag=playing] times 10 20 10

# Displays a blank title so that the subtitles can be displayed
title @a[tag=playing] title ""

# Displays 'Ready' as a subtitle with the colour depending on the team
title @a[team=blue] subtitle {"nbt":"colors.blue","storage":"minecraft:config","interpret":true,"extra":[{"translate":"generic.Ready","bold":true}],"source":"storage","type":"nbt"}
title @a[team=red] subtitle {"nbt":"colors.red","storage":"minecraft:config","interpret":true,"extra":[{"translate":"generic.Ready","bold":true}],"source":"storage","type":"nbt"}
title @a[team=green] subtitle {"nbt":"colors.green","storage":"minecraft:config","interpret":true,"extra":[{"translate":"generic.Ready","bold":true}],"source":"storage","type":"nbt"}
title @a[team=orange] subtitle {"nbt":"colors.orange","storage":"minecraft:config","interpret":true,"extra":[{"translate":"generic.Ready","bold":true}],"source":"storage","type":"nbt"}
title @a[tag=playing,tag=!ingame] subtitle {"nbt":"colors.spectator","storage":"minecraft:config","interpret":true,"extra":[{"translate":"generic.Ready","bold":true}],"source":"storage","type":"nbt"}

# Plays countdown sound
execute as @a[tag=playing] at @s run playsound minecraft:block.note_block.banjo master @s ~ ~ ~ 3 0.7

# Schedules the start of the game in 2 seconds
schedule function games:15/begin 2s

tp @a[tag=ingame,team=blue] 15944 19 16001.0
tp @a[tag=ingame,team=red] 15944 19 16002.0
tp @a[tag=ingame,team=green] 15944 19 16003.0
tp @a[tag=ingame,team=orange] 15944 19 16004.0