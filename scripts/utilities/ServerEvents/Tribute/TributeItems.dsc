GodsTribute:
    type: item
    debug: false
    material: gold_nugget[flags=li@HIDE_ENCHANTS;nbt=li@event_item/gods_tribute|uncraftable/true|expiration/<util.date.time.duration.add[2d].in_weeks.round_down>;lore=<proc[lore_builder].context[40|<script.yaml_key[lore_list].escaped>]>]
    display name: "<&a>Tribute to the Gods"
    lore_list:
    - "<&a>Event Item"
    - "<&f>A token that radiates a divine presence."
    enchantments:
    - MENDING:1

TokenExpiration:
    type: world
    debug: false
    events:
        on player opens inventory:
        - if <context.inventory.list_contents.filter[scriptname.is[==].to[GodsTribute]].filter[nbt[expiration].is[or_less].than[<util.date.time.duration.sub[<util.date.time.day_of_week>d].add[1d].in_weeks>]].size> == 0:
            - stop
        - else:
            - foreach <context.inventory.list_contents.filter[scriptname.is[==].to[GodsTribute]].filter[nbt[expiration].is[or_less].than[<util.date.time.duration.sub[<util.date.time.day_of_week>d].add[1d].in_weeks>]]>:
                - take <def[value]> quantity:<def[value].quantity> from:<context.inventory>
            - narrate "<&7><&o>The Tribute to the Gods fades away before your eyes..."