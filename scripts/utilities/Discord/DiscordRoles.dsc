PatreonRoleSync:
    type: world
    debug: false
    events:
        on discord message received:
        - if <context.message> == "!rolesync":
            - discord id:sxr addrole user:<context.author_id> role:458328476248965120 guild:191040935633616896
            - wait 1s
            - discord id:sxr removerole user:<context.author_id> role:458328476248965120 guild:191040935633616896
        - else if <context.message.split[<&sp>].get[1]> == "!linkminecraft":
            - if <server.match_offline_player[<context.message.split[<&sp>].get[2]>]||null> != null:
                - flag server discord-user_<context.author_id>.minecraft-player:<server.match_offline_player[<context.message.split[<&sp>].get[2]>]>
                - discord id:sxr addrole user:<context.author_id> role:458328476248965120 guild:191040935633616896
                - wait 1s
                - discord id:sxr removerole user:<context.author_id> role:458328476248965120 guild:191040935633616896
                - discord id:sxr message channel:191040977652285450 "<&lt><&at><context.author_id><&gt>, you linked your Discord account to the Minecraft player <server.match_offline_player[<context.message.split[<&sp>].get[2]>].name>! If this is in error, please feel free to try again, or contact Wahrheit."
            - else:
                - discord id:sxr message channel:191040977652285450 "<&lt><&at><context.author_id><&gt>, something went wrong! Please feel free to try again, or contact Wahrheit."
        on discord user role changes:
        - if <server.has_flag[discord-user_<context.user_id>.minecraft-player]>:
            - if <context.new_role_ids.contains[458328498608799774]>:
                - group add Patron player:<server.flag[discord-user_<context.user_id>.minecraft-player]>
                - group add GenerousPatron player:<server.flag[discord-user_<context.user_id>.minecraft-player]>
                - group add EsteemedPatron player:<server.flag[discord-user_<context.user_id>.minecraft-player]>
            - else if <context.new_role_ids.contains[458328312054546432]>:
                - group add Patron player:<server.flag[discord-user_<context.user_id>.minecraft-player]>
                - group add GenerousPatron player:<server.flag[discord-user_<context.user_id>.minecraft-player]>
            - else if <context.new_role_ids.contains[387095048015314956]>:
                - group add Patron player:<server.flag[discord-user_<context.user_id>.minecraft-player]>
            - else:
                - group remove Patron player:<server.flag[discord-user_<context.user_id>.minecraft-player]>
                - group remove GenerousPatron player:<server.flag[discord-user_<context.user_id>.minecraft-player]>
                - group remove EsteemedPatron player:<server.flag[discord-user_<context.user_id>.minecraft-player]>
                - group remove Duke player:<server.flag[discord-user_<context.user_id>.minecraft-player]>
                - group remove GenerousDuke player:<server.flag[discord-user_<context.user_id>.minecraft-player]>
                - group remove EsteemedDuke player:<server.flag[discord-user_<context.user_id>.minecraft-player]>
                - group remove Duchess player:<server.flag[discord-user_<context.user_id>.minecraft-player]>
                - group remove GenerousDuchess player:<server.flag[discord-user_<context.user_id>.minecraft-player]>
                - group remove EsteemedDuchess player:<server.flag[discord-user_<context.user_id>.minecraft-player]>