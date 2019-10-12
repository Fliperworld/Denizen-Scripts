FindReinwaldCompletion:
    type: task
    debug: false
    script:
    - zap IronToolsArmorOffer s@QuestMasterInteract
    - zap FirstMobHuntingOffer s@WarmasterReinwaldInteract