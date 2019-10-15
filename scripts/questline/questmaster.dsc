# This thing handles the main quest line, at least for now
# @author Wahrheit
# @version 3.0
# @last-updated May 18 2019

"New Quest Master":
    type: assignment
    interact scripts:
    - 10 Newbie
    actions:
        on assignment:
        - teleport npc 'location:<anchor:questmaster>'
        - trigger name:proximity toggle:true
    
"Quest Master Format":
    type: format
    format: "<dark_green>Quest Master<white><&co> <text>"

FoundSomeDiamonds:
    type: task
    script:
    - narrate "<dark_green>Quest Master<white><&co> Not quite all the Treasure Hunters, but here's what you've earned!"
    - give diamond "qty:<player.flag[npccount]>"
    - give emerald "qty:<player.flag[npccount]>"
    - flag player npccount:0
FoundAllDiamonds:
    type: task
    script:
    - narrate "<dark_green>Quest Master<white><&co> Oh, I see you found all the Treasure Hunters! Here are your rewards!"
    - give diamond qty:8
    - give emerald qty:8
    - give diamond_helmet qty:1
    - give diamond_chestplate qty:1
    - give diamond_leggings qty:1
    - give diamond_boots qty:1
    - flag npccount:0

QuestMasterStepUpdater:
    type: world
    debug: false
    events:
        on player joins:
        - if <s@newbie.step||null> == General-Dialogue:
            - queue clear
        - else:
            - if <s@Newbie.step||null> != Greeting:
                - zap script:Newbie step:General-Dialogue

"Newbie":
    type: interact
    steps:
        'Greeting*':
            proximity trigger:
                entry:
                    script:
                    - narrate "format:Quest Master Format" "Welcome to the Questing Hall, <player.name>! The folks here have a variety of quests that you can complete to help out our citizens."
                    - wait 0.7s
                    - narrate "format:Quest Master Format" "I've got a series of quests, too, that will help ease you into your adventure. I'll even toss you a little coin for your efforts, as well as a few other surprise bonuses."
                    - if <player.flag[npccount]||0>  == 8:
                        - run FoundAllDiamonds instantly
                    - if <player.flag[npccount]||0> < 8 && <player.flag[npccount]||0> > 0:
                        - run FoundSomeDiamonds instantly
                    - zap General-Dialogue
        General-Dialogue:
            proximity trigger:
                entry:
                    script:
                    - if <player.has_flag[QuestMasterSeen].not>:
                        - narrate "format:Quest Master Format" "Well hello there, <player.name>! Nice to meet you."
                        - flag player QuestMasterSeen:true
                    - else:
                        - narrate "format:Quest Master Format" "Good to see you, <player.name>!"
                    - wait 0.7s
                    - if "<player.quests.active_names.contains[Deliver the Swabby's Package to the Quest Master]||null>":
                        - narrate "format:Quest Master Format" "Have you got something for me?"
                        - wait 0.5s
                        - title "subtitle:<&a>Right click the Quest Master!"
                    - else if "<player.quests.completed_names.contains[Deliver the Swabby's Package to the Quest Master]||null>" && "<player.quests.completed_names.contains[Adventurer's toolbox].not>" && "<player.quests.active_names.contains[Adventurer's toolbox].not>":
                        - narrate "format:Quest Master Format" "Thanks for delivering that package from Swabby!"
                        - wait 0.7s
                        - narrate "format:Quest Master Format" "Say, I think you're ready for something more exciting. How about it?"
                        - wait 0.7s
                        - narrate "format:Quest Master Format" "I've got your first real get-out-in-the-world quest for you as soon as you're ready."
                        - wait 0.7s
                        - narrate "format:Quest Master Format" "I can also teach you how to set a home! It's an important skill for surviving out there."
                    - else if "<player.quests.active_names.contains[Adventurer's toolbox]||null>":
                        - narrate "format:Quest Master Format" "How's it going with getting those wood tools?"
                        - wait 0.7s
                        - narrate "format:Quest Master Format" "Don't forget, you can get boats from the docks and sail down the river to get out of Dawn's Landing quickly."
                    - else if "<player.quests.completed_names.contains[Adventurer's toolbox]>" && "<player.quests.active_names.contains[Breaking ground].not>" && "<player.quests.completed_names.contains[Breaking ground].not>":
                        - narrate "format:Quest Master Format" "You did a great job getting those wooden tools! Ready to put them to use?"
                    - else if "<player.quests.active_names.contains[Breaking ground]||null>":
                        - narrate "format:Quest Master Format" "You putting those tools to work yet?"
                    - else if "<player.quests.completed_names.contains[Breaking ground]>" && "<player.quests.active_names.contains[MOOving on up].not>" && "<player.quests.completed_names.contains[MOOving on up].not>":
                        - narrate "format:Quest Master Format" "Nice job on that last quest. Now you've got some basic tools, but you're still missing an adventurer's essential. Talk to me for the next quest when you're ready."
                    - else if "<player.quests.active_names.contains[MOOving on up]||null>":
                        - narrate "format:Quest Master Format" "Everything MOOving along?"
                        - wait 0.7s
                        - narrate "format:Quest Master Format" "You can find cows both around Dawn's Landing and all over the world."
                        - wait 0.7s
                        - narrate "format:Quest Master Format" "Just make sure there's some grass around so they show up to munch on it."
                    - else if "<player.quests.completed_names.contains[MOOving on up]>" && "<player.quests.active_names.contains[Meet Warmaster Reinwald].not>" && "<player.quests.completed_names.contains[Meet Warmaster Reinwald].not>":
                        - narrate "format:Quest Master Format" "I'm not the only one with quests for you! Why don't you go meet a friend of mine?"
                    - else if "<player.quests.active_names.contains[Meet Warmaster Reinwald]||null>":
                        - narrate "format:Quest Master Format" "Having a hard time finding Warmaster Reinwald? He's just over in the castle, but maybe you can ask another adventurer for help."
                    - else if "<player.quests.completed_names.contains[Meet Warmaster Reinwald]>" && "<player.quests.active_names.contains[The iron price].not>" && "<player.quests.completed_names.contains[The iron price].not>":
                        - narrate "format:Quest Master Format" "You found Reinwald! Nice work."
                        - wait 0.7s
                        - narrate "format:Quest Master Format" "I think you're ready to work on another gear upgrade."
                    - else if "<player.quests.active_names.contains[The iron price]||null>":
                        - narrate "format:Quest Master Format" "How's that hunt for iron going?"
                        - wait 0.7s
                        - narrate "format:Quest Master Format" "If you're having a rought time finding it just outside the valley, try going further out."
                        - wait 0.7s
                        - narrate "format:Quest Master Format" "Many adventurers have been through these parts! Not so many are brave enough to cross the oceans to the other continents, though. I reckon you've got what it takes."
                    - else if "<player.quests.completed_names.contains[The iron price]>" && "<player.quests.active_names.contains[Go find the Fishing Newbie].not>" && "<player.quests.completed_names.contains[Go find the Fishing Newbie].not>":
                        - narrate "format:Quest Master Format" "You've been hard at work. Why don't you go find that kid on the docks and teach him how to fish?"
                    - else if "<player.quests.active_names.contains[Go find the Fishing Newbie]||null>":
                        - narrate "format:Quest Master Format" "Did you find that kid yet? He's just down by the docks."
                    - else if "<player.quests.completed_names.contains[Go find the Fishing Newbie]>" && "<player.quests.active_names.contains[Meet the Skill Trainers].not>" && "<player.quests.completed_names.contains[Meet the Skill Trainers].not>":
                        - narrate "format:Quest Master Format" "Did you know there are skill trainers around Dawn's Landing?"
                    - else if "<player.quests.active_names.contains[Meet the Skill Trainers]||null>":
                        - narrate "format:Quest Master Format" "Having trouble finding those skill trainers?"
                        - wait 0.7s
                        - narrate "format:Quest Master Format" "Lucky for you, I wrote a little book with directions."
                        - wait 0.7s
                        - adjust <player> show_book:i@SkillTrainerBook
                    - else if "<player.quests.completed_names.contains[Meet the Skill Trainers]>" && "<player.quests.active_names.contains[Meet the Postmaster].not>" && "<player.quests.completed_names.contains[Meet the Postmaster].not>":
                        - narrate "format:Quest Master Format" "Did you know we have a post office?"
                    - else if "<player.quests.active_names.contains[Meet the Postmaster]||null>":
                        - narrate "format:Quest Master Format" "The post office is just around the corner from here."
                    - else if "<player.quests.completed_names.contains[Meet the Postmaster]>" && "<player.quests.active_names.contains[Cutting your teeth].not>" && "<player.quests.completed_names.contains[Cutting your teeth].not>":
                        - narrate "format:Quest Master Format" "You know, I reckon Reinwald has a quest for you."
                    - else if "<player.quests.active_names.contains[Cutting your teeth]||null>":
                        - narrate "format:Quest Master Format" "You picked up that quest from Reinwald, eh? Don't forget to wear armor!"
                    - else:
                        - narrate "format:Quest Master Format" "Look at you, making your way in the world! I'm very proud."
                        - wait 0.7s
                        - narrate "format:Quest Master Format" "There are some quests around here that we could use your help with every so often, so check back regularly."
                        - wait 0.7s
                        - narrate "format:Quest Master Format" "Reinwald and his troops have some similar tasks for you, too, I'm sure."
                    #- else if "<player.quests.completed_names.contains[]>" && "<player.quests.active_names.contains[].not>" && "<player.quests.completed_names.contains[].not>":
                    #    - narrate "format:Quest Master Format" ""
                    #- else if "<player.quests.active_names.contains[]||null>":
                    #    - narrate "format:Quest Master Format" ""