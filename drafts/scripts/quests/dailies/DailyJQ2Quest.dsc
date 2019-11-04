DailyJQ2_gui_item:
    type: item
    quest_name: DailyJQ2
    material: leather_boots[lore=<proc[lore_builder].context[40|<script.yaml_key[lore_list].escaped>]>]
    display name: "<&a><yaml[<script.yaml_key[quest_name]>].read[player_data.<script.yaml_key[quest_name]>.name]>"
    lore_list:
    - <yaml[<script.yaml_key[quest_name]>].read[player_data.<script.yaml_key[quest_name]>.description]>
    - <&6>Rewards:
    - <yaml[<script.yaml_key[quest_name]>].read[config.rewards.money]> gold
    - <yaml[<script.yaml_key[quest_name]>].read[config.rewards.quest_points]> quest points