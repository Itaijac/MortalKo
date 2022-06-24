IDEAL

MODEL small
STACK 256

;---------------------------
;----===Constant Area===----
;---------------------------
	BMP_WIDTH         = 320
	BMP_HEIGHT        = 200

	RightBorder       = 240
	LeftBorder        = 40

	AttackDistance    = 60
	AttackDistance2   = 40

	MoveDistance      = 6

	ChromaKey         = 0FDh

;----====Player One Keybinds====----
	Player1RightKey   = 1Eh
	Player1LeftKey    = 20h

	Player1Attack1Key = 10h
	Player1Attack2Key = 12h

;----====Player Two Keybinds====----
	Player2RightKey   = 24h
	Player2LeftKey    = 26h

	Player2Attack1Key = 16h
	Player2Attack2Key = 18h

;---------------------------
;----===Constant Area===----
;---------------------------

DATASEG 

;---------------------------
;----====Data Area====----
;---------------------------
;----====Game Data====----
	Player1     dw 80 ;The x-axis location of Player 1.
	Player2     dw 200 ;The x-axis location of Player 2.
	
	HealthP1    db 3 ;The amount of health Player 1 has.
	HealthP2    db 3 ;The amount of health Player 2 has.
	
	KeyPress    db ? ;Contains the scancode of the button that was currently pressed.
	
	P1Walk      db 1 ;A counter used for walking animation. 
	P1Attack    db 1 ;A counter used for attacking animation.
	P1AttackB1  db 0 ;A bool that determinants if Player 1 is currently attacking Player 2 using attack 1. Helps to assign animations.
	P1AttackB2  db 0 ;A bool that determinants if Player 1 is currently attacking Player 2 using attack 2. Helps to assign animations.
	P1HurtB     db 0 ;A bool that determinants if Player 1 is currently being attacked by Player 2. Helps to assign animations.
	P1AttackedB db 0 ;A bool that determinants if Player 1 is currently being attacked, whether it"s attack 1 or attack 2.

	P2Walk      db 1 ;A counter used for walking animation. 
	P2Attack    db 1 ;A counter used for attacking animation.
	P2AttackB1  db 0 ;A bool that determinants if Player 2 is currently attacking Player 1 using attack 1. Helps to assign animations.
	P2AttackB2  db 0 ;A bool that determinants if Player 2 is currently attacking Player 1 using attack 2. Helps to assign animations.
	P2HurtB     db 0 ;A bool that determinants if Player 2 is currently being attacked by Player 1. Helps to assign animations.
	P2AttackedB db 0 ;A bool that determinants if Player 2 is currently being attacked, whether it"s attack 1 or attack 2.

	;P1HurtB and P1AttackedB or P2HurtB and P2AttackedB assist in assigning animations. 
	
;----====Game Data====----

;----====BMP Data====----
	OneBmpLine 	db BMP_WIDTH dup (0)  ; One Color line read buffer
   
    ScrLine 	db BMP_WIDTH dup (0)  ; One Color line read buffer

	;BMP File data
	BackScr     db "MortalKo/BackScr.bmp",0 ;Part of the starting menu, lets you choose your background.
	Backg 	    db "MortalKo/Backg1.bmp" ,0 ;The arena where the fight is taking place. 
	Tutorial    db "MortalKo/Tutorial.bmp" ,0 ;A short tutorial that explains how to play the game.
	WS          db "MortalKo/WS.bmp",0 ;The starting menu.
	
	;Winning message that is displayed after one opponent is killed. Either "Player one won" or "Player two won",
	P1W         db "MortalKo/P1W.bmp",0
	P2W         db "MortalKo/P2W.bmp",0
	
	;Player 1 - Walking Animation
	P1Walk1     db "MortalKo/P1Walk1.bmp",0
	P1Walk2     db "MortalKo/P1Walk2.bmp",0
	P1Walk3     db "MortalKo/P1Walk3.bmp",0
	P1Walk4     db "MortalKo/P1Walk4.bmp",0
	P1Walk5     db "MortalKo/P1Walk5.bmp",0
	P1Walk6     db "MortalKo/P1Walk6.bmp",0
	P1Walk7     db "MortalKo/P1Walk7.bmp",0

	;Player 1 - Death Animation
    P1DEAD1     db "MortalKo/P1DEAD1.bmp",0	
	P1DEAD2     db "MortalKo/P1DEAD2.bmp",0	
	P1DEAD3     db "MortalKo/P1DEAD3.bmp",0	
	P1DEAD4     db "MortalKo/P1DEAD4.bmp",0	
	P1DEAD5     db "MortalKo/P1DEAD5.bmp",0	
	P1DEAD6     db "MortalKo/P1DEAD6.bmp",0	
	
	;Player 1 - Winning Animation
	P1WIN1      db "MortalKo/P1WIN1.bmp",0	
	P1WIN2      db "MortalKo/P1WIN2.bmp",0	
	P1WIN3      db "MortalKo/P1WIN3.bmp",0	 
	P1WIN4      db "MortalKo/P1WIN4.bmp",0	
	P1WIN5      db "MortalKo/P1WIN5.bmp",0	
	
	;Player 1 - Attack 1 Animation
	P1Attack1   db "MortalKo/P1Att11.bmp",0
	P1Attack2   db "MortalKo/P1Att12.bmp",0
	P1Attack3   db "MortalKo/P1Att13.bmp",0
	
	;Player 1 - Attack 2 Animation
	P1Attack21  db "MortalKo/P1Att21.bmp",0
	P1Attack22  db "MortalKo/P1Att22.bmp",0
	
	;Player 1 - Health Bar Animation
	P1H1        db "MortalKo/P1H1.bmp",0
	P1H2        db "MortalKo/P1H2.bmp",0
	P1H3        db "MortalKo/P1H3.bmp",0
	P1H4        db "MortalKo/P1H4.bmp",0
	
	;Player 1 - Attacked Animation
	P1Hurt      db "MortalKo/P1Hurt.bmp",0
	
	;Player 2 - Walking Animation
	P2Walk1     db "MortalKo/P2Walk1.bmp",0
	P2Walk2     db "MortalKo/P2Walk2.bmp",0
	P2Walk3     db "MortalKo/P2Walk3.bmp",0
	P2Walk4     db "MortalKo/P2Walk4.bmp",0
	P2Walk5     db "MortalKo/P2Walk5.bmp",0
	P2Walk6     db "MortalKo/P2Walk6.bmp",0
	P2Walk7     db "MortalKo/P2Walk7.bmp",0
	
	;Player 2 - Death Animation
	P2DEAD1     db "MortalKo/P2DEAD1.bmp",0	
	P2DEAD2     db "MortalKo/P2DEAD2.bmp",0	
	P2DEAD3     db "MortalKo/P2DEAD3.bmp",0	
	P2DEAD4     db "MortalKo/P2DEAD4.bmp",0	
	P2DEAD5     db "MortalKo/P2DEAD5.bmp",0	
	P2DEAD6     db "MortalKo/P2DEAD6.bmp",0	
	
	;Player 2 - Winning Animation
	P2WIN1      db "MortalKo/P2WIN1.bmp",0	
	P2WIN2      db "MortalKo/P2WIN2.bmp",0	
	P2WIN3      db "MortalKo/P2WIN3.bmp",0	 
	P2WIN4      db "MortalKo/P2WIN4.bmp",0	
	P2WIN5      db "MortalKo/P2WIN5.bmp",0	
	
	;Player 2 - Attack 1 Animation
	P2Attack1   db "MortalKo/P2Att11.bmp",0
	P2Attack2   db "MortalKo/P2Att12.bmp",0
	P2Attack3   db "MortalKo/P2Att13.bmp",0
	
	;Player 2 - Attack 2 Animation
	P2Attack21  db "MortalKo/P2Att21.bmp",0
	P2Attack22  db "MortalKo/P2Att22.bmp",0
	
	;Player 2 - Health Bar Animation
	P2H1        db "MortalKo/P2H1.bmp",0
	P2H2        db "MortalKo/P2H2.bmp",0
	P2H3        db "MortalKo/P2H3.bmp",0
	P2H4        db "MortalKo/P2H4.bmp",0
	
	;Player 2 - Attacked Animation
	P2Hurt      db "MortalKo/P2Hurt.bmp",0
		 
	FileHandle	dw ?
	Header 	    db 54 dup(0)
	Palette 	db 400h dup (0)
	
	
	;BmpFileErrorMsg    	db "Error At Opening Bmp File ",FILE_NAME_IN, 0dh, 0ah,"$"
	ErrorFile   db 0
    ;BB db "BB..","$"
	; array for mouse int 33 ax=09 (not a must) 64 bytes
	 
	BmpLeft     dw ?
	BmpTop      dw ?
	BmpColSize  dw ?
	BmpRowSize  dw ?
	
	BmpSizeB db 0	
;----====BMP Data====----

;---------------------------
;----====Data Area====----
;---------------------------
	
	
CODESEG
    
	
start:
	 mov ax, @data
	 mov ds,ax
	 
	 call SetGraphic

	 @@Pre: ;Game starts here. 
	 	 call PaintWS

	 @@WelcomeScreen:
	 	 call Await
     	 call CheckAndReadKey
		 mov ah,[KeyPress]
	 	 cmp [KeyPress],39h ;Checks if the player pressed space, if yes start the game.
	 	 jz @@GameStart
		 cmp [KeyPress],10h ;Checks if the player pressed "Q", if yes open the tutorial.
	 	 jz @@Tuto
		 cmp [KeyPress],2Dh ;Checks if the player pressed "X", if yes open background menu.
		 jz @@BackgroundMenu
		 jmp @@WelcomeScreen
	
	 @@GameStart:
	 	 call SetUp ;Sets up the game.
	
     @@Turn: 
		 call CheckAndReadKey
     	 call Background
	 	 call Player1Turn
	 	 call Player2Turn
	 
	 @@TurnEnd: ;Checks if the game ended by checking if a player was killed.
		 call Await
	 	 mov [KeyPress],0h
	 
	 	 cmp [HealthP1],0
	 	 jle @@P2Won
	 	 cmp [HealthP2],0
		 jle @@P1Won
	 
	 	 jmp @@Turn
	 
	 @@P1Won: ;If we get here, Player 1 killed Player 2. Calls the funcation PrintDeathP2 that prints the death of Player 2.
	 	 call PrintDeathP2
	 	 jmp @@DeathPrinted
	 
	 
	 @@P2Won: ;If we get here, Player 2 killed Player 1. Calls the funcation PrintDeathP1 that prints the death of Player 1.
	 	 call PrintDeathP1	
	 	 jmp @@DeathPrinted
	 
	 @@DeathPrinted: ;After the death animation was printed (whether it was Player 1 or Player 2 who won), this bit allows the user to restart the game by hitting space.
		 call CheckAndReadKey
		 mov ah,[KeyPress]
		 cmp [KeyPress],39h
		 jz @@Pre
		 jmp @@DeathPrinted
	 
	 @@Tuto: ;This bit is used to showcase the tutorial. It prints the tutorial (Variable name "Tutorial"), waits until the user hits "Q" and goes back to @@WelcomeScreen.
	 	 mov dx, offset Tutorial
	 	 mov [BmpLeft],0
		 mov [BmpTop],0
		 mov [BmpColSize],320
    	 mov [BmpRowSize],200
		 call OpenShowBmp
	     @@TutorialWait:
	 	 	 call CheckAndReadKey
	 	     cmp [KeyPress],10h
	 	     jnz @@TutorialWait
		     call PaintWS
		     jmp @@WelcomeScreen

	 @@BackgroundMenu: ;This bit is used to change worlds. It prints the background menu, waits for the user to pick a world and goes back to @@WelcomeScreen
	     mov dx, offset BackScr
	 	 mov [BmpLeft],0
		 mov [BmpTop],0
		 mov [BmpColSize],320
    	 mov [BmpRowSize],200
		 call OpenShowBmp ;Prints background menu.
		 @@BackgroundWait:   
	 	 	 call CheckAndReadKey ;Checks if the user pressed either 1, 2 or 3. if so jumps to the suiting event and changes the background.
	 	     cmp [KeyPress],02h
			 jz @@Backg1Picked
			 cmp [KeyPress],03h
			 jz @@Backg2Picked
			 cmp [KeyPress],04h
			 jz @@Backg3Picked
			 jmp @@BackgroundWait
        
			 @@Backg1Picked: ;Changes the background to Backg1.
			 mov [Backg + 14],'1'
		     call PaintWS
		     jmp @@WelcomeScreen

			 @@Backg2Picked: ;Changes the background to Backg2.
			 mov [Backg + 14],'2'
		     call PaintWS
		     jmp @@WelcomeScreen

			 @@Backg3Picked: ;Changes the background to Backg3.
			 mov [Backg + 14],'3'
		     call PaintWS
		     jmp @@WelcomeScreen

	     
	 
EXIT:
    
	 mov ax, 4C00h ; returns control to dos
  	 int 21h
  
  
;---------------------------
; Procudures area
;---------------------------

;================================================
; Description - Paints the Starting Screen using OpenShowBmp. 
;                 
;				
;               
;           	 
; INPUT: None
; OUTPUT: Paints Starting Screen
; Register Usage: DX
;================================================
proc PaintWS
	 mov dx, offset WS
	 mov [BmpLeft],0
	 mov [BmpTop],0
	 mov [BmpColSize],320
     mov [BmpRowSize],200
	
	 call OpenShowBmp 
	 ret
endp PaintWS

;================================================
; Description - Sets up the game. In order to do that it: 
;   -Resets Variables              
;	-Prints Player1 & Player2 in their natural position			
;   -Calls the Background method that prints the background + health bars. 
;           	 
; INPUT: None
; OUTPUT: Resets variables(HealthP1, HealthP2, Player1, PLayer2, P1Attack, P1AttackB, P1AttackB1, P1AttackB2, P1AttackedB, P2Attack, P2AttackB1, P2AttackB2, P2AttackedB). Prints Player 1 & 2. Includes the output of Background.
; Register Usage:  AX 
;================================================
proc SetUp
	 call Background ;Prints the background & health bars. 

	 ;Reset variables:
	 mov [HealthP1],3 
	 mov [HealthP2],3
	
	 mov [Player1],80
	 mov [Player2],200
	
	 mov [P1Attack],1  
	 mov [P1AttackB1],0
	 mov [P1AttackB2],0
	 mov [P1AttackedB],0
	
	 mov [P2Attack],1  
	 mov [P2AttackB1],0
	 mov [P2AttackB2],0
	 mov [P2AttackedB],0
	
	 ;Prints Player1 in it's starting position
     call AssignAnim1
     mov ax,[Player1]
	 mov [BmpLeft],ax
	 mov [BmpTop],80
	 mov [BmpColSize],57
     mov [BmpRowSize],99
	 call OpenShowBmp

	 ;Prints Player2 in it's starting position
	 call AssignAnim2
     mov ax,[Player2]
	 mov [BmpLeft],ax
	 call OpenShowBmp

	 ret
endp SetUp

;================================================
; Description - 
;                 
;				
;               
;           	 
; INPUT: None
; OUTPUT: [KeyPress]
; Register Usage: AX
;================================================
proc CheckAndReadKey
	  mov ah,1
	  int 16h
	  pushf
	  jz @@return 
	  mov ah,0
	  int 16h

@@return:
	  popf
 	  mov [KeyPress], ah
	  ret
endp CheckAndReadKey

;================================================
; Description - Prints the background, and the health bar of Player1 and Player2.
;                 
;				
;               
;           	 
; INPUT: [HealthP1],[HealthP2],[Backg]
; OUTPUT: Prints the background, and the health bar of Player1 and Player2.
; Register Usage: DX
;================================================
proc Background
     ;Prints the world the fight is taking place in.
     mov dx, offset Backg
	 mov [BmpLeft],0
	 mov [BmpTop],0
	 mov [BmpColSize],320
	 mov [BmpRowSize],200
	
	 call OpenShowBmp 
    
	 ;According to HealthP1, this small bit chooses what BMP to print.
	 @@PrintPlayer1Health:
	 	 cmp [HealthP1],0
	 	 jz @@PrintP1H0
	 	 cmp [HealthP1],1
	 	 jz @@PrintP1H1
	 	 cmp [HealthP1],2
	 	 jz @@PrintP1H2
	 	 cmp [HealthP1],3
	 	 jz @@PrintP1H3
	
		 @@PrintP1H0: ;Prints an empty health bar
			 mov dx, offset P1H4
		 	 jmp @@Player1HealthAssigned
		 @@PrintP1H1: ;Prints a 1/3 full health bar
		 	 mov dx, offset P1H3
		 	 jmp @@Player1HealthAssigned
	 	 @@PrintP1H2: ;Prints a 2/3 full health bar
		 	 mov dx, offset P1H2
		 	 jmp @@Player1HealthAssigned
	 	 @@PrintP1H3: ;Prints a full health bar
			 mov dx, offset P1H1

	 	 @@Player1HealthAssigned:
			 mov [BmpLeft],20
		 	 mov [BmpTop],20
		 	 mov [BmpColSize],30
		 	 mov [BmpRowSize],13
	
			 call OpenShowBmp
	
	 ;According to HealthP2, this small bit chooses what BMP to print.
	 @@PrintPlayer2Health:
		 cmp [HealthP2],0
	 	 jz @@PrintP2H0
		 cmp [HealthP2],1
		 jz @@PrintP2H1
		 cmp [HealthP2],2
		 jz @@PrintP2H2
		 cmp [HealthP2],3
		 jz @@PrintP2H3
	
	 	 @@PrintP2H0: ;Prints an empty health bar
		 	 mov dx, offset P2H4
			 jmp @@Player2HealthAssigned
		 @@PrintP2H1: ;Prints a 1/3 full health bar
			 mov dx, offset P2H3
			 jmp @@Player2HealthAssigned
		 @@PrintP2H2: ;Prints a 2/3 full health bar
		 	 mov dx, offset P2H2
		 	 jmp @@Player2HealthAssigned
		 @@PrintP2H3: ;Prints a full health bar
		 	 mov dx, offset P2H1
	
		 @@Player2HealthAssigned:
	 		 mov [BmpLeft],250
	 		 mov [BmpTop],20
	 		 mov [BmpColSize],30
	 		 mov [BmpRowSize],13
	   	     call OpenShowBmp

	 ret
endp Background

;================================================
; Description - Takes care of all actions that can be done by Player1. 
; -Checks if Player1 tried to move left/right and move him accordingly.     
; -Checks if Player1 tried to attack Player2 using attack 1/2, calculate if Player1 hit and damage Player2.
; -Prints Player1.
;           	 
; INPUT: [KeyPress],[Player1],[Player2],[BmpSizeB],[P1HurtB]
; OUTPUT: [Player1],[Player2],[HealthP2],[BmpSizeB],[P2AttackedB], Prints Player1 on screen.
; Register Usage: AX, BX, DX  
;================================================
proc Player1Turn

     ;----====Movement====----
	 ;This part checks if Player1 tried to go right or left.
	 mov ah, [KeyPress]
	 cmp ah, Player1RightKey
	 jz @@MoveLeft1
	 cmp ah, Player1LeftKey
	 jz @@MoveRight1
	 jmp @@NoMovement1
	  
	 @@MoveLeft1:
		 mov bx, [Player1]
		 cmp bx,LeftBorder
		 jz @@NoMovement1
		
		 sub bx, MoveDistance 
		 mov [Player1],bx
		 jmp @@NoMovement1
		
	 @@MoveRight1:
		 mov bx, [Player1]
		 cmp bx,RightBorder
		 jz @@NoMovement1
		
		 add bx, MoveDistance 
		 mov [Player1],bx
	 ;----====Movement====----
	 ;After we finished moving (or didn't move at all), this part checks if Player1 tried to attack Player2.
     @@NoMovement1:	 
	 	 mov ah, [KeyPress]
	     cmp ah, Player1Attack1Key
	     jz @@Player1AttackOne
	     cmp ah, Player1Attack2Key
	     jz @@Player1AttackTwo

	     jmp @@Print ;If Player1 didn't attempt to attack Player2, we just skip right to print it 

	 ;----===Attack Number One===----
	 @@Player1AttackOne:
	 	 mov [P1AttackB1],1
	 	 mov bx, [Player1]
		 cmp bx,[Player2]
		 jg @@P1Greater1

	     ;The following takes place if Player2 has a higher X value than Player1	
	  	 sub [Player2],bx 
	  	 cmp [Player2], AttackDistance	  
	 	 pushf
	  	 add [Player2], bx
	  	 popf
	     jle @@Attack11

	  	 jmp @@Print

	     ;The following takes place if Player2 has a lower X value than Player1		
	  	 @@P1Greater1:	   
	  	 	 sub bx,[Player2] 
	  		 cmp bx,AttackDistance
	  		 jle @@Attack11

	  	 	 jmp @@Print

		 ;The following takes place if Player1 managed to attack Player2. We substruct the health of Player2 by 1 and change the bool 'P2AttackedB' to true for animation purposes.
	  	 @@Attack11: 
	   	  	 dec [HealthP2]
	     	 mov [P2AttackedB],1
	     	 jmp @@Print
	 ;----===Attack Number One===----

	  ;----===Attack Number Two===----
	 @@Player1AttackTwo:
	  	 mov [P1AttackB2],1
	   	 mov bx,[Player1]
	     cmp bx,[Player2]
	     jg @@P1Greater2

		 ;The following takes place if Player2 has a higher X value than Player1
	  	 sub [Player2],bx 
	  	 cmp [Player2],AttackDistance2
	 	 pushf
	     add [Player2],bx
	 	 popf
	     jle @@Attack12
	  
	     jmp @@Print

		 ;The following takes place if Player2 has a lower X value than Player1		
	     @@P1Greater2:
	 		 sub bx,[Player2] 
	  		 cmp bx,AttackDistance2
	  		 jle @@Attack12
	  
	  		 jmp @@Print

	  	 ;The following takes place if Player1 managed to attack Player2. We substruct the health of Player2 by 2 and change the bool 'P2AttackedB' to true for animation purposes.
	     @@Attack12:
	 		 dec [HealthP2]
      		 dec [HealthP2]
	  		 mov [P2AttackedB],1
	 ;----===Attack Number Two===----

	 ;----===Print===----
	 @@Print:
	 	 call AssignAnim1
	  
		 mov ax,[Player1]
	 	 mov [BmpLeft],ax
		 mov [BmpTop],80
	  
	 @@OpenShowBmp1:   ;Assigns the right dimensions for the BMP.
	  	 cmp [BmpSizeB],0
	  	 jz @@NormalDim1
	  	 jnz @@NotNormalDim1
	  
	     @@NormalDim1:
	  		 mov [BmpColSize],57
	  		 mov [BmpRowSize],99
	  		 jmp @@DimGiven1
	  
	  	 @@NotNormalDim1:
	         mov [BmpColSize],75
	         mov [BmpRowSize],102
	  
	 @@DimGiven1:
	     mov [BmpSizeB],0
	     cmp [P1HurtB],0 ;Checks if the player is attacked and should display an 'attacked' animation. 
	  	 jz @@OpenShowBmp11 

	 	 mov dx, offset P1Hurt
	 	 mov [BmpColSize],57
	 	 mov [BmpRowSize],99
	 	 mov [P1HurtB],0
	  
	 @@OpenShowBmp11:
	     call OpenShowBmp
	 ;----===Print===----
	  
	  ret
endp Player1Turn

;================================================
; Description - The main function of this method 
; is moving the offset of a certain BMP address to DX,
; so it could assign the right animation for Player1. 
; This function also changes some minor variables to guide				         
; Player1Turn in setting the right parameters for OpenShowBMP.           	 
;
; INPUT: [P1AttackB1],[P1AttackB2],[P1Walk],[P1Attack],[P2AttackedB]
; OUTPUT: The address of a certain BMP file (stored in DX)
; Register Usage: DX
;================================================
proc AssignAnim1
	 ;Checks if Player1 is attempting attack1 or attack2, if so directs them to a suiting method.
     cmp [P1AttackB1],1   
	 jz @@Player1AttackOneAnimation
	 cmp [P1AttackB2],1
	 jz @@Player1AttackTwoAnimation
	
	 ;----===No Attack===---- 
	 ;If we get here, no attack was attempted by Player1. Assigns a suiting walking animation.
	 cmp [P1Walk],1
	 jz @@P11
	 cmp [P1Walk],2
	 jz @@P12
	 cmp [P1Walk],3
	 jz @@P13
	 cmp [P1Walk],4
	 jz @@P14
	 cmp [P1Walk],5
	 jz @@P15
	 cmp [P1Walk],6
	 jz @@P16
	 cmp [P1Walk],7
	 jz @@P17
	
     @@P11:   ;Walking animation variation 1
		 mov dx, offset P1Walk1
		 inc [P1Walk]
		 jmp @@WAssigned

	 @@P12:   ;Walking animation variation 2
		 mov dx, offset P1Walk2
		 inc [P1Walk]
		 jmp @@WAssigned

	 @@P13:   ;Walking animation variation 3
		 mov dx, offset P1Walk3
		 inc [P1Walk]
		 jmp @@WAssigned
		 
	 @@P14:   ;Walking animation variation 4
		 mov dx, offset P1Walk4
		 inc [P1Walk]
		 jmp @@WAssigned

	 @@P15:   ;Walking animation variation 5
		 mov dx, offset P1Walk5
		 inc [P1Walk]
		 jmp @@WAssigned
		
	 ;----===Attack===---- If we get here, an attack was attempted by Player1. Assigns a suiting attacking animation.
	 @@Player1AttackOneAnimation: 
		 cmp [P1Attack],1
		 jz @@P111
		 cmp [P1Attack],2
		 jz @@P112
		 cmp [P1Attack],3
		 jz @@P113
	
	 @@Player1AttackTwoAnimation:
	 	 cmp [P1Attack],1
		 jz @@P121
		 cmp [P1Attack],2
		 jz @@P122
	 ;----===Attack===----
	
	 @@P16:	  ;Walking animation variation 6
		 mov dx, offset P1Walk6
		 inc [P1Walk]
		 jmp @@WAssigned

	 @@P17:	  ;Walking animation variation 7
		 mov dx, offset P1Walk7
		 mov [P1Walk],1  ;Resets the counter that displays the animation so it loops.
	
	 @@WAssigned: ;Once all walking animations are done, they are transferred here so they can go to @Assigned
	 	 jmp @@Assigned

	 ;----===Attack One===----
	 @@P111:	  ;Attack 1 animation variation 1   
		 mov dx, offset P1Attack1
		 inc [P1Attack]  
		 jmp @@Assigned

	 @@P112:	  ;Attack 1 animation variation 2  
		 mov dx, offset P1Attack2
		 inc [P1Attack]
	     jmp @@Assigned

	 @@P113:	  ;Attack 1 animation variation 3  
		 mov dx, offset P1Attack3
		 mov [BmpSizeB], 1
		 mov [P1Attack],1
		 mov [P1AttackB1],0

		 cmp [P2AttackedB],0  ;If Player1 succesfully attacked Player2, it changes [P2HurtB] to true so Player2Turn will be able to assign the 'hurt' animation. It also moves [P2AttackedB] to 0 so it won't do it next time we get to P113.
		 jz @@Safe113

		 mov [P2HurtB],1
		 mov [P2AttackedB],0
	
		 @@Safe113:
		 	 jmp @@Assigned
	 ;----===Attack One===----

	 ;----===Attack Two===----
	 @@P121:	  ;Attack 2 animation variation 1  
		 mov dx, offset P1Attack21
		 inc [P1Attack]
	  	 jmp @@Assigned
	 @@P122:      ;Attack 2 animation variation 2  
		 mov dx, offset P1Attack22
		 mov [BmpSizeB], 1
		 mov [P1Attack],1
	     mov [P1AttackB2],0
		
		 cmp [P2AttackedB],0 ;If Player1 succesfully attacked Player2, it changes [P2HurtB] to true so Player2Turn will be able to assign the 'hurt' animation. It also moves [P2AttackedB] to 0 so it won't do it next time we get to P122.
		 jz @@Safe122

		 mov [P2HurtB],1 
		 mov [P2AttackedB],0
	
		 @@Safe122:
			 jmp @@Assigned
	 ;----===Attack Two===----
	
	 @@Assigned:

	 ret
endp AssignAnim1

;================================================
; Description - Takes care of all actions that can be done by Player2. 
; -Checks if Player2 tried to move left/right and move him accordingly.     
; -Checks if Player2 tried to attack Player1 using attack 1/2, calculate if Player2 hit and damage Player1.
; -Prints Player2.
;                 
;				
;               
;           	 
; INPUT: [KeyPress],[Player1],[Player2],[BmpSizeB],[P2HurtB] 
; OUTPUT: [Player1],[Player2],[HealthP1],[BmpSizeB],[P1AttackedB], Prints Player2 on screen. 
; Register Usage: AX, BX, DX    
;================================================
proc Player2Turn
     ;----====Movement====----
	 ;This part checks if Player1 tried to go right or left.
	 mov ah, [KeyPress]
	 cmp ah, Player2RightKey
	 jz @@MoveLeft2
	 cmp ah, Player2LeftKey
	 jz @@MoveRight2
	 jmp @@NoMovement2
	  
	 @@MoveLeft2:
		 mov bx, [Player2]
		 cmp bx,LeftBorder
		 jz @@NoMovement2
		
		 sub bx,MoveDistance 
		 mov [Player2],bx
		 jmp @@NoMovement2
		
	 @@MoveRight2:
		 mov bx, [Player2]	
		 cmp bx,RightBorder
		 jz @@NoMovement2
		
		 add bx,MoveDistance 
		 mov [Player2],bx
     ;----====Movement====----
	 ;After we finished moving (or didn't move at all), this part checks if Player2 tried to attack Player1.
     @@NoMovement2:	 
	  	 mov ah, [KeyPress] 
	   	 cmp ah, Player2Attack1Key
	  	 jz @@Player2AttackOne
	  	 cmp ah, Player2Attack2Key
	  	 jz @@Player2AttackTwo
	  
	  	 jmp @@Print2

	 ;----===Attack Number One===----
	 @@Player2AttackOne:
	  	 mov [P2AttackB1],1
	     mov bx, [Player1]
	     cmp bx,[Player2]
	     jg @@P2Greater1

	     ;The following takes place if Player2 has a higher X value than Player1
	     sub [Player2],bx 
	     cmp [Player2], AttackDistance
	   	 pushf
	   	 add [Player2], bx
	   	 popf
	   	 jle @@Attack21
	  
	   	 jmp @@Print2
	  	 
		 ;The following takes place if Player2 has a lower X value than Player1		
	     @@P2Greater1:
	         sub bx,[Player2] 
	         cmp bx, AttackDistance
	         jle @@Attack21
	   
	         jmp @@Print2	

	     ;The following takes place if Player2 managed to attack Player1. We substruct the health of Player1 by 1 and change the bool 'P1AttackedB' to true for animation purposes.  
	     @@Attack21:
	   		 dec [HealthP1]
       	     mov [P1AttackedB],1	   
	   	     jmp @@Print2
	 ;----===Attack Number One===----
	   
	 ;----===Attack Number Two===----
	 @@Player2AttackTwo:
	     mov [P2AttackB2],1
	     mov bx, [Player1]
	     cmp bx,[Player2]
	     jg @@P2Greater2

	     ;The following takes place if Player2 has a higher X value than Player1
	     sub [Player2],bx 
	     cmp [Player2], AttackDistance2
	     pushf
	     add [Player2], bx
	     popf
	     jle @@Attack22
	     
		 jmp @@Print2
	  	 
		 ;The following takes place if Player has a lower X value than Player1		
	     @@P2Greater2:
	  	     sub bx,[Player2] 
	   		 cmp bx, AttackDistance2
	   		 jle @@Attack22
	  
	   		 jmp @@Print2
	   	
		 ;The following takes place if Player2 managed to attack Player1. We substruct the health of Player1 by 2 and change the bool 'P1AttackedB' to true for animation purposes.  
	   	 @@Attack22:
	   	 	 dec [HealthP1]
       		 dec [HealthP1]
	   		 mov [P1AttackedB],1	   
	   
	 ;----===Print===----
	 @@Print2:
	 	 call AssignAnim2
	  
	 	 mov ax,[Player2]
	  	 mov [BmpLeft],ax
	  	 mov [BmpTop],80
	  
	 @@OpenShowBmp2:   ;Assigns the right dimensions for the BMP.
	  	 cmp [BmpSizeB],0
	  	 jz @@NormalDim2
	  	 jnz @@NotNormalDim2
	  
	  	 @@NormalDim2:
	  	 mov [BmpColSize], 57
	  	 mov [BmpRowSize], 99
	  	 jmp @@DimGiven2
	  
	  	 @@NotNormalDim2:
	  	 mov [BmpColSize], 75
	  	 mov [BmpRowSize], 102
	  	 mov ax,[Player2]
	  	 sub ax,18
	  	 mov [BmpLeft],ax
	  
	 @@DimGiven2:
	  	 mov [BmpSizeB],0  
	  	 cmp [P2HurtB],0 ;Checks if the player is attacked and should display an 'attacked' animation. 
	 	 jz @@OpenShowBmp21
	  
	  	 mov dx, offset P2Hurt
	  	 mov [BmpColSize], 57
	  	 mov [BmpRowSize], 99
	  	 mov [P2HurtB],0
	  
	 @@OpenShowBmp21:
	  	 call OpenShowBmp
	 ;----===Print===----
	  
	  ret
endp Player2Turn

;================================================
; Description - The main function of this method 
; is moving the offset of a certain BMP address to DX,
; so it could assign the right animation for Player2. 
; This function also changes some minor variables to guide				         
; Player2Turn in setting the right parameters for OpenShowBMP.           	 
;
; INPUT: [P2AttackB1],[P2AttackB2],[P2Walk],[P2Attack],[P1AttackedB]
; OUTPUT: The address of a certain BMP file (stored in DX)
; Register Usage: DX
;================================================
proc AssignAnim2
	 ;Checks if Player2 is attempting attack1 or attack2, if so directs them to a suiting method.
     cmp [P2AttackB1],1
	 jz @@Player2AttackOneAnimation
	 cmp [P2AttackB2],1
	 jz @@Player2AttackTwoAnimation

	 ;----===No Attack===----
	 ;If we get here, no attack was attempted by Player2. Assigns a suiting walking animation.
	 cmp [P2Walk],1
	 jz @@P21
	 cmp [P2Walk],2
	 jz @@P22
	 cmp [P2Walk],3
	 jz @@P23
	 cmp [P2Walk],4
	 jz @@P24
	 cmp [P2Walk],5
	 jz @@P25
	 cmp [P2Walk],6
	 jz @@P26
	 cmp [P2Walk],7
	 jz @@P27
	
	
     @@P21:    ;Walking animation variation 1
	     mov dx, offset P2Walk1
		 inc [P2Walk]
		 jmp @@WAssigned2
	 @@P22:    ;Walking animation variation 2
		 mov dx, offset P2Walk2
		 inc [P2Walk]
		 jmp @@WAssigned2
	 @@P23:    ;Walking animation variation 3
		 mov dx, offset P2Walk3
		 inc [P2Walk]
		 jmp @@WAssigned2
	 @@P24:    ;Walking animation variation 4
		 mov dx, offset P2Walk4
		 inc [P2Walk]
		 jmp @@WAssigned2
	 @@P25:    ;Walking animation variation 5
		 mov dx, offset P2Walk5
		 inc [P2Walk]
		 jmp @@WAssigned2

	;----====Attacks====---- If we get here, an attack was attempted by Player2. Assigns a suiting attacking animation.
	 @@Player2AttackOneAnimation:
		 cmp [P2Attack],1
		 jz @@P211
		 cmp [P2Attack],2
		 jz @@P212
		 cmp [P2Attack],3
		 jz @@P213
	
	 @@Player2AttackTwoAnimation:
		 cmp [P2Attack],1
		 jz @@P221
		 cmp [P2Attack],2
		 jz @@P222
	 ;----====Attacks====----

	 @@P26:	  ;Walking animation variation 6
		 mov dx, offset P2Walk6
		 inc [P2Walk]
		 jmp @@WAssigned2
	 @@P27:	  ;Walking animation variation 7
		 mov dx, offset P2Walk7
		 mov [P2Walk],1 ;Resets the counter that displays the animation so it loops.
	
	 @@WAssigned2: ;Once all walking animations are done, they are transferred here so they can go to @Assigned
		 jmp @@Assigned2

	 ;----===Attack One===----	
	 @@P211:	  ;Attack 1 animation variation 1
		 mov dx, offset P2Attack1
		 inc [P2Attack]
		 jmp @@Assigned2

	 @@P212:	  ;Attack 1 animation variation 2
		 mov dx, offset P2Attack2
		 inc [P2Attack]
		 jmp @@Assigned2
	 @@P213:	  ;Attack 1 animation variation 3
		 mov dx, offset P2Attack3
		 mov [BmpSizeB],1
		 mov [P2Attack],1  
		 mov [P2AttackB1],0
	
	     cmp [P1AttackedB],0 ;If Player2 succesfully attacked Player1, it changes [P1HurtB] to true so Player1Turn will be able to assign the 'hurt' animation. It also moves [P1AttackedB] to 0 so it won't do it next time we get to P213.
		 jz @@Safe213
		 
		 mov [P1HurtB],1
		 mov [P1AttackedB],0
	
		 @@Safe213:
		     jmp @@Assigned2
	 ;----===Attack One===----
	
	 ;----===Attack Two===----
	 @@P221:      ;Attack 2 animation variation 1
		 mov dx, offset P2Attack21
		 inc [P2Attack]
		 jmp @@Assigned2

	 @@P222:      ;Attack 2 animation variation 2 
		 mov dx, offset P2Attack22	
		 mov [BmpSizeB],1
		 mov [P2Attack],1
		 mov [P2AttackB2],0
	
		 cmp [P1AttackedB],0 ;If Player2 succesfully attacked Player1, it changes [P1HurtB] to true so Player1Turn will be able to assign the 'hurt' animation. It also moves [P1AttackedB] to 0 so it won't do it next time we get to P222.
		 jz @@Safe222

	 	 mov [P1HurtB],1
		 mov [P1AttackedB],0
	
		 @@Safe222:
		     jmp @@Assigned2
	 ;----===Attack Two===----
	
	 @@Assigned2:

	 ret
endp AssignAnim2

;================================================
; Description - Prints the death animation of Player1 and win animation of Player2.  
; Built out of 6 phases. Each phase: calls the Background method, then prints Player1, then prints Player2.     
; Once the method finishes, it prints a BMP file named P2W. This is the 'game over' message (actual text is "Player two won").
;               
;           	 
; INPUT: None
; OUTPUT: Prints the death animation of Player1 and win animation of Player2. 
; Register Usage: DX   
;================================================
proc PrintDeathP1

	 ;----===Phase 1===----
	 ;Background
     call Background
	 ;Player 1
	 call PrintDeathP1ParaP1
	 mov dx, offset P1DEAD1
	 call OpenShowBmp
	 ;Player 2
	 call PrintDeathP1ParaP2
	 mov dx, offset P2WIN1
	 call OpenShowBmp
	 call Await
	 
	 ;----===Phase 2===----
	 ;Background
	 call Background
	 ;Player 1
	 call PrintDeathP1ParaP1
	 mov dx, offset P1DEAD2
	 call OpenShowBmp
	 ;Player 2
	 call PrintDeathP1ParaP2
	 mov dx, offset P2WIN1
	 call OpenShowBmp
	 call Await
	 
	 ;----===Phase 3===----
	 ;Background
	 call Background
	 ;Player 1
	 call PrintDeathP1ParaP1
	 mov dx, offset P1DEAD3
	 call OpenShowBmp
	 ;Player 2
	 call PrintDeathP1ParaP2
	 mov dx, offset P2WIN2
	 call OpenShowBmp
	 call Await
	 
	 ;----===Phase 4===----
	 ;Background
	 call Background
	 ;Player 1
	 call PrintDeathP1ParaP1
	 mov dx, offset P1DEAD4
	 call OpenShowBmp
	 ;Player 2
	 call PrintDeathP1ParaP2
	 mov dx, offset P2WIN3
	 call OpenShowBmp
	 call Await
	 
	 ;----===Phase 5===----
	 ;Background
	 call Background
	 ;Player 1
	 call PrintDeathP1ParaP1
	 mov dx, offset P1DEAD5
	 call OpenShowBmp
	 ;Player 2
	 call PrintDeathP1ParaP2
	 mov dx, offset P2WIN4
	 call OpenShowBmp
	 call Await
	 
	 ;----===Phase 5===----
	 ;Background
	 call Background
	 ;Player 1
	 call PrintDeathP1ParaP1
	 mov [BmpTop],95 ;Make the body lower 
	 mov dx, offset P1DEAD6
	 call OpenShowBmp
	 ;Player 2
	 call PrintDeathP1ParaP2
	 mov dx, offset P2WIN5
	 call OpenShowBmp
	 call Await
	 
	 ;Prints P2W, the 'game over' message (actual text is "Player two won").
	 mov [BmpColSize],125
	 mov [BmpRowSize],27
	 mov [BmpTop],10
	 mov [BmpLeft],87
	 mov dx, offset P2W
	 call OpenShowBmp
	 
	 ret
endp PrintDeathP1

;================================================
; Description - Assists the method "PrintDeathP1" by supplying the right parameters for Player1 for OpenShowBMP
;                 
;				
;               
;           	 
; INPUT: [Player1]
; OUTPUT: [BmpColSize],[BmpRowSize],[BmpLeft],[BmpTop]
; Register Usage: None 
;================================================
proc PrintDeathP1ParaP1
	 mov [BmpColSize],89
	 mov [BmpRowSize],95
	 mov ax,[Player1]
	 mov [BmpLeft],ax
	 mov [BmpTop],80

	 ret
endp PrintDeathP1ParaP1

;================================================
; Description - Assists the method "PrintDeathP1" by supplying the right parameters for Player2 for OpenShowBMP
;                 
;				
;               
;           	 
; INPUT: [Player2]
; OUTPUT: [BmpColSize],[BmpRowSize],[BmpLeft],[BmpTop]
; Register Usage: None  
;================================================
proc PrintDeathP1ParaP2
	 mov [BmpColSize],46
	 mov [BmpRowSize],116
	 mov ax,[Player2]
	 add ax,30	        ;We add 30 to BmpLeft so Player2 won't override Player1.
	 mov [BmpLeft],ax
	 mov [BmpTop],70

	 ret
endp PrintDeathP1ParaP2

;================================================
; Description - Prints the death animation of Player2 and win animation of Player1.  
; Built out of 6 phases. Each phase: calls the Background method, then prints Player1, then prints Player2.     
; Once the method finishes, it prints a BMP file named P1W. This is the 'game over' message (actual text is "Player one won").				
;               
;           	 
; INPUT: None
; OUTPUT: Prints the win animation of Player1 and death animation of Player2. 
; Register Usage: None
;================================================
proc PrintDeathP2
	 
	 ;----===Phase 1===----
	 ;Background
     call Background
	 ;Player 1
	 call PrintDeathP2ParaP1
	 mov dx, offset P1WIN1
	 call OpenShowBmp
	 ;Player 2
	 call PrintDeathP2ParaP2
	 mov dx, offset P2DEAD1
	 call OpenShowBmp
	 call Await
	 
	 ;----===Phase 2===----
	 ;Background
	 call Background
	 ;Player 1
	 call PrintDeathP2ParaP1
	 mov dx, offset P1WIN1
	 call OpenShowBmp
	 ;Player 2
	 call PrintDeathP2ParaP2
	 mov dx, offset P2DEAD2
	 call OpenShowBmp
	 call Await
	 
	 ;----===Phase 3===----
	 ;Background
	 call Background
	 ;Player 1
	 call PrintDeathP2ParaP1
	 mov dx, offset P1WIN2
	 call OpenShowBmp
	 ;Player 2
	 call PrintDeathP2ParaP2
	 mov dx, offset P2DEAD3
	 call OpenShowBmp
	 call Await
	 
	 ;----===Phase 4===----
	 ;Background
	 call Background
	 ;Player 1
	 call PrintDeathP2ParaP1
	 mov dx, offset P1WIN3
	 call OpenShowBmp
	 ;Player 2
	 call PrintDeathP2ParaP2
	 mov dx, offset P2DEAD4
	 call OpenShowBmp
	 call Await
	 
	 ;----===Phase 5===----
	 ;Background
	 call Background
	 ;Player 1
	 call PrintDeathP2ParaP1
	 mov dx, offset P1WIN4
	 call OpenShowBmp
	 ;Player 2
	 call PrintDeathP2ParaP2
	 mov dx, offset P2DEAD5
	 call OpenShowBmp
	 call Await
	 
	 ;----===Phase 6===----
	 ;Background
	 call Background
	 ;Player 1
	 call PrintDeathP2ParaP1
	 mov dx, offset P1WIN5
	 call OpenShowBmp
	 ;Player 2
	 call PrintDeathP2ParaP2
	 mov [BmpTop],95 ;Make the body lower 
	 mov dx, offset P2DEAD6
	 call OpenShowBmp
	 call Await
	 
	 ;Prints P1W, the 'game over' message (actual text is "Player one won").
	 mov [BmpColSize],125
	 mov [BmpRowSize],27
	 mov [BmpTop],10
	 mov [BmpLeft],87
	 mov dx, offset P1W
	 call OpenShowBmp
	 
	 ret
endp PrintDeathP2

;================================================
; Description -  Assists the method "PrintDeathP2" by supplying the right parameters for Player1 for OpenShowBMP
;                 
;				
;               
;           	 
; INPUT: [Player1]
; OUTPUT: [BmpColSize],[BmpRowSize],[BmpLeft],[BmpTop]
; Register Usage: None
;================================================
proc PrintDeathP2ParaP1
	 mov [BmpColSize],46
	 mov [BmpRowSize],116
	 mov ax,[Player1]
	 add ax,30          ;We add 30 to BmpLeft so Player1 won't override Player2.
	 mov [BmpLeft],ax
	 mov [BmpTop],70

	 ret
endp PrintDeathP2ParaP1

;================================================
; Description -  Assists the method "PrintDeathP2" by supplying the right parameters for Player2 for OpenShowBMP
;                 
;				
;               
;           	 
; INPUT: [Player2]
; OUTPUT: [BmpColSize],[BmpRowSize],[BmpLeft],[BmpTop]
; Register Usage: None 
;================================================
proc PrintDeathP2ParaP2
	 mov [BmpColSize],89
	 mov [BmpRowSize],95
	 mov ax,[Player2]
	 mov [BmpLeft],ax
	 mov [BmpTop],80

	 ret
endp PrintDeathP2ParaP2

;================================================
; Description - Delays the program by flooding the CPU. This method allows
; us to control the speed of the game.
;				
;               
;           	 
; INPUT: None
; OUTPUT: None
; Register Usage: CX   
;================================================
proc Await
	push cx
	
	mov cx ,9000
@@Self1:
	
	push cx
	mov cx,600

@@Self2:	
	loop @@Self2
	
	pop cx
	loop @@Self1
	
	pop cx
	ret
endp Await

proc OpenShowBmp near
	
	 
	call OpenBmpFile
	cmp [ErrorFile],1
	je @@ExitProc
	
	call ReadBmpHeader
	
	call ReadBmpPalette
	
	call CopyBmpPalette
	
	call ShowBMP
	
	 
	call CloseBmpFile

@@ExitProc:
	ret
endp OpenShowBmp

 
 
	
; input dx filename to open
proc OpenBmpFile	near						 
	mov ah, 3Dh
	xor al, al
	int 21h
	jc @@ErrorAtOpen
	mov [FileHandle], ax
	jmp @@ExitProc
	
@@ErrorAtOpen:
	mov [ErrorFile],1
@@ExitProc:	
	ret
endp OpenBmpFile
 
 
 



proc CloseBmpFile near
	mov ah,3Eh
	mov bx, [FileHandle]
	int 21h
	ret
endp CloseBmpFile




; Read 54 bytes the Header
proc ReadBmpHeader	near					
	push cx
	push dx
	
	mov ah,3fh
	mov bx, [FileHandle]
	mov cx,54
	mov dx,offset Header
	int 21h
	
	pop dx
	pop cx
	ret
endp ReadBmpHeader



proc ReadBmpPalette near ; Read BMP file color palette, 256 colors * 4 bytes (400h)
						 ; 4 bytes for each color BGR + null)			
	push cx
	push dx
	
	mov ah,3fh
	mov cx,400h
	mov dx,offset Palette
	int 21h
	
	pop dx
	pop cx
	
	ret
endp ReadBmpPalette

; Will move out to screen memory the colors
; video ports are 3C8h for number of first color
; and 3C9h for all rest
proc CopyBmpPalette		near					
										
	push cx
	push dx
	
	mov si,offset Palette
	mov cx,256
	mov dx,3C8h
	mov al,0  ; black first							
	out dx,al ;3C8h
	inc dx	  ;3C9h
CopyNextColor:
	mov al,[si+2] 		; Red				
	shr al,2 			; divide by 4 Max (cos max is 63 and we have here max 255 ) (loosing color resolution).				
	out dx,al 						
	mov al,[si+1] 		; Green.				
	shr al,2            
	out dx,al 							
	mov al,[si] 		; Blue.				
	shr al,2            
	out dx,al 							
	add si,4 			; Point to next color.  (4 bytes for each color BGR + null)				
								
	loop CopyNextColor
	
	pop dx
	pop cx
	
	ret
endp CopyBmpPalette

proc  SetGraphic
	mov ax,13h   ; 320 X 200 
				 ;Mode 13h is an IBM VGA BIOS mode. It is the specific standard 256-color mode 
	int 10h
	ret
endp 	SetGraphic

proc ShowBMP 
; BMP graphics are saved upside-down.
; Read the graphic line by line (BmpRowSize lines in VGA format),
; displaying the lines from bottom to top.
	push cx
	
	mov ax, 0A000h
	mov es, ax
	
	mov cx,[BmpRowSize]
	
 
	mov ax,[BmpColSize] ; row size must dived by 4 so if it less we must calculate the extra padding bytes
	xor dx,dx
	mov si,4
	div si
	cmp dx,0
	mov bp,0
	jz @@row_ok
	mov bp,4
	sub bp,dx

@@row_ok:	
	mov dx,[BmpLeft]
	
@@NextLine:
	push cx
	push dx
	
	mov di,cx  ; Current Row at the small bmp"(each time -1)
	add di,[BmpTop] ; add the Y on entire screen
	
 
	; next 5 lines  di will be  = cx*320 + dx , point to the correct screen line
	dec di
	mov cx,di
	shl cx,6
	shl di,8
	add di,cx
	add di,dx
	 
	; small Read one line
	mov ah,3fh
	mov cx,[BmpColSize]  
	add cx,bp  ; extra  bytes to each row must be divided by 4
	mov dx,offset ScrLine
	int 21h
	; Copy one line into video memory
	cld ; Clear direction flag, for movsb
	mov cx,[BmpColSize]  
	mov si,offset ScrLine
	
	@@DrawLine:
            cmp [byte ptr si], ChromaKey
            jnz @@NotChromaKey
            
            inc si
            inc di
            jmp @@DontDraw
            
        @@NotChromaKey:
            movsb ; Copy line to the screen
            
        @@DontDraw:
            loop @@DrawLine
	
	pop dx
	pop cx
	 
	loop @@NextLine
	
	pop cx
	ret
endp ShowBMP  

;---------------------------
; Procudures area
;---------------------------

END start