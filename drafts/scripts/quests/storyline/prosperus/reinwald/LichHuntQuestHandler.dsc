LichHuntCompletion:
    type: task
    debug: false
    script:
    - zap EliteHuntOffer s@WarmasterReinwaldInteract

LichHuntHandler:
    type: world
    debug: false
    events:
        on player kills entity:
        - define data:<player.uuid>_quest_data
        - define quest_internalname:LichHunt
        - if <yaml[<[data]>].contains[quests.active.LichHunt].not>:
            - stop
        - if <context.entity.name.starts_with[&d].not||null>:
            - stop
        - if <context.entity.mythicmob||null> == Lich:
            - yaml id:<[data]> set quests.active.LichHunt.stages.1.objectives.1.progress:++
            - run QuestStageProgressHandler def:LichHunt|1