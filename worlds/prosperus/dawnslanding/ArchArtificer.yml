"Arch Artificer":
    type: assignment
    debug: false
    interact scripts:
    - 10 Artificing
    actions:
        on assignment:
        - teleport npc <npc.anchor[archartificer]>
        - trigger name:proximity toggle:true
        - trigger name:chat toggle:true

"Arch Artificer Format":
    type: format
    debug: false
    format: "<dark_green>Arch Artificer<white><&co> <text>"

CrystallizedExperienceSliver:
    type: item
    debug: false
    material: emerald[flags=li@HIDE_ENCHANTS;nbt=li@ExperienceCrystal/Sliver|uncraftable/true;lore=<proc[lore_builder].context[40|<script.yaml_key[lore_list].escaped>]>]
    display name: "<&a>Sliver of Crystallized Experience"
    lore_list:
    - "<&6>The Arch Artificer Created this by crystallizing a small number of levels."
    enchantments:
    - MENDING:1
CrystallizedExperienceChunk:
    type: item
    debug: false
    material: emerald[flags=li@HIDE_ENCHANTS;nbt=li@ExperienceCrystal/Chunk|uncraftable/true;lore=<proc[lore_builder].context[40|<script.yaml_key[lore_list].escaped>]>]
    display name: "<&a>Chunk of Crystallized Experience"
    lore_list:
    - "<&6>The Arch Artificer Created this by crystallizing a fair number of levels."
    enchantments:
    - MENDING:1
CrystallizedExperienceBillet:
    type: item
    debug: false
    material: emerald[flags=li@HIDE_ENCHANTS;nbt=li@ExperienceCrystal/Billet|uncraftable/true;lore=<proc[lore_builder].context[40|<script.yaml_key[lore_list].escaped>]>]
    display name: "<&a>Billet of Crystallized Experience"
    lore_list:
    - "<&6>The Arch Artificer Created this by crystallizing a sizable number of levels."
    enchantments:
    - MENDING:1
CrystallizedExperienceBloom:
    type: item
    debug: false
    material: emerald[flags=li@HIDE_ENCHANTS;nbt=li@ExperienceCrystal/Bloom|uncraftable/true;lore=<proc[lore_builder].context[40|<script.yaml_key[lore_list].escaped>]>]
    display name: "<&a>Bloom of Crystallized Experience"
    lore_list:
    - "<&6>The Arch Artificer Created this by crystallizing a large number of levels."
    enchantments:
    - MENDING:1
CrystallizedExperienceIngot:
    type: item
    debug: false
    material: emerald[flags=li@HIDE_ENCHANTS;nbt=li@ExperienceCrystal/Ingot|uncraftable/true;lore=<proc[lore_builder].context[40|<script.yaml_key[lore_list].escaped>]>]
    display name: "<&a>Ingot of Crystallized Experience"
    lore_list:
    - "<&6>The Arch Artificer Created this by crystallizing a tremendous number of levels."
    enchantments:
    - MENDING:1

"Artificing":
    type: interact
    debug: false
    steps:
        "Player Seen*":
            proximity trigger:
                entry:
                    script:
                    - narrate "format:Arch Artificer Format" "Hello, adventurer! What can I help you with? I can take all of that magical experience you've earned from slaying monsters and crystallize it. A sliver will cost you 30 levels, a chunk will cost you 50, a billet will cost you 70, a bloom will cost you 90, and an ingot will cost you 110."
                exit:
                    script:
                    - narrate "format:Arch Artificer Format" "See you again, and good hunting!"
            chat trigger:
                'Sliver':
                    trigger: "I need a /Sliver/ of Crystallized Experience, please."
                    script:
                    - if <player.xp.level> >= 30:
                        - narrate "format:Arch Artificer Format" "Sure thing, here you go!"
                        - give CrystallizedExperienceSliver quantity:1
                        - execute as_server "xp -30l <player.name>"
                    - else:
                        - narrate "format:Arch Artificer Format" "Sorry, you don't seem to have enough levels! Come back when you've got at least 30."
                'Chunk':
                    trigger: "I need a /Chunk/ of Crystallized Experience, please."
                    script:
                    - if <player.xp.level> >= 50:
                        - narrate "format:Arch Artificer Format" "Sure thing, here you go!"
                        - give CrystallizedExperienceChunk quantity:1
                        - execute as_server "xp -50l <player.name>"
                    - else:
                        - narrate "format:Arch Artificer Format" "Sorry, you don't seem to have enough levels! Come back when you've got at least 50."
                'Billet':
                    trigger: "I need a /Billet/ of Crystallized Experience, please."
                    script:
                    - if <player.xp.level> >= 70:
                        - narrate "format:Arch Artificer Format" "Sure thing, here you go!"
                        - give CrystallizedExperienceBillet quantity:1
                        - execute as_server "xp -70l <player.name>"
                    - else:
                        - narrate "format:Arch Artificer Format" "Sorry, you don't seem to have enough levels! Come back when you've got at least 70."
                'Bloom':
                    trigger: "I need a /Bloom/ of Crystallized Experience, please."
                    script:
                    - if <player.xp.level> >= 90:
                        - narrate "format:Arch Artificer Format" "Sure thing, here you go!"
                        - give CrystallizedExperienceBloom quantity:1
                        - execute as_server "xp -90l <player.name>"
                    - else:
                        - narrate "format:Arch Artificer Format" "Sorry, you don't seem to have enough levels! Come back when you've got at least 90."
                'Ingot':
                    trigger: "I need an /Ingot/ of Crystallized Experience, please."
                    script:
                    - if <player.xp.level> >= 110:
                        - narrate "format:Arch Artificer Format" "Sure thing, here you go!"
                        - give CrystallizedExperienceIngot quantity:1
                        - execute as_server "xp -110l <player.name>"
                    - else:
                        - narrate "format:Arch Artificer Format" "Sorry, you don't seem to have enough levels! Come back when you've got at least 110."