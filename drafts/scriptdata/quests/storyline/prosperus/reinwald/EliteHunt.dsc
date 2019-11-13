config:
    availability:
        offering_npc: 190
    requirements:
        quests_completed:
        - "LichHunt"
    rewards:
        money: 750
        quest_points: 8
        items:
        - diamond[quantity=32]
        commands:
        - "mm i give -s <player> BurnishedHelm 1"
        - "mm i give -s <player> BurnishedChest 1"
        - "mm i give -s <player> BurnishedLegs 1"
        - "mm i give -s <player> BurnishedBoots 1"
        command_text:
        - "<gold>1 set of Burnished armor"
    material: diamond_sword
messages:
    offer: "<darkgreen>Warmaster Reinwald<white>: Those Elite-level monsters aren't going anywhere, and we need your help to fight them off. Get to it."
    completion: "<darkgreen>Warmaster Reinwald<white>: Phenomenal work - you're getting quite good at this. I think you're ready for a new adventure! Go and find the Royal Geographer."
player_data:
    EliteHunt:
        name: Hunt down the Elite monsters
        description: "Hunt down Elite monsters for Warmaster Reinwald."
        stages:
            1:
                description: "Hunt Elites in the Prosperus wilderness and beyond. Elite monsters are more common in other, more dangerous dimensions."
                objectives:
                    1:
                        name: "Kill Elite monsters"
                        progress: 0
                        total: 25
                progress: 0
                total: 1