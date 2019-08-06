QuestNameFormat:
    type: format
    format: "<green>Quest: <gold><text>"

QuestDescriptionFormat:
    type: format
    format: "<aqua>Description:<&r> <text>"

QuestDataHandler:
    debug: false
    type: world
    events:
        on player joins:
        - define data <player.uuid>_quest_data
        - if <server.has_file[playerdata/<player.uuid>/quest_data.yml]>:
            - ~yaml load:playerdata/<player.uuid>/quest_data.yml id:<[data]>
        - else:
            - yaml create id:<[data]>
            - yaml id:<[data]> set player_uuid:<player.uuid>
            - ~yaml id:<[data]> savefile:playerdata/<player.uuid>/quest_data.yml
        - yaml set id:<[data]> set player_last_known_name:<player.name>
        on player quits:
        - ~yaml id:<script.yaml_key[data]> savefile:playerdata/<player.uuid>/quest_data.yml

QuestAcceptHandler:
    debug: false
    type: task
    definitions: quest_internalname
    script:
    - define data <player.uuid>_quest_data
    - yaml id:<[quest_internalname]> copykey:player_data.<[quest_internalname]> quests.active.<[quest_internalname]> to_id:<[data]>
    - yaml id:<[data]> set quests.active.<[quest_internalname]>.current_stage:1
    - define current_stage 1
    - narrate "<yaml[<[quest_internalname]>].read[messages.offer]>"
    - narrate format:QuestNameFormat "<yaml[<[quest_internalname]>].read[player_data.<[quest_internalname]>.name]>"
    - narrate format:QuestDescriptionFormat "<yaml[<[quest_internalname]>].read[player_data.<[quest_internalname]>.description]>"
    - narrate "<green>Stage <[current_stage]>: <&r><yaml[<[quest_internalname]>].read[player_data.<[quest_internalname]>.stages.<[current_stage]>.description]>"
    - foreach <yaml[<[quest_internalname]>].read[player_data.<[quest_internalname]>.stages.<[current_stage]>.objectives]>:
        - narrate "• <yaml[<[quest_internalname]>].read[player_data.<[quest_internalname]>.stages.<[current_stage]>.objectives.<[value]>.name]>: <yaml[<[quest_internalname]>].read[player_data.<[quest_internalname]>.stages.<[current_stage]>.objectives.<[value]>.progress]>/<yaml[<[quest_internalname]>].read[player_data.<[quest_internalname]>.stages.<[current_stage]>.objectives.<[value]>.total]>"
    

QuestStageAdvanceHandler:
    debug: false
    type: task
    definitions: quest_internalname
    script:
    - define data <player.uuid>_quest_data
    - yaml id:<[data]> set quests.active.<[quest-quest_internalname]>.current_stage:++
    - define current_stage <yaml[<[data]>].read[quests.active.<[quest_internalname]>.current_stage]>
    - narrate format:QuestNameFormat "<yaml[<[quest_internalname]>].read[player_data.<[quest_internalname]>.name]>"
    - narrate format:QuestDescriptionFormat "<yaml[<[quest_internalname]>].read[player_data.<[quest_internalname]>.description]>"
    - narrate "<green>Stage <[current_stage]>: <&r><yaml[<[quest_internalname]>].read[player_data.<[quest_internalname]>.stages.<[current_stage]>.description]>"
    - foreach <yaml[<[quest_internalname]>].read[player_data.<[quest_internalname]>.stages.<[current_stage]>.objectives]>:
        - narrate "• <yaml[<[quest_internalname]>].read[player_data.<[quest_internalname]>.stages.<[current_stage]>.objectives.<[value]>.name]>: <yaml[<[quest_internalname]>].read[player_data.<[quest_internalname]>.stages.<[current_stage]>.objectives.<[value]>.progress]>/<yaml[<[quest_internalname]>].read[player_data.<[quest_internalname]>.stages.<[current_stage]>.objectives.<[value]>.total]>"

QuestQuitHandler:
    debug: false
    type: task
    definitions: quest_internalname
    script:
    - define data <player.uuid>_quest_data
    - yaml id:<[data]> set quests.active.<[quest_internalname]>:!

QuestCompletionHandler:
    debug: false
    type: task
    definitions: quest_internalname
    script:
    - define data <player.uuid>_quest_data
    - yaml id:<[data]> set quests.active.<[quest_internalname]>:!
    - yaml id:<[data]> set quests.completed.<[quest_internalname]>.completion_count:++
    - yaml id:<[data]> set quests.completed.<[quest_internalname]>.last_completed:<util.date.time.duration>

QuestRewardHandler:
    debug: false
    type: task
    definitions: quest_internalname
    script:
    - define data <player.uuid>_quest_data
    - if <yaml[<[quest_internalname]>].contains[rewards.money]>:
        - money give quantity:<yaml[<[quest_internalname]>].read[rewards.money]> players:<player>
    - if <yaml[<[quest_internalname]>].contains[rewards.items]>:
        - foreach <yaml[<[quest_internalname]>].read[rewards.items]>:
            - give <def[value]> player:<player>
    - if <yaml[<[quest_internalname]>].contains[rewards.quest_points]>:
        - yaml id:<[data]> set career.quest_points:+:<yaml[<[quest_internalname]>].read[rewards.quest_points]>
    - if <yaml[<[quest_internalname]>].contains[rewards.scripts]>:
        - foreach <yaml[<[quest_internalname]>].read[rewards.scripts]>:
            - run <[value]> def:<player>|<[quest_internalname]>