

fire_mage_drop:
    type: world
    debug: false
    events:
        on mm denizen death:
        - if !<context.entity.name.starts_with[<&d>]||null>:
            - stop
        - else if <proc[AntiFarm_Proc].context[<context.entity>]>:
            - stop
        - else if "<context.entity.name.starts_with[<&d>Cultist Fire Mage]||null>":
            - if <util.random.int[1].to[300]> <= <tern[<yaml[rates].read[drops.active]>]:<el@1.mul[<yaml[rates].read[drops.multiplier]>].mul[<player.flag[player_drop_rate]||1>]||<el@1.mul[<player.flag[player_drop_rate]||1>]>>||1>:
                - drop <yaml[droptables].read[fire_mage_weapon_drop_list].random[1]> location:<context.entity.location>
            - else if <util.random.int[1].to[200]> <= <tern[<yaml[rates].read[drops.active]>]:<el@1.mul[<yaml[rates].read[drops.multiplier]>].mul[<player.flag[player_drop_rate]||1>]||<el@1.mul[<player.flag[player_drop_rate]||1>]>>||1>:
                - drop <yaml[droptables].read[fire_mage_armor_drop_list_sealed_potential].random[1]> location:<context.entity.location>
            - else if <util.random.int[1].to[100]> <= <tern[<yaml[rates].read[drops.active]>]:<el@1.mul[<yaml[rates].read[drops.multiplier]>].mul[<player.flag[player_drop_rate]||1>]||<el@1.mul[<player.flag[player_drop_rate]||1>]>>||1>:
                - drop <yaml[droptables].read[fire_mage_armor_drop_list].random[1]> location:<context.entity.location>