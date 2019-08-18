"Repair Master":
    type: assignment
    interact scripts:
    - 10 Repair
    actions:
        on assignment:
        - teleport npc <npc.anchor[repairmaster]>
        - trigger name:proximity toggle:true
        - trigger name:chat toggle:true
    
"Repair Master Format":
    type: format
    format: "<gray>Master Repairman<white><&co> <text>"

"Repair":
    type: interact
    steps:
        'Player Seen*':
            proximity trigger:
                entry:
                    script:
                    - narrate "format:Repair Master Format" "Hello apprentice! Want to learn about repair? I'll help you refine your craft. Right click me."
                exit:
                    script:
                    - narrate "format:Repair Master Format" "Have a good one!"
            click trigger:
                script:
                - narrate "format:Repair Master Format" "Alright, let's get you some training. I'll give you 100 Repair XP for 1 gold. Say how much gold you want to spend, or anything else to cancel."
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
                        - narrate "format:Repair Master Format" "Okay, let's get you trained up."
                        - execute as_server "addxp <player.name> repair <player.flag[ChosenAmount].mul[100]||0>"
                        - announce to_console "ran command 'addxp <player.name> repair <player.flag[ChosenAmount].mul[100]||0>'"
                        - take money qty:<player.flag[ChosenAmount]>
                        - flag player ChosenAmount:!
                        - narrate "format:Repair Master Format" "All done. Enjoy."
                    - else:
                        - narrate "format:Repair Master Format" "You don't have that much gold."
                    - zap 'step:Player Seen'
                'Fail':
                    trigger: "/REGEX:.+/"
                    script:
                    - narrate "format:Repair Master Format" "I don't think that's a number. Sorry, I can't work with that."
                    - zap 'step:Player Seen'
            click trigger:
                script:
                - narrate "format:Repair Master Format" "Just say how much gold you want to pay for XP, or anything else to cancel."