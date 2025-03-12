fill -596 40 545 -625 4 572 air
fill -626 40 545 -650 4 572 air
fill -596 3 545 -625 -1 572 air
fill -626 3 545 -650 -1 572 air

execute as @e[type=player,x=-596,y=0,z=548,dx=-40,dy=30,dz=40] at @s run tp @s -594 12 ~
tag @e[type=!player,x=-596,y=0,z=548,dx=-40,dy=30,dz=40] add lobbyKill
tp @e[tag=lobbyKill] 0 -150 0
kill @e[tag=lobbyKill]



# clone -525 34 531 -539 21 492 -597 11 530