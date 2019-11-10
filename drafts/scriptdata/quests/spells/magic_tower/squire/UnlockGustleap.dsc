config:
    availability:
        offering_npc: 194
    requirements:
        quests_completed:
        - "UnlockBlink"
        - "UnlockGust"
        permissions:
        - magicspells.learn.gustleap
    rewards:
        money: 100
        quest_points: 3
messages:
    offer: "<darkgreen>Skilled Sorcerer<white>: The Gustleap spell lets you whip up the air around you to leap forward. When you're ready to learn it, bring me what I need so that I can teach you."
    completion: "<darkgreen>Skilled Sorcerer<white>: Congratulations, you're ready to learn Gustleap! Give it a try with <&dq>/cast gustleap.<&dq>"
player_data:
    UnlockGustleap:
        name: Learn the Gustleap spell
        description: "Bring reagents to the Skilled Sorcerer and learn the Gustleap spell!"
        stages:
            1:
                description: "Bring magical reagents to the Skilled Sorcerer."
                objectives:
                    1:
                        name: "Deliver redstone"
                        progress: 0
                        total: 512
                    2:
                        name: "Deliver feathers"
                        progress: 0
                        total: 2048
                    3:
                        name: "Deliver ender pearls"
                        progress: 0
                        total: 256
                    4:
                        name: "Deliver diamonds"
                        progress: 0
                        total: 64
                    5:
                        name: "Deliver gold ingots"
                        progress: 0
                        total: 256
                progress: 0
                total: 5
            2:
                description: "Bring crystallized experience to the Skilled Sorcerer."
                objectives:
                    1:
                        name: "Deliver a billet of crystallized experience"
                        progress: 0
                        total: 1
                progress: 0
                total: 1