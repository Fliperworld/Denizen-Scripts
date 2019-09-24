
veteran_bones_drop:
    type: world
    debug: false
    events:
        on mm denizen death:
        - if !<context.entity.name.starts_with[<&9>]||null>:
            - stop
        - else if <proc[AntiFarm_Proc].context[<context.entity>]>:
            - stop
        - else if <context.entity.name.starts_with[<&9>]||null>:
            - drop VeteranToken location:<context.entity.location>
            - if <util.random.int[1].to[4]> <= 1:
                - drop VeteranToken quantity:<util.random.int[1].to[2]> location:<context.entity.location>

elite_bones_drop:
    type: world
    debug: false
    events:
        on mm denizen death:
        - if !<context.entity.name.starts_with[<&d>]||null>:
            - stop
        - else if <proc[AntiFarm_Proc].context[<context.entity>]>:
            - stop
        - else if <context.entity.name.starts_with[<&d>]||null>:
            - drop VeteranToken quantity:6 location:<context.entity.location>
            - if <util.random.int[1].to[4]> <= 1:
                - drop VeteranToken quantity:<util.random.int[1].to[6]> location:<context.entity.location>