config:
    availability:
        offering_npc: 190
    requirements:
        quests_completed:
        - "VeteranHunt"
    rewards:
        money: 250
        quest_points: 5
        items:
        - diamond[quantity=8]
    material: diamond_sword
messages:
    offer: "<darkgreen>Warmaster Reinwald<white>: The forces of darkness are strong, but I think you're ready for a bigger challenge. I want you to hunt your first Elite-level monster - a Lich."
    completion: "<darkgreen>Warmaster Reinwald<white>: I'm proud of you. Keep your wits about you, there's more work to do."
player_data:
    LichHunt:
        name: Hunt down a Lich
        description: "Hunt down a Lich for Warmaster Reinwald."
        stages:
            1:
                description: "Hunt a Lich. You can find them rarely in Prosperus. Elite monsters are more common in other, more dangerous dimensions."
                objectives:
                    1:
                        name: "Kill a Lich"
                        progress: 0
                        total: 1
                progress: 0
                total: 1