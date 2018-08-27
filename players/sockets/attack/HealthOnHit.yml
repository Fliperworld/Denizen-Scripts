socket_gem_attack_health_on_hit_handler:
    type: world
    debug: false
    events:
        on player damages entity:
        - define gem_count 0
        - foreach <context.damager.equipment.include[<context.damager.item_in_hand>]>
        {
            - define gem_count <def[gem_count].add[<def[value].nbt.filter[matches[socket[0-9]+_gem/socket_gem_attack_health_on_hit]].size||0>]>
        }
        - repeat <def[gem_count]>
        {
            - heal <context.final_damage.div[8]> <context.damager>
        }

socket_gem_attack_health_on_hit:
    debug: false
    type: item
    material: emerald[flags=li@HIDE_ATTRIBUTES|HIDE_ENCHANTS;nbt=li@uncraftable/true|gem_type/attack|gem_specific/socket_gem_attack_health_on_hit]
    display name: "<&c>Gem of Health on Hit"
    lore:
    - "<&6>Gem"
    - "<&c>Attack"
    - "<&f>+1/8 damage dealt healed on hit"
    enchantments:
    - MENDING:1