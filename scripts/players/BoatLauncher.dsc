boatlauncher:
    type: world
    debug: true
    events:
        on player enters notable cuboid:
        - if <context.cuboids.contains_text[boatlauncher2]>:
            - wait 5t
            - define vehicle <player.vehicle>
            - define speed <player.vehicle.speed>
            - mount <player>|<def[vehicle]> cancel
            - adjust <def[vehicle]>|<player> velocity:<def[vehicle].location.direction.vector.mul[<def[speed]>].mul[1.5].add[0,2,0]>
            - wait 1s
            - mount <player>|boat