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
        - if <yaml[<[data]>].contains[quests.active.<[quest_internalname]>].not>:
            - stop
        - if <context.entity.is_mythicmob||null>:
            - stop
        - if <context.entity.entity_type> == CREEPER:
            - yaml id:<[data]> set quests.active.<[quest_internalname]>.stages.1.objectives.1.progress:++
            - run QuestStageProgressHandler def:<[quest_internalname]>|1
        - else if <context.entity.entity_type> == SKELETON:
            - yaml id:<[data]> set quests.active.<[quest_internalname]>.stages.1.objectives.2.progress:++
            - run QuestStageProgressHandler def:<[quest_internalname]>|2
        - else if <context.entity.entity_type> == SPIDER:
            - yaml id:<[data]> set quests.active.<[quest_internalname]>.stages.1.objectives.3.progress:++
            - run QuestStageProgressHandler def:<[quest_internalname]>|3
        - else if <context.entity.entity_type> == ZOMBIE:
            - yaml id:<[data]> set quests.active.<[quest_internalname]>.stages.1.objectives.4.progress:++
            - run QuestStageProgressHandler def:<[quest_internalname]>|4