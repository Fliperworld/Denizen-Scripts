config:
    availability:
        offering_npc: 11
    reset:
        period: daily
        time: "19:00"
    requirements:
        quests_completed:
        - "TeachFishingNewbie"
    rewards:
        money: 100
        quest_points: 1
messages:
    offer: "<gray>Fishing Newbie<white>: I've got a fishing challenge for you, do you think you're up to it?"
    completion: "<gray>Fishing Newbie<white>: Wow! Nice work!"
player_data:
    DailyFishingChallenge:
        name: Beat the Fishing Newbie's challenge (Daily)
        description: "The Fishing Newbie has a challenge for you - can you catch 32 fish in 10 minutes?"
        stages:
            1:
                description: "Beat the Fishing Newbie's challenge."
                objectives:
                    1:
                        name: "Catch 32 fish"
                        progress: 0
                        total: 32