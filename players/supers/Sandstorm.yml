"Sandstorm Cast":
    type: world
    debug: false
    events:
        on mm denizen mechanic:
        - if <context.skill> == "sandstorm-cast"
        {
            - define caster <context.caster>
            - define location <context.caster.location>
            - define duration 20
            - define super-passive-spending 4
            - define super-max-energy 300
            - define wait 1
            - define duration-calculated <def[super-max-energy].div[<def[duration]>].sub[<def[super-passive-spending]>].div[20].mul[<def[wait]>]>
            - if <def[caster].as_player.has_flag[sandstorm-activated]>
            {
#               - narrate "Caster already had the flag" targets:<def[caster]>
                - queue clear
            }
            - flag <def[caster]> sandstorm-activated:1
            - define radius 10
            - define angle-inc 10
            - define radians <def[angle-inc].to_radians>
            - define edge1 l@<def[radius]>,0,0
            - define point-number 20
            - define amplitude 2
            - while <yaml[super-counter].read[energy.<context.caster.uuid>].is[more].than[0]>
            {
                - yaml id:super-counter set energy.<context.caster.uuid>:<yaml[super-counter].read[energy.<context.caster.uuid>].sub[<def[duration-calculated]>]>
                - cast effect:slow duration:5 power:4 <def[location].find.entities.within[10].exclude[<def[caster]>]>
                # Rotates the main brace by the step angle
                - define edge1 <def[edge1].rotate_around_y[<def[radians]>]>
                # Defines the second brace on a 90 degree angle
                - define edge2 <def[edge1].rotate_around_y[<util.pi.div[2]>]>
                # Defines the perpendicular scale
                - define scale <def[amplitude].div[<def[radius]>]>
                # Defines the perpendicular to the first brace as the second brace scaled
                - define perp1 <def[edge2].mul[<def[scale]>]>
                # Defines the perpendicular to the second brace as the first brace scaled
                - define perp2 <def[edge1].mul[<def[scale]>]>
                # Defines the start and end points of the first brace
                - define edge1-plus <def[location].add[<def[edge1]>]>
                - define edge1-minus <def[location].sub[<def[edge1]>]>
                - define list li@
                - foreach <def[edge1-minus].points_between[<def[edge1-plus]>].distance[<def[radius].div[<def[point-number]>]>]>
                {
                    - define offset <def[loop_index].mul[<util.pi>].div[<def[point-number]>].sin>
                    - define sin-angle <def[loop_index].mul[<def[radius]>].sin>
                    - define list <def[list].include[<def[value].add[<def[perp1].mul[<def[offset]>]>]>]>
                }
                # Defines the start and end points of the second brace
                - define edge2-plus <def[location].add[<def[edge2]>]>
                - define edge2-minus <def[location].sub[<def[edge2]>]>
                - foreach <def[edge2-minus].points_between[<def[edge2-plus]>].distance[<def[radius].div[<def[point-number]>]>]>
                {
                    - define offset <def[loop_index].mul[<util.pi>].div[<def[point-number]>].sin.mul[-1]>
                    - define sin-angle <def[loop_index].mul[<def[radius]>].sin>
                    - define list <def[list].include[<def[value].add[<def[perp2].mul[<def[offset]>]>]>]>
                }
                - playeffect <def[list]> effect:crit quantity:12 offset:2,1,2 visibility:100
                - foreach <def[location].find.entities.within[10].exclude[<def[caster]>]>
                {
                    - adjust <def[value]> velocity:<def[value].location.face[<def[location]>].direction.vector.div[8]>
                }
                - wait 1t
            }
            - flag <def[caster]> sandstorm-activated:!
        }
