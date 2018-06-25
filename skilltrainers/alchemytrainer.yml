# This thing lets players pay for XP in alchemy if you have mcMMO
# @author Wahrheit
# @version 2.0
# @last-updated December 29th 2017

"Alchemy Master":
    type: assignment
    interact scripts:
    - 10 Alchemy
    actions:
        on assignment:   
        - teleport npc <npc.anchor[alchemymaster]>
        - trigger name:proximity toggle:true
        - trigger name:chat toggle:true
    
"Alchemy Master Format":
    type: format
    format: "<gray>Royal Alchemist<white><&co> <text>"

"Alchemy":
    type: interact
    steps:
        'Player Seen*':
            proximity trigger:
                entry:
                    script:
                    - narrate "format:Alchemy Master Format" "Hello, novice. Want to learn about alchemy? I'll teach you my best brewing techniques. Right click me."
                exit:
                    script:
                    - narrate "format:Alchemy Master Format" "Fare thee well."
            click trigger:
                script:
                - narrate "format:Alchemy Master Format" "Alright, let's get you some training. I'll give you 100 Alchemy XP for 1 gold. Say how much gold you want to spend, or anything else to cancel."
                - zap 'step:Payment'
        'Payment':
            chat trigger:
                'Confirm':
                    trigger: I'd like to pay /REGEX:\d+/ gold.
                    script:
                    - flag player ChosenAmount:<context.message.replace[regex:\D+]>
                    - announce to_console "player.flag[ChosenAmount] equals <player.flag[ChosenAmount]>"
                    - announce to_console "player.money is <player.money>"
                    - if <player.flag[ChosenAmount].is[OR_LESS].than[<player.money>]>
                    {
                        - narrate "format:Alchemy Master Format" "Okay, let's get you trained up."
                        - execute as_server "addxp <player.name> alchemy <player.flag[ChosenAmount].mul[100]||0>"
                        - announce to_console "ran command 'addxp <player.name> alchemy <player.flag[ChosenAmount].mul[100]||0>'"
                        - take money qty:<player.flag[ChosenAmount]>
                        - flag player ChosenAmount:!
                        - narrate "format:Alchemy Master Format" "All done. Enjoy." 
                    }
                    else
                    {
                        - narrate "format:Alchemy Master Format" "You don't have that much gold."
                    }
                    - zap 'step:Player Seen'
                'Fail':
                    trigger: "/REGEX:.+/"
                    script:
                    - narrate "format:Alchemy Master Format" "I don't think that's a number. Sorry, I can't work with that."
                    - zap 'step:Player Seen'
            click trigger:
                script:
                - narrate "format:Alchemy Master Format" "Just say how much gold you want to pay for XP, or anything else to cancel."