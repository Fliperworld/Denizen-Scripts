"Mob Spawner Block Loot":
    type: world
    events:
        on player breaks mob_spawner:
        - if <player.gamemode> == survival:
            - modifyblock <context.location> air
            - determine passively diamond_block
            - drop xp <context.location> quantity:1395