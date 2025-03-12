# Init
execute unless score init= lobby matches 1 run function lobby:init

# Minigame selection timer
execute if score minigameSelectTimer= lobby matches 1.. run scoreboard players remove minigameSelectTimer= lobby 1

# Minigame countdown timer
execute if score countdownMinigame= lobby matches 1 run function lobby:select/countdown


# Island visiting actionbar
title @a[tag=islandVisit] actionbar {"translate":"lobby.Island.Actionbar","color":"gray","with":[{"translate":"command.islandReturn","color":"light_purple","bold":true}]}
# Return to island trigger
execute as @a run trigger islandReturn set 0
scoreboard players enable @a[tag=islandVisit] islandReturn
execute as @a[tag=islandVisit] at @s unless score @s islandReturn matches 0 run function lobby:island/return

# Visiting gamemode changes
execute as @a run trigger islandSpectate set 0
scoreboard players enable @a[tag=islandVisit,tag=!lobbyParkour] islandSpectate
execute as @a[tag=islandVisit,tag=!lobbyParkour] unless score @s islandSpectate matches 0 run function lobby:island/switch_gamemode

# Visiting GUI
execute as @e[type=chest_minecart,tag=lobbyMinigames] at @s run function lobby:visit/gui_main

# Start play trigger
execute as @a[team=!blue,team=!red,team=!green,team=!orange,x=-549,y=10,z=580,dx=2,dy=0.1,dz=2] at @s run function lobby:main/tp
execute as @a[team=blue,x=-549,y=10,z=580,dx=2,dy=0.1,dz=2] at @s run function lobby:try_play
execute as @a[team=red,x=-549,y=10,z=580,dx=2,dy=0.1,dz=2] at @s run function lobby:try_play
execute as @a[team=green,x=-549,y=10,z=580,dx=2,dy=0.1,dz=2] at @s run function lobby:try_play
execute as @a[team=orange,x=-549,y=10,z=580,dx=2,dy=0.1,dz=2] at @s run function lobby:try_play
# Main countdown timer
execute if score countdownMain= lobby matches 1 run function lobby:main/countdown

# Join detect
execute as @a[tag=new,tag=!firstJoined] unless predicate lobby:moved at @s run function lobby:first_message
execute as @a[tag=!new,tag=!firstJoined] at @s run function lobby:first_joined

# Players who rejoin
tag @a[scores={leave=1..}] remove joined
execute as @a[tag=!joined] at @s run function lobby:join

# End trigger
scoreboard objectives add endGame trigger
execute as @a run trigger endGame set 0
execute unless score timer= endGame matches 1.. as @a[tag=ingame,scores={endGame=1..}] run function lobby:end/start_vote
execute if score timer= endGame matches 1.. run scoreboard players remove timer= endGame 1
execute if score timer= endGame matches ..0 run function lobby:end/end_vote
execute if score timer= endGame matches 1.. as @a[tag=ingame,scores={endGame=1..}] run function lobby:end/vote
scoreboard players enable @a[tag=ingame,tag=!endVoted] endGame

# End if players leave
execute if score playing= lobby matches 1.. store result score players= lobby if entity @a[tag=ingame]
execute if score playing= lobby matches 1.. unless score players= lobby matches 2.. as @r run function lobby:end/no_players

# Team joining
execute as @e[type=armor_stand,tag=lobbyJoinStand,team=blue] at @s as @a[tag=!lobbyJoinTempblue,distance=..3.5] at @s run function lobby:teams/try_join {"team":"blue","color":"#0088ff"}
execute as @e[type=armor_stand,tag=lobbyJoinStand,team=red] at @s as @a[tag=!lobbyJoinTempred,distance=..3.5] at @s run function lobby:teams/try_join {"team":"red","color":"red"}
execute as @e[type=armor_stand,tag=lobbyJoinStand,team=green] at @s as @a[tag=!lobbyJoinTempgreen,distance=..3.5] at @s run function lobby:teams/try_join {"team":"green","color":"green"}
execute as @e[type=armor_stand,tag=lobbyJoinStand,team=orange] at @s as @a[tag=!lobbyJoinTemporange,distance=..3.5] at @s run function lobby:teams/try_join {"team":"orange","color":"gold"}
execute as @e[type=armor_stand,tag=lobbyJoinStand,team=] at @s as @a[tag=!lobbyJoinTempleave,distance=..3.5] at @s run function lobby:teams/try_leave

tag @a remove lobbyStillIn
execute as @e[type=armor_stand,tag=lobbyJoinStand,team=blue] at @s run tag @a[tag=lobbyJoinTempblue,distance=4..] remove lobbyJoinTempblue
execute as @e[type=armor_stand,tag=lobbyJoinStand,team=red] at @s run tag @a[tag=lobbyJoinTempred,distance=4..] remove lobbyJoinTempred
execute as @e[type=armor_stand,tag=lobbyJoinStand,team=green] at @s run tag @a[tag=lobbyJoinTempgreen,distance=4..] remove lobbyJoinTempgreen
execute as @e[type=armor_stand,tag=lobbyJoinStand,team=orange] at @s run tag @a[tag=lobbyJoinTemporange,distance=4..] remove lobbyJoinTemporange
execute as @e[type=armor_stand,tag=lobbyJoinStand,team=] at @s run tag @a[tag=lobbyJoinTempleave,distance=4..] remove lobbyJoinTempleave

# Weakness
execute unless score playing= lobby matches 1.. run effect give @a weakness infinite 255 true

# Delivery Duel Pig
clear @a carrot_on_a_stick[custom_data={ddPig:1b}]
kill @e[type=item,nbt={Item:{id:"minecraft:carrot_on_a_stick",count:1,components:{"minecraft:custom_data":{ddPig:1b}}}}]
execute unless score playing= lobby matches 1.. as @a[nbt={RootVehicle:{Entity:{Tags:["ddPig"]}}}] run item replace entity @s weapon.offhand with carrot_on_a_stick[custom_model_data=1,custom_data={ddPig:1b}]
# Popping Pilots Eltra
kill @e[type=item,nbt={Item:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:custom_data":{ppElytra:1b}}}}]
execute unless score playing= lobby matches 1.. as @a if items entity @s armor.chest elytra[custom_data={ppElytra:1b}] unless items entity @s weapon.offhand firework_rocket run clear @s firework_rocket[custom_data={ppElytra:1b}]
execute unless score playing= lobby matches 1.. as @a if items entity @s armor.chest elytra[custom_data={ppElytra:1b}] unless items entity @s weapon.offhand firework_rocket run item replace entity @s weapon.offhand with firework_rocket[custom_data={ppElytra:1b}]


# Graphing
scoreboard players add #graph= lobby 1
execute if score #graph= lobby matches 2.. positioned -574.75 26 562.99 rotated ~180 ~ run function graphing:fullgraph
execute if score #graph= lobby matches 2.. run scoreboard players set #graph= lobby 0


# Lobby Parkour
execute positioned -488 17 572 as @a[dx=-20,dy=-5,dz=-20,tag=!lobbyParkourTP] at @s if block ~ 17 ~ structure_void run function general:fade/main_s
execute positioned -488 17 572 as @a[dx=-20,dy=-5,dz=-20,tag=!lobbyParkourTP] at @s if block ~ 17 ~ structure_void run tag @s add lobbyParkourTP
# TP TIMER
scoreboard objectives add lobbyParkourTP dummy
scoreboard players add @a[tag=lobbyParkourTP] lobbyParkourTP 1
execute as @a[tag=lobbyParkourTP,scores={lobbyParkourTP=8..}] at @s run function lobby:parkour/start
scoreboard players reset @a[tag=!lobbyParkourTP] lobbyParkourTP
# Lava fail
execute positioned -2881 51 -3014 as @a[tag=lobbyParkour,dx=-55,dy=-5,dz=20] at @s run function lobby:parkour/fail_lava
# Parkour completion
execute unless score pParkour= lobby matches 1 positioned -2851 72 -2980 if block ~ ~ ~ minecraft:polished_blackstone_button[powered=true] as @p run function lobby:parkour/finish_parkour
execute unless score pParkour= lobby matches 1 positioned -2851 72 -2979 if block ~ ~ ~ minecraft:polished_blackstone_button[powered=true] as @p run function lobby:parkour/finish_parkour
execute unless score pParkour= lobby matches 1 positioned -2852 72 -2980 if block ~ ~ ~ minecraft:polished_blackstone_button[powered=true] as @p run function lobby:parkour/finish_parkour
execute unless score pParkour= lobby matches 1 positioned -2852 72 -2979 if block ~ ~ ~ minecraft:polished_blackstone_button[powered=true] as @p run function lobby:parkour/finish_parkour
# Maze Completion
execute unless score pMaze= lobby matches 1 positioned -2856 58 -3061 if block ~ ~ ~ minecraft:polished_blackstone_button[powered=true] as @p run function lobby:parkour/finish_maze
execute unless score pMaze= lobby matches 1 positioned -2856 58 -3059 if block ~ ~ ~ minecraft:polished_blackstone_button[powered=true] as @p run function lobby:parkour/finish_maze
execute unless score pMaze= lobby matches 1 positioned -2858 58 -3061 if block ~ ~ ~ minecraft:polished_blackstone_button[powered=true] as @p run function lobby:parkour/finish_maze
execute unless score pMaze= lobby matches 1 positioned -2858 58 -3059 if block ~ ~ ~ minecraft:polished_blackstone_button[powered=true] as @p run function lobby:parkour/finish_maze
execute unless score pMaze= lobby matches 1 positioned -2857 58 -3060 if block ~ ~ ~ minecraft:polished_blackstone_button[powered=true] as @p run function lobby:parkour/finish_maze
# Finish Parkour Trigger
scoreboard objectives add finishParkour trigger
execute as @a run trigger finishParkour set 0
execute if score pParkour= lobby matches 1 if score pMaze= lobby matches 1 unless score pFinish= lobby matches 1 run scoreboard players enable @a[tag=lobbyParkour] finishParkour
execute as @a[tag=lobbyParkour] at @s unless score pFinish= lobby matches 1 if score @s finishParkour matches 1.. run function lobby:parkour/finish


# Lobby boosts
execute as @a[x=-530,y=10,z=544,dx=0,dy=0.1,dz=0] at @s unless score @s lobbyBoostDelay matches 1.. run function lobby:boost_pad
scoreboard players remove @a[scores={lobbyBoostDelay=1..}] lobbyBoostDelay 1

# Respawn visiting cart
execute positioned -585 13.2 566 unless entity @e[type=chest_minecart,tag=lobbyMinigames,distance=..1] run function lobby:visit/spawn_cart
execute store result score carts= lobby if entity @e[type=chest_minecart,tag=lobbyMinigames]
execute positioned -585 13.2 566 if score carts= lobby matches 2.. run function lobby:visit/spawn_cart

# Lobby song
execute unless score playing= lobby matches 1.. run scoreboard players add @a[scores={lobby_song=0..}] lobby_song 1
execute unless score playing= lobby matches 1.. as @a[scores={lobby_song=3400..}] at @s run function lobby:play_menu

# Clear people stealin books
execute unless score playing= lobby matches 1.. run clear @a enchanted_book

# Stop sheep escaping
# execute as @e[type=sheep,x=-594,y=12,z=545,dx=30,dy=10,dz=30] run tp @s 0 -300 0

# Minis ARG
execute if block -597 15 546 minecraft:stone_button[face=floor,facing=north,powered=true] run fill -606 13 547 -606 12 547 air destroy
execute if block -597 15 546 minecraft:stone_button[face=floor,facing=north,powered=true] run schedule function lobby:arg/start_close 2s
execute if block -597 15 546 minecraft:stone_button[face=floor,facing=north,powered=true] run setblock -597 15 546 minecraft:stone_button[face=floor,facing=north,powered=false]
# Sheep
execute positioned -614 13 560 as @a[distance=..1,tag=arg] if block -611 17 560 gray_stained_glass run fill -611 17 560 -611 13 564 air destroy
execute at @e[type=minecraft:item] if entity @p[tag=arg] run data merge entity @e[type=item,limit=1,sort=nearest] {PickupDelay:0s}
execute positioned -546 9 517 store result score sheep= lobby if entity @e[dx=1,dy=0,dz=1,type=sheep,nbt={CustomName:'"Lurelei"'}]
execute positioned -546 9 517 if score sheep= lobby matches 1.. run tp @e[dx=1,dy=1,dz=1,type=sheep] 0 -200 0
execute positioned -546 9 517 if score sheep= lobby matches 1.. run kill @e[dx=1,dy=1,dz=1,type=sheep]
execute positioned -546 9 517 if score sheep= lobby matches 1.. run clear @a[tag=arg] wheat
execute positioned -546 9 517 if score sheep= lobby matches 1.. run give @a[tag=arg] spyglass
execute positioned -546 9 517 if score sheep= lobby matches 1.. as @a[tag=arg] at @s run playsound block.note_block.pling master @s
# Ending
execute if block -582 12 523 dispenser{Items:[{Slot:0b,id:"minecraft:heart_of_the_sea",count:1}]} run function lobby:arg/win
execute if block -582 12 523 dispenser{Items:[{Slot:1b,id:"minecraft:heart_of_the_sea",count:1}]} run function lobby:arg/win
execute if block -582 12 523 dispenser{Items:[{Slot:2b,id:"minecraft:heart_of_the_sea",count:1}]} run function lobby:arg/win
execute if block -582 12 523 dispenser{Items:[{Slot:3b,id:"minecraft:heart_of_the_sea",count:1}]} run function lobby:arg/win
execute if block -582 12 523 dispenser{Items:[{Slot:4b,id:"minecraft:heart_of_the_sea",count:1}]} run function lobby:arg/win
execute if block -582 12 523 dispenser{Items:[{Slot:5b,id:"minecraft:heart_of_the_sea",count:1}]} run function lobby:arg/win
execute if block -582 12 523 dispenser{Items:[{Slot:6b,id:"minecraft:heart_of_the_sea",count:1}]} run function lobby:arg/win
execute if block -582 12 523 dispenser{Items:[{Slot:7b,id:"minecraft:heart_of_the_sea",count:1}]} run function lobby:arg/win
execute if block -582 12 523 dispenser{Items:[{Slot:8b,id:"minecraft:heart_of_the_sea",count:1}]} run function lobby:arg/win
# Bars
execute positioned -577 12 502 if block ~ ~ ~ iron_bars if entity @a[tag=arg,distance=..2.5] run setblock -577 12 502 air destroy
execute positioned -577 12 502 if block ~ ~ ~ air unless entity @a[tag=arg,distance=..2.5] run setblock -577 12 502 iron_bars[east=false,north=true,south=false,waterlogged=false,west=true]
scoreboard players add fuck= lobby 1
execute if score fuck= lobby matches 2.. run scoreboard players set fuck= lobby 0
execute if score fuck= lobby matches 0 positioned -565 16 539 run tp @e[type=boat,tag=lobbyBoat,distance=1..,nbt=!{Passengers:[]}] ~ ~ ~ 0 0

# Particles
# Portal
particle portal -548 11 581 1.5 1 1.5 0.5 2 normal
# Volcano
particle smoke -543 20 557 2 1 2 0.025 3 normal
# Phil
particle mycelium -559 12 523 3 1 3 0 2 normal
