/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Basic Choices
 - Knot structure
 - Recurring choices
 - Conditionals in descriptions
 - Conditionals in choices
 
 In the assignment:
 - Add four more knots (and feel free to change any of the example text, this is YOUR story)
 - Add at least one more conditional
*/

VAR gold = 0
VAR orb = false

It's freezing and the wind is howling. The pale frozen plane extends for miles. There is no life here. Except you.
+[Focus.] -> frozen_plane

==frozen_plane==
The snowy wasteland sprawls for miles. {not gold_orb : You see a glint on the ground}.
+[Continue north.] -> continue_north
+[Move towards the glint.] -> gold_orb

==gold_orb==
As you walk forward you see a small golden orb half submerged into the ground. Your purple hood reflects off the orb. You notice that you can't see your own face. Your coat moves with the wind.
+[Collect the orb.] -> greed
+[Continue north.] -> continue_north

==greed==
You bend down and pick up the orb. You feel your skin tingle. You decide to continue heading North. The golden orb reminds you of the treasure you've been chasing.
~orb = true
~gold += 1
-> continue_north

==continue_north==
The air pushes against your face. You feel more determined than ever to find the stone. The snow falls beside you. You notice something emerging from the horizon.
+[Approach.] -> the_cave

==the_cave==
It's a massive cave entrance. You've finally found it.
+[Enter the cave.] -> thought
+{orb} [Take your gold and leave satisfied.] -> tricked

==tricked==
You return to your village with a small amount of gold.
-> END

==thought==
You enter the cave slowly. The air feels humid. You notice gold dust lining the floor.
+{orb}[Wealth.] -> thought_of_wealth
+[Knowledge.] -> thought_of_knowledge
+[Immortality.] -> thought_of_immortality

==thought_of_wealth==
You think of the gold which must lie at the bottom. You lower to the floor and fill your pockets with gold. You collect all the gold you see in the room.
+[Go deeper.]->room_choice
~ gold += 1
->room_choice

==thought_of_knowledge==
You've heard this cave contains the truth of our universe. Knowledge seekers have been searching for a millennia for this.
->room_choice

==thought_of_immortality==
Deep within the cave network might lie the key to immortality.
->room_choice

==room_choice==
You hear a groaning nearby.
+[Cast light magic.] -> light
+[Follow the noise.] -> ambush
+{not money}[Collect some more gold.] -> money
-> END

==money==
You reach down and fill your pockets with gold. The gold falls into the pocket without taking any space. You do this in the dark as fast as you can.
~ gold += 1
-> room_choice

==light==
You see a Fleshbeast in front of you.
+[Cast mana blast.] -> attack
->room_choice

==ambush==
As you follow the noise you bump into a large creature. It stabs you and you fall to the ground.
-> attack

==attack==
+{light}[Fire directly into the Fleshbeast's ugly face!!] -> body
+[Shoot randomly!] -> crush
+[Run towards the light!] -> escape
+{not light}[Cast light magic.] -> eaten

==crush==
You begin to cast magic missles everywhere. You are crushed by falling rocks.
-> END

==eaten==
By the time you are done casting the creature leaps onto you. Killing you instantly.
-> END

==escape==
You run towards the light while bleeding from the cut. You realize it's too dangerous. You decide to walk back to your village in shame...
-> END


==body==
You see the beast slumped onto the floor. 
{not collect_gold : You notice it's insides are filled with bloody gold.}
+[Go Left] -> left_room
+[Go Right] -> right_room
+{not collect_gold} [Take Gold] ->  collect_gold

==collect_gold==
You stick your hands into the beast and pull out the gold chunks.
~gold += 1
-> body

==left_room==
You enter a small room within the cavern. You see the shrine of an ancient God.
{gift : The gold_orb is tightly in}
*{orb}[Offer the gold orb as tribute.] -> gift
+[go back to the body] -> body
+{gift}[Steal back the orb] -> to_gold

==to_gold==
As you pull out the orb you suddenly turn to gold.
-> END


==gift==
~orb = false
{gold > 0 : You know the Gods demand more.}
+{gold > 0}[Place all of your gold] -> no_gold
+{gold > 0}[Keep your hard earned gold.] -> judgement
{gold == 0} -> judgement

==no_gold==
~gold = 0
->judgement

==judgement==
{gold > 0 : You have insulted the Gods. -> appeased}
{gold == 0 : The gods are pleased with you. -> appeased}

==appeased==
+You return to the body feeling clean.
-> body

==right_room==
You a pit below. You suddenly feel terrified.
+{gold >= 4}[Leave this place with your wealth.] -> happy_end
+[Jump down] -> deepest
+[Go back to the body] ->body

==happy_end==
You leave the cave with enough gold to support your village for an entire year. 
-> END

==deepest==
You jump to the bottom unharmed. You see a large creature standing in front of you. It looks like a giant green squirming ball with six purple eyes and eight insectoid limbs.
+[Cast mana blast.] -> Death
+[Ask it what it is.] -> Converse

==Death==
You fire at it but your blast does nothing. It consumes you.
-> END

==Converse==
"I am the guardian of the stone. Why have you come?"
+{thought_of_wealth}[For unlimited wealth] -> greed_end
+{thought_of_knowledge}[For unlimited knowledge] -> wise_end
+{thought_of_immortality}[For unlimited health] -> immortality_end
+[For the stone!] -> rage
->END

==rage==
"You will never get it."
+[Cast mana blast.] -> Death

==greed_end==
"You are just another ignorant fool. I have seen the cycle thousands of times. People come in here and try to steal my gold."
Everything around you begins to turn into gold. You are quickly buried in it completely. You can't escape.
-> END


==wise_end==
{gift :"You are one of the knowledge seekers arn't you. You gave the Gods a gift. I will give you this book."}
{gift :You take the mysterious book and return to your village.}
{not gift: "You are a fool thinking you can take and not give."}
+{not gift}[Cast mana blast.] -> Death

==immortality_end==
"Immortality is a curse. I have felt pain for many millennia, I have seen the cycle thousands of times. People come in here and try to steal my immortality."
+[Cast mana blast.] -> Death

