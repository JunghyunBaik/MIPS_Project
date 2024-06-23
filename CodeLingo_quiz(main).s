# Final Project CodeLingo Language Quiz
# CS-118
# Main Program 

.data
choose_level: .asciiz "\n Choose Level (easy: 1, medium: 2, hard: 3): "
level_easy: .asciiz "\n Loading to Easy...\n"
level_medium: .asciiz "\n Loading to Medium...\n"
level_hard: .asciiz "\n Loading to Hard...\n"
invalid_choice: .asciiz "\n Invalid Input.. Please try again"
play_again: .asciiz "\n\n Would you like to play again? ( 1: Yes, 2: No ) : "

	l1answer: .byte 'c','b','a','d','c'
	l2answer: .byte 'a','b','b','c','c'
	l3answer: .byte 'c','d','a','b','b'
	ask_ans: .asciiz"Answer: "
	welcome: .asciiz"\n\t==== Welcome to CodeLingo Quiz! ===="
	line: .asciiz"______________________________"
	copyright: .asciiz"\n\t  @Englishcurrent.com(copyright)\n\n"
	
	l1q1: .asciiz"\n\n1. “I can’t ___ my passport. Have you seen it?”  \n"
	l1q1opt: .asciiz"a) fill  b) order  c) find  d) offer\n"
	l1q2: .asciiz"\n\n2. “The weather is ___ today. Let’s stay inside.”  \n"
	l1q2opt:  .asciiz"a) simple  b) awful  c) rich  d) close\n"
	l1q3: .asciiz"\n\n3. The man ___ the basketball into the air. \n"
	l1q3opt: .asciiz"a) threw  b) cleared  c) checked  d) lent\n"
	l1q4: .asciiz"\n\n4. Every year, many ___ travel to Paris to visit its famous places. \n"
	l1q4opt: .asciiz"a) schedules  b) churches  c) instructions  d) tourists\n"
	l1q5: .asciiz"\n\n5.Masa put the pot on the ___ to warm it up.\n"
	l1q5opt: .asciiz"a) sauce  b) screen  c) stove  d) scarf\n"
	
	l2q1: .asciiz"\n\n1. One day, I want to climb Mt. Everest. That's a goal I want to ___ .   \n"
	l2q1opt: .asciiz"a) achieve  b) invent  c) respect  d) acquire \n"
	l2q2: .asciiz"\n\n2. Jack ___ did a thing at work today day. He spent most of his time chatting with the secretary.  \n"
	l2q2opt:  .asciiz"a) seldom  b) hardly  c) rarely  d) slightly\n"
	l2q3: .asciiz"\n\n3. Weather experts have ___ that next summer will be extremely hot.  \n"
	l2q3opt: .asciiz"a) reflected  b) predicted  c) included  d) prescribed\n"
	l2q4: .asciiz"\n\n4. Lisa is ___ buying a pet but she's not sure what kind to get. \n"
	l2q4opt: .asciiz"a) recalling  b) regretting  c) considering  d) counting\n"
	l2q5: .asciiz"\n\n5. It is very ___ to shop on the Internet. All you need is a credit card. \n"
	l2q5opt: .asciiz"a) polite  b) enthusiastic  c) convenient  d) foolish\n"
	
	l3q1: .asciiz"\n\n1. The telemarketer's sales ___ was too pushy, so I hung up the phone.    \n"
	l3q1opt: .asciiz"a) sketch  b) treaty  c) pitch  d) venture \n"
	l3q2: .asciiz"\n\n2. The directions my friend gave us were ___ ,  so we were able to find his house easily.   \n"
	l3q2opt:  .asciiz"a) coordinated  b) novel  c) essential  d) straightforward\n"
	l3q3: .asciiz"\n\n3. The flight attendant caught a ___ of cigarette smoke, so she checked the washrooms to see if someone was smoking.  \n"
	l3q3opt: .asciiz"a) whiff  b) bout  c) glitch  d) mite\n"
	l3q4: .asciiz"\n\n4. Mick's interest in skateboarding began to ___ as he got older and the activity became harder on his body.  \n"
	l3q4opt: .asciiz"a) bloat  b) wane  c) tweak  d) instil\n"
	l3q5: .asciiz"\n\n5The chef received many ___ from his guests about the delicious dinner he made.  \n"
	l3q5opt: .asciiz"a) curses  b) compliments  c) pardons  d) excuses\n"
	
	score: .word 0
	box1: .asciiz"\n    ---------------\n"
	total_score: .asciiz"    | TOTAL SCORE |\n"
	box2: .asciiz"    ---------------\n"
	name: .asciiz"\nNAME : "
	buffer: .space 30
	ask_name: .asciiz"\nEnter your name : "
	score_out: .asciiz"\nSCORE : "

.text
main:
	# ask user's name
	la $a0, ask_name	
	li $v0, 4
	syscall
	
	li $v0, 8
	la $a0, buffer	
	li $a1, 20
	
	move $t4, $a0
	syscall
	
	# Display welcome message
	la $a0, welcome		
	li $v0, 4
	syscall
	
	# Display copyright
	la  $a0, copyright	
	li $v0, 4
	syscall
		
   	# choose_level output
   	li $v0, 4
	la $a0, choose_level
    	syscall

    	# Take User's Input
  	li $v0, 5
    	syscall
    	move $t0, $v0 # Save User's Input to $t0
	
    	# Branch based on level selection
    	beq $t0, 1, jump_easy 		# Branches to jump_easy when selecting Easy level
    	beq $t0, 2, jump_medium 	# Branch to jump_medium when selecting Medium level
    	beq $t0, 3, jump_hard		# Branches to jump_hard when selecting hard level
	
    	# If input is invalid choice, exit
    	li $v0, 4
    	la $a0, invalid_choice
    	syscall
    	j end

# Level 1
jump_easy:
    	li $v0, 4
    	la $a0, level_easy
    	syscall
    	
	la $a0,line
	li $v0, 4
	syscall
	
	# Level 1 quizes
	# Level 1 no.1	
	la $a0, l1q1
	li $v0, 4
	syscall
	la $a0, l1q1opt
	li $v0, 4
	syscall

	la $a0, ask_ans
	li $v0, 4
	syscall
	li $v0, 12
	syscall
	
	la $t0, l1answer
	lb $t1, 0($t0)
	bne $t1, $v0,L1Q2	# if answer is not correct move to next question
	addi $t7,$t7,1		# if answer is correct add score and move to next question

     # Level 1 no.2
     L1Q2:move $v0, $0
     	la $a0, l1q2
	li $v0, 4
	syscall
	la $a0, l1q2opt
	li $v0, 4
	syscall

	la $a0, ask_ans
	li $v0, 4
	syscall
	li $v0, 12
	syscall
	
	lb $t1, 1($t0)
	bne $t1, $v0,L1Q3	# if answer is not correct move to next question
	addi $t7,$t7,1		# if answer is correct add score and move to next question

     # Level 1 no.3
     L1Q3:move $v0, $0
     	la $a0, l1q3
	li $v0, 4
	syscall
	la $a0, l1q3opt
	li $v0, 4
	syscall
	
	la $a0, ask_ans
	li $v0, 4
	syscall
	li $v0, 12
	syscall

	lb $t1, 2($t0)
	bne $t1, $v0,L1Q4	# if answer is not correct move to next question
	addi $t7,$t7,1		# if answer is correct add score and move to next question

     # Level 1 no.4		
     L1Q4:move $v0, $0
     	la $a0, l1q4
	li $v0, 4
	syscall
	la $a0, l1q4opt
	li $v0, 4
	syscall
	
	la $a0, ask_ans
	li $v0, 4
	syscall
	li $v0, 12
	syscall
	
	lb $t1, 3($t0)
	bne $t1, $v0,L1Q5	# if answer is not correct move to next question
	addi $t7,$t7,1		# if answer is correct add score and move to next question
	
     # Level 1 no.5	
     L1Q5:move $v0, $0
     	la $a0, l1q5
	li $v0, 4
	syscall
	la $a0, l1q5opt
	li $v0, 4
	syscall
	
	la $a0, ask_ans
	li $v0, 4
	syscall
	li $v0, 12
	syscall
	
	lb $t1, 4($t0)
	bne $t1, $v0, jump_medium	# if answer is not correct move to medium level
	addi $t7,$t7,1			# if answer is correct add score and move to next question

# Level 2
jump_medium:
    	li $v0, 4
    	la $a0, level_medium
    	syscall

	la $a0,line
	li $v0, 4
	syscall
	
	# Level 2 quizes
	# Level 2 no.1
	la $a0, l2q1
	li $v0, 4
	syscall
	la $a0, l2q1opt
	li $v0, 4
	syscall

	la $a0, ask_ans
	li $v0, 4
	syscall
	li $v0, 12
	syscall
	
	la $t0, l2answer
	lb $t1, 0($t0)
	bne $t1, $v0,L2Q2	# if answer is not correct move to next question
	addi $t7,$t7,1		# if answer is correct add score and move to next question

     # Level 2 no.2
     L2Q2:move $v0, $0
     	la $a0, l2q2
	li $v0, 4
	syscall
	la $a0, l2q2opt
	li $v0, 4
	syscall

	la $a0, ask_ans
	li $v0, 4
	syscall
	li $v0, 12
	syscall
	
	lb $t1, 1($t0)
	bne $t1, $v0,L2Q3	# if answer is not correct move to next question
	addi $t7,$t7,1		# if answer is correct add score and move to next question

     # Level 2 no.3
     L2Q3:move $v0, $0
     	la $a0, l2q3
	li $v0, 4
	syscall
	la $a0, l2q3opt
	li $v0, 4
	syscall
	
	la $a0, ask_ans
	li $v0, 4
	syscall
	li $v0, 12
	syscall

	lb $t1, 2($t0)
	bne $t1, $v0,L2Q4	# if answer is not correct move to next question
	addi $t7,$t7,1		# if answer is correct add score and move to next question
	
     # Level 2 no.4	
     L2Q4:move $v0, $0
     	la $a0, l2q4
	li $v0, 4
	syscall
	la $a0, l2q4opt
	li $v0, 4
	syscall
	
	la $a0, ask_ans
	li $v0, 4
	syscall
	li $v0, 12
	syscall
	
	lb $t1, 3($t0)
	bne $t1, $v0,L2Q5	# if answer is not correct move to next question
	addi $t7,$t7,1		# if answer is correct add score and move to next question

     # Level 2 no.5	
     L2Q5:move $v0, $0
     	la $a0, l2q5
	li $v0, 4
	syscall
	la $a0, l2q5opt
	li $v0, 4
	syscall
	
	la $a0, ask_ans
	li $v0, 4
	syscall
	li $v0, 12
	syscall
	
	lb $t1, 4($t0)
	bne $t1, $v0, jump_hard	# if answer is not correct move to hard level
	addi $t7,$t7,1		# if answer is correct add score and move to next question

# Level 3
jump_hard:	
    	li $v0, 4
    	la $a0, level_hard
    	syscall

	la $a0,line
	li $v0, 4
	syscall
	
	# Level 3 quizes
	# Level 3 no.1
	la $a0, l3q1
	li $v0, 4
	syscall
	la $a0, l3q1opt
	li $v0, 4
	syscall

	la $a0, ask_ans
	li $v0, 4
	syscall
	li $v0, 12
	syscall
	
	la $t0, l3answer
	lb $t1, 0($t0)
	bne $t1, $v0,L3Q2	# if answer is not correct move to next question
	addi $t7,$t7,1		# if answer is correct add score and move to next question

     # Level 3 no.2
     L3Q2:move $v0, $0
     	la $a0, l3q2
	li $v0, 4
	syscall
	la $a0, l3q2opt
	li $v0, 4
	syscall

	la $a0, ask_ans
	li $v0, 4
	syscall
	li $v0, 12
	syscall
	
	lb $t1, 1($t0)
	bne $t1, $v0,L3Q3	# if answer is not correct move to next question
	addi $t7,$t7,1		# if answer is correct add score and move to next question
     
     # Level 3 no.3
     L3Q3:move $v0, $0
     	la $a0, l3q3
	li $v0, 4
	syscall
	la $a0, l3q3opt
	li $v0, 4
	syscall
	
	la $a0, ask_ans
	li $v0, 4
	syscall
	li $v0, 12
	syscall

	lb $t1, 2($t0)
	bne $t1, $v0,L3Q4	# if answer is not correct move to next question
	addi $t7,$t7,1		# if answer is correct add score and move to next question
     
     # Level 3 no.4	
     L3Q4:move $v0, $0
     	la $a0, l3q4
	li $v0, 4
	syscall
	la $a0, l3q4opt
	li $v0, 4
	syscall
	
	la $a0, ask_ans
	li $v0, 4
	syscall
	li $v0, 12
	syscall
	
	lb $t1, 3($t0)
	bne $t1, $v0,L3Q5	# if answer is not correct move to next question
	addi $t7,$t7,1		# if answer is correct add score and move to next question
    
      # Level 3 no.5	
     L3Q5:move $v0, $0
     	la $a0, l3q5
	li $v0, 4
	syscall
	la $a0, l3q5opt
	li $v0, 4
	syscall
	
	la $a0, ask_ans
	li $v0, 4
	syscall
	li $v0, 12
	syscall
	
	lb $t1, 4($t0)
	bne $t1, $v0, SCORE	# if answer is not correct move to Score
	addi $t7,$t7,1		# if answer is correct add score and move to Score
	
SoundWrong:
li $a2 112	# $a2=instrument
li $a3 120	# set volume

#1 C3
li $a0 48	# $a0=pitch, set pitch to C3
li $a1 100	# $a1=duration in milliseconds, set duration 100
li $v0 33	# MIDI out synchronous
syscall

#2 C4
li $a0 48	# $a0=pitch, set pitch to C4
li $a1 300	# $a1=duration in milliseconds, set duration 300
li $v0 33	# MIDI out synchronous
syscall

SoundCorrect:
li $a2 112	# $a2=instrument
li $a3 120	# set volume

#1 C4
li $a0 60	# $a0=pitch, set pitch to C4
li $a1 90	# $a1=duration in milliseconds, set duration 90
li $v0 33	# MIDI out synchronous
syscall

#2 C5
li $a0 72	# $a0=pitch, set pitch to C5
li $a1 300	# $a1=duration in milliseconds, set duration 300
li $v0 33	# MIDI out synchronous
syscall

SCORE:
#display score
add $t9,$t9,$t7
sw $t9,score

la $a0, box1 	# dispaly line for total score box
li $v0, 4
syscall

la $a0, total_score	# dispaly "total score"
li $v0, 4
syscall

la $a0, box2	# dispaly line for total score box
li $v0, 4
syscall

#Sound Effect
li $a2 112	# $a2=instrument
li $a3 120	# set volume

#1 C4
li $a0 60	# $a0=pitch, set pitch to C4
li $a1 100	# $a1=duration in milliseconds, set duration 100
li $v0 33	# MIDI out synchronous
syscall

#2 G
li $a0 67	# $a0=pitch, set pitch to G
li $a1 100	# $a1=duration in milliseconds, set duration 100
li $v0 33	# MIDI out synchronous
syscall

#2 C5
li $a0 72	# $a0=pitch, set pitch to C5
li $a1 100	# $a1=duration in milliseconds, set duration 100
li $v0 33	# MIDI out synchronous
syscall

#2 E
li $a0 76	# $a0=pitch, set pitch to E
li $a1 250	# $a1=duration in milliseconds, set duration 250
li $v0 33	# MIDI out synchronous
syscall

#2 C
li $a0 72	# $a0=pitch, set pitch to C
li $a1 80	# $a1=duration in milliseconds, set duration 80
li $v0 33	# MIDI out synchronous
syscall

#2 E
li $a0 76	# $a0=pitch, set pitch to E
li $a1 400	# $a1=duration in milliseconds, set duration 400
li $v0 33	# MIDI out synchronous
syscall

# dispaly user's name
la $a0, name	
li $v0, 4
syscall

la $a0, buffer
move $a0, $t4
li $v0, 4
syscall

# dispaly user's total score
la $a0, score_out
li $v0, 4
syscall

move $a0, $t9
li $v0, 1
syscall

move $v0, $0

   	# Ask User to Play Again?
   	li $v0, 4
	la $a0, play_again
    	syscall

    	# Take User's Input
  	li $v0, 5
    	syscall
    	move $t0, $v0 	# Save User's Input to $t0
	
    	# if yes branch to main, no branch to end
    	beq $t0, 1, main # Branches to main when selecting 1
    	beq $t0, 2, end  # Branch to end when selecting 2

		
end:
    	li $v0, 10
    	syscall
