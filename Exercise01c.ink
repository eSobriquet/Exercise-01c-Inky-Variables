/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Variable types: integer, float, boolean
 - Variable assignment
 - Printing variables
 - Variable checking
 
 In the assignment:
 - Add four more knots
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
*/

VAR sword_type = ""
VAR name = ""


-> Memory
=== Memory ===
You wake up in a cave. You're in a daze but you manage to remember your name. What is you name?
*[Tim]
~ name ="Tim"
->new_name
*[Bob]
~ name="Bob"
->new_name
*[Jim]
~ name ="Jim"
->new_name
-> END
=== new_name ===
You manage to recall your name, {name}.
*[Look around]->cave_mouth
-> END

== cave_mouth ==
{name} is at the enterance to a cave. {not torch_pickup:There is a torch on the floor.}{not sword_pickup:There is a sword on the floor.} The cave extends to the east and west.



+ {not east_tunnel_lit}[Take the east tunnel] -> east_tunnel
+ {east_tunnel_lit}[Take the east tunnel] -> east_tunnel_lit
+ [Take the west tunnel] -> west_tunnel
* [Pick up the torch] -> torch_pickup
*[pick up the sowrd]->sword_pickup
+{sword_pickup}[Change weapon]->sword_pickup
== east_tunnel ==
{name} is in the east tunnel. It is very dark, you can't see anything.
* {torch_pickup} [Light Torch] -> east_tunnel_lit
+ [Go Back] -> cave_mouth
-> END
=== sword_pickup ===
When {name} pick's up the sword it becomes the weapon you wish.
+[Axe]
~ sword_type = "Axe"
->new_weapon
+[Great sword]
~ sword_type= "Great Sword"
->new_weapon
+[Glave]
~sword_type= "Glave"
->new_weapon

-> END
=== new_weapon ===
The sword becomes a {sword_type}.
+[Go back]-> cave_mouth
-> END

== west_tunnel ==
{name} is in the west
+ [Go Back] -> cave_mouth
-> END

=== torch_pickup ===
{name} now has a torch. May it light the way.
* [Go Back] -> cave_mouth
-> END

== east_tunnel_lit ==
The light of {name}'s torch glints off of the thousands of coins in the room. With a door with a slot.
+[Inspect door]->Door
+[Go back]-> cave_mouth
-> END
=== Door ===
When {name} inspects the door you see the slot is in the shape of an axe.
+[Go back]->east_tunnel_lit
*{sword_type =="Axe"}[Place the Weapon]->exit
-> END
=== exit ===
The Door opens and {name} sees sunlight. {name} is free.
-> END

