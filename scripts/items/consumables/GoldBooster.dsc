GoldBooster2x:
    type: item
    material: potion[flags=li@HIDE_ENCHANTS|HIDE_POTION_EFFECTS;nbt=li@uncraftable/true;color=co@255,255,0;lore=<proc[lineWrap].context[<&6>There's gold in them there hills - or, rather, in the pockets of them there monsters! Drink this potion to improve gold drops from monsters you slay.|40]>]
    display name: "<&a>Golden Brew"
    enchantments:
    - MENDING:1
GoldBooster4x:
    type: item
    material: potion[flags=li@HIDE_ENCHANTS|HIDE_POTION_EFFECTS;nbt=li@uncraftable/true;color=co@255,255,0;lore=<proc[lineWrap].context[<&6>There's gold in them there hills - or, rather, in the pockets of them there monsters! Drink this potion to greatly improve gold drops from monsters you slay.|40]>]
    display name: "<&a>Improved Golden Brew"
    enchantments:
    - MENDING:1
gold_booster_handler:
    type: world
    debug: true
    events:
        on player consumes GoldBooster2x:
        - take GoldBooster2x
        - narrate "<&6>You feel a golden aura about you! For the next 30 minutes, you'll find more gold drops from slain monsters!"
        - flag player player_gold_rate:2 duration:30m
        - wait 30m
        - narrate "<&6>Your golden aura wears off..."
        on player consumes GoldBooster4x:
        - take GoldBooster4x
        - narrate "<&6>You feel a golden aura about you! For the next 30 minutes, you'll find more gold drops from slain monsters!"
        - flag player player_gold_rate:4 duration:30m
        - wait 30m
        - narrate "<&6>Your golden aura wears off..."