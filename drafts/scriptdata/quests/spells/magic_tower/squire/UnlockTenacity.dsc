config:
    availability:
        offering_npc: 194
    requirements:
        quests_completed:
        - "UnlockBlink"
        permissions:
        - magicspells.learn.tenacity
    rewards:
        money: 100
        quest_points: 3
messages:
    offer: "<darkgreen>Skilled Sorcerer<white>: The Tenacity spell temporarily channels your will to resist knockback from enemies. When you're ready to learn it, bring me what I need so that I can teach you."
    completion: "<darkgreen>Skilled Sorcerer<white>: Congratulations, you're ready to learn Tenacity! Give it a try with <&dq>/cast tenacity.<&dq>"
player_data:
    UnlockTenacity:
        name: Learn the Tenacity spell
        description: "Bring reagents to the Skilled Sorcerer and learn the Tenacity spell!"
        stages:
            1:
                description: "Bring magical reagents to the Skilled Sorcerer."
                objectives:
                    1:
                        name: "Deliver redstone"
                        progress: 0
                        total: 512

                    2:
                        name: "Deliver iron ingots"
                        progress: 0
                        total: 1024
                    3:
                        name: "Deliver diamonds"
                        progress: 0
                        total: 64
                    4:
                        name: "Deliver gold ingots"
                        progress: 0
                        total: 256
                progress: 0
                total: 4
            2:
                description: "Bring crystallized experience to the Skilled Sorcerer."
                objectives:
                    1:
                        name: "Deliver a billet of crystallized experience"
                        progress: 0
                        total: 1
                progress: 0
                total: 1