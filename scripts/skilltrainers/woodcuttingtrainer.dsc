"Woodcutting Master":
    type: assignment
    interact scripts:
    - 10 Woodcutting
    actions:
        on assignment:
        - teleport npc <npc.anchor[woodcuttingmaster]>
        - trigger name:proximity toggle:true
        - trigger name:chat toggle:true
    
"Woodcutting Master Format":
    type: format
    format: "<gray>Expert Logger<white><&co> <text>"

"Woodcutting":
    type: interact
    steps:
        'Player Seen*':
            proximity trigger:
                entry:
                    script:
                    - narrate "format:Woodcutting Master Format" "Howdy sapling! Want to learn about woodcutting? I'll show you the ropes. Right click me."
                exit:
                    script:
                    - narrate "format:Woodcutting Master Format" "Happy cuts!"
            click trigger:
                script:
                - narrate "format:Woodcutting Master Format" "Alright, let's get you some training. I'll give you 100 Woodcutting XP for 1 gold. Say how much gold you want to spend, or anything else to cancel."
                - zap 'step:Payment'
        'Payment':
            chat trigger:
                'Confirm':
                    trigger: I'd like to pay /REGEX:\d+/ gold.
                    script:
                    - flag player ChosenAmount:<context.message.replace[regex:\D+]>
                    - announce to_console "player.flag[ChosenAmount] equals <player.flag[ChosenAmount]>"
                    - announce to_console "player.money is <player.money>"
                    - if <player.flag[ChosenAmount].is[OR_LESS].than[<player.money>]>:
                        - narrate "format:Woodcutting Master Format" "Okay, let's get you trained up."
                        - execute as_server "addxp <player.name> woodcutting <player.flag[ChosenAmount].mul[100]||0>"
                        - announce to_console "ran command 'addxp <player.name> woodcutting <player.flag[ChosenAmount].mul[100]||0>'"
                        - take money qty:<player.flag[ChosenAmount]>
                        - flag player ChosenAmount:!
                        - narrate "format:Woodcutting Master Format" "All done. Enjoy."
                    - else:
                        - narrate "format:Woodcutting Master Format" "You don't have that much gold."
                    - zap 'step:Player Seen'
                'Fail':
                    trigger: "/REGEX:.+/"
                    script:
                    - narrate "format:Woodcutting Master Format" "I don't think that's a number. Sorry, I can't work with that."
                    - zap 'step:Player Seen'
            click trigger:
                script:
                - narrate "format:Woodcutting Master Format" "Just say how much gold you want to pay for XP, or anything else to cancel."