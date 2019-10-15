StoneToolsCompletion:
    type: task
    debug: false
    script:
    - zap LeatherArmorOffer s@QuestMasterInteract

StoneToolsQuestCraftingHandler:
    type: world
    debug: false
    events:
        on player crafts stone_*:
        - define data:<player.uuid>_quest_data
        - define quest_internalname:StoneTools
        - if <yaml[<[data]>].contains[quests.active.StoneTools].not>:
            - stop
        - choose <context.item.material.name>:
            - case stone_axe:
                - if <yaml[<[data]>].[quests.active.StoneTools.stages.1.objectives.1.progress]> == 0:
                    - narrate "<green>You crafted a Stone Axe!"
                    - yaml id:<[data]> set quests.active.StoneTools.stages.1.objectives.1.progress:1
                    - run QuestStageProgressHandler def:StoneTools|1
            - case stone_pickaxe:
                - if <yaml[<[data]>].[quests.active.StoneTools.stages.1.objectives.2.progress]> == 0:
                    - narrate "<green>You crafted a Stone Pickaxe!"
                    - yaml id:<[data]> set quests.active.StoneTools.stages.1.objectives.2.progress:1
                    - run QuestStageProgressHandler def:StoneTools|2
            - case stone_shovel:
                - if <yaml[<[data]>].[quests.active.StoneTools.stages.1.objectives.3.progress]> == 0:
                    - narrate "<green>You crafted a Stone Shovel!"
                    - yaml id:<[data]> set quests.active.StoneTools.stages.1.objectives.3.progress:1
                    - run QuestStageProgressHandler def:StoneTools|3
            - case stone_sword:
                - if <yaml[<[data]>].[quests.active.StoneTools.stages.1.objectives.4.progress]> == 0:
                    - narrate "<green>You crafted a Stone Sword!"
                    - yaml id:<[data]> set quests.active.StoneTools.stages.1.objectives.4.progress:1
                    - run QuestStageProgressHandler def:StoneTools|4
            - case stone_hoe:
                - if <yaml[<[data]>].[quests.active.StoneTools.stages.1.objectives.5.progress]> == 0:
                    - narrate "<green>You crafted a Stone Hoe!"
                    - yaml id:<[data]> set quests.active.StoneTools.stages.1.objectives.5.progress:1
                    - run QuestStageProgressHandler def:StoneTools|5

StoneToolsQuestDeliveryHandler:
    type: task
    debug: false
    script:
    - choose <player.item_in_hand.material.name>:
        - case stone_axe:
            - if <yaml[<[data]>].[quests.active.StoneTools.stages.2.objectives.1.progress]> == 0:
                - take stone_axe
                - narrate format:QuestMasterFormat "A stone axe! Stone axes chop trees just a little bit faster than their wooden counterparts."
                - yaml id:<[data]> set quests.active.StoneTools.stages.2.objectives.1.progress:1
                - run QuestStageProgressHandler def:StoneTools|1
        - case stone_pickaxe:
            - if <yaml[<[data]>].[quests.active.StoneTools.stages.2.objectives.2.progress]> == 0:
                - take stone_pickaxe
                - narrate format:QuestMasterFormat "A stone pickaxe! You're going to want to use this to mine some iron and coal."
                - yaml id:<[data]> set quests.active.StoneTools.stages.2.objectives.2.progress:1
                - run QuestStageProgressHandler def:StoneTools|2
        - case stone_shovel:
            - if <yaml[<[data]>].[quests.active.StoneTools.stages.2.objectives.3.progress]> == 0:
                - take stone_shovel
                - narrate format:QuestMasterFormat "A stone shovel! If you dig up some sand, you can make glass out of it with a furnace."
                - yaml id:<[data]> set quests.active.StoneTools.stages.2.objectives.3.progress:1
                - run QuestStageProgressHandler def:StoneTools|3
        - case stone_sword:
            - if <yaml[<[data]>].[quests.active.StoneTools.stages.2.objectives.4.progress]> == 0:
                - take stone_sword
                - narrate format:QuestMasterFormat "A stone sword! Now you'll be able to beat back those zombies pretty well."
                - yaml id:<[data]> set quests.active.StoneTools.stages.2.objectives.4.progress:1
                - run QuestStageProgressHandler def:StoneTools|4
        - case stone_hoe:
            - if <yaml[<[data]>].[quests.active.StoneTools.stages.2.objectives.5.progress]> == 0:
                - take stone_hoe
                - narrate format:QuestMasterFormat "A stone hoe! This should last quite a bit longer than that wooden one."
                - yaml id:<[data]> set quests.active.StoneTools.stages.2.objectives.5.progress:1
                - run QuestStageProgressHandler def:StoneTools|5
        - case default:
            - narrate format:QuestMasterFormat "Bring me those stone tools!"