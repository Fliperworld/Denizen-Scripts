# Scratchpad

Stuff I come up with on lunch breaks.

## Mobs

### Elites

#### Spider
* Web shot 
  * Modifies some air blocks to cobwebs
* Leap
* Web grab
  * Pull players

#### Wind Cultist
* Gustlaunch players
* Shockwave players
* Summon air familiar

#### Water Cultist
* Heal mobs (regen)
* Rally & speed boost
* Summon water familiar
* Tidal wave

#### Fire Cultist
* Fire Aura
* Summon fire familiar
* Firestorm
* Flamesurge

#### Nature Cultist
* Heal mobs (burst)
* Rally & shield
* Rootsurge
* Summon nature familiar

## Skills and spells

### Super ideas

#### Sandstorm
PBAOE
Remains at cast location
Applies slow pulse to entities within
- Need logic for sand swirl particles; circling waves?
Modify blocks in radius to sand temporarily?
Draw towards middle?

#### Ice Storm
Cone AOE
Multi cast
Increased damage and slow on successive casts
Slow duration rather long
Return energy for slowed target death?

#### Headshot
Headshots deal 300% damages
Restore energy on kill

#### Impenetrable
No knockback, increased armor, decreased damage

#### Live Wire
Explode after 10s
Increased speed

#### Battle Soul
Grant +dmg to ally
Heal from % ally dmg

#### Swirl of blades
Spin around dealing damage

#### Hundred blades
Successive hits +dmg

#### Crashing wave
Geyser up, wave outward
Pushes mobs away + damages
Ice platform 10s

#### Fleet-footed
Velocity on jump / right click
Speed boost
+dmg in air
Hover while aiming

### Counter-attacks

* `on entity damaged by`
* * `<context.cause>` == `entity_attack`
* * `<context.damager>`

* Skill: Tie to off-hand items?
* Counter-attack spells?

### Attunement spells

* Mana is easy. What about redstone?
* Probably requires Denizen knowing what the costs of the spells are
  * Could do this via manually making a list in Denizen or maybe just wait for MagicSpells 4.0

### "Elite" spells

* If an Elite spell is on cooldown, no other Elite spell may be cast

### More magic stuff to flesh out later

* What is this element bad at?
* What is this element good at?
* What is this element the best at (i.e. better than any other element at)?

## Etc

* MobArena with MythicMobs that uses the players' equipped inventories so they can practice combat
  * Requires writing a Denizen script to cancel drops / money mobs in the arena
  
* Do this but better: https://www.spigotmc.org/resources/mobhunting.3582/

### Pocket realms for gold and redstone farming

#### Summary
  * Summoning scroll or whatever drops from elite mobs, activate to bring you and 2 others
  * Mobs that drop resources and a boss at the end
  * Maybe blocks to mine
  * Time limit - choose between mining and combat or work together and do both
#### Redstone progress
  * Tileset ![Progress](http://progressed.io/bar/60)
    * Tileset design ![Progress](http://progressed.io/bar/80)
    * Generation / implementation ![Progress](http://progressed.io/bar/0)
  * Mobs ![Progress](http://progressed.io/bar/0)
    * Veterans ![Progress](http://progressed.io/bar/0)
    * Elites ![Progress](http://progressed.io/bar/0)
    * Boss ![Progress](http://progressed.io/bar/0)
  * Items ![Progress](http://progressed.io/bar/0)
  * Scripts ![Progress](http://progressed.io/bar/0)
    * Player teleportation ![Progress](http://progressed.io/bar/0)
    * Timer ![Progress](http://progressed.io/bar/0)

## Introduction rework

* Key concept - first ten minutes

* Hint at skill trainer locations

* Force user to open book
