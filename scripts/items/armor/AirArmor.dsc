Veteran_Air_Helm_sealed_potential:
    type: item
    no_id: true
    material: Leather_Helmet[nbt_attributes=li@generic.maxHealth/head/0/4.0|generic.armorToughness/head/0/2.0|generic.armor/head/0/2.0;nbt=li@equipment_type/armor|item_tier/veteran|sealed_potential/true|armor_set/veteran_air|air_magic_multiplier/0.25|enable_mana/true;lore=<proc[lore_builder].context[40|<script.yaml_key[lore_list].escaped>]>]
    display name: "<&9>Breezy Leather Helm"
    lore_list:
    - "<&9><&o>Veteran"
    - "<&f>This helm is flowing with air magic, almost floating when held."
    - "<&b>+0.25x Air Magic Effectiveness"
    - "<&6>Sealed Potential"
    enchantments:
    - PROTECTION_ENVIRONMENTAL:5
Veteran_Air_Chest_sealed_potential:
    type: item
    no_id: true
    material: Leather_Chestplate[nbt_attributes=li@generic.maxHealth/chest/0/8.0|generic.armorToughness/chest/0/2.0|generic.armor/chest/0/4.0;nbt=li@equipment_type/armor|item_tier/veteran|sealed_potential/true|armor_set/veteran_air|air_magic_multiplier/0.6|enable_mana/true;lore=<proc[lore_builder].context[40|<script.yaml_key[lore_list].escaped>]>]
    display name: "<&9>Breezy Leather Chestplate"
    lore_list:
    - "<&9><&o>Veteran"
    - "<&f>This chestplate is flowing with air magic, almost floating when held."
    - "<&b>+0.6x Air Magic Effectiveness"
    - "<&6>Sealed Potential"
    enchantments:
    - PROTECTION_ENVIRONMENTAL:5
Veteran_Air_Legs_sealed_potential:
    type: item
    no_id: true
    material: Leather_Leggings[nbt_attributes=li@generic.maxHealth/legs/0/6.0|generic.armorToughness/legs/0/2.0|generic.armor/legs/0/3.0;nbt=li@equipment_type/armor|item_tier/veteran|sealed_potential/true|armor_set/veteran_air|air_magic_multiplier/0.4|enable_mana/true;lore=<proc[lore_builder].context[40|<script.yaml_key[lore_list].escaped>]>]
    display name: "<&9>Breezy Leather Leggings"
    lore_list:
    - "<&9><&o>Veteran"
    - "<&f>These leggings are flowing with air magic, almost floating when held."
    - "<&b>+0.4x Air Magic Effectiveness"
    - "<&6>Sealed Potential"
    enchantments:
    - PROTECTION_ENVIRONMENTAL:5
Veteran_Air_Boots_sealed_potential:
    type: item
    no_id: true
    material: Leather_Boots[nbt_attributes=li@generic.maxHealth/feet/0/2.0|generic.armorToughness/feet/0/2.0|generic.armor/feet/0/2.0;nbt=li@equipment_type/armor|item_tier/veteran|sealed_potential/true|armor_set/veteran_air|air_magic_multiplier/0.25|enable_mana/true;lore=<proc[lore_builder].context[40|<script.yaml_key[lore_list].escaped>]>]
    display name: "<&9>Breezy Leather Boots"
    lore_list:
    - "<&9><&o>Veteran"
    - "<&f>These boots are flowing with air magic, almost floating when held."
    - "<&b>+0.25x Air Magic Effectiveness"
    - "<&6>Sealed Potential"
    enchantments:
    - PROTECTION_ENVIRONMENTAL:5

veteran_air_armor_set_data:
    type: yaml data
    debug: false
    set_name: veteran_air
    set_variable: air_magic_multiplier

veteran_air_armor_set_bonuses:
    type: procedure
    definitions: set_piece_count
    scale:
        1: 0
        2: 0.25
        3: 0.5
        4: 1
    script:
    - determine <script.yaml_key[scale.<def[set_piece_count].min[4].max[1].round>]>