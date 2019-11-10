config:
    availability:
        offering_npc: 39
    requirements:
        quests_completed:
        - "Mining"
    rewards:
        money: 50
        quest_points: 1
        items:
        - diamond
        - emerald
messages:
    offer: "<darkgreen>Quest Master<white>: Have you noticed yourself learning any skills while you're out adventuring? Well, we've got some trainers here around Dawn's Landing that will share their knowledge of those arts with you - for some coin, of course. Go meet the lot of them, and I'll give you a reward for your troubles."
    completion: "<darkgreen>Quest Master<white>: Great job! Remember where they are, and visit them if you need help with your skills. There are a few others around, too, if you want to go find them on your own time."
player_data:
    MeetSkillTrainers:
        name: Meet the skill trainers
        description: "Skill trainers are located all around Dawn's Landing. For a little coin, they'll help you improve your abilities. Go meet a few of them for a reward from the Quest Master."
        stages:
            1:
                description: "Meet a few of the Skill Trainers."
                objectives:
                    1:
                        name: "Speak to Old Fisherman"
                        progress: 0
                        total: 1
                    2:
                        name: "Speak to the Head Miner"
                        progress: 0
                        total: 1
                    3:
                        name: "Speak to the Head Excavator"
                        progress: 0
                        total: 1
                    4:
                        name: "Speak to the Expert Logger"
                        progress: 0
                        total: 1
                    5:
                        name: "Speak to the Master Repairman"
                        progress: 0
                        total: 1
                progress: 0
                total: 5