config:
    availability:
        offering_npc: 191
    requirements:
        quests_completed:
        - "UnlockBlink"
        permissions:
        - magicspells.learn.confusion
    rewards:
        money: 100
        quest_points: 3
messages:
    offer: "<darkgreen>Wise Wizard<white>: The Confusion spell is powerful, but volatile. If you can gather me the magical ingredients, I can teach it to you. It will cause monsters in a small area around you to begin attacking each other."
    completion: "<darkgreen>Wise Wizard<white>: Congratulations, you're ready to learn Confusion! Give it a try with <&dq>/cast confusion.<&dq>"
player_data:
    UnlockConfusion:
        name: Learn the Confusion spell
        description: "Bring reagents to the Wise Wizard and learn the Confusion spell!"
        stages:
            1:
                description: "Bring magical reagents to the Wise Wizard."
                objectives:
                    1:
                        name: "Deliver redstone"
                        progress: 0
                        total: 128
                    2:
                        name: "Deliver ghast tears"
                        progress: 0
                        total: 64
                    3:
                        name: "Deliver magma cream"
                        progress: 0
                        tota: 128
                    4:
                        name: "Deliver gold ingots"
                        progress: 0
                        total: 64
            2:
                description: "Bring crystallized experience to the Wise Wizard."
                objectives:
                    1:
                        name: "Deliver a sliver of crystallized experience"
                        progress: 0
                        total: 1