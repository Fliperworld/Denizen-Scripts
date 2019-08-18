"Heavens Portal Creation":
    type: world
    debug: false
    events:
        on player right clicks quartz_block with flint_and_steel in prosperus:
        - if <context.location.add[0,1,0].material.name> != air:
            - queue clear
        - if <context.location.add[1,0,0].material.name> == quartz_block && <context.location.add[-1,0,0].material.name> == quartz_block:
            - define axis-pos l@1,0,0
            - define axis-neg l@-1,0,0
            - define axis-data 1
        - else if <context.location.add[0,0,1].material.name> == quartz_block && <context.location.add[0,0,-1].material.name> == quartz_block:
            - define axis-pos l@0,0,1
            - define axis-neg l@0,0,-1
            - define axis-data 2
        - else
            - queue clear
        - define origin <context.location.add[0,1,0]>
        - define node <def[origin]>
        - define air-list li@
        - define y-list li@
        - define y-max <def[origin].y>
        - define y-min <def[origin].y>
        - define x-max <def[origin].x>
        - define x-min <def[origin].x>
        - define z-max <def[origin].z>
        - define z-min <def[origin].z>
        - while <def[node].material.name.is[==].to[air]>:
            - define air-list <def[air-list].include[<def[node]>]>
            - define y-list <def[y-list].include[<def[node]>]>
            - define y-max <def[y-max].max[<def[node].y>]>
            - define y-min <def[y-min].min[<def[node].y>]>
            - define node <def[node].add[0,1,0]>
        - if <def[node].material.name> != quartz_block:
            - queue clear
        - else:
            - foreach <def[y-list]>:
                - define node <def[value]>
                - while <def[node].material.name.is[==].to[air]>:
                    - define air-list <def[air-list].include[<def[node]>]>
                    - if <def[axis-data]> == 1:
                        - define x-max <def[x-max].max[<def[node].x>]>
                        - define x-min <def[x-min].min[<def[node].x>]>
                    - if <def[axis-data]> == 2:
                        - define z-max <def[z-max].max[<def[node].z>]>
                        - define z-min <def[z-min].min[<def[node].z>]>
                    - define node <def[node].add[<def[axis-pos]>]>
                - if <def[node].material.name> != quartz_block:
                    - queue clear
                - define node <def[value]>
                - while <def[node].material.name.is[==].to[air]>:
                    - define air-list <def[air-list].include[<def[node]>]>
                    - if <def[axis-data]> == 1:
                        - define x-max <def[x-max].max[<def[node].x>]>
                        - define x-min <def[x-min].min[<def[node].x>]>
                    - if <def[axis-data]> == 2:
                        - define z-max <def[z-max].max[<def[node].z>]>
                        - define z-min <def[z-min].min[<def[node].z>]>
                    - define node <def[node].add[<def[axis-neg]>]>
                - if <def[node].material.name> != quartz_block:
                    - queue clear
        - modifyblock <def[air-list]> m@end_gateway,<def[axis-data]> no_physics
#        - announce to_console "cu@<def[x-min].add[<def[axis-neg].x>]>,<def[y-min].add[-1]>,<def[z-min].add[<def[axis-neg].z>]>,prosperus|<def[x-max].add[<def[axis-pos].x>]>,<def[y-max].add[1]>,<def[z-max].add[<def[axis-pos].z>]>,prosperus as:heavens-portal-<util.random.duuid>"
        - note cu@<def[x-min].add[<def[axis-neg].x>]>,<def[y-min].add[-1]>,<def[z-min].add[<def[axis-neg].z>]>,prosperus|<def[x-max].add[<def[axis-pos].x>]>,<def[y-max].add[1]>,<def[z-max].add[<def[axis-pos].z>]>,prosperus as:heavens-portal-<util.random.duuid>
"Heavens Portal Removal":
    type: world
    debug: false
    events:
        on player breaks end_gateway:
        - if <context.location.cuboids.contains_text[heavens-portal]>:
            - define notable <context.location.cuboids.filter[notable_name.starts_with[heavens-portal]].get[1]>
            - modifyblock <def[notable].blocks[end_gateway]> m@air
            - note remove as:<def[notable].notable_name>
        on player breaks quartz_block:
        - if <context.location.cuboids.contains_text[heavens-portal]>:
            - define notable <context.location.cuboids.filter[notable_name.starts_with[heavens-portal]].get[1]>
            - modifyblock <def[notable].blocks[end_gateway]> m@air
            - flag server <context.cuboids.filter[notable_name.starts_with[heavens-portal]].get[1].notable_name>:!
            - note remove as:<def[notable].notable_name>
"Heavens Portal Entry":
    type: world
    debug: false
    events:
        on player enters notable cuboid:
        - if <context.cuboids.contains_text[heavens-portal]>:
            - define target-location l@<context.from.x.div[2].as_int>,<context.from.y.as_int>,<context.from.z.div[2].as_int>,heavens
#            - announce to_console "def target-location: <def[target-location]>"
            - define target-material <def[target-location].material.name>
#            - announce to_console "def target-material: <def[target-material]>"
            - define portal <context.cuboids.filter[notable_name.starts_with[heavens-portal]].get[1]>
#            - announce to_console "def portal: <def[portal]>"
            - define portal-exit <context.cuboids.filter[notable_name.starts_with[heavens-portal]].get[1].notable_name>
#            - announce to_console "def portal-exit: <def[portal-exit]>"
            - define portal-unsafe-exit <def[portal-exit]>-unsafe
#            - announce to_console "def portal-unsafe-exit: <def[portal-unsafe-exit]>"
#            - wait 1t
            - if <server.has_flag[<def[portal-exit]>]>:
                - wait 1t
                - teleport <server.flag[<def[portal-exit]>]>
                - queue clear
            - if <server.has_flag[<def[portal-unsafe-exit]>]>:
                - wait 1t
                - teleport <server.flag[<def[portal-unsafe-exit]>]>
#                - announce to_console "teleport <server.flag[<def[portal-unsafe-exit]>]>"
                - adjust <player> gliding:true
                - queue clear
            - if <def[target-material]> == air && <def[target-location].add[0,-1,0].material.name> != air && <def[target-location].add[0,1,0].material.name> == air:
                - announce to_console "Initial block is safe"
                - define teleport-location l@<context.from.x.div[2]>,<context.from.y>,<context.from.z.div[2]>,heavens
                - wait 1t
                - teleport <def[teleport-location]>
 #               - announce to_console "teleport <def[teleport-location]>"
                - flag server <def[portal-exit]>:<def[teleport-location]>
                - queue clear
            - define size 10
            - if <def[target-location].find.surface_blocks.within[<def[size]>].size> >= 1:
                - announce to_console "Finding safe spot"
                - define safe-spot <def[target-location].find.surface_blocks.within[<def[size]>].random>
                - announce to_console "Safe spot: <def[safe-spot]>"
                - wait 1t
                - teleport <def[safe-spot]>
#                - announce to_console "teleport <def[safe-spot]>"
                - flag server <def[portal-exit]>:<def[safe-spot]>
                - queue clear
            - else:
                - announce to_console "No safe spot, let's glide!"
                - flag server <def[portal-unsafe-exit]>:l@<context.from.x.div[2]>,256,<context.from.z.div[2]>,heavens
                - define teleport-location l@<context.from.x.div[2]>,256,<context.from.z.div[2]>,heavens
                - wait 1t
                - teleport <def[teleport-location]>
#                - announce to_console "teleport <def[teleport-location]>"
                - adjust <player> gliding:true
                - queue clear
#            - determine cancelled
        on player stops gliding in heavens:
        - if <player.has_flag[player-gliding-chestplate]>:
            - equip <player> chest:<player.flag[player-gliding-chestplate]>
            - flag <player> player-gliding-chestplate:!
#"Portal Gliding Handler":
#    type: world
#    debug: false
#    events:
#        on player stops gliding in heavens:
#        - if <player.has_flag[portal-exiter]>:
##            - flag <player> portal-exiter:!
#            - determine cancelled
##        - determine cancelled
#        on player starts gliding in heavens:
#        - if <player.has_flag[portal-exiter]>:
##            - flag <player> portal-exiter:!
#            - determine cancelled:false
    