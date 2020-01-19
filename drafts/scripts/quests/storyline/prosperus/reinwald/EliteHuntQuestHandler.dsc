EliteHuntCompletion:
    type: task
    debug: false
    script:
    - zap EliteHuntComplete s@WarmasterReinwaldInteract

EliteHuntHandler:
    type: world
    debug: false
    events:
        on player kills entity:
        - define data:<player.uuid>_quest_data
        - define quest_internalname:EliteHunt
        - if <yaml[<[data]>].contains[quests.active.<[quest_internalname]>].not>:
            - stop
        - if <context.entity.name.starts_with[&d]>:
            - yaml id:<[data]> set quests.active.<[quest_internalname]>.stages.1.objectives.1.progress:++
            - run QuestStageProgressHandler def:<[quest_internalname]>|1