kill @e[tag=29clam]

summon marker 28011 22 27990 {Tags:["29clam"],Rotation:[0f,0f]}
summon marker 28006 15 27990 {Tags:["29clam"]}
summon marker 28009 10 28000 {Tags:["29clam"],Rotation:[90f,0f]}
summon marker 28000 9 28000 {Tags:["29clam"],Rotation:[90f,0f]}
summon marker 27991 10 27992 {Tags:["29clam"]}
summon marker 27995 18 27990 {Tags:["29clam"],Rotation:[-90f,0f]}
summon marker 27984 20 28005 {Tags:["29clam"],Rotation:[-90f,0f]}
summon marker 27982 12 28003 {Tags:["29clam"],Rotation:[180f,0f]}
summon marker 27995 13 28013 {Tags:["29clam"],Rotation:[180f,0f]}
summon marker 28003 23 28019 {Tags:["29clam"],Rotation:[180f,0f]}
summon marker 28009 16 28008 {Tags:["29clam"],Rotation:[180f,0f]}

execute as @e[type=marker,tag=29clam] at @s rotated as @s run function games:29/spawn_model