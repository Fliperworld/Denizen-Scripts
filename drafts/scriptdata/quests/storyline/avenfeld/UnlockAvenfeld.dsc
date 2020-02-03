config:
    availability:
        offering_npc: 33
    requirements:
        quests_completed:
        - "EliteHunt"
        permissions:
        - magicspells.learn.realmwarp-avenfeld
    rewards:
        money: 250
        quest_points: 5
    material: ender_eye
messages:
    offer: "<darkgreen>Royal Geographer<white>: We've made new developments in magical transportation. We've discovered a new realm, Avenfeld! I'd like you to go there. I can teach you the spell, but you'll need to gather the requisite magical items in order to visit. Bring them to me when you're ready."
    completion: "<darkgreen>Royal Geographer<white>: Congratulations - you've made it to Avenfeld! I'm sure further adventures are afield."
player_data:
    UnlockAvenfeld:
        name: Discover a new realm
        description: "The researchers in the Dawn's Landing castle have made some exciting advancements in magical transportation. Gather the magical ingredients needed, and they'll teach you how to warp yourself to a new realm, Avenfeld."
        stages:
            1:
                description: "Bring magical ingredients to the Royal Geographer"
                objectives:
                    1:
                        name: "Deliver redstone"
                        progress: 0
                        total: 128
                    2:
                        name: "Deliver ghast tears"
                        progress: 0
                        total: 16
                    3:
                        name: "Deliver eyes of ender"
                        progress: 0
                        total: 16
                    4:
                        name: "Deliver slime balls"
                        progress: 0
                        total: 32
                progress: 0
                total: 4
            2:
                description: "Cast the spell to travel to Avenfeld"
                objectives:
                    1:
                        name: "Cast realmwarp-avenfeld"
                        progress: 0
                        total: 1
                progress: 0
                total: 1