veteran_consumable_drop:
    type: world
    debug: false
    events:
        on mm denizen death:
        - if !<context.entity.name.starts_with[<&9>]||null>:
            - stop
        - else if <proc[AntiFarm_Proc].context[<context.entity>]>:
            - stop
        - else if <context.entity.name.starts_with[<&9>]||null>:
            - if <util.random.int[1].to[150]> <= <tern[<yaml[rates].read[drops.active]>]:<el@1.mul[<yaml[rates].read[drops.multiplier]>].mul[<player.flag[player_drop_rate]||1>]||<el@1.mul[<player.flag[player_drop_rate]||1>]>>||1>:
                - drop <yaml[droptables].read[consumable_drop_list].random[1]> location:<context.entity.location>
elite_consumable_drop:
    type: world
    debug: false
    events:
        on mm denizen death:
        - if !<context.entity.name.starts_with[<&d>]||null>:
            - stop
        - else if <proc[AntiFarm_Proc].context[<context.entity>]>:
            - stop
        - else if <context.entity.name.starts_with[<&d>]||null>:
            - if <util.random.int[1].to[50]> <= <tern[<yaml[rates].read[drops.active]>]:<el@1.mul[<yaml[rates].read[drops.multiplier]>].mul[<player.flag[player_drop_rate]||1>]||<el@1.mul[<player.flag[player_drop_rate]||1>]>>||1>:
                - drop <yaml[droptables].read[consumable_drop_list].random[1]> location:<context.entity.location>