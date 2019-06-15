spear_ready_check:
    type: world
    debug: false
    events:
        # Affects targets rather than amounts; use an early-firing priority
        on player damages entity priority:-15:
        - if <player.item_in_hand.nbt[weapon_type]||null> == spear && <player.has_flag[attack_cooldown].not>:
            - flag player attack_cooldown:true duration:<player.attack_cooldown.max_duration>
            - define entity_list <player.eye_location.points_between[<player.eye_location.add[<player.location.direction.vector.mul[8]>]>].distance[1.0].parse[find.entities.within[1.0]].replace_text[li@].as_list.deduplicate.exclude[li@<context.damager>|<context.entity>]>
            - hurt <context.damage> <def[entity_list]> source:<player> cause:entity_attack
            - playeffect effect:damage_indicator at:<def[entity_list].parse[location]> visibility:500 quantity:3 offset:0.5
        - else if <player.item_in_hand.nbt[weapon_type]||null> == spear:
            - flag player attack_cooldown:true duration:<player.attack_cooldown.max_duration>
        on player left clicks:
        - if <player.item_in_hand.nbt[weapon_type]||null> == spear:
            - flag player attack_cooldown:true duration:<player.attack_cooldown.max_duration>