scoreboard players set init= lobby 1
scoreboard players set playing= lobby 0

scoreboard players set minigame= lobby 1
scoreboard players set minigameMin= lobby 1
scoreboard players set minigameMax= lobby 27
scoreboard players set minigameSelectDelay= lobby 5
scoreboard players set minigameSelectTimer= lobby 0

scoreboard players set visitPage= lobby 0

scoreboard players set testing options 0


function lobby:init_entities

scoreboard objectives add islandReturn trigger
scoreboard objectives add islandSpectate trigger
scoreboard objectives add lobbyBoostDelay dummy

gamerule reducedDebugInfo true
gamerule sendCommandFeedback false