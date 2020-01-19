SkeletalRogueHuntCompletion:
    type: task
    debug: false
    script:
    - zap VeteranHuntOffer s@WarmasterReinwaldInteract

SkeletalRogueHuntHandler:
    type: world
    debug: false
    events:
        on player kills entity:
        - define data:<player.uuid>_quest_data
        - define quest_internalname:SkeletalRogueHunt
        - if <yaml[<[data]>].contains[quests.active.SkeletalRogueHunt].not>:
            - stop
        - if <context.entity.name.starts_with[&9].not||null>:
            - stop
        - if <context.entity.mythicmob||null> == SkeletalRogue:
            - yaml id:<[data]> set quests.active.SkeletalRogueHunt.stages.1.objectives.1.progress:++
            - run QuestStageProgressHandler def:SkeletalRogueHunt|1