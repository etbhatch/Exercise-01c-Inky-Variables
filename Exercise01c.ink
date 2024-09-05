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
 
 
 
 Editor's Note for Ocean's Song v2: Prior to this exercise I believe I had 10 knots, now I have 14 knots. I also added a bunch of slightly varying dialouge based on the player's tranquolity level or where they first came from. It's not a lot, but I feel like it makes the experience flow a little nicer. Again, good wriitng is my personal goal. So if the story is intriguing and or though provoking, I consider this a success.
 
*/


VAR seashell = 0
VAR tranquility =0


-> beach_shore

== beach_shore ==
You stand at the waters edge, gazing into the near infinite sea. You hear what sounds like a sweet melody, calling to you from the stars reflecting in the water. Behind you lies a dark cave, cold and unfeeling.
{tranquility == 0: You don't yet feel at peace} 
{tranquility > 0: You're a little at peace, maybe you need more tranquility}
Your tranquility is at {tranquility}

*[Listen to the song.] 
     ~tranquility = tranquility +1
    ->listen_beach
*[Head for the cave.] ->dark_cave
*[Wade out into the waves.] ->wade_waters
*[Look around the shore.] -> gazing_shore
 
==gazing_shore==
The sand all around you glistens like tiny stars in the night sky. Many seashells dot the shore, like galaxies in the distance.
    ~tranquility = tranquility + 1
Your tranquility is now at {tranquility}

*[Gaze back out to the sea.] ->beach_shore
*{seashell < 1}[Pick up a seashell.] ->seashell_pickup 

==dark_cave==
{darkest_cave: You escaped, yet you are right back where you started.}The cave you now stand in is dark, cold, and unfeeling. A single point of light exists at the end of the tunnel. You feel as though just standing here is enough to make your skin crawl. You can hear your heatbeat, pulsating through your chest. Fear. Yet, perhaps this is your only option to make a choice that is your own.
*[Head deeper into the darkness.] ->darkest_cave
*[Head to the light] -> deep_cave
*[Turn back.] ->beach_shore

==deep_cave==
{tranquility > 1: You begin heading home.} You feel the rush of wind against your face. You stand at the edge of a cliff, staring into the great beyond. You're back home. It almost feels as though you never left. {tranquility == 1: Though something is missing, you can't quite figure out what.} Your father calls for you, worried since you went missing.
"Welcome back," he says with a smile. {tranquility ==0:"Tell me, did you find what you were looking for?"}
{tranquility == 1: You made it home, you feel happy, a smile still planted on your face. {listen_beach:The song still radiating in your soul. Making the whole world seem brighter.} } 
{tranquility == 2: "Welcome home," your father says, a smile on his face. "You look happy today! Let's head home, your mother is worried. You can tell us about your adventure when we get back."} 
{tranquility > 3: You feel almost scared. The pull of the ocean almost took you away. Perhaps you should never return.}

You have {seashell} seashells

{seashell > 0: "Hey, that's a beautiful shell you have there. I'm sure you mother would love it."}
*{seashell > 0} [Give the seashell as a present for your mother.]->seashell_gift
*[Go home] ->END

==darkest_cave==
You now stand in almost complete darkness. Slight fear and panic begin to settle in. You are trapped. The silence stabbing into your ears and the century old air burns your lungs.
*{tranquility >= 2}[Try to escape] ->dark_cave
*{tranquility < 2} [Try to escape] -> cave_abyss
*[Accept, go deeper] -> cave_abyss

==cave_abyss==
You have utterly lost yourself in a dark void. One without ligth and without hope. You can't even hear the allure of the Ocean's Song anymore. You have totally vanished from this world. No desire...and no sense of self.
{tranquility > 2: Perhaps this was the answer you searched for. To completly dissapear from this world.}
->END

==listen_beach==
You stand there, listening to the song. It makes you feel...at peace. That your worries can finally dissapear. The answers to that question burning deep within your heart, may finally be understood. All you must do, is head forward and never look back. {not seashell_pickup: Though the beautiful shell on the ground may make you feel better.}

{tranquility == 1: you feel more at peace, but something is still missing}
your tranquility is now {tranquility}

You have {seashell} seashells

*[Sprint for the cave.] ->sprint_cave
*[Wade out into the waves.] ->wade_waters
*{seashell < 1}[Pick up the seashell.] ->seashell_pickup 

==seashell_pickup==
    ~seashell = seashell + 1
You now have a seashell, perhaps your mother would like it.

you have {seashell} seashell

*[Listen to the song] -> listen_beach
*[Gaze back out to the sea] -> beach_shore

==sprint_cave==
You ran, trying to break free from the calling sea. You're out of breath, gasping for air. The air tastes old, stale, and damp.{seashell == 1: You must have dropped the shell during your sprint.} {tranquility > 3: You must have ran straight into the cave.}You know that if you head back now, your father should be waiting with open arms.

    ~seashell = 0
you have {seashell} seashells

*[Head home.] ->deep_cave
*[Go deeper into the darkness.] -> darkest_cave
*[Go back to the water.] ->beach_shore

==wade_waters==
{not melody_ponder:You wade out, feeling the cold water rush around you. It makes you feel alive. You feel, happy.} 
    ~tranquility = tranquility + 1
{melody_ponder: You return to the cold waters, gazing into an abyss.}
{listen_beach:You feel at peace. Listening to the song of the waves.}

your tranquility is now at {tranquility}

*[Go deeper.] ->deep_waves
*{listen_beach}[Consider the melody] -> melody_ponder
*[Head home.] -> deep_cave

==melody_ponder==
You condsider the song of the waves. It's captivating, yet utterly alien to you. It makes you feel both understood and at home.
    ~tranquility = tranquility +1
your tranquility is now at {tranquility}
-> wade_waters

==seashell_gift==
You gave the seashell to your mother when you got home. She noticed how happy you seemed from your day and acepted the seashell with a smile that matched yours.
{tranquility > 1: Perhaps this is the meaning in your life you have been searching for. The happiness of those you love.}
-> END

==deep_waves==
You feel ensared by the song of the waves. You feel at peace, yet you desire more. You need to go deeper.
    ~tranquility = tranquility + 2
your tranquility is now at {tranquility}
*[Go even deeper.]
    ~ tranquility = tranquility + 6
    ->deeper_waves
*{tranquility < 6} [Resist the pull, run away] -> sprint_cave

==deeper_waves==
You feel as though you are floating in an infinite void. You feel good, you feel happy. Almost as though nothing matters at all. Almost as though you no longer exist.
{tranquility > 9: You feel more at peace than ever before. Perhaps this was the meaning in your life you longed for. Your own peace and enjoyment.}
your tranquility is at {tranquility}
-> END