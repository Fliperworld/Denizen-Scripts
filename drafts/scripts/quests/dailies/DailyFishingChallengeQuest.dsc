DailyFishingChallenge_gui_item:
    type: item
    quest_name: DailyFishingChallenge
    material: fishing_rod[flags=li@HIDE_ENCHANTS;lore=<proc[lore_builder].context[40|<script.yaml_key[lore_list].escaped>]>]
    display name: "<&a><yaml[<script.yaml_key[quest_name]>].read[player_data.<script.yaml_key[quest_name]>.name]>"
    enchantments:
    - MENDING:1
    lore_list:
    - <yaml[<script.yaml_key[quest_name]>].read[player_data.<script.yaml_key[quest_name]>.description]>
    - <&6>Rewards:
    - <yaml[<script.yaml_key[quest_name]>].read[config.rewards.money]> gold
    - <yaml[<script.yaml_key[quest_name]>].read[config.rewards.quest_points]> quest points