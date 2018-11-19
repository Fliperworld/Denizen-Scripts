Using this file to write / store spell ideas while their development is either ongoing or infeasible.

# Elemental spells

## Air magic

* Shockwave
  * Exists, needs modifiers for power added
* Gust
  * Linear force push
* Gustleap
  * Jump forward
  * Dependency: `Gust`
* Gustlaunch
  * Jump up
  * Dependency: `Gust`
* Whirlwind
  * Spin mobs around in small AOE dealing damage
* Hurricane
  * Spin mobs around in large PBAOE radius dealing damage
  * Dependency: `Whirlwind`

## Fire magic

* Singe
  * Amplifies fire damage against singed targets
* Flamebolt
  * Projectile fire spell, hits 1 target
* Flamesurge
  * Greater projectile fire spell, small aoe on strike, ignites targets
  * Dependency: `Flamebolt`
* Lava Wave
  * Conal wave, does damage, minor displacement + slow, ignites targets
* Lava Tsunami
  * Conal wave, does damage, larger displacement + slow, ignites targets
  * Dependency: `Lava Wave`

## Nature magic

* Rootbind
  * Roots targets in a straight line
* Rootsurge
  * Roots targets in a conal wave
  * Dependency: `Rootbind`
* Naturedrain (need better name)
  * Steal health from targets, extra-effective versus rooted targets

## Water magic

* Aquabolt
  * Projectile water spell, hits 1 target
* Aquasurge
  * Greater projectile water spell, small aoe on strike, slows targets
* Typhoon
  * Spin mobs around in a large PBAOE radius dealing damage
  * **Needs dependency and differentiation from `Hurricane`**

# General plans

## Mana

* Allow usage of mana in lieu of redstone whilst wearing a full set of mana-enabling armor
* Mana potions
* Mana regen items / armor / whatever