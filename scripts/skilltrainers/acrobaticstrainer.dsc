"Acrobatics Master":
    type: assignment
    interact scripts:
    - 10 Acrobatics
    actions:
        on assignment:
        - teleport npc <npc.anchor[acrobaticsmaster]>
        - trigger name:proximity toggle:true
        - trigger name:chat toggle:true
    
"Acrobatics Master Format":
    type: format
    format: "<gray>Top Acrobat<white><&co> <text>"

"Acrobatics":
    type: interact
    steps:
        'Player Seen*':
            proximity trigger:
                entry:
                    script:
                    - narrate "format:Acrobatics Master Format" "Hello spry one! Want to learn about acrobatics? I'll get you extra fit. Right click me."
                exit:
                    script:
                    - narrate "format:Acrobatics Master Format" "Have a good one!"
            click trigger:
                script:
                - narrate "format:Acrobatics Master Format" "Alright, let's get you some training. I'll give you 100 Acrobatics XP for 1 gold. Say how much gold you want to spend, or anything else to cancel."
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
                        - narrate "format:Acrobatics Master Format" "Okay, let's get you trained up."
                        - execute as_server "addxp <player.name> acrobatics <player.flag[ChosenAmount].mul[100]||0>"
                        - announce to_console "ran command 'addxp <player.name> acrobatics <player.flag[ChosenAmount].mul[100]||0>'"
                        - take money qty:<player.flag[ChosenAmount]>
                        - flag player ChosenAmount:!
                        - narrate "format:Acrobatics Master Format" "All done. Enjoy."
                    - else:
                        - narrate "format:Acrobatics Master Format" "You don't have that much gold."
                    - zap 'step:Player Seen'
                'Fail':
                    trigger: "/REGEX:.+/"
                    script:
                    - narrate "format:Acrobatics Master Format" "I don't think that's a number. Sorry, I can't work with that."
                    - zap 'step:Player Seen'
            click trigger:
                script:
                - narrate "format:Acrobatics Master Format" "Just say how much gold you want to pay for XP, or anything else to cancel."