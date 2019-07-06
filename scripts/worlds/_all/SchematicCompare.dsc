schematic_data:
    debug: false
    type: yaml data
    triggers:
        # Material names to check on block place
        # Each schematic entry for that material will be checked each time the trigger block is placed
        #- 'SCHEMATIC_NAME/IGNORE_AIR(Boolean)(/Creation Script(/Deletion Script))'
        dirt:
        - 'example_schematic/false'
        diamond_block:
        # Checks against schematic 'altar_example' and requires air blocks to match the schematic
        - 'altar_example/false/altar_created/altar_deleted'

altar_created:
    type: task
    speed: 0
    script:
    - narrate "Created!"

alter_deleted:
    type: task
    speed: 0
    script:
    - narrate "Deleted!"

# Handles creation and removal of notable cuboids when a player places a schematic listed in 'schematic_data'.

# Will save schematics in form "schematic_<LOCATION>_<SCHEMATIC NAME>"
# For example, "schematic_1,2,3,world_examplename"
schematic_check_evt:
    type: world
    debug: false
    events:
        # Checks for a trigger block, then checks for a matching schamatic, and notes if found
        on player places block:
        - if <s@schematic_data.list_keys[triggers].contains[<context.material.name>]> {
            - foreach <s@schematic_data.yaml_key[triggers.<context.material.name>]> {
                - if !<schematic[<def[value].before[/]>].exists> {
                    - queue clear
                }
                - run schematic_checker def:<context.location>|<def[value].before[/]>|<def[value].after[/]>
                - if <server.flag[schem_check]> {
                    - note <schematic[<def[value].before[/]>].cuboid[<context.location>]> as:schematic_<context.location.simple.replace[l@]>_<def[value].before[/]>
                }
                - flag server schem_check:!
                - if <def[value].split_by[/].size> >= 3 {
                    - run <def[value].split_by[/].get[3]>
                }
                - if <def[value].split_by[/].size> == 4 {
                    - flag server schem_deletion_scripts.schematic_<context.location.simple.replace[l@]>_<def[value].before[/]>:<def[value].after_last[/]>
                }
            }
        }
        on player breaks block in notable cuboid:
        - foreach <context.location.cuboids.filter[notable_name.starts_with[schematic_]]> {
            - note remove as:<def[value].notable_name>
            - if <server.has_flag[schem_deletion_scripts.<def[value].notable_name>]> {
                - run <server.flag[schem_deletion_scripts.<def[value].notable_name>]>
                - flag server schem_deletion_scripts.<def[value].notable_name>:!
            }
        }

# Checks if a schematic matches the placed blocks around a location
# USAGE SAMPLE:
# - run schematic_checker def:<LOCATION>|<SCHEMATIC>|<IGNORE_AIR(Boolean)>
# - if <server.flag[schem_check]> { ... }
# - flag server schem_check:!
schematic_checker:
    type: procedure
    debug: true
    definitions: location|schematic|ignore_air
    speed: 0
    script:
    - define cuboid <schematic[<def[schematic]>].cuboid[<def[location]>]>
    - define adjusted_location <def[location].sub[<schematic[<def[schematic]>].origin>]>
    - inject locally <tern[<def[ignore_air]>]:ignore_air||with_air>
    - flag server schem_check:true
    with_air:
    - foreach <def[cuboid].blocks>:
        - define schem_mat <schematic[<def[schematic]>].block[<def[value].sub[<def[adjusted_location]>]>].name>
        - if <def[schem_mat]> != air && <def[schem_mat]> != <def[value].material.name> {
            - flag server schem_check:false
        }
    ignore_air:
    - foreach <def[cuboid].blocks>:
        - define schem_mat <schematic[<def[schematic]>].block[<def[value].sub[<def[adjusted_location]>]>].name>
        - if <def[schem_mat]> != <def[value].material.name> {
            - flag server schem_check:false
        }
