config:
    availability:
        offering_npc: 190
    requirements:
        quests_completed:
        - "SkeletalRogueHunt"
    rewards:
        money: 500
        quest_points: 5
        items:
        - diamond[quantity=8]
        commands:
        - "mm i give -s <player> ImbuedHelm 1"
        - "mm i give -s <player> ImbuedChest 1"
        - "mm i give -s <player> ImbuedLegs 1"
        - "mm i give -s <player> ImbuedBoots 1"
    material: iron_sword
messages:
    offer: "<darkgreen>Warmaster Reinwald<white>: Your initial assault against the Skeletal Rogues was a success, and for that, we thank you. You're now ready to take on more intense challenges. Accordingly, your next task is to eliminate the rising squadrons of Veteran-level monsters that have been appearing across the land."
    completion: "<darkgreen>Warmaster Reinwald<white>: Fantastic work. You stand as a bulwark against the darkness."
player_data:
    VeteranHunt:
        name: Hunt down the Veteran monsters
        description: "Hunt down Veteran monsters for Warmaster Reinwald."
        stages:
            1:
                description: "Hunt Veterans in the Prosperus wilderness and beyond. You can  find them in greater numbers in other dimensions, but beware! The forces of darkness are stronger in those realms, and your foes will come for your with all their might."
                objectives:
                    1:
                        name: "Kill Veteran monsters"
                        progress: 0
                        total: 25
                progress: 0
                total: 1