

scoreboard players reset timer= minigameSelect
scoreboard players reset maxTicks= minigameSelect 
scoreboard players reset currentTicks= minigameSelect 
scoreboard players reset choosing= minigameSelect

execute if score selected= minigameSelect matches 1 run scoreboard players operation final= minigameSelect = game1= minigameSelect
execute if score selected= minigameSelect matches 2 run scoreboard players operation final= minigameSelect = game2= minigameSelect
execute if score selected= minigameSelect matches 3 run scoreboard players operation final= minigameSelect = game3= minigameSelect


execute if score final= minigameSelect matches 1 run data modify storage board:minigame_select name set value "DiceyDescent"
execute if score final= minigameSelect matches 2 run data modify storage board:minigame_select name set value "ZombieTag"
execute if score final= minigameSelect matches 3 run data modify storage board:minigame_select name set value "BarrelDaredevil"
execute if score final= minigameSelect matches 4 run data modify storage board:minigame_select name set value "BackAttack"
execute if score final= minigameSelect matches 5 run data modify storage board:minigame_select name set value "LuckyLaunch"
execute if score final= minigameSelect matches 6 run data modify storage board:minigame_select name set value "DerbyDash"
execute if score final= minigameSelect matches 7 run data modify storage board:minigame_select name set value "ChopChops"
execute if score final= minigameSelect matches 8 run data modify storage board:minigame_select name set value "PopgunPosse"
execute if score final= minigameSelect matches 9 run data modify storage board:minigame_select name set value "FlagFracas"
execute if score final= minigameSelect matches 10 run data modify storage board:minigame_select name set value "FriendlyFaceOff"
execute if score final= minigameSelect matches 11 run data modify storage board:minigame_select name set value "GoalGetters"
execute if score final= minigameSelect matches 12 run data modify storage board:minigame_select name set value "RiskyRailway"
execute if score final= minigameSelect matches 13 run data modify storage board:minigame_select name set value "HammerHeads"
execute if score final= minigameSelect matches 14 run data modify storage board:minigame_select name set value "StopWatchers"
execute if score final= minigameSelect matches 15 run data modify storage board:minigame_select name set value "FaceFlip"
execute if score final= minigameSelect matches 16 run data modify storage board:minigame_select name set value "Shutterpup"
execute if score final= minigameSelect matches 17 run data modify storage board:minigame_select name set value "MazeDaze"
execute if score final= minigameSelect matches 18 run data modify storage board:minigame_select name set value "WalkOff"
execute if score final= minigameSelect matches 19 run data modify storage board:minigame_select name set value "TropicalPunch"
execute if score final= minigameSelect matches 20 run data modify storage board:minigame_select name set value "StrategySteps"
execute if score final= minigameSelect matches 21 run data modify storage board:minigame_select name set value "FeatheredFrenzy"
execute if score final= minigameSelect matches 22 run data modify storage board:minigame_select name set value "PearlPlunder"
execute if score final= minigameSelect matches 23 run data modify storage board:minigame_select name set value "ChinUpChamp"
execute if score final= minigameSelect matches 24 run data modify storage board:minigame_select name set value "RamJam"
execute if score final= minigameSelect matches 25 run data modify storage board:minigame_select name set value "SmileSnap"

function board:select/get_name with storage board:minigame_select

title @a[tag=playing] times 0 50 20

execute as @a[tag=playing] at @e[type=marker,tag=selectMarker] run playsound entity.player.levelup master @s ~ ~ ~ 10000 0.75

clear @s minecraft:carrot_on_a_stick[minecraft:custom_data={selectstick:1b}]

function board:select/trigger_minigame
schedule function board:select/end 79t
schedule function general:fade/main 68t

# Put any inactive players back in the game
tag @a[tag=inactive,tag=playing] add ingame
tag @a[tag=ingame] remove inactive

# Store in score for future select
scoreboard players operation chosenGame3= minigameSelect = chosenGame2= minigameSelect
scoreboard players operation chosenGame2= minigameSelect = chosenGame1= minigameSelect
scoreboard players operation chosenGame1= minigameSelect = final= minigameSelect