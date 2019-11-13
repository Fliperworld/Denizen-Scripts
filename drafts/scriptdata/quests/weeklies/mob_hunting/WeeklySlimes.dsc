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
    material: iron_sword
messages:
    offer: "<darkgreen>Lady Brightsword<white>: We need assistance fighting the slime plague, take out 500 for us!"
    completion: "<darkgreen>Lady Brightsword<white>: Well done citizen, your contributions are invaluable."
player_data:
    WeeklySlimes:
        name: Stagger the slimes (Weekly)
        description: "Lady Brightsword needs your help hunting down slimes."
        stages:
            1:
                description: "Cross the universe and hunt down slimes wherever they are."
                objectives:
                    1:
                        name: "Slay 500 slimes"
                        progress: 0
                        total: 500
                progress: 0
                total: 1