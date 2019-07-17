config:
    availability:
        offering_npc: 31
    reset:
        period: weekly
        day: friday
        time: "19:00"
    rewards:
        money: 250
        quest_points: 3
messages:
    offer: "<darkgreen>Lady Brightsword<white>: We need assistance fighting the creeper hivemind, take out 500 for us!"
    completion: "<darkgreen>Lady Brightsword<white>: Well done citizen, your contributions are invaluable."
player_data:
    WeeklyCreepers:
        name: Crush the creepers (Weekly)
        description: "Lady Brightsword needs your help hunting down creepers."
        stages:
            1:
                description: "Cross the universe and hunt down creepers wherever they are."
                objectives:
                    1:
                        name: "Slay 500 creepers"
                        progress: 0
                        total: 500