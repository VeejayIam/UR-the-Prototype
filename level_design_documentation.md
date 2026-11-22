# level design documentation

## brief overview
This document provides a guide for how the levels should look and feel. Since the levels are procedurally generated the design consists of modular tiles (rooms and hallways) that are instanced and connected at runtime.
The room layouts(separate documents) markout where the connection points are and where certain props might or might not spawn. There is a rough sketch of how the tile may look like.
Since there are also visually distinct "areas" e.g. employee spaces, testing labs etc. a section in this document explains each style and a separate file has a moodboard for inspiration.

## general structure
although the levels are procedurally generated there are certain rooms that are always present(not necessarly in the same place) and serve as anchor points in the generation process.
The complex has 2 elevators opposite eachother used to traverse the floors and due to high security demand these elevator shafts can be completely closed off in case of emergencies(such as an experimental robot escaping).
In such a case the only way to travel between floors is to use the maintinance elevators, which only travel a few floors and alternate sides. Thus the player needs to find their way to the other side of the floor.
In practice this means each level has 2 lobby rooms opposite eachother serving as the beginning and end of the level. These lobbies are connected by office spaces in a roughly straight line with labs and 
test chembers branching off of them.
//subject to change if this structruce doesnt produce good gameplay 

## layout
the layout shows a topdown view of the room. Colored rectangles denotate gameplay relevant things(explained below). Underneath the layout are notes about props objects and other specifics. 
To the right of the layout is a sketch to give a rough idea of how the tile might look like

### legend:
- black: the walls/outline of the tile
- green: a garanteed connection point(doors, gateways); this is to prevent rooms with no entrance or exit and serves as a sort of anchor when generating levels
- orange: possible connection point; these are places where a door will appear only if there is another tile connected there
- yellow: possible item spawn; notes under layout will specify what kind of item can spawn there
- gray: prop spawns; notes under layout will specify what props can appear there, and whether its spawn is garanteed or not
- blue: interactables such as the repair & upgrade station or computers with info, camera access etc.;in each floor there is always at least one repair&upgrade station
- brown: interior doors
- letter v: marks an access point(usually orange) as a vent(vents can only lead to other vents)
- red rectangle: marks an access point that is locked; it can be lockpicked, remotely unlocked or kicked in depending on the type of door and player upgrades
- letter c: marks where cameras are placed(viewable through a pc)

## areas
the game has different "areas", visually distinct locations that have their own variants of tiles.
Below is the detailed description of each area, its style, atmosphere and gameplay purpose.

### employee office spaces
the employee/lounge area is mainly inspired by 70's/80's office spaces and socialist interiors. main materials are carpets and wood intersperced with concrete.
the walls are wooden panels or concrete painted in light,usually warm colors. the furniture is wood and leather for the "higher placed" employee's and fake leather,
steel tube and wood composite for "lower placed" ones. Office decorations include plants, sometimes paintings, rarely posters/photos. Office utilities are scatterd all over.
The rooms also have windows with light panels and fake panoramas to create an illusion of being above ground. The ceilings are typical square shaped dropdowns.
Some desk are organized and clean, almost empty. other are messy, full of papers, pencil, scissors etc. the technology is 80's inspired aka bulky equipment, made of plastic,
crt monitors(some monochrome, some colored, again depending on status), vhs recorders, other tools are mainly analog. Hallways have bulletin boards with notes and corpo propaganda pinned to them,
plants, occasional water dispenser, a mini kitchen with a coffee machine etc. The atmosphere is a combination of cozy and warm yet liminal.

### testing chambers
Attached to experimental laboratories and meant to test new modules they are as varied as the upgrades in the game. From simple shooting ranges and killhouses to parkour tracks and logic puzzles.
Their main style is clean futurism and laboratories. The Main materials are synthetics and plastics with plywood used for houses and other mock structures. The rooms are mostly white and grey
with other colors used as markers and guides. The entrance doors are heavy duty to prevent escaping. At the end of these chambers there are often repair & upgrade stations with basic and "streamlined" body parts.
To get to them the player has to activate the test from the chambers control room and finish the test, hack the system(if they have the apropriate upgrades) or (if available) sneak in through maintinance rooms.
The rooms should feel sterile, cold and impersonal, reinforcing the feeling you're being watched and tested.

### experimental laboratories
They are the heart of the underground research facility. Stylisticaly defined by brutalism they are made of concrete and steel with simple shapes and little to no decorations. 
The common areas are bare with cold lighting and invoking a liminal and alienating feeling. The individual labs have designations based on what kind fo modules they're developing.
They are cluttered with loose parts and tools on shelves and desks leaving relatively little room to move around. One commonality is that EVERY desk has a coffee mug on it(or near it) and at least one wall has
a white board covered with calculations, diagrams and jokes/scribbles by bored emplyees. These labs are the main source of experimental upgrades that affect the gameplay in substantial ways.
Sometimes there also are repair & upgrade stations, but here they're much less common. These rooms should feel cluttered and claustrophobic enveloping the player with strange/wierd devices.

### maintainance backrooms
These are the main way of sneaking around enemies and locked doors. Purely utilitarian they're made of concrete and steel with pipes, wires and vents covering the walls and ceilings.
Since they're not cleaned regularly the concrete is dirty and chipped and the pipes, railings and catwalks are rusted. The lighting is spotty, dim and sometimes nonexistnant.
The corridors are tight, sometimes requiring crouching, crawling around or climbing ladders meaning players with a tank or bulky build effectively cannot use them.
Sometimes there will also be breakers allowing the player to turn off the lights for adittional stealth. These backrooms should feel dirty, almost abandoned, creepy
like a horror game could be set there.
