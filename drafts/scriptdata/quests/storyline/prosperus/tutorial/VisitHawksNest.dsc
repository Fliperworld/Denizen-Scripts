config:
    availability:
        offering_npc: 63
    requirements:
        quests_completed:
        - "MeetPostmaster"
    rewards:
        money: 100
        quest_points: 3
        items:
        - diamond[quantity=3]
messages:
    offer: "<darkgreen>Dawn Postmaster<white>: We need a package delivered to the post office in Hawk's Nest! Can you take care of it? Be sure to find and unlock the waypoint while you're there! You can find it here: <&a>http://bit.ly/1tA3mLm"
    completion: "<darkgreen>Dawn Postmaster<white>: Thanks so much! Here's a little payment for your hard work."
player_data:
    VisitHawksNest:
        name: Visit Hawk's Nest
        description: "The Postmaster in Dawn's Landing gave you a package to be delivered to Hawk's Nest. Head there and deliver it to the Hawk's Nest Postmaster. You can find Hawk's Nest here: <&a>http://bit.ly/1tA3mLm"
        stages:
            1:
                description: "Reach the Hawk's Nest Post Office"
                objectives:
                    1:
                        name: "Speak to the Hawk's Nest Postmaster"
                        progress: 0
                        total: 1
                progress: 0
                total: 1