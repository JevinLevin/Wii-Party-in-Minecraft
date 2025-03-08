execute if entity @a[tag=ingame,team=blue] run summon item_display 41017 19 40996 {NoGravity:1b,teleport_duration:1,Tags:["41stand","blue"]}
execute if entity @a[tag=ingame,team=red] run summon item_display 41011 18 40999 {NoGravity:1b,teleport_duration:1,Tags:["41stand","red"]}
execute if entity @a[tag=ingame,team=green] run summon item_display 41011 18 41005 {NoGravity:1b,teleport_duration:1,Tags:["41stand","green"]}
execute if entity @a[tag=ingame,team=orange] run summon item_display 41017 19 41008 {NoGravity:1b,teleport_duration:1,Tags:["41stand","orange"]}

# execute as @e[type=item_display,tag=41stand] at @s run tp @s ~ ~-1 ~