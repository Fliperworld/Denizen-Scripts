TributeAssignment:
    type: assignment
    debug: false
    interact scripts:
    - 10 TributeNPC
    actions:
        on assignment:
        - teleport npc <npc.anchor[tributenpc]>
        - trigger name:proximity toggle:true
        - trigger name:chat toggle:true

tribute_npc_format:
    type: format
    debug: false
    format: "<&2>Oracle of the Gods<&f><&co> <text>"

"TributeNPC":
    type: interact
    debug: false
    steps:
        General*:
            proximity trigger:
                entry:
                    script:
                    - narrate format:tribute_npc_format "Greetings, <player.name>."
                    - wait 0.7s
                    - if <yaml[events].read[tribute.active]>:
                        - if <player.inventory.contains[GodsTribute]>:
                            - narrate format:tribute_npc_format "I see you have some Tribute to the Gods. Would you like to offer it?"
                            - zap Blessing
                        - else:
                            - narrate format:tribute_npc_format "I seek offerings of Tribute to the Gods."
                            - wait 0.7s
                            - narrate format:tribute_npc_format "Go forth and adventure. Bring me any that you find."
                exit:
                    script:
                    - narrate format:tribute_npc_format "May the Gods bless your travels."
        Blessing:
            click trigger:
                script:
                - narrate format:tribute_npc_format "Wonderful. Which blessing do you pray for?"
                - wait 1s
                - inventory open d:in@Tribute_Inventory
                - zap General
            proximity trigger:
                exit:
                    script:
                    - narrate format:tribute_npc_format "May the Gods bless your travels."
                    - zap General
        Offer:
            chat trigger:
                'Tribute':
                    trigger: I'd like to offer /REGEX:\d+/ Tribute.
                    script:
                    - define offering_amount <context.message.replace[regex:\D+]>
                    - if <player.inventory.contains[GodsTribute].quantity[<context.message.replace[regex:\D+]>]>:
                        - define choice <player.flag[blessing_selection]>
                        - define progress <yaml[events].read[tribute.<player.flag[blessing_selection]>.progress]>
                        - define rate <yaml[events].read[tribute.<def[choice]>.rate]>
                        - define upgrade_amount <yaml[events].read[tribute.<def[choice]>.upgrades.<def[rate]>]>
                        - if <def[rate]> == 3 && <def[progress].add[<def[offering_amount]>]> > <def[upgrade_amount]>:
                                - take GodsTribute quantity:<def[offering_amount].sub[<def[offering_amount].add[<def[progress]>].sub[<def[upgrade_amount]>]>]>
                                - define offering_amount <def[offering_amount].sub[<def[offering_amount].add[<def[progress]>].sub[<def[upgrade_amount]>]>]>
                        - else:
                            - take GodsTribute quantity:<def[offering_amount]> from:<player.inventory>
                        - yaml id:events set tribute.<def[choice]>.progress:<def[progress].add[<def[offering_amount]>]>
                        - define progress <def[progress].add[<def[offering_amount]>]>
                        - narrate format:tribute_npc_format "The Gods thank you for your offering."
                        - if <def[progress]> >= <def[upgrade_amount]>:
                            - yaml id:events set tribute.<def[choice]>.progress:<def[progress].sub[<def[upgrade_amount]>]>
                            - yaml id:events set tribute.<def[choice]>.rate:++
                            - if <def[choice]> == mcmmo:
                                - yaml id:events set tribute.mcmmo.rate:<def[rate].add[1]>
                                - execute as_server "xprate <def[rate].add[1]> true"
                                - narrate format:tribute_npc_format "The Gods smile on us! Your offering brings the Blessing of Skillfulness to us all!"
                                - announce "<&c>The Gods speak<&f>: The Gods smile upon Prosperus. Thanks to the offerings by <player.name>, we offer a Blessing of Skillfulness."
                                - discord id:sxr message channel:191040977652285450 "**Blessings upon us all, <&at>here! <player.name> has brought the favor of the Gods to Prosperus. They bestow a Blessing of Skillfulness!**"
                            - else if <def[choice]> == drops:
                                - yaml id:events set tribute.drops.rate:<def[rate].add[1]>
                                - yaml id:rates set drops.multiplier:<def[rate].add[1]>
                                - yaml id:rates savefile:scriptdata/Rates.yml
                                - narrate format:tribute_npc_format "The Gods smile on us! Your offering brings the Blessing of Luck to us all!"
                                - announce "<&c>The Gods speak<&f>: The Gods smile upon Prosperus. Thanks to the offerings by <player.name>, we offer a Blessing of Luck."
                                - discord id:sxr message channel:191040977652285450 "**Blessings upon us all, <&at>here! <player.name> has brought the favor of the Gods to Prosperus. They bestow a Blessing of Luck!**"
                            - else if <def[choice]> == experience:
                                - yaml id:events set tribute.experience.rate:<def[rate].add[1]>
                                - yaml id:rates set experience.multiplier:<def[rate].add[1]>
                                - yaml id:rates savefile:scriptdata/Rates.yml
                                - narrate format:tribute_npc_format "The Gods smile on us! Your offering brings the Blessing of Wisdom to us all!"
                                - announce "<&c>The Gods speak<&f>: The Gods smile upon Prosperus. Thanks to the offerings by <player.name>, we offer a Blessing of Wisdom."
                                - discord id:sxr message channel:191040977652285450 "**Blessings upon us all, <&at>here! <player.name> has brought the favor of the Gods to Prosperus. They bestow a Blessing of Wisdom!**"
                        - yaml id:events savefile:scriptdata/Events.yml
                        - flag player blessing_selection:!
                        - zap General
                    - else:
                        - narrate format:tribute_npc_format "You don't seem to have that much Tribute. Did you misspeak?"
            proximity trigger:
                exit:
                    script:
                    - narrate format:tribute_npc_format "May the Gods bless your travels."
                    - zap General

Tribute_Inventory:
    type: inventory
    debug: false
    title: Blessings
    size: 45
    slots:
    - "[] [] [] [] [] [] [] [] []"
    - "[] [] [] [] [] [] [] [] []"
    - "[] [] [i@Tribute_mcMMO] [] [i@Tribute_DropRate] [] [i@Tribute_Experience] [] []"
    - "[] [] [] [] [] [] [] [] []"
    - "[] [] [] [] [] [] [] [] []"


Tribute_Inventory_Handler:
    type: world
    debug: false
    events:
        on player clicks Tribute_mcMMO in Tribute_Inventory:
        - inventory close
        - if <yaml[events].read[tribute.<player.flag[blessing_selection]||null>.rate]||null> == 4:
            - narrate format:tribute_npc_format "The Gods are already offering as much of this blessing as they deem this world worthy of."
            - wait 0.7s
            - narrate format:tribute_npc_format "Would you like to pray for a different blessing?"
            - zap s@TributeNPC Blessing
            - queue clear
        - else:
            - flag player blessing_selection:mcmmo
            - narrate format:tribute_npc_format "Ah, you pray for the Blessing of Skillfulness."
            - wait 0.7s
            - narrate format:tribute_npc_format "How much Tribute would you like to offer?"
            - zap s@TributeNPC Offer

        on player clicks Tribute_DropRate in Tribute_Inventory:
        - inventory close
        - if <yaml[events].read[tribute.<player.flag[blessing_selection]||null>.rate]||null> == 4:
            - narrate format:tribute_npc_format "The Gods are already offering as much of this blessing as they deem this world worthy of."
            - wait 0.7s
            - narrate format:tribute_npc_format "Would you like to pray for a different blessing?"
            - zap s@TributeNPC Blessing
            - queue clear
        - else:
            - flag player blessing_selection:drops
            - narrate format:tribute_npc_format "Ah, you pray for the Blessing of Luck."
            - wait 0.7s
            - narrate format:tribute_npc_format "How much Tribute would you like to offer?"
            - zap s@TributeNPC Offer

        on player clicks Tribute_Experience in Tribute_Inventory:
        - inventory close
        - if <yaml[events].read[tribute.<player.flag[blessing_selection]||null>.rate]||null> == 4:
            - narrate format:tribute_npc_format "The Gods are already offering as much of this blessing as they deem this world worthy of."
            - wait 0.7s
            - narrate format:tribute_npc_format "Would you like to pray for a different blessing?"
            - zap s@TributeNPC Blessing
            - queue clear
        - else:
            - flag player blessing_selection:experience
            - narrate format:tribute_npc_format "Ah, you pray for the Blessing of Wisdom."
            - wait 0.7s
            - narrate format:tribute_npc_format "How much Tribute would you like to offer?"
            - zap s@TributeNPC Offer

        on player drags in Tribute_Inventory:
        - determine cancelled

Tribute_Cap_Procedure:
    type: procedure
    definitions: upgrade_type
    script:
    - if <yaml[events].read[tribute.<[upgrade_type]>.rate]> == <yaml[events].read[tribute.<[upgrade_type]>.cap]>:
        - determine "<&a>Maximum blessing achieved!"
    - else:
        - determine "<&a>Progress to upgrade: <yaml[events].read[tribute.<[upgrade_type]>.progress]> / <yaml[events].read[tribute.<[upgrade_type]>.upgrades.<yaml[events].read[tribute.<[upgrade_type]>.rate]>]>"

Tribute_mcMMO:
    type: item
    debug: false
    material: diamond_pickaxe
    display name: "<&6>Blessing of Skillfulness"
    lore_list:
    - "<&f>Pray for the Gods to bless your ability to learn skills."
    - "<&a>Increases mcMMO EXP rate"
    - "<&a>Current rate: <yaml[events].read[tribute.mcmmo.rate]>x"
    - "<proc[Tribute_Cap_Procedure].context[mcmmo]>"
    enchantments:
    - MENDING:1
    mechanisms:
        lore: <proc[lore_builder].context[40|<script.yaml_key[lore_list].escaped>]>
        flags:
        - HIDE_ENCHANTS

Tribute_DropRate:
    type: item
    debug: false
    material: gold_ingot
    display name: "<&6>Blessing of Luck"
    lore_list:
    - "<&f>Pray for the Gods to bless your ability to find rare items from slain monsters."
    - "<&a>Increases rare drop rate"
    - "<&a>Current rate: <yaml[events].read[tribute.drops.rate]>x"
    - "<proc[Tribute_Cap_Procedure].context[drops]>"
    enchantments:
    - MENDING:1
    mechanisms:
        lore: <proc[lore_builder].context[40|<script.yaml_key[lore_list].escaped>]>
        flags:
        - HIDE_ENCHANTS

Tribute_Experience:
    type: item
    debug: false
    material: i@exp_bottle
    display name: "<&6>Blessing of Wisdom"
    lore_list:
    - "<&f>Pray for the Gods to bless your ability to gain experience from slain monsters."
    - "<&a>Increases monster experience drop rate"
    - "<&a>Current rate: <yaml[events].read[tribute.experience.rate]>x"
    - "<proc[Tribute_Cap_Procedure].context[experience]>"
    enchantments:
    - MENDING:1
    mechanisms:
        lore: <proc[lore_builder].context[40|<script.yaml_key[lore_list].escaped>]>
        flags:
        - HIDE_ENCHANTS
