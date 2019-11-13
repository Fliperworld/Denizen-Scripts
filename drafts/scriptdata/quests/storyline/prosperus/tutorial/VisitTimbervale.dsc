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
    material: paper
messages:
    offer: "<darkgreen>Dawn Postmaster<white>: We need a package delivered to the post office in Timbervale! Can you take care of it? Be sure to find and unlock the waypoint while you're there! You can find it here: <&a>http://bit.ly/2vHnIdH"
    completion: "<darkgreen>Dawn Postmaster<white>: Thanks so much! Here's a little payment for your hard work."
player_data:
    VisitTimbervale:
        name: Visit Timbervale
        description: "The Postmaster in Dawn's Landing gave you a package to be delivered to Timbervale. Head there and deliver it to the Timbervale Postmaster. You can find Timbervale here: <&a>http://bit.ly/2vHnIdH"
        stages:
            1:
                description: "Reach the Timbervale Post Office"
                objectives:
                    1:
                        name: "Speak to the Timbervale Postmaster"
                        progress: 0
                        total: 1
                progress: 0
                total: 1