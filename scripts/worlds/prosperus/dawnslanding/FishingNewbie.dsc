FishingNewbieAssignment:
    type: assignment
    interact scripts:
    - 10 FishingNewbieInteract
    actions:
        on assignment:
        - teleport npc 'location:<anchor:fishingnewbie>'
        - trigger name:proximity toggle:true
        - trigger name:chat toggle:true
    
FishingNewbieFormat:
    type: format
    format: "<gray>Fishing Newbie<white><&co> <text>"

FishingNewbieInteract:
    type: interact
    steps:
        Unmet*:
            proximity trigger:
                script:
                - narrate format:FishingNewbieFormat "Oh, hi! I'm trying to learn how to fish. Maybe you can help me!"
                - zap TeachFishingNewbieOffer
        TeachFishingNewbieOffer:
            proximity trigger:
                script:
                - narrate format:FishingNewbieFormat "Do you think you can help me learn how to fish?"
            click trigger:
                script:
                - narrate format:PlayerChatformat "Sure, I can help you out."
                - run QuestAcceptHandler def:TeachFishingNewbie player:<player>
                - zap TeachFishingNewbieActive
            chat trigger:
                TeachFishingNewbieOffer:
                    trigger: /yes|sure|okay|great/
                    hide trigger message: true
                    script:
                    - narrate format:PlayerChatFormat "Sure, I can help you out."
                    - run QuestAcceptHandler def:TeachFishingNewbie player:<player>
        TeachFishingNewbieActive:
            proximity trigger:
                script:
                - narrate format:FishingNewbieFormat "Still fishing, huh? Be sure to look for those bubbles in the water!"
                - run QuestProgressHandler def:TeachFishingNewbie player:<player>
        DailyFishingOffer:
            proximity trigger:
                script:
                - narrate format:FishingNewbieFormat "Ready to catch some more fish?"