config:
    availability:
        offering_npc: 22
    reset:
        period: daily
        time: "19:00"
    rewards:
        money: 50
        quest_points: 1
messages:
    offer: "<gray>Melon Matt<white>: We need 5 stacks of melon today to feed the people of Dawn's Landing. Can you help?"
    completion: "<gray>Melon Matt<white>: Wow, thank you so much for your generosity! The people will love this melon."
player_data:
    DailyGathering_Melon:
        name: Melon for the masses (Daily)
        description: "Melon Matt needs melon for the people of Dawn's Landing!"
        stages:
            1:
                description: "Bring melon to Melon Matt in the Questing Hall."
                objectives:
                    1:
                        name: "Deliver 320 melon slices"
                        progress: 0
                        total: 320