"Start Bot":
    type: world
    debug: false
    events:
        on server start:
        - wait 80s
        - run "Connect Denizen Bot"
        - announce to_console "Denizen Bot has successfully loaded"
"Startup Test":
    type: task
    script:
    - wait 5s
    - run "Connect Denizen Bot"
    - announce to_console "Denizen Bot has successfully loaded via the test script"
"New Player Alert":
    type: world
    debug: false
    events:
        on player logs in for the first time:
        - discord id:sxr message channel:343105813293826059 "<&lt><&at><&amp>223441207341219840<&gt>, **<player.name>** has joined the server for the first time! Say hello in <&lt><&ns>191040977652285450<&gt>!"
        - announce "<red>The Gods speak<white>: <player.name> is new to the server, please welcome them!"
        - wait 5s
        - execute as_server "money create <player.name>"
        - announce to_console "Created money account for <player.name>"
"Death Message Repeater":
    type: world
    debug: false
    events:
        on player dies:
        - discord id:sxr message channel:191040977652285450 ":skull: <context.message>"
#Emoji format: "<&lt>:kappa:327884375410737153<&gt>"