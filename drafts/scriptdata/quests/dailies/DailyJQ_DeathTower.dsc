config:
    availability:
        offering_npc: 66
    reset:
        period: daily
        time: "19:00"
    rewards:
        money: 250
        quest_points: 2
messages:
    offer: "<gray>He Jumps Death<white>: You've heard of the Death Tower, right? Go and make your way up the first five levels."
    completion: "<gray>He Jumped Death<white>: You're quite the climber! Here's some gold for your trouble."
player_data:
    DailyJQ_DeathTower:
        name: Laugh in the face of death (Daily)
        description: "Head to the Death Tower and make your way up the first five levels!"
        stages:
            1:
                description: "Complete the first five levels of the Death Tower"
                objectives:
                    1:
                        name: "Speak to He Jumped Death"
                        progress: 0
                        total: 1