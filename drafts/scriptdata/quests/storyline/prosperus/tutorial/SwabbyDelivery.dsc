config:
    availability:
        offering_npc: 79
    rewards:
        money: 100
        quest_points: 1
    material: potion[color=242,142,28]
messages:
    offer: "<darkgreen>Swabby<white>: Can you take this package to the Quest Master in the questing hall for me? I owe him a bottle of rum!"
    completion: "<darkgreen>Quest Master<white>: Hey, thanks! I'm out of rum. This'll be real good. Say, you look like the adventuring type. You up for some quests?"
player_data:
    SwabbyDelivery:
        name: Deliver the Swabby's package to the Quest Master
        description: "The Swabby on The Coming Sunrise, the ship you came into port on, gave you a package to take to the Quest Master. Head to the Questing Hall to deliver it. The Questing Hall is to your right if you're looking off the plank of the ship, or to the left from /spawn."
        stages:
            1:
                description: "Find the Quest Master and deliver Swabby's package."
                objectives:
                    1:
                        name: "Speak to the Quest Master"
                        progress: 0
                        total: 1
                progress: 0
                total: 1