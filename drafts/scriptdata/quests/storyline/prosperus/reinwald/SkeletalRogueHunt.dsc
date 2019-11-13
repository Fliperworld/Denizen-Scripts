config:
    availability:
        offering_npc: 190
    requirements:
        quests_completed:
        - "FirstMobHunting"
    rewards:
        money: 100
        quest_points: 3
        items:
        - diamond[quantity=3]
    material: iron_sword
messages:
    offer: "<darkgreen>Warmaster Reinwald<white>: I think you're ready to start fighting the stronger ranks of the forces of darkness. We've seen them in increased numbers lately, and we're going to need your help to hold them back. To start, I'd like you to track down and defeat some Skeletal Rogues."
    completion: "<darkgreen>Warmaster Reinwald<white>: Great work. With your help, the world is a little safer. Keep up the fight."
player_data:
    SkeletalRogueHunt:
        name: Hunt down the Skeletal Rogues
        description: "Hunt down monsters for Warmaster Reinwald."
        stages:
            1:
                description: "Hunt Skeletal Rogues in the Prosperus wilderness."
                objectives:
                    1:
                        name: "Kill Skeletal Rogues"
                        progress: 0
                        total: 10
                progress: 0
                total: 1