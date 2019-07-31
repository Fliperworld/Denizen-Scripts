# This thing handles the main quest line, at least for now
# @author Wahrheit
# @version 3.0
# @last-updated May 18 2019

QuestMasterAssignment:
    type: assignment
    interact scripts:
    - 10 Newbie
    actions:
        on assignment:
        - teleport npc 'location:<anchor:questmaster>'
        - trigger name:proximity toggle:true
    
QuestMasterFormat:
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
                - zap script:Newbie step:General-Dialogue player:<player>

Newbie:
    type: interact
    steps:
        Greeting*:
            proximity trigger:
                entry:
                    script:
                    - if <player.has_flag[QuestMasterSeen]>:
                        - zap GeneralDialogue
                    - narrate format:QuestMasterFormat "Welcome to the Questing Hall, <player.name>! The folks here have a variety of quests that you can complete to help out our citizens."
                    - wait 0.7s
                    - narrate format:QuestMasterFormat "I've got a series of quests, too, that will help ease you into your adventure. I'll even toss you a little coin for your efforts, as well as a few other surprise bonuses."
                    - if <player.flag[npccount]||0>  == 8:
                        - run FoundAllDiamonds instantly
                    - if <player.flag[npccount]||0> < 8 && <player.flag[npccount]||0> > 0:
                        - run FoundSomeDiamonds instantly
                    - zap GeneralDialogue
        GeneralDialogue:
            proximity trigger:
                entry:
                    script:
                    - define data <player.uuid>_quest_data
                    - if <player.has_flag[QuestMasterSeen].not>:
                        - narrate format:QuestMasterFormat "Well hello there, <player.name>! Nice to meet you."
                        - flag player QuestMasterSeen:true
                    - else:
                        - narrate format:QuestMasterFormat "Good to see you, <player.name>!"
                    - wait 0.7s
                    # Swabby package quest active
                    - if <yaml[<[data]>].contains[quests.active.SwabbyDelivery]>:
                        - narrate format:QuestMasterFormat "Have you got something for me?"
                        - wait 0.5s
                        - title "subtitle:<&a>Right click the Quest Master!"
                        - zap SwabbyDeliveryActive
                    # Wood tools quest offer
                    - else if <yaml[<[data]>].contains[quests.completed.SwabbyDelivery]> && <yaml[<[data]>].contains[quests.active.WoodTools].not> && <yaml[<[data]>].contains[quests.completed.WoodTools].not>:
                        - narrate format:QuestMasterFormat "Thanks for delivering that package from Swabby!"
                        - wait 0.7s
                        - narrate format:QuestMasterFormat "Say, I think you're ready for something more exciting. How about it?"
                        - wait 0.7s
                        - narrate format:QuestMasterFormat "I've got your first real get-out-in-the-world quest for you as soon as you're ready."
                        - if <yaml[<[data]>].contains[quests.active.SetHome].not> && <yaml[<[data]>].contains[quests.completed.SetHome].not>:
                            - wait 0.7s
                            - narrate format:QuestMasterFormat "I can also teach you how to set a home! It's an important skill for surviving out there."
                        - zap WoodToolsOffer
                    # Wood tools quest active
                    - else if <yaml[<[data]>].contains[quests.active.WoodTools]>:
                        - narrate format:QuestMasterFormat "How's it going with getting those wood tools?"
                        - wait 0.7s
                        - narrate format:QuestMasterFormat "Don't forget, you can get boats from the docks and sail down the river to get out of Dawn's Landing quickly."
                        - zap WoodtoolsActive
                    # Mining quest offer
                    - else if <yaml[<[data]>].contains[quests.completed.WoodTools]> && <yaml[<[data]>].contains[quests.active.StoneTools].not> && <yaml[<[data]>].contains[quests.completed.StoneTools].not>:
                        - narrate format:QuestMasterFormat "You did a great job getting those wooden tools! Ready to put them to use?"
                        - zap StoneToolsOffer
                    # Mining quest active
                    - else if <yaml[<[data]>].contains[quests.active.StoneTools]>:
                        - narrate format:QuestMasterFormat "You putting those tools to work yet?"
                        - zap StoneToolsActive
                    # Leather quest offer
                    - else if <yaml[<[data]>].contains[quests.completed.StoneTools]> && <yaml[<[data]>].contains[quests.active.LeatherArmor].not> && <yaml[<[data]>].contains[quests.completed.LeatherArmor].not>:
                        - narrate format:QuestMasterFormat "Nice job on that last quest. Now you've got some basic tools, but you're still missing an adventurer's essential. Talk to me for the next quest when you're ready."
                        - zap LeatherArmorOffer
                    # Leather quest active
                    - else if <yaml[<[data]>].contains[quests.active.LeatherArmor]>:
                        - narrate format:QuestMasterFormat "Everything MOOving along?"
                        - wait 0.7s
                        - narrate format:QuestMasterFormat "You can find cows both around Dawn's Landing and all over the world."
                        - wait 0.7s
                        - narrate format:QuestMasterFormat "Just make sure there's some grass around so they show up to munch on it."
                        - zap LeatherArmorActive
                    # Meet Reinwald offer
                    - else if <yaml[<[data]>].contains[quests.completed.LeatherArmor]> && <yaml[<[data]>].contains[quests.active.FindReinwald].not> && <yaml[<[data]>].contains[quests.completed.FindReinwald].not>:
                        - narrate "format:Quest Master Format" "I'm not the only one with quests for you! Why don't you go meet a friend of mine?"
                        - zap FindReinwaldOffer
                    # Meet Reinwald active
                    - else if <yaml[<[data]>].contains[quests.active.FindReinwald]>:
                        - narrate "format:Quest Master Format" "Having a hard time finding Warmaster Reinwald? He's just over in the castle, but maybe you can ask another adventurer for help."
                        - zap FindReinwaldActive
                    # Iron quest offer
                    - else if <yaml[<[data]>].contains[quests.completed.LeatherArmor]> && <yaml[<[data]>].contains[quests.active.IronToolsArmor].not> && <yaml[<[data]>].contains[quests.completed.IronToolsArmor].not>:
                        - narrate "format:Quest Master Format" "You found Reinwald! Nice work."
                        - wait 0.7s
                        - narrate "format:Quest Master Format" "I think you're ready to work on another gear upgrade."
                        - zap IronToolsArmorOffer
                    # Iron quest active
                    - else if <yaml[<[data]>].contains[quests.active.IronToolsArmor]>:
                        - narrate "format:Quest Master Format" "How's that hunt for iron going?"
                        - wait 0.7s
                        - narrate "format:Quest Master Format" "If you're having a rought time finding it just outside the valley, try going further out."
                        - wait 0.7s
                        - narrate "format:Quest Master Format" "Many adventurers have been through these parts! Not so many are brave enough to cross the oceans to the other continents, though. I reckon you've got what it takes."
                        - zap IronToolsArmorActive
                    # Fishing newbie quest offer
                    - else if <yaml[<[data]>].contains[quests.completed.IronToolsArmor]> && <yaml[<[data]>].contains[quests.active.FindFishingNewbie].not> && <yaml[<[data]>].contains[quests.completed.FindFishingNewbie].not>:
                        - narrate "format:Quest Master Format" "You've been hard at work. Why don't you go find that kid on the docks and teach him how to fish?"
                        - zap FindFishingNewbieOffer
                    # Fishing newbie quest active
                    - else if <yaml[<[data]>].contains[quests.active.FindFishingNewbie]>:
                        - narrate "format:Quest Master Format" "Did you find that kid yet? He's just down by the docks."
                        - zap FindFishingNewbieActive
                    # Skill trainer offer
                    - else if <yaml[<[data]>].contains[quests.completed.FindFishingNewbie]> && <yaml[<[data]>].contains[quests.active.MeetSkillTrainers].not> && <yaml[<[data]>].contains[quests.completed.MeetSkillTrainers].not>:
                        - narrate "format:Quest Master Format" "Did you know there are skill trainers around Dawn's Landing?"
                        - zap MeetSkillTrainersOffer
                    # Skill trainer active
                    - else if <yaml[<[data]>].contains[quests.active.MeetSkillTrainers]>:
                        - narrate "format:Quest Master Format" "Having trouble finding those skill trainers?"
                        - wait 0.7s
                        - narrate "format:Quest Master Format" "Lucky for you, I wrote a little book with directions."
                        - wait 0.7s
                        - adjust <player> show_book:i@SkillTrainerBook
                        - zap MeetSkillTrainersActive
                    # Meet Postmaster offer
                    - else if <yaml[<[data]>].contains[quests.completed.MeetSkillTrainers]> && <yaml[<[data]>].contains[quests.active.MeetPostmaster].not> && <yaml[<[data]>].contains[quests.completed.MeetPostmaster].not>:
                        - narrate "format:Quest Master Format" "Did you know we have a post office?"
                        - zap MeetPostmasterOffer
                    # Meet Postmaster active
                    - else if <yaml[<[data]>].contains[quests.active.MeetPostmaster]>:
                        - narrate "format:Quest Master Format" "The post office is just around the corner from here."
                        - zap MeetPostmasterActive
                    # Go talk to Reinwald for first mob hunting quest
                    - else if <yaml[<[data]>].contains[quests.completed.MeetPostmaster]> && <yaml[<[data]>].contains[quests.active.FirstMobHunting].not> && <yaml[<[data]>].contains[quests.completed.FirstMobHunting].not>:
                        - narrate "format:Quest Master Format" "You know, I reckon Reinwald has a quest for you."
                        - zap FirstMobHuntingOffer_QM
                    # Player has Reinwald mob hunting quest
                    - else if <yaml[<[data]>].contains[quests.active.FirstMobHunting]>:
                        - narrate "format:Quest Master Format" "You picked up that quest from Reinwald, eh? Don't forget to wear armor!"
                        - zap FirstMobHuntingActive_QM
                    # No active quest
                    - else:
                        - narrate "format:Quest Master Format" "Look at you, making your way in the world! I'm very proud."
                        - wait 0.7s
                        - narrate "format:Quest Master Format" "There are some quests around here that we could use your help with every so often, so check back regularly."
                        - wait 0.7s
                        - narrate "format:Quest Master Format" "Reinwald and his troops have some similar tasks for you, too, I'm sure."
                        - zap NoActiveQuest
        SwabbyDeliveryActive: