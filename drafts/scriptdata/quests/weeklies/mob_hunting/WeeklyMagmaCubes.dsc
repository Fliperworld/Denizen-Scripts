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
    offer: "<darkgreen>Sir Firestride<white>: We need assistance fighting the magma cube horde, take out 500 for us!"
    completion: "<darkgreen>Sir Firestride<white>: Well done citizen, your contributions are invaluable."
player_data:
    WeeklyMagmaCubes:
        name: Mutilate the magma cubes (Weekly)
        description: "Sir Firestride needs your help hunting down magma cubes."
        stages:
            1:
                description: "Cross the universe and hunt down magma cubes wherever they are."
                objectives:
                    1:
                        name: "Slay 500 magma cubes"
                        progress: 0
                        total: 350