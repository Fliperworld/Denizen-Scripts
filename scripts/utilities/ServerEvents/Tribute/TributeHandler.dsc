Tribute_Task:
    type: task
    debug: true
    script:
    - yaml set id:events tribute.active:false
    - yaml set id:events tribute.mcmmo.rate:1
    - yaml set id:events tribute.mcmmo.progress:0
    - yaml set id:events tribute.drops.rate:1
    - yaml set id:events tribute.drops.progress:0
    - yaml set id:events tribute.experience.rate:1
    - yaml set id:events tribute.experience.progress:0
    - yaml set id:rates drops.active:false
    - yaml set id:rates drops.multiplier:1
    - yaml set id:rates experience.active:false
    - yaml set id:rates experience.multiplier:1
    - yaml id:rates savefile:scriptdata/Rates.yml
    - yaml id:events savefile:scriptdata/Events.yml
    - execute as_server "xprate reset"
    - reload

Tribute_Activate_Task:
    type: task
    debug: true
    script:
    - yaml set id:events tribute.active:true
    - yaml set id:rates drops.active:true
    - yaml set id:rates drops.multiplier:1
    - yaml set id:rates experience.active:true
    - yaml set id:rates experience.multiplier:1
    - yaml id:rates savefile:scriptdata/Rates.yml
    - yaml id:events savefile:scriptdata/Events.yml
    - announce to_console "Reloading scripts"
    - reload

Tribute_Handler:
    type: world
    debug: false
    events:
        on system time hourly:
        - announce to_console "Tribute Handler system time event run"
        - if <util.date.format[EEE]> != Fri && <util.date.format[EEE]> != Mon:
            #- announce to_console "Date is not Friday or Monday, Tribute Handler stopping"
            - stop
        - else if <util.date.format[EEE]> == Fri:
            - announce to_console "Date is Friday, Tribute Handler running"
            - if <yaml[events].read[tribute.active]>:
                - announce to_console "Tribute event already active, Tribute Handler stopping"
                - stop
            - else:
                - announce to_console "Activating Tribute"
                - yaml set id:events tribute.active:true
                - yaml set id:rates drops.active:true
                - yaml set id:rates drops.multiplier:1
                - yaml set id:rates experience.active:true
                - yaml set id:rates experience.multiplier:1
                - yaml id:rates savefile:scriptdata/Rates.yml
                - yaml id:events savefile:scriptdata/Events.yml
                - announce to_console "Reloading scripts"
                - reload
        - else if <util.date.format[EEE]> == Mon:
            - if <yaml[events].read[tribute.active]> == false:
                - stop
            - else:
                - yaml set id:events tribute.active:false
                - yaml set id:events tribute.mcmmo.rate:1
                - yaml set id:events tribute.mcmmo.progress:0
                - yaml set id:events tribute.drops.rate:1
                - yaml set id:events tribute.drops.progress:0
                - yaml set id:events tribute.experience.rate:1
                - yaml set id:events tribute.experience.progress:0
                - yaml set id:rates drops.active:false
                - yaml set id:rates drops.multiplier:1
                - yaml set id:rates experience.active:false
                - yaml set id:rates experience.multiplier:1
                - yaml id:rates savefile:scriptdata/Rates.yml
                - yaml id:events savefile:scriptdata/Events.yml
                - execute as_server "xprate reset"
                - reload
        on player joins:
        - if <yaml[events].read[tribute.active].not>:
            - stop
        - if <yaml[events].read[tribute.active]>:
            - wait 3s
            - narrate "<&6>The Gods seek your offerings of Tribute! Collect Tribute and deliver it to the <&2>Oracle of the Gods<&6> in the castle in Dawn's Landing!"
            - if <yaml[events].read[tribute.mcmmo.rate]> > 1 || <yaml[events].read[tribute.drops.rate]> > 1 || <yaml[events].read[tribute.experience.rate]> > 1:
                - narrate "<&a>Current blessings:"
                - narrate "<&a>Blessing of Skillfulness: <&6><yaml[events].read[tribute.mcmmo.rate]>x"
                - narrate "<&a>Blessing of Luck: <&6><yaml[events].read[tribute.drops.rate]>x"
                - narrate "<&a>Blessing of Wisdom: <&6><yaml[events].read[tribute.experience.rate]>x"
        on player receives message:
        - if "<context.message.contains_text[mcMMO is currently in an XP rate event]>" && <yaml[events].read[tribute.active]>:
            - determine cancelled

Tribute_Power_Hour:
    type: world
    debug: false
    events:
        on system time 19:00:
        - if <util.date.format[EEE]> != Fri && <util.date.format[EEE]> != Sat && <util.date.format[EEE]> != Sun:
            - announce to_console "It's not the weekend, Tribute Power Hour stopping"
            - stop
        - if <server.has_flag[tribute_power_hour]>:
            - stop
        - else:
            - flag server tribute_power_hour:true duration:2h
            - announce "<&a>The Gods present an opportunity to win their favor! For the next two hours, Tribute will appear more often!"
            - discord id:sxr message channel:191040977652285450 "**The Gods present an opportunity to win their favor! For the next two hours, Tribute will appear more often!**"

Tribute_DropTable_Veteran:
    type: world
    debug: false
    events:
        on entity killed by player:
        - if <yaml[events].read[tribute.active]> == false:
            - stop
        - if !<context.entity.name.starts_with[<&9>]||null>:
            - stop
        - if <context.entity.location.is_within[arena_avenfeld]>:
            - stop
        - else if <context.entity.name.starts_with[<&9>]||null>:
            - if <server.has_flag[tribute_power_hour]>:
                - if <util.random.int[2].to[5]> <= 1:
                    - drop GodsTribute location:<context.entity.location>
            - else if <util.random.int[1].to[5]> <= 1:
                - drop GodsTribute location:<context.entity.location>

Tribute_DropTable_Elite:
    type: world
    debug: false
    events:
        on entity killed by player:
        - if <yaml[events].read[tribute.active]> == false:
            - stop
        - if !<context.entity.name.starts_with[<&d>]||null>:
            - stop
        - if <context.entity.location.is_within[arena_avenfeld]>:
            - stop
        - else if <context.entity.name.starts_with[<&d>]||null>:
            - if <server.has_flag[tribute_power_hour]>:
                - drop GodsTribute location:<context.entity.location> quantity:<util.random.int[1].to[10]>
            - else:
                - drop GodsTribute location:<context.entity.location> quantity:<util.random.int[1].to[5]>

Tribute_mcMMO_Drops:
    type: world
    debug: false
    events:
        on mcmmo player gains xp for mining:
        - if <yaml[events].read[tribute.active]> == false:
            - stop
        - if <util.random.int[1].to[50]> <= 1:
            - announce to_console "Tribute drop for <player.name> caused by gaining mining exp"
            - if <server.has_flag[tribute_power_hour]>:
                - give GodsTribute quantity:2
            - else:
                - give GodsTribute
            - narrate "<&a>You found a Tribute to the Gods!"

        on mcmmo player gains xp for herbalism:
        - if <yaml[events].read[tribute.active]> == false:
            - stop
        - if <util.random.int[1].to[50]> <= 1:
            - announce to_console "Tribute drop for <player.name> caused by gaining herbalism exp"
            - if <server.has_flag[tribute_power_hour]>:
                - give GodsTribute quantity:2
            - else:
                - give GodsTribute
            - narrate "<&a>You found a Tribute to the Gods!"

        on mcmmo player gains xp for fishing:
        - if <yaml[events].read[tribute.active]> == false:
            - stop
        - if <util.random.int[1].to[15]> <= 1:
            - announce to_console "Tribute drop for <player.name> caused by gaining fishing exp"
            - if <server.has_flag[tribute_power_hour]>:
                - give GodsTribute quantity:2
            - else:
                - give GodsTribute
            - narrate "<&a>You found a Tribute to the Gods!"

        on mcmmo player gains xp for woodcutting:
        - if <yaml[events].read[tribute.active]> == false:
            - stop
        - if <util.random.int[1].to[50]> <= 1:
            - announce to_console "Tribute drop for <player.name> caused by gaining woodcutting exp"
            - if <server.has_flag[tribute_power_hour]>:
                - give GodsTribute quantity:2
            - else:
                - give GodsTribute
            - narrate "<&a>You found a Tribute to the Gods!"

        on mcmmo player gains xp for excavation:
        - if <yaml[events].read[tribute.active]> == false:
            - stop
        - if <util.random.int[1].to[50]> <= 1:
            - announce to_console "Tribute drop for <player.name> caused by gaining excavation exp"
            - if <server.has_flag[tribute_power_hour]>:
                - give GodsTribute quantity:2
            - else:
                - give GodsTribute
            - narrate "<&a>You found a Tribute to the Gods!"