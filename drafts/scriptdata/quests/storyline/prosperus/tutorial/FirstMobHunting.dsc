config:
    availability:
        offering_npc: 190
    requirements:
        quests_completed:
        - "FindReinwald"
    rewards:
        money: 100
        quest_points: 3
        items:
        - diamond[quantity=1]
        - iron_ingot[quantity=6]
        scripts:
        - FirstMobHuntingCompletion
    material: wooden_sword
messages:
    offer: "<darkgreen>Warmaster Reinwald<white>: It's time for you to head out into the world. I've got a lot of work for you to do, but first, I have to make sure you're ready for it. Start by killing a <&a>Zombie<&f>, a <&a>Skeleton<&f>, a <&a>Spider<&f>, and a <&a>Creeper<&f> to show me that you know what you're doing. Be careful, and if you see any Veteran or Elite monsters, I suggest you run. You'll know them when you see them."
    completion: "<darkgreen>Warmaster Reinwald<white>: Great work. I have more for you to do, when you're ready."
player_data:
    FirstMobHunting:
        name: Cutting your teeth
        description: "Hunt down monsters for Warmaster Reinwald."
        stages:
            1:
                description: "Hunt monsters in the Prosperus wilderness."
                objectives:
                    1:
                        name: "Kill a creeper"
                        progress: 0
                        total: 1
                    2:
                        name: "Kill a skeleton"
                        progress: 0
                        total: 1
                    3:
                        name: "Kill a spider"
                        progress: 0
                        total: 1
                    4:
                        name: "Kill a zombie"
                        progress: 0
                        total: 1
                progress: 0
                total: 1