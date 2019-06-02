alchemist_arcaena:
    type: assignment
    interact scripts:
    - 10 alchemist_arcaena_interact
    actions:
        on assignment:
        - teleport npc <npc.anchor[alchemist_arcaena]>
        - trigger name:proximity toggle:true
        - trigger name:chat toggle:true

alchemist_arcaena_format:
    type: format
    format: "<dark_green>Alchemist Arcaena<white><&co> <text>"

"alchemist_arcaena_interact":
    type: interact
    steps:
        "Player Seen*":
            proximity trigger:
                entry:
                    script:
                    - narrate "format:alchemist_arcaena_format" "Hello, adventurer! Come to peruse my magical brews? Bring me the right ingredients and I can craft you some enchanted cocktails."
                    - narrate "format:alchemist_arcaena_format" "The various potions I can brew require different kinds of ingredients. Right click me to browse my offerings."
                exit:
                    script:
                    - narrate "format:alchemist_arcaena_format" "Good luck on your adventures! Visit me again when you need another magical drink."
            click trigger:
                script:
                - narrate "format:alchemist_arcaena_format" "Okay, here's what I have to offer."
                - wait 1s
                - inventory open d:in@alchemist_arcaena_inventory_menu

"alchemist_arcaena_inventory_menu":
    type: inventory
    title: Enchanted Cocktails
    size: 45
    slots:
    - "[i@DropRateBooster2xMenu] [] [i@GoldBooster2xMenu] [] [] [] [] [] []"
    - "[i@DropRateBooster4xMenu] [] [i@GoldBooster4xMenu] [] [] [] [] [] []"
    - "[] [] [] [] [] [] [] [] []"
    - "[] [] [] [] [] [] [] [] []"
    - "[] [] [] [] [] [] [] [] []"


DropRateBooster2xMenu:
    type: item
    material: potion[flags=li@HIDE_ENCHANTS|HIDE_POTION_EFFECTS;nbt=li@uncraftable/true;color=co@0,0,255;lore=<proc[lore_builder].context[40|<script.yaml_key[lore_list].escaped>]>]
    display name: "<&a>Bottled Luck"
    lore_list:
    - "<&f>This magic potion will give you a 2x chance to find rare items while hunting monsters!"
    - "<&6>Ingredients"
    - "<&f><s@DropRateBooster2xMenu.yaml_key[purifieddarkmattercost]>x Purified Dark Matter"
    - "<&f><s@DropRateBooster2xMenu.yaml_key[crystallizedexperienceingotcost]>x Crystallized Experience Ingot"
    enchantments:
    - MENDING:1
    purifieddarkmattercost: 32
    crystallizedexperienceingotcost: 1
DropRateBooster4xMenu:
    type: item
    material: potion[flags=li@HIDE_ENCHANTS|HIDE_POTION_EFFECTS;nbt=li@uncraftable/true;color=co@0,0,255;lore=<proc[lore_builder].context[40|<script.yaml_key[lore_list].escaped>]>]
    display name: "<&a>Improved Bottled Luck"
    lore_list:
    - "<&f>This magic potion will give you a 4x chance to find rare items while hunting monsters!"
    - "<&6>Ingredients"
    - "<&f><s@DropRateBooster4xMenu.yaml_key[purifieddarkmattercost]>x Purified Dark Matter"
    - "<&f><s@DropRateBooster4xMenu.yaml_key[crystallizedexperienceingotcost]>x Crystallized Experience Ingot"
    enchantments:
    - MENDING:1
    purifieddarkmattercost: 96
    crystallizedexperienceingotcost: 3

GoldBooster2xMenu:
    type: item
    material: potion[flags=li@HIDE_ENCHANTS|HIDE_POTION_EFFECTS;nbt=li@uncraftable/true;color=co@255,255,0;lore=<proc[lore_builder].context[40|<script.yaml_key[lore_list].escaped>]>]
    display name: "<&a>Golden Brew"
    lore_list:
    - "<&f>This magic potion will give you a 2x chance to find extra gold from slain monsters!"
    - "<&6>Ingredients"
    - "<&f><s@DropRateBooster2xMenu.yaml_key[purifieddarkmattercost]>x Purified Dark Matter"
    - "<&f><s@DropRateBooster2xMenu.yaml_key[crystallizedexperienceingotcost]>x Crystallized Experience Ingot"
    enchantments:
    - MENDING:1
    purifieddarkmattercost: 32
    crystallizedexperienceingotcost: 1
GoldBooster4xMenu:
    type: item
    material: potion[flags=li@HIDE_ENCHANTS|HIDE_POTION_EFFECTS;nbt=li@uncraftable/true;color=co@255,255,0;lore=<proc[lore_builder].context[40|<script.yaml_key[lore_list].escaped>]>]
    display name: "<&a>Improved Golden Brew"
    lore_list:
    - "<&f>This magic potion will give you a 4x chance to find extra gold from slain monsters!"
    - "<&6>Ingredients"
    - "<&f><s@GoldBooster4xMenu.yaml_key[purifieddarkmattercost]>x Purified Dark Matter"
    - "<&f><s@GoldBooster4xMenu.yaml_key[crystallizedexperienceingotcost]>x Crystallized Experience Ingot"
    enchantments:
    - MENDING:1
    purifieddarkmattercost: 96
    crystallizedexperienceingotcost: 3


"alchemist_arcaena_inventory_handler":
    type: world
    events:
        on player clicks in alchemist_arcaena_inventory_menu:
        - determine cancelled
        on player drags in alchemist_arcaena_inventory_menu:
        - determine cancelled
        on player clicks DropRateBooster2xMenu in alchemist_arcaena_inventory_menu:
        - inventory close d:in@alchemist_arcaena_inventory_menu
        - announce to_console <player.inventory.list_contents>
        - if <player.inventory.contains.scriptname[SocketMaker].quantity[<s@DropRateBooster2xMenu.yaml_key[purifieddarkmattercost]>]> && <player.inventory.contains.scriptname[CrystallizedExperienceIngot].quantity[<s@DropRateBooster2xMenu.yaml_key[crystallizedexperienceingotcost]>]>
        {
            - take scriptname:SocketMaker quantity:<s@DropRateBooster2xMenu.yaml_key[purifieddarkmattercost]>
            - take scriptname:CrystallizedExperienceIngot quantity:<s@DropRateBooster2xMenu.yaml_key[crystallizedexperienceingotcost]>
            - give DropRateBooster2x quantity:1 to:<player.inventory>
            - narrate "format:alchemist_arcaena_format" "Here you go, bottoms up!"
        }
        else
        {
            - narrate "format:alchemist_arcaena_format" "Sorry, I need you to bring me the right ingredients for that!"
        }
        - narrate "format:alchemist_arcaena_format" "Right click me again if you're looking for anything else!"
        on player clicks DropRateBooster4xMenu in alchemist_arcaena_inventory_menu:
        - inventory close d:in@alchemist_arcaena_inventory_menu
        - announce to_console <player.inventory.list_contents>
        - if <player.inventory.contains.scriptname[SocketMaker].quantity[<s@DropRateBooster4xMenu.yaml_key[purifieddarkmattercost]>]> && <player.inventory.contains.scriptname[CrystallizedExperienceIngot].quantity[<s@DropRateBooster4xMenu.yaml_key[crystallizedexperienceingotcost]>]>
        {
            - take scriptname:SocketMaker quantity:<s@DropRateBooster4xMenu.yaml_key[purifieddarkmattercost]>
            - take scriptname:CrystallizedExperienceIngot quantity:<s@DropRateBooster4xMenu.yaml_key[crystallizedexperienceingotcost]>
            - give DropRateBooster4x quantity:1 to:<player.inventory>
            - narrate "format:alchemist_arcaena_format" "Here you go, bottoms up!"
        }
        else
        {
            - narrate "format:alchemist_arcaena_format" "Sorry, I need you to bring me the right ingredients for that!"
        }
        - narrate "format:alchemist_arcaena_format" "Right click me again if you're looking for anything else!"
        on player clicks GoldBooster2xMenu in alchemist_arcaena_inventory_menu:
        - inventory close d:in@alchemist_arcaena_inventory_menu
        - announce to_console <player.inventory.list_contents>
        - if <player.inventory.contains.scriptname[SocketMaker].quantity[<s@GoldBooster2xMenu.yaml_key[purifieddarkmattercost]>]> && <player.inventory.contains.scriptname[CrystallizedExperienceIngot].quantity[<s@GoldBooster2xMenu.yaml_key[crystallizedexperienceingotcost]>]>
        {
            - take scriptname:SocketMaker quantity:<s@GoldBooster2xMenu.yaml_key[purifieddarkmattercost]>
            - take scriptname:CrystallizedExperienceIngot quantity:<s@GoldBooster2xMenu.yaml_key[crystallizedexperienceingotcost]>
            - give GoldBooster2x quantity:1 to:<player.inventory>
            - narrate "format:alchemist_arcaena_format" "Here you go, bottoms up!"
        }
        else
        {
            - narrate "format:alchemist_arcaena_format" "Sorry, I need you to bring me the right ingredients for that!"
        }
        - narrate "format:alchemist_arcaena_format" "Right click me again if you're looking for anything else!"
        on player clicks GoldBooster4xMenu in alchemist_arcaena_inventory_menu:
        - inventory close d:in@alchemist_arcaena_inventory_menu
        - announce to_console <player.inventory.list_contents>
        - if <player.inventory.contains.scriptname[SocketMaker].quantity[<s@GoldBooster4xMenu.yaml_key[purifieddarkmattercost]>]> && <player.inventory.contains.scriptname[CrystallizedExperienceIngot].quantity[<s@GoldBooster4xMenu.yaml_key[crystallizedexperienceingotcost]>]>
        {
            - take scriptname:SocketMaker quantity:<s@GoldBooster4xMenu.yaml_key[purifieddarkmattercost]>
            - take scriptname:CrystallizedExperienceIngot quantity:<s@GoldBooster4xMenu.yaml_key[crystallizedexperienceingotcost]>
            - give GoldBooster4x quantity:1 to:<player.inventory>
            - narrate "format:alchemist_arcaena_format" "Here you go, bottoms up!"
        }
        else
        {
            - narrate "format:alchemist_arcaena_format" "Sorry, I need you to bring me the right ingredients for that!"
        }
        - narrate "format:alchemist_arcaena_format" "Right click me again if you're looking for anything else!"