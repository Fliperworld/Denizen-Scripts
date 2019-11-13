config:
    availability:
        offering_npc: 39
    requirements:
        quests_completed:
        - "LeatherArmor"
    rewards:
        money: 50
        quest_points: 1
        scripts:
        - FindReinwaldCompletion
    material: compass
messages:
    offer: "<darkgreen>Quest Master<white>: Warmaster Reinwald has some new assignments for you. They're more dangerous than anything you've tackled so far, but I think you're up to it. Go and meet him."
    completion: "<darkgreen>Warmaster Reinwald<white>: Hey there, recruit! Welcome! Are you ready to join the fight against the darkness? I'll help you build your strength. Oh, and the Quest Master probably has a new task for you, too - go and see him before you head out."
player_data:
    FindReinwald:
        name: Meet Warmaster Reinwald
        description: "The Quest Master has someone new for you to meet - head to the castle and seek them out."
        stages:
            1:
                description: "Meet Warmaster Reinwald."
                objectives:
                    1:
                        name: "Speak to Warmaster Reinwald"
                        progress: 0
                        total: 1
                progress: 0
                total: 1