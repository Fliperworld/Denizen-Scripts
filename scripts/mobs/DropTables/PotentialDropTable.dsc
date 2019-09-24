
veteran_potential_drop:
    type: world
    debug: false
    events:
        on mm denizen death:
        - if !<context.entity.name.starts_with[<&9>]||null>:
            - stop
        - else if <proc[AntiFarm_Proc].context[<context.entity>]>:
            - stop
        - else if <context.entity.name.starts_with[<&9>]||null>:
            - if <util.random.int[1].to[400]> <= <tern[<yaml[rates].read[drops.active]>]:<el@1.mul[<yaml[rates].read[drops.multiplier]>].mul[<player.flag[player_drop_rate]||1>]||<el@1.mul[<player.flag[player_drop_rate]||1>]>>||1>:
                - drop <yaml[droptables].read[veteran_potential_drop_list].random[1]> location:<context.entity.location>
            - if <util.random.int[1].to[45]> <= <tern[<yaml[rates].read[drops.active]>]:<el@1.mul[<yaml[rates].read[drops.multiplier]>].mul[<player.flag[player_drop_rate]||1>]||<el@1.mul[<player.flag[player_drop_rate]||1>]>>||1>:
                - drop SocketMaker location:<context.entity.location>

elite_potential_drop:
    type: world
    debug: false
    events:
        on mm denizen death:
        - if !<context.entity.name.starts_with[<&d>]||null>:
            - stop
        - else if <proc[AntiFarm_Proc].context[<context.entity>]>:
            - stop
        - else if <context.entity.name.starts_with[<&d>]||null>:
            - if <util.random.int[1].to[200]> <= <tern[<yaml[rates].read[drops.active]>]:<el@1.mul[<yaml[rates].read[drops.multiplier]>].mul[<player.flag[player_drop_rate]||1>]||<el@1.mul[<player.flag[player_drop_rate]||1>]>>||1>:
                - drop <yaml[droptables].read[veteran_potential_drop_list].random[1]> location:<context.entity.location>
            - if <util.random.int[1].to[400]> <= <tern[<yaml[rates].read[drops.active]>]:<el@1.mul[<yaml[rates].read[drops.multiplier]>].mul[<player.flag[player_drop_rate]||1>]||<el@1.mul[<player.flag[player_drop_rate]||1>]>>||1>:
                - drop <yaml[droptables].read[elite_potential_drop_list].random[1]> location:<context.entity.location>
            - if <util.random.int[1].to[15]> <= <tern[<yaml[rates].read[drops.active]>]:<el@1.mul[<yaml[rates].read[drops.multiplier]>].mul[<player.flag[player_drop_rate]||1>]||<el@1.mul[<player.flag[player_drop_rate]||1>]>>||1>:
                - drop SocketMaker location:<context.entity.location>
            - if <util.random.int[1].to[100]> <= <tern[<yaml[rates].read[drops.active]>]:<el@1.mul[<yaml[rates].read[drops.multiplier]>].mul[<player.flag[player_drop_rate]||1>]||<el@1.mul[<player.flag[player_drop_rate]||1>]>>||1>:
                - drop <yaml[droptables].read[gem_drop_list].random[1]> location:<context.entity.location>
