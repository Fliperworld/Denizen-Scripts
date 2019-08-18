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

QuestStageProgressHandler:
    debug: false
    type: task
    definitions: quest_internalname
    script:
    - define data <player.uuid>_quest_data
    - define current_stage <yaml[<[data]>].read[quests.active.<[quest_internalname]>.current_stage]>
    - yaml id:<[data]> set quests.active.<[quest_internalname]>.stages.<[current_stage]>.progress:++
    - if <yaml[<[data]>].read[quests.active.<[quest_internalname]>.stages.<[current_stage]>.progress]> >= <yaml[<[data]>].read[quests.active.<[quest_internalname]>.stages.<[current_stage]>.total]>:
        - if <yaml[<[data]>].contains[quests.active.<[quest_internalname]>.stages.<[current_stage].add[1]>]>:
            - run QuestStageAdvanceHandler def:<[quest_internalname]> player:<player>
        - else:
            - run QuestCompletionHandler def:<[quest_internalname]> player:<player>

QuestProgressHandler:
    debug: false
    type: task
    definitions: quest_internalname
    script:
    - define data <player.uuid>_quest_data
    - define current_stage <yaml[<[data]>].read[quests.active.<[quest_internalname]>.current_stage]>
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
    - narrate "<red>QUEST QUIT: <yaml[<[quest_internalname]>].read[player_data.<[quest_internalname]>.name]>"

QuestCompletionHandler:
    debug: false
    type: task
    definitions: quest_internalname
    script:
    - define data <player.uuid>_quest_data
    - yaml id:<[data]> set quests.active.<[quest_internalname]>:!
    - yaml id:<[data]> set quests.completed.<[quest_internalname]>.completion_count:++
    - yaml id:<[data]> set quests.completed.<[quest_internalname]>.last_completed:<util.date.time.duration>
    - narrate "<gold>QUEST COMPLETE: <yaml[<[quest_internalname]>].read[player_data.<[quest_internalname]>.name]>"
    - narrate "<yaml[<[quest_internalname]>].read[messages.completion]>"
    - narrate "<green>Rewards:"
    - run QuestRewardHandler def:<[quest_internalname]> player:<player>

QuestRepeatableHandler:
    debug: false
    type: procedure
    definitions: quest_internalname
    script:
    - define data:<player.uuid>_quest_data
    - define current_week:<util.date.time.duration.in_weeks.round_to[0]>
    - define current_day:<util.date.time.duration.in_days.round_to[0]>
    - define last_completed:<yaml[<[data]>].read[quests.completed.<[quest_internalname]>.last_completed].as_duration>
    - choose <yaml[<[quest_internalname]>].read[config.reset.period]>:
        - case 7d:
            - if <[current_week]> > <[last_completed].in_weeks>:
                - determine true
            - else if <[current_week]> == <[last_completed].in_weeks> && <util.date.time.day_of_week> > 5:
                - determine true
            - else if <util.date.time.day_of_week> == 5 && <util.date.time.hour> >= 19:
                - determine true
            - else:
                - determine false
        - case 1d:
            - if <[current_day].sub[1]> > <[last_completed].in_days>:
                - determine true
            - else if <[current_day].sub[1]> == <[last_completed].in_days> && <[last_completed].time.hour> < 19:
                - determine true
            - else if <[last_completed].time.hour> >= 19:
                - determine false
            - else if <[current_day]> == <[last_completed].in_days> && <util.date.time.hour> >= 19 && <[last_completed].time.hour> < 19:
                - determine true
            - else:
                - determine false

QuestRewardHandler:
    debug: false
    type: task
    definitions: quest_internalname
    script:
    - define data <player.uuid>_quest_data
    - if <yaml[<[quest_internalname]>].contains[rewards.money]>:
        - money give quantity:<yaml[<[quest_internalname]>].read[rewards.money]> players:<player>
        - narrate "<gold><yaml[<[quest_internalname]>].read[rewards.money]> gold"
    - if <yaml[<[quest_internalname]>].contains[rewards.items]>:
        - foreach <yaml[<[quest_internalname]>].read[rewards.items]>:
            - give <[value]> player:<player>
            - narrate "<[value].quantity>x <[value].display>"
    - if <yaml[<[quest_internalname]>].contains[rewards.quest_points]>:
        - yaml id:<[data]> set career.quest_points:+:<yaml[<[quest_internalname]>].read[rewards.quest_points]>
    - if <yaml[<[quest_internalname]>].contains[rewards.scripts]>:
        - foreach <yaml[<[quest_internalname]>].read[rewards.scripts]>:
            - run <[value]> def:<[quest_internalname]> player:<player>
    - if <yaml[<[quest_internalname]>].contains[rewards.commands]>:
        - foreach <yaml[<[quest_internalname]>].read[rewards.commands]>:
            - execute as_server <[value]>
        - foreach <yaml[<[quest_internalname]>].read[rewards.command_text]>:
            - narrate <[value]>