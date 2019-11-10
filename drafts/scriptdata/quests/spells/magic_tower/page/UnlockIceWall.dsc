config:
    availability:
        offering_npc: 192
    requirements:
        quests_completed:
        - "UnlockBlink"
        permissions:
        - magicspells.learn.icewall
    rewards:
        money: 100
        quest_points: 3
messages:
    offer: "<darkgreen>Stoic Sage<white>: The Ice Wall spell allows you to magically summon a wall of ice in front of you. When you're ready to learn it, bring me what I need so that I can teach you."
    completion: "<darkgreen>Stoic Sage<white>: Congratulations, you're ready to learn Ice Wall! Give it a try with <&dq>/cast icewall.<&dq>"
player_data:
    UnlockIcewall:
        name: Learn the Ice Wall spell
        description: "Bring reagents to the Stoic Sage and learn the Ice Wall spell!"
        stages:
            1:
                description: "Bring magical reagents to the Stoic Sage."
                objectives:
                    1:
                        name: "Deliver redstone"
                        progress: 0
                        total: 128
                    2:
                        name: "Deliver ice"
                        progress: 0
                        total: 256
                    3:
                        name: "Deliver diamonds"
                        progress: 0
                        total: 32
                    4:
                        name: "Deliver gold ingots"
                        progress: 0
                        total: 64
                progress: 0
                total: 4
            2:
                description: "Bring crystallized experience to the Stoic Sage."
                objectives:
                    1:
                        name: "Deliver a chunk of crystallized experience"
                        progress: 0
                        total: 1
                progress: 0
                total: 1