"Frozen Wave Cast":
    type: world
    debug: false
    events:
        on mm denizen mechanic:
        - if <context.skill> == "frozenwave-cast"
        {
            - define caster <context.caster>
            - define location <context.caster.location>

            
            - if <def[caster].as_player.has_flag[frozenwave-activated]>
            {
#                - narrate "Caster already had the flag" targets:<def[caster]>
                - queue clear
            }
            - flag <def[caster]> frozenwave-activated:1
            - define radius 8
            - define angle 75
            - define radians <def[angle].to_radians>
            - define edge l@<def[radius]>,0,0
            - define point-number 20

            - define edge <def[edge].rotate_around_y[<def[radians]>]>
            - define perp <def[edge].rotate_around_y[<util.pi.div[4]>].div[<def[radius]>]>
            - define edge-plus <def[location].add[<def[edge]>]>
            - define edge-minus <def[location].sub[<def[edge]>]>
            - define list li@
            - define list-radius <def[location].find.entities.within[8].exclude[<def[caster]>]>
            - foreach <def[list-radius]>
            {
                - if <def[location].facing[<def[value].location>].degrees[<def[angle]>]>
                {
                    - define list <def[list].include[<def[value]>]>
                }
            }
            - foreach <def[edge-minus].points_between[<def[edge-plus]>].distance[<def[radius].div[<def[point-number]>]>]>
            {
                - define offset <def[loop_index].mul[<util.pi>].div[<def[point-number]>].sin>
                - define sin-angle <def[loop_index].mul[<def[radius]>].sin>
                - define list <def[list].include[<def[value].add[<def[perp].mul[<def[offset]>]>]>]>
            }
            - playeffect <def[list]> effect:blockcrack_12 quantity:12 offset:2,1,2 visibility:100
            - foreach <def[location].find.entities.within[10].exclude[<def[caster]>]>
            {
                - adjust <def[value]> velocity:<def[value].location.face[<def[location]>].direction.vector.div[8]>
            }
            - cast slow duration:5 power:4 <def[location].find.entities.within[10].exclude[<def[caster]>]>
            - flag <def[caster]> frozenwave-activated:!
        }

# Get point on edge of circle
# Define list of points between center and edge
