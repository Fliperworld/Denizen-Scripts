BurningSpeed_Power_Handler:
    type: world
    debug: false
    events:
        on magicspells player casts spell:
        - if <context.spell_name> != burningspeed:
            - queue clear
        - else:
            - define fire_power <proc[Magic_Power_Handler].context[fire]>
            - determine power:<def[fire_power].div[100]>