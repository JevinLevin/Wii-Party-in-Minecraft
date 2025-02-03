data modify storage minecraft:game38 display set from storage minecraft:game38 blue[0]
data remove storage minecraft:game38 blue[0]
function games:38/camera/display

scoreboard players add total= 38scores 1
execute if score hit= 38scores >= min= 38scores run scoreboard players add correct= 38scores 1
execute if score hit= 38scores >= min= 38scores as @a[tag=playing] at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 1 0.25

data modify storage minecraft:game38 temp set value []
execute store success score continue= 38scores run data modify storage minecraft:game38 temp set from storage minecraft:game38 blue
data remove storage minecraft:game38 temp

execute if score continue= 38scores matches 1 run title @a[tag=playing] actionbar {"nbt":"colors.blue","storage":"minecraft:config","interpret":true,"extra":[{"selector":"@a[team=blue]","type":"selector"},": ",{"score":{"name":"correct=","objective":"38scores"},"type":"score"},{"text":"/","type":"text"},{"score":{"name":"total=","objective":"38scores"},"type":"score"}],"source":"storage","type":"nbt"}
execute if score continue= 38scores matches 0 run title @a[tag=playing] actionbar ""
execute if score continue= 38scores matches 0 run title @a[tag=playing] title {"nbt":"colors.blue","storage":"minecraft:config","interpret":true,"extra":[{"score":{"name":"correct=","objective":"38scores"},"type":"score"},{"text":"/","type":"text"},{"score":{"name":"total=","objective":"38scores"},"type":"score"}],"source":"storage","type":"nbt"}
execute if score continue= 38scores matches 0 run scoreboard players operation @a[team=blue] 38scores = correct= 38scores

execute if score continue= 38scores matches 1 run schedule function games:38/gallery/internal/blue 1.5s
execute if score continue= 38scores matches 0 run schedule function games:38/gallery/red 5s