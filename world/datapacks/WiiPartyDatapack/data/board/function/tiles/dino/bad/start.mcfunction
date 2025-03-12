title @a[tag=playing,tag=!ingame] title {"translate":"board.Tiles.Dino.Run","color":"light_purple","bold":true}
title @a[team=blue] title {"translate":"board.Tiles.Dino.Run","color":"#0088ff","bold":true}
title @a[team=red] title {"translate":"board.Tiles.Dino.Run","color":"red","bold":true}
title @a[team=green] title {"translate":"board.Tiles.Dino.Run","color":"green","bold":true}
title @a[team=orange] title {"translate":"board.Tiles.Dino.Run","color":"gold","bold":true}

execute as @a[tag=playing] at @s run playsound minecraft:entity.wither.spawn master @s ~ ~ ~ 0.5

scoreboard players set dino= tiles 2

execute if score bad= tiles matches 1 run summon hoglin -204 25 120 {Silent:1b,Invulnerable:1b,PersistenceRequired:1b,NoAI:1b,Rotation:[180F,0F],Tags:["dino"]}
execute if score bad= tiles matches 2 run summon hoglin -95.84 14.94 33.54 {Silent:1b,Invulnerable:1b,PersistenceRequired:1b,NoAI:1b,Rotation:[1535.36F,-10.45F],Tags:["dino"]}

effect give @a[tag=turn] minecraft:speed infinite 9 true


execute if score bad= tiles matches 1 run scoreboard players set @a[tag=turn] newBoardPos 27
execute if score bad= tiles matches 2 run scoreboard players set @a[tag=turn] newBoardPos 52
execute as @a[tag=turn] run scoreboard players operation @s boardPos = @s newBoardPos
kill @e[tag=tileGlow]
function board:dice_roll/glowing_tile

function board:dice_roll/prevent/clear_back
scoreboard players remove @a[tag=turn] newBoardPos 1
execute as @a[tag=turn] run function board:dice_roll/prevent/forward_prevention
scoreboard players add @a[tag=turn] newBoardPos 1
