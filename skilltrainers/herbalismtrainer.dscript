# This thing lets players pay for XP in herbalism if you have mcMMO
# @author Wahrheit
# @version 2.0
# @last-updated December 29th 2017

"Herbalism Master":
    type: assignment
    interact scripts:
    - 10 Herbalism
    actions:
        on assignment:   
        - teleport npc <npc.anchor[herbalismmaster]>
        - trigger name:proximity toggle:true
        - trigger name:chat toggle:true
    
"Herbalism Master Format":
    type: format
    format: "<gray>Veteran Farmer<white><&co> <text>"

"Herbalism":
    type: interact
    steps:
        'Player Seen*':
            proximity trigger:
                entry:
                    script:
                    - narrate "format:Herbalism Master Format" "Hello young farmer! Want to learn about herbalism? I'll teach you the ways of life. Right click me."
                exit:
                    script:
                    - narrate "format:Herbalism Master Format" "Happy harvest!"
            click trigger:
                script:
                - narrate "format:Herbalism Master Format" "Alright, let's get you some training. I'll give you 100 Herbalism XP for 1 gold. Say how much gold you want to spend, or anything else to cancel."
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
                        - narrate "format:Herbalism Master Format" "Okay, let's get you trained up."
                        - execute as_server "addxp <player.name> herbalism <player.flag[ChosenAmount].mul[100]||0>"
                        - announce to_console "ran command 'addxp <player.name> herbalism <player.flag[ChosenAmount].mul[100]||0>'"
                        - take money qty:<player.flag[ChosenAmount]>
                        - flag player ChosenAmount:!
                        - narrate "format:Herbalism Master Format" "All done. Enjoy." 
                    }
                    else
                    {
                        - narrate "format:Herbalism Master Format" "You don't have that much gold."
                    }
                    - zap 'step:Player Seen'
                'Fail':
                    trigger: "/REGEX:.+/"
                    script:
                    - narrate "format:Herbalism Master Format" "I don't think that's a number. Sorry, I can't work with that."
                    - zap 'step:Player Seen'
            click trigger:
                script:
                - narrate "format:Herbalism Master Format" "Just say how much gold you want to pay for XP, or anything else to cancel."