scoreboard objectives add lobby dummy
execute unless score init= lobby matches 1.. run function lobby:init

forceload add -979 -1177 -1001 -974

function general:wasd/base/install

scoreboard players add load= game 1
execute as @a at @s run playsound minecraft:block.note_block.bit master @s ~ ~ ~ 3
tellraw @a [{"text":"Map Reloaded [","color":"green","type":"text"},{"score":{"name":"load=","objective":"game"},"color":"yellow","type":"score"},{"text":"]","type":"text"}]

scoreboard objectives add leave minecraft.custom:minecraft.leave_game

# Edit team suffix spaces
function general:scoreboard_suffix

team add black
team modify black color black

# Load back attack
forceload add 3984 4000 4006 4012
# Load risky railway
forceload add 24199 24016 24210 24018
# Load face flip cards
forceload add 36007 35988 35989 36012
# Load barrel daredevil armor stands
forceload add 3009 3001 2992 3005
# Shutter puip mayb fix
forceload add 37999 38015 37936 37952
# Maze daze
forceload add 25041 24972 25021 24992
forceload add 24968 25012 25006 24974
# Walk-Off Signs
forceload add 49001 49131 49001 49167
# Spike ball
forceload add -155 103 -158 93
# Ending
forceload add -202 57 -193 55
# Dragon wall
forceload add -236 -10 -225 -21
# Chop Chops
forceload add 7995 7996 8004 8005
# Ribcage
forceload add -209 112 -227 130
# Popgun posse
forceload add 10992 11001 11001 10982
# Lucky Launch
forceload add 4993 5008 5011 5016
# Friendly Face-Off
forceload add 19148 19145 19167 19164
# Goal getters balls
forceload add 22927 22986 22921 22984
# Risky Railway wall
forceload add 24010 23988
# Ram Jam
forceload add 16020 16001 15952 16001

team add colorAqua
team modify colorAqua color aqua
team add colorDarkAqua
team modify colorDarkAqua color dark_aqua
team add colorDarkGreen
team modify colorDarkGreen color dark_green
team add colorGreen
team modify colorGreen color green
team add colorOrange
team modify colorOrange color gold
team add colorYellow
team modify colorYellow color yellow
team add colorRed
team modify colorRed color red
team add colorDarkRed
team modify colorDarkRed color dark_red
team add colorPurple
team modify colorPurple color dark_purple

team modify blue nametagVisibility always
team modify red nametagVisibility always
team modify green nametagVisibility always
team modify orange nametagVisibility always

scoreboard objectives modify lobbyDisplay numberformat blank
scoreboard objectives modify boardDisplay numberformat blank
scoreboard objectives modify 1display numberformat blank
scoreboard objectives modify 2display numberformat blank
scoreboard objectives modify 3display numberformat blank
scoreboard objectives modify 4display numberformat blank
scoreboard objectives modify 5display numberformat blank
scoreboard objectives modify 6display numberformat blank
scoreboard objectives modify 7display numberformat blank
scoreboard objectives modify 8display numberformat blank
scoreboard objectives modify 9display numberformat blank
scoreboard objectives modify 10display numberformat blank
scoreboard objectives modify 11display numberformat blank
scoreboard objectives modify 12display numberformat blank
scoreboard objectives modify 13display numberformat blank
scoreboard objectives modify 14display numberformat blank
scoreboard objectives modify 15display numberformat blank
scoreboard objectives modify 16display numberformat blank
scoreboard objectives modify 17display numberformat blank
scoreboard objectives modify 18display numberformat blank
scoreboard objectives modify 19display numberformat blank
scoreboard objectives modify 20display numberformat blank
scoreboard objectives modify 21display numberformat blank
scoreboard objectives modify 22display numberformat blank
scoreboard objectives modify 23display numberformat blank
scoreboard objectives modify 24display numberformat blank
scoreboard objectives modify 25display numberformat blank
scoreboard objectives modify 26display numberformat blank
scoreboard objectives modify 27display numberformat blank
scoreboard objectives modify 28display numberformat blank
scoreboard objectives modify 29display numberformat blank
scoreboard objectives modify 30display numberformat blank
scoreboard objectives modify 31display numberformat blank
scoreboard objectives modify 32display numberformat blank
scoreboard objectives modify 33display numberformat blank
scoreboard objectives modify 34display numberformat blank
scoreboard objectives modify 35display numberformat blank
scoreboard objectives modify 36display numberformat blank
scoreboard objectives modify 37display numberformat blank
scoreboard objectives modify 38display numberformat blank
scoreboard objectives modify 39display numberformat blank
scoreboard objectives modify 40display numberformat blank
scoreboard objectives modify 41display numberformat blank
scoreboard objectives modify 42display numberformat blank
scoreboard objectives modify 43display numberformat blank
scoreboard objectives modify 44display numberformat blank
scoreboard objectives modify 45display numberformat blank
scoreboard objectives modify 46display numberformat blank
scoreboard objectives modify 47display numberformat blank
scoreboard objectives modify 48display numberformat blank
scoreboard objectives modify 49display numberformat blank




# Set numbers
scoreboard players set 10000 Numbers 10000
scoreboard players set 50 Numbers 50
scoreboard players set 10 Numbers 10
scoreboard players set 360 Numbers 360
scoreboard players set 250 Numbers 250
scoreboard players set 180 Numbers 180
scoreboard players set 120 Numbers 120
scoreboard players set 100 Numbers 100
scoreboard players set 20 Numbers 20
scoreboard players set 8 Numbers 8
scoreboard players set 7 Numbers 7
scoreboard players set 6 Numbers 6
scoreboard players set 5 Numbers 5
scoreboard players set 4 Numbers 4
scoreboard players set 3 Numbers 3
scoreboard players set 2 Numbers 2
scoreboard players set 1 Numbers 1
scoreboard players set 0 Numbers 0




scoreboard objectives add math dummy

scoreboard players set #1 math 1
scoreboard players set #10 math 10
scoreboard players set #100 math 100
scoreboard players set #1000 math 1000
scoreboard players set #10000 math 10000
scoreboard players set #100000 math 100000
scoreboard players set #1000000 math 1000000
scoreboard players set #10000000 math 10000000
scoreboard players set #100000000 math 100000000
scoreboard players set #1000000000 math 1000000000

scoreboard players set #2 math 2
scoreboard players set #4 math 4
scoreboard players set #8 math 8
scoreboard players set #16 math 16
scoreboard players set #32 math 32
scoreboard players set #64 math 64
scoreboard players set #128 math 128
scoreboard players set #256 math 256
scoreboard players set #512 math 512
scoreboard players set #1024 math 1024
scoreboard players set #2048 math 2048
scoreboard players set #4096 math 4096
scoreboard players set #8192 math 8192
scoreboard players set #16384 math 16384
scoreboard players set #32768 math 32768
scoreboard players set #65536 math 65536
scoreboard players set #131072 math 131072
scoreboard players set #262144 math 262144
scoreboard players set #524288 math 524288
scoreboard players set #1048576 math 1048576
scoreboard players set #2097152 math 2097152
scoreboard players set #4194304 math 4194304
scoreboard players set #8388608 math 8388608
scoreboard players set #16777216 math 16777216
scoreboard players set #33554432 math 33554432
scoreboard players set #67108864 math 67108864
scoreboard players set #134217728 math 134217728
scoreboard players set #268435456 math 268435456
scoreboard players set #536870912 math 536870912
scoreboard players set #1073741824 math 1073741824
scoreboard players set #-2147483648 math -2147483648

scoreboard players set #-1 math -1
scoreboard players set #3 math 3
scoreboard players set #5 math 5
scoreboard players set #6 math 6
scoreboard players set #7 math 7
scoreboard players set #9 math 9
scoreboard players set #15 math 15
scoreboard players set #20 math 20
scoreboard players set #25 math 25
scoreboard players set #45 math 45
scoreboard players set #50 math 50
scoreboard players set #90 math 90
scoreboard players set #180 math 180
scoreboard players set #360 math 360
scoreboard players set #250 math 250
scoreboard players set #500 math 500
scoreboard players set #720 math 720
scoreboard players set #900 math 900
scoreboard players set #1570 math 1570
scoreboard players set #1800 math 1800
scoreboard players set #2000 math 2000
scoreboard players set #2500 math 2500
scoreboard players set #3141 math 3141
scoreboard players set #3600 math 3600
scoreboard players set #4000 math 4000
scoreboard players set #5040 math 5040
scoreboard players set #6283 math 6283