"Arcblade YAML Handler":
    type: world
    debuge: false
    events:
        on server start:
        - yaml create id:arcblade
        on shutdown:
        - yaml unload id:arcblade

"Arcblade Chain":
    type: world
    debug: false
    events:
        on mm denizen mechanic:
        - if <context.skill> == "arcblade-task-runner"
        {
            - define L1 <context.target.location.find.entities.within[10].exclude[<c.caster>|<c.target>].get[1].to[5]>
            - if <def[L1].size> == 0 queue clear
            - define L1_dist <def[L1].last.location.distance[<c.target.location>]>
            - define L2 li@
            - foreach <def[L1]>
            {
                - define L2 <def[L2].include[<def[value].location.find.entities.within[10].exclude[<def[L1].include[<c.caster>|<c.target>]>].filter[location.distance[<c.target.location>].is[MORE].than[<def[L1_dist]>]]>]>
            }
            - define L2 <def[L2].deduplicate.get[1].to[6]>
            - foreach <def[L1]>
            {
                - define ent <def[value]>
                - playeffect <c.target.location.points_between[<def[ent].location>].distance[0.1]> effect:villager_happy offset:0,0,0
                - repeat 2
                {
                    - if <def[L2].size> == 0 queue clear
                    - define L2 <def[L2].sort_by_number[location.distance[<def[ent].location>]]>
                    - playeffect <def[ent].location.points_between[<def[L2].get[1].location>].distance[0.1]> effect:villager_happy offset:0,0,0
                    - define L2 <def[L2].remove[1]>
                }
            }
        }