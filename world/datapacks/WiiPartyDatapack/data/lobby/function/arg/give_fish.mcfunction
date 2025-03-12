tp @s -525 11 541 45 0

summon item_display 0 0 0 {UUID:[I;0,0,0,1],view_range:0f,width:0f,height:0f,item:{id:"minecraft:player_head",count:1}}
item modify entity 0-0-0-0-1 container.0 {function:fill_player_head,entity:this}
data modify storage custom-data PlayerName set from entity 0-0-0-0-1 item.components.minecraft:profile.name
kill 0-0-0-0-1

execute at @s run summon item ~ ~ ~ {Item:{id:"minecraft:tropical_fish_spawn_egg",components:{"minecraft:entity_data":{id:"minecraft:tropical_fish",CustomName:'" "'},"minecraft:can_place_on":{predicates:[{blocks:"cobblestone"},{blocks:"andesite"},{blocks:"stone"},{blocks:"dead_brain_coral_block"},{blocks:"dead_bubble_coral_block"},{blocks:"tuff"},{blocks:"cobblestone_slab"},{blocks:"andesite_slab"},{blocks:"stone_slab"}],show_in_tooltip:true}}},Tags:["spawn_egg"]}
execute as @e[type=item,tag=spawn_egg] run data modify entity @s Item.components."minecraft:entity_data".CustomName set from storage custom-data PlayerName
tag @e[type=item,tag=spawn_egg] remove spawn_egg

