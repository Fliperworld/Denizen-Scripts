config:
    availability:
        offering_npc: 39
    rewards:
        money: 50
        quest_points: 1
        items:
        - wood_axe[enchantments=li@DURABILITY,1]
        - wood_pickaxe[enchantments=li@DURABILITY,1]
        - wood_spade[enchantments=li@DURABILITY,1]
        - wood_sword[enchantments=li@DURABILITY,1]
        - wood_hoe[enchantments=li@DURABILITY,1]
    material: wooden_axe
messages:
    offer: "<darkgreen>Quest Master<white>: It's time for your adventure to begin! Go out into the wild, scavenge for resources, and craft your first set of wooden tools. Then, bring them to me, and I'll enchant them."
    completion: "<darkgreen>Quest Master<white>: Nicely done! Here are your tools back - and I enchanted them for you, too! Ready for your next task?"
player_data:
    WoodTools:
        name: "Adventurer's Toolbox"
        description: "Head out into the wild, find a tree, and use the logs to craft wooden tools. Bring them back to the Quest Master."
        current_stage: 1
        stages:
            1:
                description: "Craft wooden tools."
                objectives:
                    1:
                        name: "Craft a wooden axe"
                        progress: 0
                        total: 1
                    2:
                        name: "Craft a wooden pickaxe"
                        progress: 0
                        total: 1
                    3:
                        name: "Craft a wooden shovel"
                        progress: 0
                        total: 1
                    4:
                        name: "Craft a wooden sword"
                        progress: 0
                        total: 1
                    5:
                        name: "Craft a wooden hoe"
                        progress: 0
                        total: 1
                progress: 0
                total: 5
            2:
                description: "Bring wooden tools to the Quest Master."
                objectives:
                    1:
                        name: "Bring a wooden axe to the Quest Master"
                        progress: 0
                        total: 1
                    2:
                        name: "Bring a wooden pickaxe to the Quest Master"
                        progress: 0
                        total: 1
                    3:
                        name: "Bring a wooden shovel to the Quest Master"
                        progress: 0
                        total: 1
                    4:
                        name: "Bring a wooden sword to the Quest Master"
                        progress: 0
                        total: 1
                    5:
                        name: "Bring a wooden hoe to the Quest Master"
                        progress: 0
                        total: 1
                progress: 0
                total: 5