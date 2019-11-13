config:
    availability:
        offering_npc: 31
    reset:
        period: 7d
        day: friday
        time: "19:00"
    rewards:
        money: 250
        quest_points: 3
    material: wooden_sword
messages:
    offer: "<darkgreen>Lady Brightsword<white>: We need assistance fighting the zombie horde, take out 500 for us!"
    completion: "<darkgreen>Lady Brightsword<white>: Well done citizen, your contributions are invaluable."
player_data:
    WeeklyZombies:
        name: Zap the zombies (Weekly)
        description: "Lady Brightsword needs your help hunting down zombies."
        stages:
            1:
                description: "Cross the universe and hunt down zombies wherever they are."
                objectives:
                    1:
                        name: "Slay 500 zombies"
                        progress: 0
                        total: 500
                progress: 0
                total: 1