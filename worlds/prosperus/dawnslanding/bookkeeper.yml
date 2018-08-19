# This thing makes the maze marked as complete when you talk to the NPC at the end
# It was written by Wahrheit and you better believe it
# @author Wahrheit
# @version 1.0
# @last-updated December 16 2014

"Bookkeeper Assign":
    type: assignment
    interact scripts:
    - 10 Bookkeeper
    actions:
        on assignment:
        - run "Bookkeeper Assigned" instant
"Bookkeeper Format":
    type: format
    format: "<gray>Bookkeeper<white><&co> <text>"
"Bookkeeper Assigned":
    type: task
    script:
    - teleport npc 'location:<anchor:bookkeeper>'
    - trigger name:proximity toggle:true radius:3
"Library Win":
    type: task
    script:
    - flag global mazeclear:1
    - announce "<green><player.name> has conquered The Grand Library! It is now clear."
    - flag global maze-challenger:!
    - flag global maze-challenger-name:!
"Bookkeeper":
    type: interact
    steps:
        'Victory*':
            click trigger:
                script:
                - if <player.uuid> == <global.flag[maze-challenger]> {
                  - run "Library Win"
                  }