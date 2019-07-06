"Impact Cast":
    type: world
    debug: false
    events:
        on mm denizen mechanic:
        - if <context.skill> == "impact-cast"
        {
            - define caster <context.caster>
#            - narrate "Impact cast" targets:<def[caster]>
            - if <def[caster].as_player.has_flag[impact-activated]>
            {
#                - narrate "Caster already had the flag" targets:<def[caster]>
                - queue clear
            }
#            - define cost 125
#            - yaml id:super-counter set energy.<context.caster.uuid>:<yaml[super-counter].read[energy.<context.caster.uuid>].sub[<def[cost]>]>
            - adjust <def[caster]> gravity:false
            - adjust <def[caster]> velocity:0,0.5,0
            - flag <def[caster]> impact-activated:1
            - wait 8s
#            - narrate "Wait finished" targets:<def[caster]>
#            - narrate "<def[caster].as_player.has_flag[impact-activated]>" targets:<def[caster]>
#            - narrate "<def[caster]>" targets:<def[caster]>
            - if <def[caster].as_player.has_flag[impact-activated]>
            {
#                - narrate "Caster has flag, adjusting values" targets:<def[caster]>
                - flag <def[caster]> impact-activated:!
                - adjust <def[caster]> gravity:true
            }
        }
"Impact Swing":
    type: world
    debug: false
    events:
        on mm denizen mechanic:
        - if <context.skill> == "impact-swing"
        {
            - define caster <context.caster>
#            - define cost 200
            - if <def[caster].as_player.has_flag[impact-activated]>
            {
#                - yaml id:super-counter set energy.<context.caster.uuid>:<yaml[super-counter].read[energy.<context.caster.uuid>].sub[<def[cost]>]>
                - adjust <def[caster]> gravity:true
                - adjust <def[caster]> velocity:<def[caster].location.with_pose[<def[caster].location.pitch.abs>,<def[caster].location.yaw>].direction.vector.mul[5]>
                - while <def[caster].location.sub[0,1,0].material.name> == air
                {
                    - wait 5t
                }
                - adjust <def[caster]> velocity:0,0,0
                - define mobs <def[caster].location.find.entities.within[15].exclude[<def[caster].location.find.entities[player].within[15]>]>
                - define players <def[caster].location.find.entities[player].within[15]>
                - define particle-count 0
                - repeat 160
                {
                    - playeffect <context.target.location> effect:CLOUD visibility:500 quantity:10 data:1 offset:<def[particle-count].div[20]>,0.1,<def[particle-count].div[20]>
                    - define particle-count <def[particle-count].add[1]>
                }
                - playsound <def[caster]> sound:ENTITY_GENERIC_EXPLODE
                - flag <def[caster]> impact-activated:!
                - hurt 40 <def[mobs]> source:<def[caster]>
                - hurt 15 <def[players]> source:<def[caster]>
            }
        }