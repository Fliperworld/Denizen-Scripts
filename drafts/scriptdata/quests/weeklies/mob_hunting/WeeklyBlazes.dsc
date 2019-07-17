config:
    availability:
        offering_npc: 27
    reset:
        period: weekly
        day: friday
        time: "19:00"
    rewards:
        money: 250
        quest_points: 3
messages:
    offer: "<darkgreen>Sir Firestride<white>: We need assistance fighting the blaze attacks, take out 350 for us!"
    completion: "<darkgreen>Sir Firestride<white>: Well done citizen, your contributions are invaluable."
player_data:
    WeeklyBlazes:
        name: Burninate the blazes (Weekly)
        description: "Sir Firestride needs your help hunting down blazes."
        stages:
            1:
                description: "Cross the universe and hunt down blazes wherever they are."
                objectives:
                    1:
                        name: "Slay 350 blazes"
                        progress: 0
                        total: 350