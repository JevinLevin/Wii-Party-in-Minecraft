tag @a[team=blue] add ingame
tag @a[team=red] add ingame
tag @a[team=green] add ingame
tag @a[team=orange] add ingame
tag @a add playing

title @a actionbar ""

scoreboard players set playing= lobby 1
scoreboard players set @a islandReturn 0
scoreboard players set errupted= tiles 0
scoreboard players reset eventRoll= tiles

tag @a remove islandVisit
tag @a remove volcano
tag @a remove startFinal
tag @a remove islandVisit
tag @a remove selectChoose
tag @a remove inactive

scoreboard players set round= game 11
scoreboard players set testing options 0
scoreboard players set @a boardPos 0
scoreboard players set @a newBoardPos 0
scoreboard players set chosenGame1= minigameSelect 0
scoreboard players set chosenGame2= minigameSelect 0
scoreboard players set chosenGame3= minigameSelect 0

kill @e[type=minecraft:area_effect_cloud,tag=tileCloud]

scoreboard objectives setdisplay sidebar

function board:tiles/reset

function board:select/start

#gamerule sendCommandFeedback false

#function board:tiles/ropeswing/stages/stage1

data modify storage minecraft:graphing blue set value []
data modify storage minecraft:graphing red set value []
data modify storage minecraft:graphing green set value []
data modify storage minecraft:graphing orange set value []

execute if entity @a[tag=ingame,team=blue] run data modify storage minecraft:graphing blue set value [0]
execute if entity @a[tag=ingame,team=red] run data modify storage minecraft:graphing red set value [0]
execute if entity @a[tag=ingame,team=green] run data modify storage minecraft:graphing green set value [0]
execute if entity @a[tag=ingame,team=orange] run data modify storage minecraft:graphing orange set value [0]
data modify storage minecraft:graphing config.datapoints set value 1

schedule clear board:tiles/ropeswing/stages/stage1
schedule clear board:tiles/ropeswing/stages/stage1set
schedule clear board:tiles/ropeswing/stages/stage2
schedule clear board:tiles/ropeswing/stages/stage2set
schedule clear board:tiles/ropeswing/stages/stage3
schedule clear board:tiles/ropeswing/stages/stage3set
schedule clear board:tiles/ropeswing/stages/stage4
schedule clear board:tiles/ropeswing/stages/stage4set
schedule clear board:tiles/ropeswing/stages/stage5
schedule clear board:tiles/ropeswing/stages/stage5set
schedule clear board:tiles/ropeswing/stages/stage6
schedule clear board:tiles/ropeswing/stages/stage6set
schedule clear board:tiles/ropeswing/stages/stage7
schedule clear board:tiles/ropeswing/stages/stage7set
schedule clear board:tiles/ropeswing/stages/stage8
schedule clear board:tiles/ropeswing/stages/stage8set
schedule clear board:tiles/ropeswing/stages/stage9
schedule clear board:tiles/ropeswing/stages/stage9set
function board:tiles/ropeswing/stages/stage1

schedule clear lobby:play_menu

stopsound @a voice

tellraw @a[tag=playing] {"translate":"lobby.EndGame.Info","color":"light_purple","with":[{"translate":"command.endGame","bold":true}]}

execute as @a run attribute @s player.entity_interaction_range base set 3
tag @a remove lobbyParkour
tag @a remove islandVisit
scoreboard players set @a islandReturn 0


# GAME ID
scoreboard objectives add gameID dummy
scoreboard players add value= gameID 1
scoreboard players operation @a[tag=ingame] gameID = value= gameID