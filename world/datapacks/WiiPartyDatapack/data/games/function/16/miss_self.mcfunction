# Calculate motion vector
execute positioned 0.0 0 0.0 rotated ~ 0 run summon marker ^ ^ ^-1 {Tags:["direction"]}
execute store result score $x player_motion.api.launch run data get entity @e[type=marker,tag=direction,limit=1] Pos[0] 2500
scoreboard players set $y player_motion.api.launch 2500
execute store result score $z player_motion.api.launch run data get entity @e[type=marker,tag=direction,limit=1] Pos[2] 2500
kill @e[tag=direction]

function player_motion:api/launch_xyz