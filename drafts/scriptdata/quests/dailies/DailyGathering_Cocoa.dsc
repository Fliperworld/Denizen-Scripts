config:
    availability:
        offering_npc: 25
    reset:
        period: daily
        time: "19:00"
    rewards:
        money: 50
        quest_points: 1
messages:
    offer: "<gray>Cocoa Calvin<white>: We need 5 stacks of cocoa today to feed the people of Dawn's Landing. Can you help?"
    completion: "<gray>Cocoa Calvin<white>: Wow, thank you so much for your generosity! Now we can make some cookies!"
player_data:
    DailyGathering_Cocoa:
        name: Cocoa for the countrymen (Daily)
        description: "Cocoa Calvin needs cocoa for the people of Dawn's Landing!"
        stages:
            1:
                description: "Bring cocoa to Cocoa Calvin in the Questing Hall"
                objectives:
                    1:
                        name: "Deliver 320 cocoa"
                        progress: 0
                        total: 320