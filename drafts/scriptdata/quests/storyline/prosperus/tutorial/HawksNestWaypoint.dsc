config:
    availability:
        offering_npc: 70
    requirements:
        quests_completed:
        - "VisitHawksNest"
    rewards:
        money: 50
        quest_points: 1
    material: compass
messages:
    offer: "<darkgreen>Hawk Postmaster<white>: Now that you're here, why don't you go find the town's waypoint? Once you unlock it, you can visit whenever you like."
    completion: "<darkgreen>Hawk Postmaster<white>: Great job! Use /ftw to view the waypoints you've unlocked. To return to Hawk's Nest at any time, just type /ftw hawksnest."
player_data:
    HawksNestWaypoint:
        name: Unlock the Hawk's Nest waypoint
        description: "Go find the Hawk's Nest waypoint. Once you've reached it, you can return to it any time."
        stages:
            1:
                description: "Find the Hawk's Nest waypoint."
                objectives:
                    1:
                        name: "Reach the waypoint"
                        progress: 0
                        total: 1
                progress: 0
                total: 1