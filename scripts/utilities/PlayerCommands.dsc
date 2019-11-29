# https://one.denizenscript.com/denizen/lngs/command%20script%20containers
TowerOfTheGodsCommand:
    type: command
    name: godstower
    description: Warp to the Tower of the Gods parkour course.
    usage: /godstower
    aliases:
    - towerofthegods
    permission: denizen.godstower
    permission message: "Sorry, you can't warp to the Tower of the Gods!"
    script:
    - execute as_server "warp <player.name> godstower"
    - narrate "<green>Welcome to the Tower of the Gods! You can get back to the main world with the '<proc[msgcommand].context[<aqua>/spawn|spawn|<aqua>/spawn]><green>' command."
DeathTowerCommand:
    type: command
    name: deathtower
    description: Warp to the Death Tower parkour course.
    usage: /deathtower
    aliases:
    - towerofdeath
    permission: denizen.deathtower
    permission message: "Sorry, you can't warp to the Death Tower!"
    script:
    - execute as_server "warp <player.name> deathtower"
    - narrate "<green>Welcome to the Death Tower! You can get back to the main world with the '<proc[msgcommand].context[<aqua>/spawn|spawn|<aqua>/spawn]><green>' command."
BoatRace1Command:
    type: command
    name: boatrace-1
    description: Warp to the Suicune boat race.
    usage: /boatrace-1
    aliases:
    - boatrace
    permission: denizen.boatrace-1
    permission-message: "Sorry, you can't warp to the boat race!"
    script:
    - execute as_server "warp <player.name> boatrace-1"
    - wait 20t
    - execute as_server "give <player.name> boat"
    - narrate "<green>Welcome to the Suicune boat race!"
BoatRace2Command:
    type: command
    name: boatrace-2
    description: Warp to the frozen caves boat race.
    usage: /boatrace-2
    permission: denizen.boatrace-2
    permission-message: "Sorry, you can't warp to the boat race!"
    script:
    - execute as_server "warp <player.name> boatrace-2"
    - wait 20t
    - execute as_server "give <player.name> boat"
    - narrate "<green>Welcome to the frozen caves boat race!"
HelpCommand:
    type: command
    name: help
    description: Get some information about the server and helpful commands.
    usage: /help
    aliases:
    - ?
    - helpme
    script:
    - narrate "<gold>-=<aqua><&n>Useful Commands<gold>=-"
    - narrate ""
    - narrate "<proc[msgcommand].context[<aqua>/spawn|spawn|<aqua>/spawn]><white> - Go to spawn. No mobs, and useful things nearby."
    - narrate "<proc[msgcommand].context[<aqua>/sethome|sethome|<aqua>/sethome]><white> - Set your home. Use <aqua>/home<white> later to go back."
    - narrate "<proc[msgcommand].context[<aqua>/money|money|<aqua>/money]><white> - View your gold balance. Use <aqua>/money help <white> to view more commands."
    - narrate "<proc[msgcommand].context[<aqua>/ftw|ftw|<aqua>/ftw]><white> - View your available warps. Use <aqua>/ftw warpname<white> to go there. Find more to unlock them."
    - narrate "<proc[msgcommand].context[<aqua>/pa list|pa list|<aqua>/pa list]><white> - List of PVP Arenas. Use <aqua>/pa arenaname<white> to join."
    - narrate "<proc[msgcommand].context[<aqua>/ma arenas|ma arenas|<aqua>/ma arenas]><white> - List of Mob Arenas. Use <aqua>/ma join arenaname<white> to join. CASE SENSITIVE."
    - narrate "<proc[msgcommand].context[<aqua>/map|map|<aqua>/map]><white> - Get a link to the live map. Sign in to see yourself."
    - narrate "<proc[msgcommand].context[<aqua>/deathtower|deathtower|<aqua>/deathtower]><white> - Go to our hard-tier parkour course."
    - narrate "<proc[msgcommand].context[<aqua>/godstower|godstower|<aqua>/godstower]><white> - Go to our insane-tier parkour course."
    - narrate "<proc[msgcommand].context[<aqua>/lwc|lwc|<aqua>/lwc]><white> - View information on locking your chests."
    - narrate "<proc[msgcommand].context[<aqua>/where|where|<aqua>/where]><white> - View your coordinates and orientation N/S/E/W."
    - narrate "<proc[msgcommand].context[<aqua>/quests|quests|<aqua>/quests]><white> - View commands for managing your quests. You can also see the quests you're currently on with <aqua>/quest<white>."
    - narrate ""
    - narrate "<aqua><&o>Need more help?<&r><aqua> Join the forums at <proc[msgUrl].context[<green>http://summaxr.com|summaxr.com|<green>Click me!]><aqua>!"
MapCommand:
    type: command
    name: map
    description: Get a link to our online map.
    usage: /map
    script:
    - narrate "<gold>-=<aqua><&n>Online World Map<gold>=-"
    - narrate ""
    - narrate "<white>Click the link below to check out our live map - the world is huge!"
    - narrate ""
    - narrate "<proc[msgUrl].context[<green>http://mc.summaxr.com|mc.summaxr.com|<green>Click me!]>"
RanksCommand:
    type: command
    name: ranks
    description: Get information about our server ranks.
    usage: /ranks
    script:
    - narrate "<gold>-=<aqua><&n>Server Ranks<gold>=-"
    - narrate ""
    - narrate "Our world has a wide range of ranks available for its adventurers to achieve. As you rank up, you get new abilities and become even more powerful and prestigious."
    - narrate ""
    - narrate "<aqua>For a list of ranks<white> and how to get them, please visit: <proc[msgUrl].context[<green>http://summaxr.com/mcranks|summaxr.com/mcranks|<green>Click me!]>"
PatreonCommand:
    type: command
    name: patreon
    description: Get information about Patreon.
    usage: /patreon
    script:
    - narrate "<gold>-=<aqua><&n>Patreon<gold>=-"
    - narrate ""
    - narrate "Please consider backing us on Patreon if you enjoy the server! As we reach goals, perks are unlocked for all players on the server!"
    - narrate ""
    - narrate "<aqua>To learn more and become a Patron,<white> please visit: <proc[msgUrl].context[<green>https://patreon.com/summacrossroads|patreon.com/summacrossroads|<green>Click me!]>"
GoldCommand:
    type: command
    name: gold
    description: Check your gold balance. Alias for /money.
    usage: /gold
    script:
    - execute as_player "money <context.raw_args>"
BalanceCommand:
    type: command
    name: balance
    description: Check your gold balance. Alias for /money.
    usage: /balance
    script:
    - execute as_player "money <context.raw_args>"
RankupCommand:
    type: command
    name: rankup
    description: Check the requirements to earn the next rank.
    usage: /rankup
    script:
    - if <player.in_group[Knight]>:
        - narrate "<&a>Congratulations, you're already at the highest rank currently achievable!"
    - else if <player.in_group[Apprentice]>:
        - narrate "<&a>You're currently an <&b>Apprentice<&a>! Here are the requirements to level up to <&b>Knight<&a><&co>"
        - execute as_player "ar track 1"
        - execute as_player "ar track 2"
        - execute as_player "ar track 3"
        - execute as_player "ar track 4"
        - execute as_player "ar track 5"
    - else if <player.in_group[Squire]>:
        - narrate "<&a>You're currently a <&b>Squire<&a>! Here are the requirements to level up to <&b>Apprentice<&a><&co>"
        - execute as_player "ar track 1"
        - execute as_player "ar track 2"
        - execute as_player "ar track 3"
        - execute as_player "ar track 4"
        - execute as_player "ar track 5"
    - else if <player.in_group[Page]>:
        - narrate "<&a>You're currently a <&b>Page<&a>! Here are the requirements to level up to <&b>Squire<&a><&co>"
        - execute as_player "ar track 1"
        - execute as_player "ar track 2"
        - execute as_player "ar track 3"
        - execute as_player "ar track 4"
        - execute as_player "ar track 5"
    - else if <player.in_group[Youngling]>:
        - narrate "<&a>You're currently a <&b>Youngling<&a>! Here are the requirements to level up to <&b>Page<&a><&co>"
        - execute as_player "ar track 1"
        - execute as_player "ar track 2"
        - execute as_player "ar track 3"
        - execute as_player "ar track 4"
GetNewPlayerBookCommand:
    type: command
    name: newplayerguide
    description: View the New Player Guide.
    usage: /newplayerguide
    script:
    - adjust <player> show_book:i@NewPlayerBook