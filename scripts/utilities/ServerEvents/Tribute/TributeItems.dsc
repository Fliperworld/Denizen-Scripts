GodsTribute:
    type: item
    debug: false
    material: gold_nugget
    display name: "<&a>Tribute to the Gods"
    lore_list:
    - "<&a>Event Item"
    - "<&f>A token that radiates a divine presence."
    enchantments:
    - MENDING:1
    mechanisms:
        lore: <proc[lore_builder].context[40|<script.yaml_key[lore_list].escaped>]>
        flags:
        - HIDE_ENCHANTS
        nbt:
        - event_item/gods_tribute
        - uncraftable/true
        - expiration/<util.date.time.duration.sub[<util.date.time.day_of_week>d].sub[<util.date.time.hour>h].sub[<util.date.time.minute>m].sub[<util.date.time.second>s].add[9d].in_days>

TokenExpiration:
    type: world
    debug: false
    events:
        on player opens inventory:
        - if <context.inventory.list_contents.filter[scriptname.is[==].to[GodsTribute]].filter[nbt[expiration].is[or_less].than[<util.date.time.duration.in_days>].size> == 0:
            - stop
        - else:
            - foreach <context.inventory.list_contents.filter[scriptname.is[==].to[GodsTribute]].filter[nbt[expiration].is[or_less].than[<util.date.time.duration.in_days>]]>:
                - take <def[value]> quantity:<def[value].quantity> from:<context.inventory>
            - narrate "<&7><&o>The Tribute to the Gods fades away before your eyes..."