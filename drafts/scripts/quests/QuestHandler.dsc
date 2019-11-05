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
        - define data:<player.uuid>_quest_data
        - if <server.has_file[playerdata/<player.uuid>/quest_data.yml]>:
            - ~yaml load:playerdata/<player.uuid>/quest_data.yml id:<[data]>
        - else:
            - yaml create id:<[data]>
            - yaml id:<[data]> set player_uuid:<player.uuid>
            - ~yaml id:<[data]> savefile:playerdata/<player.uuid>/quest_data.yml
        - yaml set id:<[data]> set player_last_known_name:<player.name>
        on player quits:
        - ~yaml id:<[data]> savefile:playerdata/<player.uuid>/quest_data.yml

QuestRequirementsHandler:
    type: procedure
    debug: false
    definitions: quest_internalname
    script:
    - define data:<player.uuid>_quest_data
    # Completed quests
    - foreach <yaml[<[quest_internalname]>].read[config.requirements.quests_completed]> as:QuestsCompleted:
        - if <yaml[<[data]>].contains[quests.completed.<[QuestsCompleted]>].not>:
            - determine false
    # Player groups
    - foreach <yaml[<[quest_internalname]>].read[config.requirements.groups]> as:PlayerGroups:
        - if <player.groups.contains[<[PlayerGroups]>].not>:
            - determine false
    # Individual permissions
    - foreach <yaml[<[quest_internalname]>].read[config.requirements.permissions]> as:PlayerPermissions:
        - if <player.has_permission[<[PlayerPermissions]>].not>:
            - determine false
    - determine true

QuestAcceptHandler:
    debug: false
    type: task
    definitions: quest_internalname
    script:
    - define data:<player.uuid>_quest_data
    - yaml id:<[quest_internalname]> copykey:player_data.<[quest_internalname]> quests.active.<[quest_internalname]> to_id:<[data]>
    - yaml id:<[data]> set quests.active.<[quest_internalname]>.current_stage:1
    - run QuestResetTimeHandler def:<[quest_internalname]>
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
    definitions: quest_internalname|objective
    script:
    - define data:<player.uuid>_quest_data
    - define current_stage <yaml[<[data]>].read[quests.active.<[quest_internalname]>.current_stage]>
    - yaml id:<[data]> set quests.active.<[quest_internalname]>.stages.<[current_stage]>.progress:++
    - if <yaml[<[data]>].read[quests.active.<[quest_internalname]>.stages.<[current_stage]>.progress]> >= <yaml[<[data]>].read[quests.active.<[quest_internalname]>.stages.<[current_stage]>.total]>:
        - if <yaml[<[data]>].contains[quests.active.<[quest_internalname]>.stages.<[current_stage].add[1]>]>:
            - run QuestStageAdvanceHandler def:<[quest_internalname]>
        - else:
            - run QuestCompletionHandler def:<[quest_internalname]>
    - else if <[objective]||null>:
        - narrate format:QuestNameFormat "<yaml[<[quest_internalname]>].read[player_data.<[quest_internalname]>.name]>"
        - narrate "• <yaml[<[quest_internalname]>].read[player_data.<[quest_internalname]>.stages.<[current_stage]>.objectives.<[objective]>.name]>: <yaml[<[quest_internalname]>].read[player_data.<[quest_internalname]>.stages.<[current_stage]>.objectives.<[objective]>.progress]>/<yaml[<[quest_internalname]>].read[player_data.<[quest_internalname]>.stages.<[current_stage]>.objectives.<[objective]>.total]>"

QuestProgressHandler:
    debug: false
    type: task
    definitions: quest_internalname
    script:
    - define data:<player.uuid>_quest_data
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
    - define data:<player.uuid>_quest_data
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
    - define data:<player.uuid>_quest_data
    - yaml id:<[data]> set quests.active.<[quest_internalname]>:!
    - narrate "<red>QUEST QUIT: <yaml[<[quest_internalname]>].read[player_data.<[quest_internalname]>.name]>"

QuestCompletionHandler:
    debug: false
    type: task
    definitions: quest_internalname
    script:
    - define data:<player.uuid>_quest_data
    - yaml id:<[data]> set quests.active.<[quest_internalname]>:!
    - yaml id:<[data]> set quests.completed.<[quest_internalname]>.completion_count:++
    - yaml id:<[data]> set quests.completed.<[quest_internalname]>.last_completed:<util.date.time.duration>
    - narrate "<gold>QUEST COMPLETE: <yaml[<[quest_internalname]>].read[player_data.<[quest_internalname]>.name]>"
    - narrate "<yaml[<[quest_internalname]>].read[messages.completion]>"
    - narrate "<green>Rewards:"
    - run QuestRewardHandler def:<[quest_internalname]>

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
            - else if <[current_week]> == <[last_completed].in_weeks> && <util.date.time.day_of_week> > 6:
                - determine true
            - else if <util.date.time.day_of_week> == 6 && <util.date.time.hour> >= 19:
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
    - define data:<player.uuid>_quest_data
    - if <yaml[<[quest_internalname]>].contains[rewards.money]>:
        - money give quantity:<yaml[<[quest_internalname]>].read[rewards.money]> players:<player>
        - narrate "<gold><yaml[<[quest_internalname]>].read[rewards.money]> gold"
    - if <yaml[<[quest_internalname]>].contains[rewards.items]>:
        - foreach <yaml[<[quest_internalname]>].read[rewards.items]>:
            - give <[value]>
            - narrate "<[value].quantity>x <[value].display>"
    - if <yaml[<[quest_internalname]>].contains[rewards.quest_points]>:
        - yaml id:<[data]> set career.quest_points:+:<yaml[<[quest_internalname]>].read[rewards.quest_points]>
    - if <yaml[<[quest_internalname]>].contains[rewards.scripts]>:
        - foreach <yaml[<[quest_internalname]>].read[rewards.scripts]>:
            - run <[value]> def:<[quest_internalname]>
    - if <yaml[<[quest_internalname]>].contains[rewards.commands]>:
        - foreach <yaml[<[quest_internalname]>].read[rewards.commands]>:
            - execute as_server <[value]>
        - foreach <yaml[<[quest_internalname]>].read[rewards.command_text]>:
            - narrate <[value]>

QuestLoginResetHandler:
    debug: false
    type: world
    events:
        on player joins:
        - define data:<player.uuid>_quest_data
        - foreach <yaml[<[data]>].read[quests.active.<[quest_internalname]>]>:
            - define reset_time:<yaml[<[data]>].read[quests.active.<[quest_internalname]>.reset_time]>
            - if <util.date.time.duration> >= <[reset_time]>:
                - yaml id:<[data]> set quests.active.<[quest_internalname]>:!
                - narrate "<red>QUEST EXPIRED: <yaml[<[quest_internalname]>].read[player_data.<[quest_internalname]>.name]>"

QuestDailyResetHandler:
    debug: false
    type: world
    events:
        on system time 19:00:
        - foreach <server.list_online_players> as:player:
            - define data:<[player].uuid>_quest_data
            - foreach <yaml[<[data]>].read[quests.active]> as:quest_internalname:
                - define reset_time:<yaml[<[data]>].read[quests.active.<[quest_internalname]>.reset_time]>
                - if <util.date.time.duration> >= <[reset_time]>:
                    - yaml id:<[data]> set quests.active.<[quest_internalname]>:!
                    - narrate "<red>QUEST EXPIRED: <yaml[<[quest_internalname]>].read[player_data.<[quest_internalname]>.name]>"

QuestResetTimeHandler:
    debug: false
    type: task
    definitions: quest_internalname
    script:
    - define data:<player.uuid>_quest_data
    - define current_week:<util.date.time.duration.in_weeks.round_to[0]>
    - define current_day:<util.date.time.duration.in_days.round_to[0]>
    - choose <yaml[<[quest_internalname]>].read[config.reset.period]>:
        - case 7d:
            - if <util.date.time.day_of_week> > 6:
                - yaml id:<[data]> set quests.completed.<[quest_internalname]>.reset_time:<util.date.time.duration.sub[<util.date.time.day_of_week>d].sub[<util.date.time.hour>h].sub[<util.date.time.minute>m].sub[<util.date.time.second>s].add[19h].add[6d].add[1w].sub[5m]>
            - else if <util.date.time.day_of_week> == 6 && <util.date.time.hour> >= 19:
                - yaml id:<[data]> set quests.completed.<[quest_internalname]>.reset_time:<util.date.time.duration.sub[<util.date.time.day_of_week>d].sub[<util.date.time.hour>h].sub[<util.date.time.minute>m].sub[<util.date.time.second>s].add[19h].add[6d].add[1w].sub[5m]>
            - else:
                - yaml id:<[data]> set quests.completed.<[quest_internalname]>.reset_time:<util.date.time.duration.sub[<util.date.time.day_of_week>d].sub[<util.date.time.hour>h].sub[<util.date.time.minute>m].sub[<util.date.time.second>s].add[19h].add[6d].sub[5m]>
        - case 1d:
            - if <util.date.time.hour> >= 19:
                - yaml id:<[data]> set quests.completed.<[quest_internalname]>.reset_time:<util.date.time.duration.sub[<util.date.time.hour>h].sub[<util.date.time.minute>m].sub[<util.date.time.second>s].add[1d].add[19h].sub[5m]>
            - else:
                - yaml id:<[data]> set quests.completed.<[quest_internalname]>.reset_time:<util.date.time.duration.sub[<util.date.time.hour>h].sub[<util.date.time.minute>m].sub[<util.date.time.second>s].add[19h].sub[5m]>

QuestAvailabilityHandler:
    debug: false
    type: procedure
    definitions: quest_internalname
    script:
    - define data:<player.uuid>_quest_data
    - if <yaml[<[data]>].read[quests.completed.<[quest_internalname]>].reset_time||null> > <util.date.time.duration>:
        - determine false
    - else:
        - determine true

QuestsAvailableHandler:
    debug: false
    type: procedure
    definitions: npc_name
    script:
    - define data:<player.uuid>_quest_data
    - define quest_list:<yaml[quest_npc_list].read[<[npc_name]>]>
    - define inventory_list:li@
    - foreach <[quest_list]>:
        - if <proc[QuestAvailabilityHandler].context[<[value]>]> && <yaml[<[data]>].contains[quests.active.<[value]>].not>:
            - determine true
    - else:
        - determine false

QuestInventoryGUIHandler:
    debug: false
    type: task
    definitions: npc_name
    script:
    - define data:<player.uuid>_quest_data
    - define quest_list:<yaml[quest_npc_list].read[<[npc_name]>]>
    - define inventory_list:li@
    - foreach <[quest_list]>:
        - if <proc[QuestAvailabilityHandler].context[<[value]>]> && <yaml[<[data]>].contains[quests.active.<[value]>].not>:
            - define inventory_list:<[inventory_list].include[<proc[QuestGUIItemBuilder].context[<[value]>]>]>
    - if <[inventory_list].size> > 0:
        - note "in@generic[title=<&6><&l>Quests;size=27;contents=<[inventory_list]>]" as:available_quest_inventory.<player.uuid>
        - inventory open d:in@available_quest_inventory.<[npc_name]>.<player.uuid>
    - else:
        - narrate "<red>No quests available!"

QuestInventorySelectionHandler:
    debug: false
    type: world
    events:
        on player clicks in available_quest_inventory*:
        - if <context.item.has_nbt[quest_internalname]>:
            - inventory close
            - run QuestAcceptHandler def:<context.item.nbt[quest_internalname]>
        - else:
            - determine cancelled
        on player drags in available_quest_inventory*:
        - determine cancelled

QuestGUIItemBuilder:
    debug: false
    type: procedure
    definitions: quest_internalname
    script:
    - define quest_name:<yaml[<[quest_internalname]>].read[player_data.<[quest_internalname]>.name]>
    - define item_lore:li@<[quest_name]>
    - define quest_description:<yaml[<[quest_internalname]>].read[player_data.<[quest_internalname]>.description]>
    - define item_lore:<[item_lore].include[<[quest_description]>]>
    - define item_lore:<[item_lore].include[<&6>Rewards:]>
    - if <yaml[<[quest_internalname]>].read[config.rewards.money]||null> != null:
        - define lore_money:"<yaml[<[quest_internalname]>].read[config.rewards.money]> gold"
        - define item_lore:<[item_lore].include[<[lore_money]>]>
    - if <yaml[<[quest_internalname]>].read[config.rewards.quest_points]||null> != null:
        - define lore_quest_points:"<yaml[<[quest_internalname]>].read[config.rewards.quest_points]> quest points"
        - define item_lore:<[item_lore].include[<[lore_quest_points]>]>
    # Line wrapping time!
    - define item_lore:<proc[lore_builder].context[40|<[item_lore].escaped>]>
    - if <item[<[quest_internalname]>_gui_item]||null> != null:
        - define base_item:<item[<[quest_internalname]>_gui_item]>
        - if <[base_item].is_enchanted>:
            - define item_enchantments:<[base_item.enchantments.with_levels]>
            - determine "i@<[base_item].material_name>[display_name=<[quest_name]>;lore=<[item_lore]>;enchantments=<[item_enchantments]>;flags=HIDE_ENCHANTS;nbt=quest_internalname/<[quest_internalname]>]"
    - else:
        - define item_material:<yaml[<[quest_internalname]>].read[config.material]>
        - determine i@<[item_material]>[display_name=<[quest_name]>;lore=<[item_lore]>;nbt=quest_internalname/<[quest_internalname]>]