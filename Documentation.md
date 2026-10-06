# technical documentation
## divison of labour
### veejay
- SFX + music
- level design
- vfx/graphics
- head of team
### Cukr
- 3d modeling
- textures
- UI design
### nevim
- programing
- more programing
- even more programing

## game mechanics
### dynamic body system
The base of the whole skeleton is pelvis, so from it stems upper body and legs.
And also when the player would, for example, crouch the pelvis would move down
and everything else would get into place by the power magic and IK systems.

Each body part has its own health, so when the body part receives some damage,
it will stop working, but still be attached to the body. When it gets even more
damage, it will fall off with all body parts dependent on it.

Some of the body parts are important for the functioning of the robot, like
the head and torso, since they house the main computer and power supply respectively.
And without those the robot cannot function and is essentially dead.

If the robot takes damage to the legs, it will limp. And when one of the legs break, it
will jump on the other one. When both are broken it'll have to use it's hands to move 
around and cannot use them for anything else, like shooting from a gun.

When the arms/hands take damage the aim and handling will worsen. If one breaks/falls off
you cannot use double handed weapons (or maybe can, but with like humongous debuff) and if
both break/fall off, pray you have some fast legs to find replacements.

---

The generic skeletal structure for any robot will be something like this:
```
Skeleton3D
├> (bones)
├> PhysicalBoneSimulator3D
│  └> PhysicalBone3D
│     └> [body part]
└> IK simulators
```
The `(bones)` will need to be imported from blender (or anything else), because godot is
kinda dumb and does not have any bone editor (sad (no I will NOT make something like that)).

Also this skeletal structure **must** be created at "compile time". (Trust me I've tried)

And the body part, the thing that will be changed, will be structured something like this:
```
PhysicalBone3D or RigidBody3D
├> CollisionShape3D
├> MeshInstance3D
└> other data, like modifiers, saved in separate node
```
The body part can be either under PhyiscalBone3D or RigidBody3D, because when it is attached
to a body it *needs* to be under PhysBone, else the IK systems would not work properly.
And when the bone is laying in the world in detached state, it *cannot* be a PhysBone,
because PhysBone requires to be under Skeleton3D, to work properly. So it needs to be
RigidBody.

I don't know how to make some kind of wrapper for the CollShape, MeshInst and the data file,
because CollShape *needs* to be under some kind of derivation of CollisionObject3D
#### upgrades
Upgrades are something like this:
```
> oh cool <body part>, would be shame if someone stole it
> steals it
> rips his <body part> off
> install new, cooler, definetly not stolen <body part>
```
Basically "finders, keepers".

Most insignificant body parts, the player can replace himself, but something more complex,
like the torso and/or head, he needs to seek upgrade/respawn station.
#### respawning
For the player to be able to respawn in the same run, he must create backup body.
He can achieve that by taking body parts that he wants to have on the backup body
and take them to a upgrade/respawn station and the station will make this the backup
body. After respawn the player will posses this new body, with the old body still
being somewhere in the world, so that the player can retrieve it.
### movement
### inventory
### procedural generation
### enemy ai
### weapon system

