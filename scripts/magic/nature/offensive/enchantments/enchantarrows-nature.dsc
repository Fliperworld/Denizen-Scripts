enchantarrows-nature:
    type: task
    debug: false
    definitions: player
    script:
    - flag <def[player]> enchantarrows-nature:true duration:300s
enchantarrows-nature-handler:
    type: world
    debug: false
    events:
        on player shoots bow:
        - if <context.entity.as_player.has_flag[enchantarrows-nature]||null>:
            - flag <context.projectile> enchanted:true
            - flag <context.projectile> enchantment:nature
        on player damages entity:
        - if <context.damager.has_flag[enchantarrows-nature]> && <context.projectile.flag[enchantment]> == nature:
            - flag <context.entity> no-fall-damage:true duration:1.5s
            - cast jump duration:1s power:-7 <context.entity>
            - cast slow duration:1s power:10 <context.entity>
        on entity damaged:
        - if <context.entity.has_flag[no-fall-damage].not||null>:
            - stop
        - determine cancelled