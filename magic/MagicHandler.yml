# Use with PAPI placeholders of the relevant magic type e.g. %denizen_<proc[Magic_Power_Handler].context[fire]>%
Magic_Power_Handler:
    type: procedure
    debug: false
    definitions: magic_type
    script:
    - define power <player.equipment.parse[nbt[<def[magic_type]>_magic_power]].sum.add[<player.flag[<def[magic_type]>_magic_power]||0>].add[100]>
    - define set_list <player.equipment.parse[nbt[armor_set]].deduplicated||li@>
    - foreach <def[set_list]>:
        - define power <def[power].add[<proc[<def[value]>_armor_set_bonuses].context[<player.equipment.parse[nbt[armor_set]].filter[matches[<def[value]>]].size>]>]>
    - determine <def[power]>

    ## Use this to get all of the magic powers for some reason
    ## Not sure what to do with it but I scripted it so I might as well keep it
    #- foreach <player.equipment>:
    #    - define equipment <def[value]>
    #    - foreach <def[equipment].nbt_keys.filter[matches[[a-zA-Z]+_magic_power]]>:
    #        - define power <def[equipment].nbt_keys.filter[matches[[a-zA-Z]+_magic_power]].get[<def[loop_index]>]>
    #        - define <def[power]> <def[power].add[<def[equipment].nbt[<def[power]>]>||0]>
    #    - define set_list <def[set_list].include[<def[value].nbt[armor_set]>]>
    #- foreach <def[set_list].deduplicated>:
    #    - define fire_magic_power <def[fire_magic_power].add[<proc[<def[value]>_armor_set_bonuses].context[<def[set_list].find_all[<def[value]>].size>]>

Spell_Loader:
    type: world
    debug: false
    events:
        on server start:
        - yaml load:../MagicSpells/spells-elemental.yml id:spells-elemental

#Spell_Power_Handler:
#    type: world
#    debug: true
#    events:
#        on magicspells player casts spell:
#        - if <yaml[spells-elemental].read[<context.spell>.spell-magic-type]||null> == null:
#            - queue clear
#        - else:
#            - determine power:<proc[Magic_Power_Handler].context[<yaml[spells-elemental].read[<context.spell>.spell-magic-type]>]||1>