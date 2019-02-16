experience_rate_handler:
    type: world
    debug: false
    events:
        on player changes xp:
        - if <context.amount> > 0:
            - define exp_rate 1
            - if <s@experience_rate_data.yaml_key[experience_multiplier_active]>:
                - define exp_rate <s@experience_rate_data.yaml_key[experience_rate_multiplier]>
            - if <player.has_flag[player_experience_rate]>:
                - define exp_rate <def[exp_rate].mul[<player.flag[player_experience_rate]>]>
            - determine <context.amount.mul[<def[exp_rate]>]>