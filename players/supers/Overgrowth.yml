"Overgrowth Cast":
    type: world
    debug: false
    events:
        on mm denizen mechanic:
        - if <context.skill> == "overgrowth-cast"
        {
            - define caster <context.caster>
            - define duration 20
            - define super-passive-spending 4
            - define super-max-energy 300
            - define wait 5
            - define duration-calculated <def[super-max-energy].div[<def[duration]>].sub[<def[super-passive-spending]>].div[20].mul[<def[wait]>]>
            - if <def[caster].as_player.has_flag[overgrowth-activated]>
            {
#                - narrate "Caster already had the flag" targets:<def[caster]>
                - queue clear
            }
            - flag <def[caster]> max-health:<player.health.max>
            - flag <def[caster]> overgrowth-activated:1
            - adjust <def[caster]> max_health:<player.health.max.add[20]>
            - adjust <def[caster]> health:<player.health.add[20]>
            - while <yaml[super-counter].read[energy.<context.caster.uuid>].is[more].than[0]>
            {
                - yaml id:super-counter set energy.<context.caster.uuid>:<yaml[super-counter].read[energy.<context.caster.uuid>].sub[<def[duration-calculated]>]>
                - wait <def[duration]>t
            }
            - adjust <def[caster]> max_health:<def[caster].flag[max-health]>
            - if <def[caster].health> > <def[caster].flag[max-health]>
            {
                - adjust <def[caster]> health:<def[caster].flag[max-health]>
            }
            - flag <def[caster]> max-health:!
            - flag <def[caster]> overgrowth-activated:!
        }