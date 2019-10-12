IronToolsArmorCompletion:
    type: task
    debug: false
    script:
    - zap FindFishingNewbieOffer s@QuestMasterInteract

IronToolsArmorQuestCraftingHandler:
    type: world
    debug: false
    events:
        on player crafts iron_*:
        - define data:<player.uuid>_quest_data
        - define quest_internalname:IronToolsArmor
        - if <yaml[<[data]>].contains[quests.active.IronToolsArmor].not>:
            - stop
        - choose <context.item.material.name>:
            - case iron_helmet:
                - if <yaml[<[data]>].[quests.active.IronToolsArmor.stages.1.objectives.1.progress]> == 0:
                    - narrate "<green>You crafted an iron helmet!"
                    - yaml id:<[data]> set quests.active.IronToolsArmor.stages.1.objectives.1.progress:1
                    - run QuestStageProgressHandler def:IronToolsArmor|1 player:<player>
            - case iron_chestplate:
                - if <yaml[<[data]>].[quests.active.IronToolsArmor.stages.1.objectives.2.progress]> == 0:
                    - narrate "<green>You crafted an iron chestplate!"
                    - yaml id:<[data]> set quests.active.IronToolsArmor.stages.1.objectives.2.progress:1
                    - run QuestStageProgressHandler def:IronToolsArmor|2 player:<player>
            - case iron_leggings:
                - if <yaml[<[data]>].[quests.active.IronToolsArmor.stages.1.objectives.3.progress]> == 0:
                    - narrate "<green>You crafted some iron leggings!"
                    - yaml id:<[data]> set quests.active.IronToolsArmor.stages.1.objectives.3.progress:1
                    - run QuestStageProgressHandler def:IronToolsArmor|3 player:<player>
            - case iron_boots:
                - if <yaml[<[data]>].[quests.active.IronToolsArmor.stages.1.objectives.4.progress]> == 0:
                    - narrate "<green>You crafted some iron boots!"
                    - yaml id:<[data]> set quests.active.IronToolsArmor.stages.1.objectives.4.progress:1
                    - run QuestStageProgressHandler def:IronToolsArmor|4 player:<player>
            - case iron_axe:
                - if <yaml[<[data]>].[quests.active.IronToolsArmor.stages.1.objectives.5.progress]> == 0:
                    - narrate "<green>You crafted an iron axe!"
                    - yaml id:<[data]> set quests.active.IronToolsArmor.stages.1.objectives.5.progress:1
                    - run QuestStageProgressHandler def:IronToolsArmor|5 player:<player>
            - case iron_pickaxe:
                - if <yaml[<[data]>].[quests.active.IronToolsArmor.stages.1.objectives.6.progress]> == 0:
                    - narrate "<green>You crafted an iron pickaxe!"
                    - yaml id:<[data]> set quests.active.IronToolsArmor.stages.1.objectives.6.progress:1
                    - run QuestStageProgressHandler def:IronToolsArmor|6 player:<player>
            - case iron_shovel:
                - if <yaml[<[data]>].[quests.active.IronToolsArmor.stages.1.objectives.7.progress]> == 0:
                    - narrate "<green>You crafted an iron shovel!"
                    - yaml id:<[data]> set quests.active.IronToolsArmor.stages.1.objectives.7.progress:1
                    - run QuestStageProgressHandler def:IronToolsArmor|7 player:<player>
            - case iron_sword:
                - if <yaml[<[data]>].[quests.active.IronToolsArmor.stages.1.objectives.8.progress]> == 0:
                    - narrate "<green>You crafted an iron sword!"
                    - yaml id:<[data]> set quests.active.IronToolsArmor.stages.1.objectives.8.progress:1
                    - run QuestStageProgressHandler def:IronToolsArmor|8 player:<player>
            - case iron_hoe:
                - if <yaml[<[data]>].[quests.active.IronToolsArmor.stages.1.objectives.9.progress]> == 0:
                    - narrate "<green>You crafted an iron hoe!"
                    - yaml id:<[data]> set quests.active.IronToolsArmor.stages.1.objectives.9.progress:1
                    - run QuestStageProgressHandler def:IronToolsArmor|9 player:<player>

IronToolsArmorQuestDeliveryHandler:
    type: task
    debug: false
    script:
    - choose <player.item_in_hand.material.name>:
        - case iron_helmet:
            - if <yaml[<[data]>].[quests.active.IronToolsArmor.stages.2.objectives.1.progress]> == 0:
                - take iron_helmet
                - narrate format:QuestMasterFormat "An iron helmet - with quite the polished sheen!"
                - yaml id:<[data]> set quests.active.IronToolsArmor.stages.2.objectives.1.progress:1
                - run QuestStageProgressHandler def:IronToolsArmor|1 player:<player>
        - case iron_chestplate:
            - if <yaml[<[data]>].[quests.active.IronToolsArmor.stages.2.objectives.2.progress]> == 0:
                - take iron_chestplate
                - narrate format:QuestMasterFormat "An iron chestplate! No more arrows stuck in you!"
                - yaml id:<[data]> set quests.active.IronToolsArmor.stages.2.objectives.2.progress:1
                - run QuestStageProgressHandler def:IronToolsArmor|2 player:<player>
        - case iron_leggings:
            - if <yaml[<[data]>].[quests.active.IronToolsArmor.stages.2.objectives.3.progress]> == 0:
                - take iron_leggings
                - narrate format:QuestMasterFormat "Some iron leggings! Expertly crafted."
                - yaml id:<[data]> set quests.active.IronToolsArmor.stages.2.objectives.3.progress:1
                - run QuestStageProgressHandler def:IronToolsArmor|3 player:<player>
        - case iron_boots:
            - if <yaml[<[data]>].[quests.active.IronToolsArmor.stages.2.objectives.4.progress]> == 0:
                - take iron_boots
                - narrate format:QuestMasterFormat "Iron boots! Hope they don't jingle while you walk."
                - yaml id:<[data]> set quests.active.IronToolsArmor.stages.2.objectives.4.progress:1
                - run QuestStageProgressHandler def:IronToolsArmor|4 player:<player>
        - case iron_axe:
            - if <yaml[<[data]>].[quests.active.IronToolsArmor.stages.2.objectives.5.progress]> == 0:
                - take iron_axe
                - narrate format:QuestMasterFormat "An iron axe! How many trees can you fell with this bad boy?"
                - yaml id:<[data]> set quests.active.IronToolsArmor.stages.2.objectives.5.progress:1
                - run QuestStageProgressHandler def:IronToolsArmor|5 player:<player>
        - case iron_pickaxe:
            - if <yaml[<[data]>].[quests.active.IronToolsArmor.stages.2.objectives.6.progress]> == 0:
                - take iron_pickaxe
                - narrate format:QuestMasterFormat "An iron pickaxe! You know, you can use this to go mine some diamonds."
                - yaml id:<[data]> set quests.active.IronToolsArmor.stages.2.objectives.6.progress:1
                - run QuestStageProgressHandler def:IronToolsArmor|6 player:<player>
        - case iron_shovel:
            - if <yaml[<[data]>].[quests.active.IronToolsArmor.stages.2.objectives.7.progress]> == 0:
                - take iron_shovel
                - narrate format:QuestMasterFormat "An iron shovel! With this, you'll be able to clear out plenty of gravel while caving."
                - yaml id:<[data]> set quests.active.IronToolsArmor.stages.2.objectives.7.progress:1
                - run QuestStageProgressHandler def:IronToolsArmor|7 player:<player>
        - case iron_sword:
            - if <yaml[<[data]>].[quests.active.IronToolsArmor.stages.2.objectives.8.progress]> == 0:
                - take iron_sword
                - narrate format:QuestMasterFormat "An iron sword! And quite sharp, too!"
                - yaml id:<[data]> set quests.active.IronToolsArmor.stages.2.objectives.8.progress:1
                - run QuestStageProgressHandler def:IronToolsArmor|8 player:<player>
        - case iron_hoe:
            - if <yaml[<[data]>].[quests.active.IronToolsArmor.stages.2.objectives.9.progress]> == 0:
                - take iron_hoe
                - narrate format:QuestMasterFormat "An iron hoe! Why, I bet that if you use this, you can farm all the live-long day."
                - yaml id:<[data]> set quests.active.IronToolsArmor.stages.2.objectives.9.progress:1
                - run QuestStageProgressHandler def:IronToolsArmor|9 player:<player>
        - case default:
            - narrate format:QuestMasterFormat "Bring me that iron equipment! Remember, you'll need to both mine and smelt iron to make equipment with it."