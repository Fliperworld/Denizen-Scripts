config:
    availability:
        offering_npc: 18
    reset:
        period: daily
        time: "19:00"
    rewards:
        money: 100
        quest_points: 1
messages:
    offer: "<gray>He Jumps Once<white>: You like to jump, don't you? Sure you do. Go beat my challenge."
    completion: "<gray>He Jumped Once<white>: That wasn't so hard, was it? Here's some gold!"
player_data:
    DailyJQ1:
        name: Jumps and slides (Daily)
        description: "Conquer the jumping challenge!"
        stages:
            1:
                description: "Jump your way through the challenge."
                objectives:
                    1:
                        name: "Speak to He Jumped Once"
                        progress: 0
                        total: 1