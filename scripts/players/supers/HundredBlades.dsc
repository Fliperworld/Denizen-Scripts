"Hundred Blades Cast":
    type: world
    debug: false
    events:
        on mm denizen mechanic:
        - if <context.skill> == "hundredblades-cast"
        {
            - define caster <context.caster>
            - define duration 20
            - define super-passive-spending 4
            - define super-max-energy 300
            - define wait 5
            - define duration-calculated <def[super-max-energy].div[<def[duration]>].sub[<def[super-passive-spending]>].div[20].mul[<def[wait]>]>
            - if <def[caster].as_player.has_flag[hundredblades-activated]>
            {
#                - narrate "Caster already had the flag" targets:<def[caster]>
                - queue clear
            }
            - flag <def[caster]> hundredblades-activated:1
            - while <yaml[super-counter].read[energy.<context.caster.uuid>].is[more].than[0]>
            {
                - yaml id:super-counter set energy.<context.caster.uuid>:<yaml[super-counter].read[energy.<context.caster.uuid>].sub[<def[duration-calculated]>]>
                - wait <def[wait]>t
            }
            - flag <def[caster]> hundredblades-activated:!
        }
        on player damages entity:
        - if <player.has_flag[hundredblades-activated]>
        {
            - flag <context.entity> hundredblades-multiplier:+:0.1 duration:30s
            - determine <context.damage.mul[<context.entity.flag[hundredblades-multiplier].add[1]>]>
        }