function lobby:minis/clear

execute if score minigame= lobby matches 1 run function lobby:minis/dicey_descent
execute if score minigame= lobby matches 2 run function lobby:minis/zombie_tag
execute if score minigame= lobby matches 3 run function lobby:minis/barrel_daredevil
execute if score minigame= lobby matches 4 run function lobby:minis/back_attack
execute if score minigame= lobby matches 5 run function lobby:minis/lucky_launch
execute if score minigame= lobby matches 6 run function lobby:minis/derby_dash
execute if score minigame= lobby matches 7 run function lobby:minis/chop_chops
execute if score minigame= lobby matches 8 run function lobby:minis/popgun_posse
execute if score minigame= lobby matches 9 run function lobby:minis/flag_fracas
execute if score minigame= lobby matches 10 run function lobby:minis/friendly_face_off
execute if score minigame= lobby matches 11 run function lobby:minis/goal_getters
execute if score minigame= lobby matches 12 run function lobby:minis/risky_railway
execute if score minigame= lobby matches 13 run function lobby:minis/hammer_heads
execute if score minigame= lobby matches 14 run function lobby:minis/stop_watchers
execute if score minigame= lobby matches 15 run function lobby:minis/face_flip
execute if score minigame= lobby matches 16 run function lobby:minis/shutterpup
execute if score minigame= lobby matches 17 run function lobby:minis/maze_daze
execute if score minigame= lobby matches 18 run function lobby:minis/walk_off
execute if score minigame= lobby matches 19 run function lobby:minis/channel_changers
execute if score minigame= lobby matches 20 run function lobby:minis/hide_n_peek
execute if score minigame= lobby matches 21 run function lobby:minis/tropical_punch
execute if score minigame= lobby matches 22 run function lobby:minis/strategy_steps
execute if score minigame= lobby matches 23 run function lobby:minis/feathered_frenzy
execute if score minigame= lobby matches 24 run function lobby:minis/pearl_plunder
execute if score minigame= lobby matches 25 run function lobby:minis/chin_up_champs
execute if score minigame= lobby matches 26 run function lobby:minis/ram_jam
execute if score minigame= lobby matches 27 run function lobby:minis/smile_snap

execute as @e[type=armor_stand,x=-596,y=0,z=548,dx=-40,dy=30,dz=40] run data merge entity @s {DisabledSlots:4144959}
execute as @e[type=item_frame,x=-596,y=0,z=548,dx=-40,dy=30,dz=40] run data merge entity @s {Fixed:true,Invisible:1b, Invulnerable:1b}
execute as @e[type=glow_item_frame,x=-596,y=0,z=548,dx=-40,dy=30,dz=40] run data merge entity @s {Fixed:true, Invulnerable:1b}
execute as @e[type=painting,x=-596,y=0,z=548,dx=-40,dy=30,dz=40] run data merge entity @s {Invulnerable:1b}

tag @e[type=sheep,x=-596,y=0,z=548,dx=-40,dy=30,dz=40] add lobbyKill