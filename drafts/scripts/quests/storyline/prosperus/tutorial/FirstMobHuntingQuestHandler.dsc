FirstMobHuntingCompletion:
    type: task
    debug: false
    script:
    - zap SkeletalRogueHuntOffer s@WarmasterReinwaldInteract

FirstMobHuntingHandler:
    type: world
    debug: false
    events:
        on player kills entity:
        - define data:<player.uuid>_quest_data
        - define quest_internalname:FirstMobHunting
        - if <yaml[<[data]>].contains[quests.active.FirstMobHunting].not>:
            - stop
        - choose <context.entity.entity_type>:
            - case CREEPER:
                - if <yaml[<[data]>].[quests.active.FirstMobHunting.stages.1.objectives.1.progress]> == 0:
                    - narrate "<green>You killed a creeper!"
                    - yaml id:<[data]> set quests.active.FirstMobHunting.stages.1.objectives.1.progress:1
                    - run QuestStageProgressHandler def:FirstMobHunting|1
            - case SKELETON:
                - if <yaml[<[data]>].[quests.active.FirstMobHunting.stages.1.objectives.2.progress]> == 0:
                    - narrate "<green>You killed a skeleton!"
                    - yaml id:<[data]> set quests.active.FirstMobHunting.stages.1.objectives.2.progress:1
                    - run QuestStageProgressHandler def:FirstMobHunting|2
            - case SPIDER:
                - if <yaml[<[data]>].[quests.active.FirstMobHunting.stages.1.objectives.3.progress]> == 0:
                    - narrate "<green>You killed a spider!"
                    - yaml id:<[data]> set quests.active.FirstMobHunting.stages.1.objectives.3.progress:1
                    - run QuestStageProgressHandler def:FirstMobHunting|3
            - case ZOMBIE:
                - if <yaml[<[data]>].[quests.active.FirstMobHunting.stages.1.objectives.4.progress]> == 0:
                    - narrate "<green>You killed a zombie!"
                    - yaml id:<[data]> set quests.active.FirstMobHunting.stages.1.objectives.4.progress:1
                    - run QuestStageProgressHandler def:FirstMobHunting|4