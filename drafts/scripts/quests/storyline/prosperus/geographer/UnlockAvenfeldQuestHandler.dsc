UnlockAvenfeldQuestDeliveryHandler:
    type: task
    debug: false
    script:
    - define stage:2
    - choose <player.item_in_hand.material.name>: