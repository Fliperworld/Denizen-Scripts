ExperienceBooster2x:
    type: item
    material: potion[flags=li@HIDE_ENCHANTS|HIDE_POTION_EFFECTS;nbt=li@uncraftable/true;color=co@0,255,0;lore=<proc[lineWrap].context[<&6>This magic potion was brewed by and elder wizard. Drinking it will improve your ability to extract experience from defeated monsters!|40]>]
    display name: "<&a>Liquid Courage"
    enchantments:
    - MENDING:1
ExperienceBooster4x:
    type: item
    material: potion[flags=li@HIDE_ENCHANTS|HIDE_POTION_EFFECTS;nbt=li@uncraftable/true;color=co@0,255,0;lore=<proc[lineWrap].context[<&6>This magic potion was brewed by and elder wizard. Drinking it will greatly improve your ability to extract experience from defeated monsters!|40]>]
    display name: "<&a>Improved Liquid Courage"
    enchantments:
    - MENDING:1
exp_booster_handler:
    type: world
    debug: true
    events:
        on player consumes ExperienceBooster2x:
        - take ExperienceBooster2x
        - narrate "<&6>You consume the potion and are imbued with magical energy allowing you to extract more experience from defeated monsters!"
        - flag player player_exp_rate:2 duration:30m
        - wait 30m
        - narrate "<&6>The experience magic wears off..."
        on player consumes ExperienceBooster4x:
        - take ExperienceBooster4x
        - narrate "<&6>You consume the potion and are imbued with magical energy allowing you to extract more experience from defeated monsters!"
        - flag player player_exp_rate:4 duration:30m
        - wait 30m
        - narrate "<&6>The experience magic wears off..."