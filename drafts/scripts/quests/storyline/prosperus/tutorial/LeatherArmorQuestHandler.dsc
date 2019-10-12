IronToolsArmorCompletion:
    type: task
    debug: false
    script:
    - zap FindReinwaldOffer s@QuestMasterInteract

LeatherArmorQuestCraftingHandler:
    type: world
    debug: false
    events:
        on player crafts leather_*:
        - define data:<player.uuid>_quest_data
        - define quest_internalname:LeatherArmor
        - if <yaml[<[data]>].contains[quests.active.LeatherArmor].not>:
            - stop
        - choose <context.item.material.name>:
            - case leather_helmet:
                - if <yaml[<[data]>].[quests.active.LeatherArmor.stages.1.objectives.1.progress]> == 0:
                    - narrate "<green>You crafted a leather helmet!"
                    - yaml id:<[data]> set quests.active.LeatherArmor.stages.1.objectives.1.progress:1
                    - run QuestStageProgressHandler def:LeatherArmor|1 player:<player>
            - case leather_chestplate:
                - if <yaml[<[data]>].[quests.active.LeatherArmor.stages.1.objectives.2.progress]> == 0:
                    - narrate "<green>You crafted a leather chesplate!"
                    - yaml id:<[data]> set quests.active.LeatherArmor.stages.1.objectives.2.progress:1
                    - run QuestStageProgressHandler def:LeatherArmor|2 player:<player>
            - case leather_leggings:
                - if <yaml[<[data]>].[quests.active.LeatherArmor.stages.1.objectives.3.progress]> == 0:
                    - narrate "<green>You crafted some leather leggings!"
                    - yaml id:<[data]> set quests.active.LeatherArmor.stages.1.objectives.3.progress:1
                    - run QuestStageProgressHandler def:LeatherArmor|3 player:<player>
            - case leather_boots:
                - if <yaml[<[data]>].[quests.active.LeatherArmor.stages.1.objectives.4.progress]> == 0:
                    - narrate "<green>You crafted some leather boots!"
                    - yaml id:<[data]> set quests.active.LeatherArmor.stages.1.objectives.4.progress:1
                    - run QuestStageProgressHandler def:LeatherArmor|4 player:<player>

LeatherArmorQuestDeliveryHandler:
    type: task
    debug: false
    script:
    - choose <player.item_in_hand.material.name>:
        - case leather_helmet:
            - if <yaml[<[data]>].[quests.active.LeatherArmor.stages.2.objectives.1.progress]> == 0:
                - take leather_helmet
                - narrate format:QuestMasterFormat "A leather helmet! Gotta keep that noggin safe."
                - yaml id:<[data]> set quests.active.LeatherArmor.stages.2.objectives.1.progress:1
                - run QuestStageProgressHandler def:LeatherArmor|1 player:<player>
        - case leather_chestplate:
            - if <yaml[<[data]>].[quests.active.LeatherArmor.stages.2.objectives.2.progress]> == 0:
                - take leather_chestplate
                - narrate format:QuestMasterFormat "A leather chestplate! Chestplates offer the greatest armor value of any single piece of armor."
                - yaml id:<[data]> set quests.active.LeatherArmor.stages.2.objectives.2.progress:1
                - run QuestStageProgressHandler def:LeatherArmor|2 player:<player>
        - case leather_leggings:
            - if <yaml[<[data]>].[quests.active.LeatherArmor.stages.2.objectives.3.progress]> == 0:
                - take leather_leggings
                - narrate format:QuestMasterFormat "Leather leggings! They look like they'll fit you just right."
                - yaml id:<[data]> set quests.active.LeatherArmor.stages.2.objectives.3.progress:1
                - run QuestStageProgressHandler def:LeatherArmor|3 player:<player>
        - case leather_boots:
            - if <yaml[<[data]>].[quests.active.LeatherArmor.stages.2.objectives.4.progress]> == 0:
                - take leather_boots
                - narrate format:QuestMasterFormat "Leather boots! They won't help you run any faster, but you'll be glad you have them."
                - yaml id:<[data]> set quests.active.LeatherArmor.stages.2.objectives.4.progress:1
                - run QuestStageProgressHandler def:LeatherArmor|4 player:<player>
        - case default:
            - narrate format:QuestMasterFormat "Bring me that leather armor!"
            - run QuestProgressHandler def:LeatherArmor player:<player>