# This thing handles the dude in the ship at spawn
# @author Wahrheit
# @version 1.2
# @last-updated April 26 2019
# @last-change Add more text

"Swabby":
    type: assignment
    interact scripts:
    - 10 Seafaring
    actions:
        on assignment:
        - teleport npc 'location:<anchor:shipSwabby>'
        - trigger name:proximity toggle:true
        
"Swabby Format":
    type: format
    format: "<dark_green>Swabby<white><&co> <text>"

"Seafaring":
    type: interact
    steps:
        'First Timer*':
            proximity trigger:
                entry:
                    script:
                    - narrate "format:Swabby Format" "Rise and shine, <player.name>! We made it to Dawn's Landing."
                    - adjust <player> "show_boss_bar:Right click Swabby to talk to him!"
                    - zap 'step:Visited'
            click trigger:
                script:
                - narrate "format:Swabby Format" "You came here to build a new life for yourself, right?"
                - adjust <player> "show_boss_bar:Say '<green>1<white>' in chat to select the quest, then '<green>yes<white>' accept it, or '<red>no<white>' to decline."
                - wait 0.7s
                - narrate "format:Swabby Format" "I can't think of a better place to do it."
                - wait 0.7s
                - narrate "format:Swabby Format" "We call these lands Prosperus. As the name implies, every day is full and bright."
                - wait 0.7s
                - narrate "format:Swabby Format" "You've got a heck of an adventure ahead of you."
                - wait 0.7s
                - narrate "format:Swabby Format" "If you want to get out of town and start your adventure right away, there are boats over on that dock."
                - wait 0.7s
                - narrate "format:Swabby Format" "There are all kinds of ways out of the valley, but the river is the quickest, and a boat will take you damn near anywhere."
                - wait 0.7s
                - narrate "format:Swabby Format" "If you've got some time before you go, mind stopping by the Quest Master for me? I'll make it worth your while."
                - wait 0.7s
                - narrate "format:Swabby Format" "He's not very far, just over there in the Questing Hall. You can see it on the right when you stand on the ship's plank. Just past the inn."
                - wait 10.0s
                - adjust <player> show_boss_bar
        'Visited':
            proximity trigger:
                entry:
                    script:
                    - narrate "format:Swabby Format" "Hey there, <player.name>! Hope your adventure is going well!"
                    - adjust <player> "show_boss_bar:Right click an NPC to talk to them!"
                    - wait 0.7s
                    - narrate "format:Swabby Format" "If you've got some time before you go, mind stopping by the Quest Master for me? I'll make it worth your while."
                    - wait 0.7s
                    - narrate "format:Swabby Format" "He's not very far, just over there in the Questing Hall. You can see it on the right when you stand on the ship's plank. Just past the inn."
                    - wait 10.0s
                    - adjust <player> show_boss_bar
                exit:
                    script:
                    - narrate "format:Swabby Format" "Happy travels!"
                    - adjust <player> show_boss_bar
            click trigger:
                script:
                - narrate "format:Swabby Format" "If you've got some time before you go, mind stopping by the Quest Master for me? I'll make it worth your while."
                - adjust <player> "show_boss_bar:Say '<green>1<white>' in chat to select the quest, then '<green>yes<white>' accept it, or '<red>no<white>' to decline."
                - wait 0.7s
                - narrate "format:Swabby Format" "He's not very far, just over there in the Questing Hall. You can see it on the right when you stand on the ship's plank. Just past the inn."
                - wait 10.0s
                - adjust <player> show_boss_bar
        'Visited and Done':
            proximity trigger:
                entry:
                    script:
                    - narrate "format:Swabby Format" "Hey, niuce to see you <player.name>! How's that adventure going?"
                    - wait 0.7s
                    - narrate "format:Swabby Format" "You met the Quest Master, right? Done all those quests? Bet you can find some more to do."
                    - wait 0.7s
                    - narrate "format:Swabby Format" "If you need some inspiration, why not ask your fellow adventurers?"
                exit:
                    script:
                    - narrate "format:Swabby Format" "Happy travels!"
