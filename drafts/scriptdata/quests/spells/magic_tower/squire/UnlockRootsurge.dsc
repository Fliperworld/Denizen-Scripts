config:
    availability:
        offering_npc: 194
    requirements:
        quests_completed:
        - "UnlockBlink"
        permissions:
        - magicspells.learn.rootsurge
    rewards:
        money: 100
        quest_points: 3
messages:
    offer: "<darkgreen>Skilled Sorcerer<white>: The Rootsurge spell runs a wave of roots along the ground in front of you, damaging and rooting any hit enemies. When you're ready to learn it, bring me what I need so that I can teach you."
    completion: "<darkgreen>Skilled Sorcerer<white>: Congratulations, you're ready to learn Rootsurge! Give it a try with <&dq>/cast rootsurge.<&dq>"
player_data:
    UnlockRootsurge:
        name: Learn the Rootsurge spell
        description: "Bring reagents to the Skilled Sorcerer and learn the Rootsurge spell!"
        stages:
            1:
                description: "Bring magical reagents to the Skilled Sorcerer."
                objectives:
                    1:
                        name: "Deliver redstone"
                        progress: 0
                        total: 512
                    2:
                        name: "Deliver oak saplings"
                        progress: 0
                        total: 512
                    3:
                        name: "Deliver brick blocks"
                        progress: 0
                        total: 512
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