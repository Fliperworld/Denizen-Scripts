SetHomeCompletion:
    type: task
    debug: false
    script:
    - if <yaml[<[data]>].contains[quests.active.WoodTools].not> && <yaml[<[data]>].contains[quests.completed.WoodTools].not>:
        - zap WoodToolsOffer s@QuestMasterInteract
    - else if <yaml[<[data]>].contains[quests.active.WoodTools]>:
        - zap WoodToolsActiveOnly s@QuestMasterInteract
    - else if <yaml[<[data]>].contains[quests.completed.WoodTools]>:
        - zap StoneToolsOffer s@QuestMasterInteract

SetHomeQuestHandler:
    type: world
    debug: false
    events:
        on sethome command:
        - if <yaml[<[data]>].contains[quests.active.SetHome].not>:
            - stop
        - if <yaml[<[data]>].read[quests.active.SetHome.stages.1.objectives.1.progress]> == 0:
            - yaml id:<[data]> set quests.active.SetHome.stages.1.objectives.1.progress:1
            - run QuestStageProgressHandler def:SetHome|1
        on home command:
        - if <yaml[<[data]>].contains[quests.active.SetHome].not>:
            - stop
        - else if <yaml[<[data]>].read[quests.active.SetHome.stages.1.objectives.1.progress]> == 0:
            - if <context.args.get[1]> == "set":
                - yaml id:<[data]> set quests.active.SetHome.stages.1.objectives.1.progress:1
                - run QuestStageProgressHandler def:SetHome|1
        - else if <yaml[<[data]>].read[quests.active.SetHome.stages.3.objectives.1.progress]> == 0:
            - yaml id:<[data]> set quests.active.SetHome.stages.1.objectives.3.progress:1
            - run QuestStageProgressHandler def:SetHome|1
        on spawn command:
        - if <yaml[<[data]>].contains[quests.active.SetHome].not>:
            - stop
        - if <yaml[<[data]>].read[quests.active.SetHome.stages.2.objectives.1.progress]> == 0:
            - yaml id:<[data]> set quests.active.SetHome.stages.2.objectives.1.progress:1
            - run QuestStageProgressHandler def:SetHome|1