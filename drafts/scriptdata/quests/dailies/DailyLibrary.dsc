config:
    availability:
        offering_npc: 182
    reset:
        period: daily
        time: "19:00"
    rewards:
        money: 250
        quest_points: 1
messages:
    offer: "<gray>Bookkeeper<white>: Ah, hello! Well done on navigating the Grand Library. Go to the Quest Master for your reward."
    completion: "<gray>Bookkeeper<white>: Hey, nice job finding your way through the Grand Library! Here's a little prize."
player_data:
    DailyLibrary:
        name: Navigate the Grand Library (Daily)
        description: "Now that you've made your way through the Grand Library, go talk to the Quest Master for your reward!"
        stages:
            1:
                description: "Speak to the Quest Master"
                objectives:
                    1:
                        name: "Visit the Quest Master"
                        progress: 0
                        total: 1