Using this file to write / store spell ideas while their development is either ongoing or infeasible.

<!-- New spec format -->

<!--- ### New spec

#### Offensive

##### Direct cast

##### Enchants

#### Defensive

##### Direct cast

##### Enchants

#### Utility

##### Direct cast

##### Enchants--->

# Elemental spells

## Air magic

### Base spec

#### Offensive

##### Direct cast

* Whirlwind
  * Spin mobs around in small targeted AOE dealing damage
  * Scales: AOE, damage, duration
* Hurricane
  * Spin mobs around in large PBAOE radius dealing damage
  * Dependency: `Whirlwind`
  * Scales: AOE, damage, duration

##### Enchants

* Enchant arrows: Air
  * Arrows have no gravity / travel directly to the target
  * Scales: Range, arrow speed, enchant duration

#### Utility

##### Direct cast

* Shockwave
  * Exists, needs modifiers for power added
  * Scales: Velocity, range
* Gust
  * Linear force push
  * Scales: Range, velocity
  * *Deployed*
* Gustleap
  * Jump forward
  * Dependency: `Gust`
  * Scales: Velocity (range)
  * *Deployed*
* Gustlaunch
  * Jump up
  * Dependency: `Gust`
  * Scales: Velocity (range)
  * *Deployed*
  
### Lightning spec

#### Offensive

##### Direct cast

* Lightning Javelin
  * Inspired by [Guild Wars](https://wiki.guildwars.com/wiki/Lightning_Javelin) skill of the same name

##### Enchants



#### Defensive

##### Direct cast
* Blinding Flash
  * Inspired by [Guild Wars](https://wiki.guildwars.com/wiki/Blinding_Flash) skill of the same name

<!--##### Enchants-->

#### Utility

<!--##### Direct cast-->

##### Enchants

* Storm Haste
  * Inspired by [Guild Wars](https://wiki.guildwars.com/wiki/Storm_Djinn%27s_Haste) skill

## Fire magic

### Base spec

#### Offensive

##### Direct cast

* Singe
  * Amplifies fire damage against singed targets
  * Scales: Duration, amplifier
  * (Probably) Infeasible until multiplier system is in effect
* Flamebolt
  * Projectile fire spell, hits 1 target
  * Scales: Range, damage
  * *Deployed*
  * Rank: Page
* Flamesurge
  * Greater projectile fire spell, small AOE on strike, ignites targets
  * Dependency: `Flamebolt`
  * Scales: Range, damage, AOE, ignite duration
  * *Deployed*
  * Rank: Squire
* Searing Flames
  * PBAOE, exhausts flames on burning targets to deal high damage
  * Scales: Range, damage
  * *Deployed*
  * Rank: Apprentice
* Firestorm
  * PBAOE, ignites targets, high damage
  * Scales: Range, ignite duration, damage
  * Rank: Apprentice

##### Enchants

* Enchant arrows: Fire
  * Arrows ignite (+ singe?)
  * Scales: Ignite duration, enchant duration
  * Rank: Page

### Magma spec

#### Offensive

##### Direct cast

* Lava Wave
  * Conal wave, does damage, minor displacement + slow, ignites targets
  * Scales: Range, damage, displacement, slow, ignite duration
* Lava Tsunami
  * Conal wave, does damage, larger displacement + slow, ignites targets
  * Dependency: `Lava Wave`
  * Scales: Range, damage, displacement, slow, ignite duration
* Magma bomb
  * Lobbed projectile, AOE impact, high damage, ignites targets, explodes
  * Scales: Range, AOE, damage, ignite duration, explosion radius

## Nature magic

### Base spec

#### Offensive

##### Direct cast

* Rootbind
  * Roots targets in a straight line
  * Scales: Range, root duration
  * *Deployed*
  * Rank: Page
* Rootsurge
  * Roots targets in a conal wave
  * Dependency: `Rootbind`
  * Scales: Range, root duration
  * *Deployed*
  * Rank: Squire
* Naturedrain (need better name)
  * Steal health from targets, extra-effective versus rooted targets
  * Scales: Damage, drain, root amplifier
  * Rank: Apprentice

##### Enchants

* Enchant arrows: Nature
  * Arrows briefly root on hit
  * Scales: Root duration, enchant duration
  * *Deployed*
  * Rank: Page

#### Defensive

* Nature Shield (need better name)
  * Shield target/self + heal damage taken
  * Possible to heal damage taken in last number of seconds? Maybe not
  * Scales: Shield amount, shield duration, healing

### Earth spec

#### Offensive

##### Direct cast

##### Enchants

#### Defensive

##### Direct cast

##### Enchants

#### Utility

##### Direct cast

##### Enchants

## Water magic

### Base spec

#### Offensive

##### Direct cast

* Aquabolt
  * Projectile water spell, hits 1 target
  ** Scales: Range, damage
  * Rank: Page
* Aquasurge
  * Greater projectile water spell, small aoe on strike, slows targets
  * Scales: Range, AOE, damage
  * Rank: Squire
* Typhoon
  * Spin mobs around in a large PBAOE radius dealing damage
  * **Needs dependency and differentiation from `Hurricane`**
  * Scales: Radius, duration, damage

##### Enchants

* Enchant arrows: Water
  * TODO: Arrows... do... something...

#### Defensive

* Soothing Mist
  * PBAOE, heal allies in area, pulses 3 times
  * Scales: Healing, # of pulses
  * Rank: Squire
* Drench (name subject to change)
  * PBAOE, allies gain burning immunity + fire magic resistance
  * Scales: Duration, fire magic resistance
  * Rank: Squire

### Frost spec

* Enemies with `frost` are slowed and take extra damage from spells that apply `frost`. Their `frost` duration is refreshed by the new spell.
  * Scales: Duration, amplifier
  * **Any spell with `applies frost` has multiplier scaling for `frost`
  * TODO: Separate frost-spec multiplier?

#### Offensive

##### Direct cast

* Frostbolt
  * Projectile water spell, damages, hits 1 target, applies frost
  * Scales: Range, damage
* Cone of Frost (name subject to change)
  * Conal blast, damages, applies frost
  * Scales: Range, damage
* Frostshock
  * PBAOE, removes frost, stuns, high damage to affected targets
  * Scales: Range, damage, stun duration
* Hail
  * PBAOE, applies frost, 3 rounds of damage
  * Scales: Range, damage, # of pulses
* Hailstorm
  * Large targeted AOE, applies frost, 3 rounds of damage
  * Scales: Range, AOE, damage, # of pulses

##### Enchants

* Enchant arrows: Frost
  * Arrows apply frost
  * Scales: Enchant duration

#### Defensive

##### Direct cast

* Iceblock
  * Already exists
  * Scales: Duration

### (Placeholder healling) spec

#### Offensive

##### Direct cast

##### Enchants

#### Defensive

##### Direct cast

##### Enchants

#### Utility

##### Direct cast

##### Enchants

# Non-elemental (?) spells

## Holy magic

### Base spec

#### Offensive

##### Direct cast

##### Enchants

#### Defensive

##### Direct cast

##### Enchants

#### Utility

##### Direct cast

### Smite spec

#### Offensive

##### Direct cast

##### Enchants

#### Defensive

##### Direct cast

##### Enchants

#### Utility

##### Direct cast

### Protection spec

#### Offensive

##### Direct cast

##### Enchants

#### Defensive

##### Direct cast

##### Enchants

#### Utility

##### Direct cast

### Healing spec

#### Offensive

##### Direct cast

##### Enchants

#### Defensive

##### Direct cast

##### Enchants

#### Utility

##### Direct cast

## Dark magic

### Base spec

#### Offensive

##### Direct cast

##### Enchants

#### Defensive

##### Direct cast

##### Enchants

#### Utility

##### Direct cast

### Blood spec

#### Offensive

##### Direct cast

##### Enchants

#### Defensive

##### Direct cast

##### Enchants

#### Utility

##### Direct cast

### Death spec

#### Offensive

##### Direct cast

##### Enchants

#### Defensive

##### Direct cast

##### Enchants

#### Utility

##### Direct cast

# General plans

## Mana

* Allow usage of mana in lieu of redstone whilst wearing a full set of mana-enabling armor
* Mana potions
* Mana regen items / armor / whatever
