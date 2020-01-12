# Add NBT to items for # of sockets available / total
# Use NBT to manage sockets
# Use events to handle socket effects
# Numbered sockets on each item to handle types separately from current sockets
# Be sure to check each specific numbered slot to avoid exploits

### Relevant NBT values:
## Item (weapon/armor) NBT
# equipment_type (VALUE) | Whether equipment is a weapon or armor, e.g. "weapon"/"armor"
# item_tier (VALUE) | The item's tier, e.g. "veteran"/"elite"/"champion"
# sealed_potential (BOOLEAN) | Whether the item has Sealed Potential. Items with Sealed Potential should have no socket data; data will be wiped on unlock.
# sockets_current (INTEGER) | Number of sockets currently on the item, filled or unfilled
# sockets_max (INTEGER) | Maximum number of sockets possible to exist on the item, whether existing or not
# sockets_can_add (BOOLEAN) | Whether it is possible to add any more sockets to the item, to be removed when sockets_current equals sockets_max
# sockets_open (BOOLEAN) | Whether an item has sockets that are empty
# socket#_type (VALUE) | The type of a socket, e.g. socket1_type "attack"/"defense"/"utility"
# socket#_gem (VALUE) | The actual gem inserted into a socket e.g. "crit_chance"/"health_on_hit"/"speed_on_hit"
# socket#_empty (BOOLEAN) | True if the numbered socket is empty
## Gem NBT
# gem_type (VALUE) | The type of a gem, e.g. "attack"/"defense"/"utility"
# gem_specific (VALUE) | The actual gem e.g. "crit_chance"/"health_on_hit"/"speed_on_hit"
# gem_attribute# (VALUE) | NBT attributes to be applied to item upon socketing


nbt_craft_prevention:
    type: world
    debug: true
    events:
        on player crafts item:
        - if <context.recipe.filter[nbt[uncraftable]].size> >= 1:
            - determine cancelled

SocketMaker:
    type: item
    material: nether_star[flags=li@HIDE_ENCHANTS;nbt=li@uncraftable/true;lore=<proc[lore_builder].context[40|<script.yaml_key[lore_list].escaped>]>]
    display name: "<&a>Purified Dark Matter"
    lore_list:
    - "<&6>This coalesced energy has been purged of the darkness inside. It now pulses and radiates in an unstoppable splendor."
    enchantments:
    - MENDING:1

sockets_sword_max:
    type: item
    no_id: true
    material: diamond_sword[nbt=li@equipment_type/weapon|item_tier/champion|sockets_current/5|sockets_max/5|sockets_can_add/false|sockets_open/true|socket1_type/attack|socket1_empty/true|socket2_type/attack|socket2_empty/true|socket3_type/utility|socket3_empty/true|socket4_type/defense|socket4_empty/true|socket5_type/utility|socket5_empty/true]
    display name: "<&a>Empty Socket Sword of Extreme Testing"
    lore:
    - "<&f>This sword is bonkers, lol."
    - "<&6>Sockets"
    - "<&c>EMPTY<&co> ATTACK"
    - "<&c>EMPTY<&co> ATTACK"
    - "<&a>EMPTY<&co> UTILITY"
    - "<&9>EMPTY<&co> DEFENSE"
    - "<&a>EMPTY<&co> UTILITY"
    enchantments:
    - MENDING:1

sockets_sword_locked:
    type: item
    no_id: true
    material: diamond_sword[nbt=li@equipment_type/weapon|item_tier/champion|sockets_current/0|sockets_max/5|sockets_can_add/true]
    display name: "<&a>Locked Socket Sword of Extreme Testing"
    lore:
    - "<&f>This sword is bonkers, lol."
    - "<&6>Sockets"
    - "<&8>LOCKED"
    - "<&8>LOCKED"
    - "<&8>LOCKED"
    - "<&8>LOCKED"
    - "<&8>LOCKED"
    enchantments:
    - MENDING:1

sockets_sword_sealed_potential:
    type: item
    no_id: true
    material: diamond_sword[nbt=li@equipment_type/weapon|item_tier/champion|sealed_potential/true]
    display name: "<&a>Sealed Socket Sword of Extreme Testing"
    lore:
    - "<&f>This sword is bonkers, lol."
    - "<&6>Sealed Potential"
    enchantments:
    - MENDING:1

prismatic_seer:
    type: assignment
    interact scripts:
    - 10 sockets
    actions:
        on assignment:
        - teleport npc <npc.anchor[prismaticseer]>
        - trigger name:proximity toggle:true
        - trigger name:chat toggle:true

prismatic_seer_format:
    type: format
    format: "<dark_green>Prismatic Seer<white><&co> <text>"

sockets:
    type: interact
    steps:
        "Player Seen*":
            proximity trigger:
                entry:
                    script:
                    - narrate format:prismatic_seer_format "Hello, adventurer. Have you come to unlock the potential of your items?"
                    - narrate format:prismatic_seer_format "With the right materials, I can help you manifest the latent powers of your items. Right click me to see my services."
                exit:
                    script:
                    - narrate format:prismatic_seer_format "Good luck, adventurer. I'll be here if you need me again."
            click trigger:
                script:
                - narrate format:prismatic_seer_format "Okay, here's what I have to offer."
                - wait 1s
                - inventory open d:in@prismatic_seer_menu
"prismatic_seer_menu":
    type: inventory
    title: Item Potential
    size: 45
    slots:
    - "[] [] [] [] [] [] [] [] []"
    - "[] [] [] [] [i@socket_add] [] [] [] []"
    - "[] [] [] [i@socket_potential] [] [] [] [] []"
    - "[] [] [] [] [i@gem_add] [] [] [] []"
    - "[] [] [] [] [] [] [] [] []"
socket_add:
    type: item
    material: nether_star[flags=li@HIDE_ATTRIBUTES|HIDE_ENCHANTS;lore=<proc[lore_builder].context[40|<script.yaml_key[lore_list].escaped>]>]
    display name: "<&a>Unlock a socket on an item"
    lore_list:
    - "<&f>Requires <server.flag[SocketAddCost]> Purified Dark Matter and 1 Ingot of Crystallized Experience."
    enchantments:
    - MENDING:1
gem_add:
    type: item
    material: diamond[flags=li@HIDE_ATTRIBUTES|HIDE_ENCHANTS]
    display name: "<&a>Add a gem to a socket"
    lore:
    - "<&f>Requires an item with an open socket and a gem of the appropriate type."
    enchantments:
    - MENDING:1
socket_potential:
    type: item
    material: gold_ingot[flags=li@HIDE_ATTRIBUTES|HIDE_ENCHANTS;lore=<proc[lore_builder].context[40|<script.yaml_key[lore_list].escaped>]>]
    display name: "<&a>Unlock the <&6>Sealed Potential<&a> of an item"
    lore_list:
    - "<&f>Requires an item with <&6>Sealed Potential<&f>, <server.flag[SealedPotentialCost]> Purified Dark Matter, and 1 Ingot of Crystallized Experience."
    enchantments:
    - MENDING:1

prismatic_seer_inventory_handler:
    type: world
    events:
        on server start:
        - wait 30s
        - flag server SocketAddCost:32
        - flag server SealedPotentialCost:64
        on player clicks in prismatic_seer_menu:
        - determine cancelled
        on player drags in prismatic_seer_menu:
        - determine cancelled
        on player clicks socket_add in prismatic_seer_menu:
        - inventory close d:in@prismatic_seer_menu
#        - narrate format:prismatic_seer_format "You clicked the Add a socket option!"
        - announce to_console <player.inventory.list_contents>
        - if !<player.inventory.contains.scriptname[SocketMaker].quantity[<server.flag[SocketAddCost]>]> || !<player.inventory.contains.scriptname[CrystallizedExperienceIngot].quantity[1]>:
            - inventory close
            - narrate format:prismatic_seer_format "Sorry, you don't have enough materials for that!"
            - stop
        - if <player.inventory.list_contents.filter[nbt[sockets_can_add]].size||null> >= 1:
            - narrate format:prismatic_seer_format "Okay, now select which of your valid items you'd like to add a socket to."
            - note "in@generic[title=Available Items;size=45;contents=<player.inventory.list_contents.filter[nbt[sockets_can_add]]>]" as:sockets_can_add.<player.uuid>
            - inventory open d:in@sockets_can_add.<player.uuid>
        - else:
            - narrate format:prismatic_seer_format "Sorry, it looks like you don't have any items I can add a socket to!"
        - narrate format:prismatic_seer_format "Right click me again if you'd like to choose another option!"

        on player clicks gem_add in prismatic_seer_menu:
        - inventory close d:in@prismatic_seer_menu
        - announce to_console <player.inventory.list_contents>
        # Add a check to ensure that there is a gem matching the available sockets before opening the inventory?
        # We're not stopping them from closing it so it might just not matter
        - if <player.inventory.list_contents.filter[nbt[sockets_open]].size||null> >= 1:
            - narrate format:prismatic_seer_format "Okay, now select which of your valid items you'd like to add a gem to."
            - flag player sockets_gem_add_item:!
            - flag player sockets_gem_add_item_empty:!
            - flag player sockets_gem_add_item_types:!
            - flag player sockets_gem_add_item_slot_type_list:!
            - note "in@generic[title=Available Items;size=45;contents=<player.inventory.list_contents.filter[nbt[sockets_open]]>]" as:sockets_open.<player.uuid>
            - inventory open d:in@sockets_open.<player.uuid>
        - else:
            - inventory close
            - narrate format:prismatic_seer_format "Sorry, you don't have any items I can add a gem to!"
        on player clicks socket_potential in prismatic_seer_menu:
        - inventory close d:in@prismatic_seer_menu
        - announce to_console <player.inventory.list_contents>
        - if <player.inventory.list_contents.filter[nbt[sealed_potential]].size||null> >= 1:
            - narrate format:prismatic_seer_format "Okay, now select which of your valid items you'd like to unlock the potential of."
            - note "in@generic[title=Available Items;size=45;contents=<player.inventory.list_contents.filter[nbt[sealed_potential]]>]" as:sealed_potential.<player.uuid>
            - inventory open d:in@sealed_potential.<player.uuid>
        - else:
            - narrate format:prismatic_seer_format "Sorry, it looks like you don't have any items with <&6>Sealed Potential<&f>!"
prismatic_seer_socket_add_handler:
    type: world
    events:
        on player clicks in notable:
        - if <context.inventory.notable_name||null> != sockets_can_add.<player.uuid>:
            - stop
        # Checks if item has locked sockets that can be opened
        - if <context.item.has_nbt[sockets_can_add]>:
            - define item <context.item>
            - take <context.item> from:<player.inventory>
            - take scriptname:SocketMaker quantity:<server.flag[SocketAddCost]>
            - take scriptname:CrystallizedExperienceIngot quantity:1
            # Add 1 to the number of sockets currently on the item
            - define item:<[item].with[nbt=sockets_current/<[item].nbt[sockets_current].add[1]>]>
            # If the item already has sockets...
            - if <[item].nbt_keys.filter[matches[socket[0-9]+_type]].alphanumeric.size> > 0:
                # Find the last existing socket#_type line
                - define sockets_last_type <[item].nbt_keys.filter[matches[socket[0-9]+_type]].alphanumeric.last>
                # Set the socket# target as the number from the last socket#_type plus one
                - define socket_target <[sockets_last_type].replace[regex:socket([0-9]+)_type].with[$1].add[1]>
            - else:
                - define socket_target 1
            # Add a new empty socket at the targeted number
            - define item:<[item].with[nbt=socket<[socket_target]>_empty/true]>
            # Different socket rolls for weapons and armor
            # In the future, use additional if checks within this section to differentiate classes of weapons or armor for use with Potential
            # Note that this is only for locked sockets - can also just drop weapons and armor with all-unlocked sockets
            - if <[item].nbt[equipment_type]> == weapon:
                - define type <tern[<util.random.decimal.is[less].than[0.7]>].pass[attack].fail[utility]>
                - define item:<[item].with[nbt=socket<[socket_target]>_type/<[type]>]>
            - if <[item].nbt[equipment_type]> == armor:
                - define type <tern[<util.random.decimal.is[less].than[0.7]>].pass[defense].fail[utility]>
                - define item:<[item].with[nbt=socket<[socket_target]>_type/<[type]>]>
            - define item:<[item].with[nbt=sockets_open/true]>
            - if <[item].nbt[sockets_current]||null> == <[item].nbt[sockets_max]>:
                - adjust <[item]> remove_nbt:sockets_can_add save:edited
                - define item:<entry[edited].result>
            ## Let's do the lore now y'all
            # Find the locked socket line
            - define locked_socket_line <[item].lore.find[<&8>LOCKED]>
            # Define the appropriate line based on socket type
            - if <[item].nbt[socket<[socket_target]>_type]> == attack:
                - define "socket_new_lore:<&c>EMPTY<&co> ATTACK"
            - if <[item].nbt[socket<[socket_target]>_type]> == defense:
                - define "socket_new_lore:<&9>EMPTY<&co> DEFENSE"
            - if <[item].nbt[socket<[socket_target]>_type]> == utility:
                - define "socket_new_lore:<&a>EMPTY<&co> UTILITY"
            - adjust <[item]> "lore:<[item].lore.set[<[socket_new_lore]>].at[<[locked_socket_line]>]>" save:edited
            - define item:<entry[edited].result>
            # Finally, give the new item
            - give <[item]> to:<player.inventory>
            - inventory close d:in@sockets_can_add.<player.uuid>
            - note remove as:in@sockets_can_add.<player.uuid>
            - narrate format:prismatic_seer_format "Congratulations, a socket has been added to your <[item].display><&f>!"
        - else if <context.item> == i@air:
            - determine cancelled
        - else:
            - narrate format:prismatic_seer_format "Something went wrong! It doesn't look like I can add a socket to that item."
prismatic_seer_socket_potential_handler:
    type: world
    max_sockets:
        veteran: 3
        elite: 4
        champion: 5
    events:
        on player clicks in notable:
        - if <context.inventory.notable_name||null> != sealed_potential.<player.uuid>:
            - stop
        - if !<player.inventory.contains.scriptname[SocketMaker].quantity[<server.flag[SealedPotentialCost]>]> || !<player.inventory.contains.scriptname[CrystallizedExperienceIngot].quantity[1]>:
            - inventory close
            - narrate format:prismatic_seer_format "Sorry, you don't have enough materials for that!"
            - stop
        - if <context.item.has_nbt[sealed_potential]>:
            - take <context.item> from:<player.inventory>
            - define max_sockets <script.yaml_key[max_sockets.<context.item.nbt[item_tier]>]>
            - adjust <context.item> remove_nbt:sealed_potential save:edited
            - define item:<entry[edited].result>
            - foreach <[item].nbt_keys.filter[matches[socket[0-9]+_empty]].alphanumeric>:
                - adjust <[item]> remove_nbt:<[value]> save:edited
                - define item:<entry[edited].result>
            - foreach <[item].nbt_keys.filter[matches[socket[0-9]+_type]].alphanumeric>:
                - adjust <[item]> remove_nbt:<[value]> save:edited
                - define item:<entry[edited].result>
            - foreach <[item].nbt_keys.filter[matches[socket[0-9]+_gem]].alphanumeric>:
                - adjust <[item]> remove_nbt:<[value]> save:edited
                - define item:<entry[edited].result>
            - adjust <[item]> remove_nbt:sockets_open save:edited
            - define item:<entry[edited].result>
            - define item:<[item].with[nbt=sockets_can_add/true]>
            - define item:<[item].with[nbt=sockets_current/0]>
            - define item:<[item].with[nbt=sockets_max/<util.random.int[1].to[<[max_sockets]>]>]>
            - define "potential_line:<[item].lore.find[<&6>Sealed Potential]>"
            - adjust <[item]> lore:<[item].lore.set[<&6>Sockets].at[<[potential_line]>]> save:edited
            - define item:<entry[edited].result>
            - adjust <[item]> lore:<[item].lore.pad_right[<[item].nbt[sockets_max].add[<[potential_line]>]>].with[<&8>LOCKED]> save:edited
            - define item:<entry[edited].result>
            - inventory close d:in@sealed_potential.<player.uuid>
            - note remove as:in@sealed_potential<player.uuid>
            - give <[item]>
            - take scriptname:SocketMaker quantity:<server.flag[SealedPotentialCost]>
            - take scriptname:CrystallizedExperienceIngot quantity:1
            - narrate format:prismatic_seer_format "Congratulations, your <[item].display><&r>'s potential has been unlocked!"
        - else if <context.item> == i@air:
            - determine cancelled
        - else:
            - narrate format:prismatic_seer_format "Something went wrong! It doesn't look like I can unlock the <&6>Sealed Potential<&f> of that item."
        - narrate format:prismatic_seer_format "Right click me again if you'd like to choose another option!"
prismatic_seer_gem_add_item_handler:
    type: world
    events:
        # Inventory manager for list of items with open sockets to add a gem to
        on player clicks in notable:
        - if <context.inventory.notable_name||null> != sockets_open.<player.uuid>:
            - stop
        - inventory close d:in@sockets_open.<player.uuid>
        - note remove as:in@sockets_open.<player.uuid>
        - if <context.item.has_nbt[sockets_open]>:
            - define item_sockets_type_list li@
            - define item_sockets_empty li@
            - define valid_gems li@
            - define item_sockets_types li@
            - flag player sockets_gem_add_item:<context.item>
            # Should save a list of empty sockets e.g. "li@socket1_empty|socket2_empty" etc.
            - flag player sockets_gem_add_item_empty:!|:<context.item.nbt_keys.filter[matches[socket[0-9]+_empty]].alphanumeric>
            - define item_sockets_empty <context.item.nbt_keys.filter[matches[socket[0-9]+_empty]].alphanumeric>
            # Returns the empty socket nbt keys, swapped to "type" e.g. "li@socket1_type|socket2_type" etc.
            - define item_sockets_type_list <[item_sockets_empty].parse[replace[empty].with[type]]>
            # Should save a list of empty socket type keys e.g. "li@socket1_type|socket2_type" etc.
            - flag player sockets_gem_add_item_slot_type_list:<[item_sockets_type_list]>
            - define item_sockets_type_list <[item_sockets_type_list].deduplicate>
            - foreach <[item_sockets_type_list]>:
                - define valid_gems <[valid_gems].include[<player.inventory.list_contents.filter[nbt[gem_type].is[==].to[<context.item.nbt[<[value]>]>]]||null>]>
                - define item_sockets_types <[item_sockets_types].include[<context.item.nbt[<[value]>]>]>
            - flag player sockets_gem_add_item_types:!|:<[item_sockets_types]>
            - define valid_gems <[valid_gems].deduplicate>
            - if <[valid_gems].size> >= 1:
                - narrate format:prismatic_seer_format "Okay, here are the gems you can add to that item."
                - note "in@generic[title=Available Gems;size=45;contents=<[valid_gems]>]" as:sockets_gem_add.<player.uuid>
                - inventory open "d:in@sockets_gem_add.<player.uuid>"
            - else:
                - narrate format:prismatic_seer_format "Sorry, you don't have any valid gems for that item."
        - else if <context.item> == i@air:
            - determine cancelled
        - else:
            - narrate format:prismatic_seer_format "Something went wrong! It doesn't look like I can add a gem to that item."

prismatic_seer_gem_add_gem_handler:
    type: world
    events:
        # Inventory manager for list of gems that can be added to the item in question
        on player clicks in notable:
        - if <context.inventory.notable_name||null> != sockets_gem_add.<player.uuid>:
            - stop
        - if <player.flag[sockets_gem_add_item_types].contains[<context.item.nbt[gem_type]||null>]>:
            # Returns "li@socket1_empty|socket2_empty" etc
            - define former_item:<player.flag[sockets_gem_add_item].as_item>
            - define item:<player.flag[sockets_gem_add_item].as_item>
            - foreach <player.flag[sockets_gem_add_item_empty].as_list>:
                ## We're finally adding the gem to the item!
                # <[value-empty]> is socket1_empty etc
                # <[value-type]> is socket1_type etc
                # <[item]> is the selected item
                # Get the NBT value of the item's socket with <player.flag[sockets_gem_add_item].as_item.nbt[<[value-type]>]>
                - define value-empty <[value]>
                - define value-type <[value].replace[empty].with[type]>
                - if <[item].nbt[<[value-type]>]> == <context.item.nbt[gem_type]||null>:
                    - inventory close d:in@sockets_gem_add.<player.uuid>
                    - note remove as:in@sockets_gem_add.<player.uuid>
                    # Take the item and gem
                    - take <[item]> from:<player.inventory>
                    - take <context.item> from:<player.inventory>
                    ## Adjust the NBT data
                    # Delete the NBT for the empty socket being filled
                    - adjust <[item]> remove_nbt:<[value]> save:edited
                    - define item:<entry[edited].result>
                    # Add NBT to indicate the gem being added
                    - define item:<entry[edited].result.with[nbt=<[value].replace[empty].with[gem]>/<context.item.nbt[gem_specific]>]>
                    ## Handle any NBT attributes, if they exist
                    - define nbt_attributes_list:<context.item.nbt_keys.filter[matches[gem_attribute[0-9]+]].alphanumeric>
                    - foreach <[nbt_attributes_list]>:
                        #- announce to_console "NBT <context.item.nbt[<[value]>]>"
                        - define attribute_location:<[item].nbt_attributes.as_list.find_partial[<context.item.nbt[<[value]>].before_last[/]>]||0>
                        - if <[attribute_location]> >= 1:
                            - adjust <[item]> "nbt_attributes:<[item].nbt_attributes.as_list.set[<[item].nbt_attributes.as_list.get[<[attribute_location]>].before_last[/]>/<context.item.nbt[<[value]>].after_last[/].add[<[item].nbt_attributes.as_list.get[<[attribute_location]>].after_last[/]>]>].at[<[attribute_location]>]>" save:edited
                            - define item:<entry[edited].result>
                        - else:
                            - adjust <[item]> "nbt_attributes:<[item].nbt_attributes.as_list.include[<context.item.nbt[<[value]>]>]>" save:edited
                            - define item:<entry[edited].result>
                    ## Adjust the lore
                    # First line after "<&6>Sockets"
                    - define first_socket_line <[item].lore.find[<&6>Sockets]>
                    # Line where our targeted socket is
                    - define socket_target <[value-empty].replace[regex:socket([0-9]+)_empty].with[$1].add[<[first_socket_line]>]>
                    # Set up the lore line for the socket
                    # Can probably eliminate this if chain if gems have standardized colors for their names
                    - if <context.item.nbt[gem_type]> == attack:
                        - define socket_new_line "<&c><context.item.display.strip_color>"
                    - else if <context.item.nbt[gem_type]> == defense:
                        - define socket_new_line "<&9><context.item.display.strip_color>"
                    - else if <context.item.nbt[gem_type]> == utility:
                        - define socket_new_line "<&a><context.item.display.strip_color>"
                    - adjust <[item]> "lore:<[item].lore.set[<[socket_new_line]>].at[<[socket_target]>]>" save:edited
                    - define item:<entry[edited].result>
                    # Check whether any open sockets remain; if not, remove sockets_open
                    - if <[item].nbt_keys.filter[matches[socket[0-9]+_empty]].alphanumeric.size> == 0:
                        - adjust <[item]> remove_nbt:sockets_open save:edited
                        - define item:<entry[edited].result>
                    # Give the new item
                    - give <[item]>
                        #- narrate format:prismatic_seer_format "This is where I tell you that I added the gem to the socket!"
                        #- announce to_console "Hooray!"
                    #- else:
                    #    - narrate format:prismatic_seer_format "Something went wrong! Here are your items back."
                    #    - give <context.item>
                    #    - give <[former_item]>
                    - foreach stop
        - else if <context.item> == i@air:
            - determine cancelled
        - else:
            - inventory close d:in@sockets_gem_add.<player.uuid>
            - note remove as:in@sockets_gem_add.<player.uuid>
            - narrate format:prismatic_seer_format "Sorry, I can't add that gem to that item!"
