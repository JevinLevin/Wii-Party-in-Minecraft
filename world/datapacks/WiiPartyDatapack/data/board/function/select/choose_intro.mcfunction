tellraw @a[tag=playing,tag=!ingame] {"translate":"board.GameSelect.Choose.Intro","color":"light_purple"}
tellraw @a[team=blue,tag=ingame] {"translate":"board.GameSelect.Choose.Intro","color":"#0088ff"}
tellraw @a[team=red,tag=ingame] {"translate":"board.GameSelect.Choose.Intro","color":"red"}
tellraw @a[team=green,tag=ingame] {"translate":"board.GameSelect.Choose.Intro","color":"green"}
tellraw @a[team=orange,tag=ingame] {"translate":"board.GameSelect.Choose.Intro","color":"gold"}

execute as @a[tag=playing] at @s run playsound block.note_block.pling master @s

schedule function board:select/start_choose 59t