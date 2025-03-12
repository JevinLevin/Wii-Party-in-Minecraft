scoreboard players set testing options 1
function games:1/end
function games:2/end
function games:3/end
function games:4/end
function games:5/end
function games:6/end
function games:8/end
function games:10/end
function games:13/end
function games:18/end
function games:22/end
function games:23/end
function games:24/end
function games:26/end
function games:28/end
function games:36/end
function games:38/end
function games:48/end
function games:27/end
function games:12/end
function games:16/end
function games:35/end
function games:19/end
function games:29/end
function games:41/end
function games:15/end
function games:21/end

schedule clear games:1/start
schedule clear games:2/start
schedule clear games:3/start
schedule clear games:4/start
schedule clear games:5/start
schedule clear games:6/start
schedule clear games:8/start
schedule clear games:10/start
schedule clear games:13/start
schedule clear games:18/start
schedule clear games:22/start
schedule clear games:23/start
schedule clear games:24/start
schedule clear games:26/start
schedule clear games:28/start
schedule clear games:36/start
schedule clear games:38/start
schedule clear games:48/start
schedule clear games:27/start
schedule clear games:12/start
schedule clear games:16/start
schedule clear games:35/start
schedule clear games:19/start
schedule clear games:29/start
schedule clear games:41/start
schedule clear games:15/start
schedule clear games:21/start

function board:draw/end
function board:dice_roll/end
schedule function board:select/end 1t

function board:tiles/volcano/set_normal
scoreboard players set errupted= tiles 0

title @a[tag=playing] title ""
title @a[tag=playing] subtitle ""
title @a[tag=playing] actionbar ""
stopsound @a[tag=playing]

# Enable movement
execute as @a[tag=ingame] run attribute @s minecraft:generic.movement_speed base set 0.1
execute as @a[tag=ingame] run attribute @s minecraft:generic.jump_strength base set 0.41999998688697815

tp @a[tag=playing] 0 20 0
gamemode adventure @a[tag=playing]

tag @a remove ingame
tag @a remove playing
tag @a remove dead
tag @a remove inactive

tag @a remove volcano
tag @a remove startFinal
tag @a remove selectChoose

tag @a remove endVoted

scoreboard objectives setdisplay sidebar

bossbar set minecraft:10bluetimer visible false
bossbar set minecraft:10redtimer visible false
bossbar set minecraft:10greentimer visible false
bossbar set minecraft:10orangetimer visible false
bossbar set minecraft:26blue visible false
bossbar set minecraft:26red visible false
bossbar set minecraft:26green visible false
bossbar set minecraft:26orange visible false
bossbar set minecraft:4blue visible false
bossbar set minecraft:4red visible false
bossbar set minecraft:4green visible false
bossbar set minecraft:4orange visible false
bossbar set minecraft:4spectator visible false
bossbar set minecraft:4bluestamina visible false
bossbar set minecraft:4redstamina visible false
bossbar set minecraft:4greenstamina visible false
bossbar set minecraft:4orangestamina visible false
bossbar set minecraft:4bluechop visible false
bossbar set minecraft:4redchop visible false
bossbar set minecraft:4greenchop visible false
bossbar set minecraft:4orangechop visible false
bossbar set minecraft:48bluetimer visible false
bossbar set minecraft:48redtimer visible false
bossbar set minecraft:48greentimer visible false
bossbar set minecraft:48orangetimer visible false
bossbar set minecraft:24bluetimer visible false
bossbar set minecraft:24redtimer visible false
bossbar set minecraft:24greentimer visible false
bossbar set minecraft:24orangetimer visible false
bossbar set minecraft:19bluetimer visible false
bossbar set minecraft:19redtimer visible false
bossbar set minecraft:19greentimer visible false
bossbar set minecraft:19orangetimer visible false
bossbar set minecraft:29bluetimer visible false
bossbar set minecraft:29redtimer visible false
bossbar set minecraft:29greentimer visible false
bossbar set minecraft:29orangetimer visible false
bossbar set minecraft:41bluetimer visible false
bossbar set minecraft:41redtimer visible false
bossbar set minecraft:41greentimer visible false
bossbar set minecraft:41orangetimer visible false
bossbar set minecraft:21bluetimer visible false
bossbar set minecraft:21redtimer visible false
bossbar set minecraft:21greentimer visible false
bossbar set minecraft:21orangetimer visible false

scoreboard players set testing options 0

gamerule sendCommandFeedback true

schedule function lobby:return_to_lobby 2t

schedule clear board:dice_roll/end_go

function lobby:end/end_vote
scoreboard players reset eventRoll= tiles

# Enable movement
execute as @a run attribute @s minecraft:generic.movement_speed base set 0.1
execute as @a run attribute @s minecraft:generic.jump_strength base set 0.41999998688697815
execute as @a run attribute @s minecraft:generic.attack_speed base set 4.0
execute as @a run attribute @s generic.gravity base set 0.08

stopsound @a voice

# Stop songs looping
schedule clear games:23/play_song
schedule clear games:26/play_song
schedule clear games:36/play_song 
schedule clear games:12/play_song
schedule clear games:4/play_song
schedule clear games:27/play_song
schedule clear games:48/play_song
schedule clear games:16/play_song
schedule clear games:35/play_song
schedule clear lobby:play_menu

schedule clear board:dice_roll/play_song
schedule clear games:1/play_song
schedule clear games:2/play_song
schedule clear games:5/play_song
schedule clear games:6/play_song
schedule clear games:8/play_song
schedule clear games:10/play_song
schedule clear games:18/play_song
schedule clear games:22/play_song
schedule clear games:24/play_song
schedule clear games:28/play_song
schedule clear games:38/play_song
schedule clear board:tiles/final/play_song
schedule clear games:19/play_song
schedule clear games:29/play_song
schedule clear games:41/play_song
schedule clear games:15/play_song
schedule clear games:21/play_song

# Clear intros
schedule clear games:1/play_intro
schedule clear games:2/play_intro
schedule clear games:3/play_intro
schedule clear games:4/play_intro
schedule clear games:5/play_intro
schedule clear games:8/play_intro
schedule clear games:10/play_intro
schedule clear games:13/play_intro
schedule clear games:16/play_intro
schedule clear games:18/play_intro
schedule clear games:22/play_intro
schedule clear games:23/play_intro
schedule clear games:24/play_intro
schedule clear games:26/play_intro
schedule clear games:28/play_intro
schedule clear games:35/play_intro
schedule clear games:36/play_intro
schedule clear games:38/play_intro
schedule clear games:48/play_intro
schedule clear games:19/play_intro
schedule clear games:29/play_intro
schedule clear games:41/play_intro
schedule clear games:15/play_intro
schedule clear games:21/play_intro

execute as @a run attribute @s player.entity_interaction_range base set 3
tag @a remove lobbyParkour
tag @a remove islandVisit
scoreboard players set @a islandReturn 0

# unblock final
fill -196 58 49 -194 64 49 air

time set noon

tag @a remove arg