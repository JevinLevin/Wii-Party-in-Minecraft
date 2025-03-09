execute store result score random= minigameSelect run random value 1..25

scoreboard players set valid= minigameSelect 1
execute if score random= minigameSelect = game1= minigameSelect run scoreboard players set valid= minigameSelect 0
execute if score random= minigameSelect = game2= minigameSelect run scoreboard players set valid= minigameSelect 0
execute if score random= minigameSelect = chosenGame1= minigameSelect run scoreboard players set valid= minigameSelect 0
execute if score random= minigameSelect = chosenGame2= minigameSelect run scoreboard players set valid= minigameSelect 0
execute if score random= minigameSelect = chosenGame3= minigameSelect run scoreboard players set valid= minigameSelect 0

# If its valid, set to the next game
execute if score valid= minigameSelect matches 1 if score game2= minigameSelect matches 1.. if score game3= minigameSelect matches 0 run scoreboard players operation game3= minigameSelect = random= minigameSelect
execute if score valid= minigameSelect matches 1 if score game1= minigameSelect matches 1.. if score game2= minigameSelect matches 0 run scoreboard players operation game2= minigameSelect = random= minigameSelect
execute if score valid= minigameSelect matches 1 if score game1= minigameSelect matches 0 run scoreboard players operation game1= minigameSelect = random= minigameSelect


# If not valid then it rolled a duplicate, try again
execute if score valid= minigameSelect matches 0 run function board:select/choose_minigames