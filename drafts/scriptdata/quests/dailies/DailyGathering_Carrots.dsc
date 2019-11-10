config:
    availability:
        offering_npc: 20
    reset:
        period: 1d
        time: "19:00"
    rewards:
        money: 50
        quest_points: 1
messages:
    offer: "<gray>Carrot Carl<white>: Please bring me 5 stacks of carrots today so we can feed the people of Dawn's Landing."
    completion: "<gray>Carrot Carl<white>: Wow, thank you so much for your generosity! The people will love these carrots."
player_data:
    DailyGathering_Carrots:
        name: Carrots for the Citizens (Daily)
        description: "Carrot Carl needs carrots for the people of Dawn's Landing!"
        stages:
            1:
                description: "Bring carrots to Carrot Carl in the Questing Hall."
                objectives:
                    1:
                        name: "Deliver 320 carrots"
                        progress: 0
                        total: 320
                progress: 0
                total: 1