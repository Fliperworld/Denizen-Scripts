WaveShooter:
    type: task
    definitions: caster
    speed: 0
    script:
    - if <[caster]||null> == null:
        - define caster <player>
    - define source <def[caster].location.with_pitch[0]>
    - define forward <def[source].direction.vector>
    - define offset <def[forward].rotate_around_y[<util.pi.div[2]>].div[2]>
    - define source_position <def[caster].location>
    - define wave_width 5
    - define wave_total <def[wave_width].mul[2]>
    - define origin_list li@
    - define speed 0.5
    - define wave_landing 5
    - define wave_length 30
    # origin repeat
    - repeat <def[wave_total]>:
        - define total_offset <def[offset].mul[<def[value].sub[0.5]>]>
        - define origin_list <def[origin_list].include[<def[source].add[<def[total_offset]>]>]>
        - define origin_list <def[origin_list].include[<def[source].sub[<def[total_offset]>]>]>
    # shooting repeat
    - repeat <def[wave_length].div[<[speed]>]>:
        - define entities li@
        - define total_forward <def[forward].mul[<def[value]>].mul[<def[speed]>]>
#        - define total_landing <def[forward].mul[<def[value]>].mul[<def[speed]>].mul[<def[wave_landing]>]>
        - foreach <def[origin_list]> as:locations:
#            - shoot falling_block,concrete,11[fallingblock_drop_item=false] origin:<def[value].add[<def[total_forward]>]> destination:<[value].add[<[total_landing]>]> save:Wave
            - shoot falling_block,concrete,11[fallingblock_drop_item=false] origin:<def[locations].add[<def[total_forward]>]> save:Wave
            - foreach <entry[Wave].shot_entities> as:shot_blocks:
                - yaml id:WaveManager set <def[shot_blocks].uuid>:RemoveOnLand
            - if <[locations].find.living_entities.within[1.0].exclude[<[caster]>].deduplicate.size> > 0:
                - define entities <[entities].include.[<[locations].find.living_entities.within[1.0]>].exclude[<[caster]>].deduplicate>
            - if <[entities].size> > 0:
                - foreach <[entities]> as:HitEntity:
                    - shoot <[HitEntity]> origin:<[HitEntity].location> destination:<[HitEntity].location.add[0,10,0]>
        - wait 1t
WaveFlagManager:
    type: world
    events:
        on server start:
        - yaml create id:WaveManager
RemoveWater:
    type: world
    events:
        on falling_block changes block:
        - if <yaml[WaveManager].read[<context.entity.uuid>]> == RemoveOnLand:
            - determine cancelled
        #- narrate "context.entity.uuid is <context.entity.uuid>" targets:<server.match_player[Wahrheit]>
        #- narrate "context.old_material is <context.old_material>" targets:<server.match_player[Wahrheit]>
        #- narrate "context.new_material is <context.new_material>" targets:<server.match_player[Wahrheit]>
