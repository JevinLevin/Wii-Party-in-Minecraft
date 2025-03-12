
setblock -582 12 523 minecraft:dispenser[facing=west,triggered=false]

title @a[tag=arg] times 20 60 20
execute as @a[tag=arg] at @s run title @s title {"text":"WELL DONE","color":"green","bold":true}
execute as @a[tag=arg] at @s run title @s subtitle {"text":"for now...","color":"green","bold":true}
execute as @a[tag=arg] at @s run playsound ui.toast.challenge_complete master @s ~ ~ ~ 1 1.5

clear @a[tag=arg]

execute as @a[tag=arg] at @s run function lobby:arg/give_fish

tag @a remove arg
