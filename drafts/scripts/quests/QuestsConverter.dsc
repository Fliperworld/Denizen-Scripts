QuestDataConverter:
    debug: false
    type: world
    events:
        on player joins:
        - wait 2s
        - define data <player.uuid>_quest_data
        - define olddata <player.uuid>_quest_data_old
        - if <server.has_file[../Quests/data/<player.uuid>.yml]> && !<player.has_flag[old_quests_data_converted]>:
            - yaml load:../Quests/data/<player.uuid>.yml id:<[olddata]>
            - yaml set id:<[data]> career.quest_points:<yaml[<[olddata]>].read[quest-points]>
            - foreach <yaml[<[olddata]>].read[completed-Quests]> as:CompletedQuest:
                - yaml set id:<[data]> quests.completed.<yaml[QuestsConversionMap].read[<[CompletedQuest]>]>.completion_count:1
            - foreach <yaml[<[olddata]>].read[amountsCompletedQuests]> as:RedoableQuest:
                - if <yaml[<[olddata]>].read[amountsCompleted].get[<[loop_index]>]||0> >= 1:
                    - yaml set id:<[data]> quests.completed.<yaml[QuestsConversionMap].read[<[RedoableQuest]>]>.completion_count:<yaml[<[olddata]>].read[amountsCompleted].get[<[loop_index]>]||1>
            - foreach <yaml[<[olddata]>].read[currentQuests]> as:CurrentQuest:
                - define cqinternalname <yaml[QuestsConversionMap].read[<[CurrentQuest]>]>
                - yaml id:<[cqinternalname]> copykey:player_data.<[cqinternalname]> quests.active.<[cqinternalname]> to_id:<[data]>
            - flag player old_quests_data_converted:true
        on server start:
        - yaml load:scriptdata/quests/ConversionMap.yml id:QuestsConversionMap