config:
    availability:
        offering_npc: 192
    requirements:
        quests_completed:
        - "UnlockSun"
        permissions:
        - magicspells.learn.sun-avenfeld
    rewards:
        money: 100
        quest_points: 3
    material: glowstone
messages:
    offer: "<darkgreen>Stoic Sage<white>: ecause you already know the spell to summon the sun in Prosperus, I can teach you the spell to summon it in Avenfeld. I just need a few more ingredients. Bring me redstone and gold bars."
    completion: "<darkgreen>Stoic Sage<white>: Congratulations, you're ready to learn Sun-Avenfeld! Give it a try with <&dq>/cast sun-avenfeld.<&dq>"
player_data:
    UnlockSun-Avenfeld:
        name: Learn the Sun-Avenfeld spell
        description: "Bring reagents to the Stoic Sage and learn the Sun-Avenfeld spell!"
        stages:
            1:
                description: "Bring magical reagents to the Stoic Sage."
                objectives:
                    1:
                        name: "Deliver redstone"
                        progress: 0
                        total: 64
                    2:
                        name: "Deliver gold ingots"
                        progress: 0
                        total: 32
                progress: 0
                total: 2