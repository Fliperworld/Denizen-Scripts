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
    definitions: player|quest_file|quest_internalname
    script:
    - define data <[player].uuid>_quest_data
    - yaml id:<[quest_file]> copykey:player_data.<[quest_internalname]> quests.active.<[quest_internalname]> to_id:<[data]>

QuestQuitHandler:
    debug: false
    type: task
    definitions: player|quest_file|quest_internalname
    script:
    - define data <[player].uuid>_quest_data
    - yaml id:<[data]> set quests.active.<[quest_internalname]>:!

QuestCompletionHandler:
    debug: false
    type: task
    definitions: player|quest_file|quest_internalname
    script:
    - define data <[player].uuid>_quest_data
    - yaml id:<[data]> set quests.active.<[quest_internalname]>:!
    - yaml id:<[data]> set quests.completed.<[quest_internalname]>.completion_count:++
    - yaml id:<[data]> set quests.completed.<[quest_internalname]>.last_completed:<util.date.time.duration>

QuestRewardHandler:
    debug: false
    type: task
    definitions: player|quest_file|quest_internalname
    script:
    - define data <[player].uuid>_quest_data
    - if <yaml[<[quest_file]>].contains[rewards.money]>:
        - money give quantity:<yaml[quest_file].read[rewards.money]> players:<[player]>
    - if <yaml[<[quest_file]>].contains[rewards.items]>:
        - foreach <yaml[<[quest_file]>].read[rewards.items]>:
            - give <def[value]> player:<[player]>
    - if <yaml[<quest_file]>].contains[rewards.quest_points]>:
        - yaml id:<[data]> set quest_points:+:<yaml[<[quest_file]>].read[rewards.quest_points]>
    - if <yaml[<[quest_file]>].contains[rewards.scripts]>:
        - foreach <yaml[<[quest_file]>].read[rewards.scripts]>:
            - run <[value]> def:<[player]>|<[quest_file]>|<[quest_internalname]>