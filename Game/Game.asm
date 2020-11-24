INCLUDE Irvine32.inc
INCLUDE Macros.inc
.data 
; cmp = compare
; je = jump if equal
; jg = jump if greater
; jl = jump if less
.code
main PROC  

 
	jmp startOfProg
startOfProg:
	call Clrscr 
	 mov bl, 0
	mWriteLn "Do you want to"
	mWriteLn "1: Start"
	mWriteLn "2: Credits"
	mWriteLn "3: exit"
	call ReadInt 
	cmp eax, 1
	je start
	cmp eax, 2
	je credits
	cmp eax, 3
	je exitProg
	cmp eax,4
	je keepExploring
	cmp eax,5
	je takeLRoomKey
	jmp startOfProg

exitProg:
	mWriteLn "Ok exiting"
	exit
start:
	call Clrscr 
	mov eax, 0
	mWriteLn "You stand in a hallway do you want to go"
	mWriteLn "1: Left"
	mWriteLn "2: Right"
	call ReadInt 
	cmp eax,1
	je left 
	cmp eax,2
	je right 
	jmp start
right:
	call Clrscr
	mov eax, 0
	mWriteLn "You decided to go right"
	mWriteLn "You find a door do you want to"
	mWriteLn "1: Open it"
	mWriteLn "2: Go back"
	call ReadInt
	cmp eax, 1
	je hasKey
	cmp eax, 2
	je start
	jmp right
left:
	call Clrscr
	mov eax, 0
	mWriteLn "You decided to go left"
	mWriteLn "You find a door do you want to"
	mWriteLn "1: Open it"
	mWriteLn "2: Go back"
	call ReadInt
	cmp eax, 1
	je openLDoor
	cmp eax, 2
	je start
	jmp left
hasKey:
	call Clrscr
	cmp bl, 1
	je OpenRDoor
	mWriteLn "You need a key"
	mWriteLn "1: Go back"
	call ReadInt
	cmp eax, 1
	je right
	jmp hasKey
openLDoor:
	call Clrscr
	mov eax, 0
	mWriteLn "You opened the door and went inside"
	mWriteLn "There is a room do you want to"
	mWriteLn "1: Search it"
	mWriteLn "2: Go back"
	call ReadInt
	cmp eax, 1
	je searchLRoom
	cmp eax, 2
	je left
	jmp openLDoor
searchLRoom:
	call Clrscr
	mov eax, 0
	mWriteLn "You searched the room and found a key"
	mWriteLn "Do you want to"
	mWriteLn "1: take it"
	mWriteLn "2: Go back"	
	call ReadInt
	cmp eax, 1
	je takeLRoomKey
	cmp eax, 2
	je openLDoor
	jmp searchLRoom
takeLRoomKey:
	call Clrscr
	mov bl, 1
	
	mWriteLn "You decide to take the key"
	mWriteLn "Do you want to"
	mWriteLn "1: Go back"
	call ReadInt
	cmp eax, 1
	je start
	jmp takeLRoomKey
openRDoor:
	call Clrscr
	mov eax, 0
	mWriteLn "You decided to open it and it lead outside"
	mWriteLn "Do you want to"
	mWriteLn "1: Explore"
	mWriteLn "2: Go back inside"
	call ReadInt 
	cmp eax, 1
	je explore
	cmp eax, 2
	je right
	jmp openRDoor
explore:
	call Clrscr
	mov eax, 0
	mWriteLn "You decided to explore"
	mWriteLn "You stumble upon a small house"
	mWriteLn "Do you want to"
	mWriteLn "1: Explore it"
	mWriteLn "2: keep on exploring"
	call ReadInt
	cmp eax, 1
	je exploreHouse
	cmp eax, 2
	je keepExploring
	jmp explore
exploreHouse:
	call Clrscr
	mov eax, 0
	mWriteLn "You decide to explore it"
	mWriteLn "It looks abandon"
	mWriteLn "Do you want to"
	mWriteLn "1: Check the front door"
	mWriteLn "2: Go back"
	call ReadInt
	cmp eax, 1
	je checkFDoor
	cmp eax, 2
	je explore
	jmp exploreHouse
checkFDoor:
	call Clrscr
	mov eax, 0
	mWriteLn "You check the front door"
	mWriteLn "It seems to be unlocked do you want to"
	mWriteLn "1: Try to open it"
	mWriteLn "2: Go back"
	call ReadInt
	cmp eax, 1
	je openFDoor
	cmp eax, 2
	je exploreHouse
	jmp checkFDoor
openFDoor:
	call Clrscr
	mov eax, 0
	mWriteLn "You decide to try opening it"
	mWriteLn "It was unlocked do you want to"
	mWriteLn "1: Go inside"
	mWriteLn "2: Go back"
	call ReadInt
	cmp eax,1
	je insideHouse
	cmp eax, 2
	je checkFDoor
	jmp openFDoor
insideHouse:
	call Clrscr
	mov eax, 0
	mWriteLn "You decide to go inside"
	mWriteLn "There is a light in the middle of"
	mWriteLn "The room do you want to"
	mWriteLn "1: Check on it"
	mWriteLn "2: Go back"
	call ReadInt
	cmp eax,1
	je checkLight
	cmp eax,2
	je openFDoor
	jmp insideHouse
checkLight:
	mov eax,0
	call Clrscr
	mWriteLn "You walk towards the light"
	mWriteLn "You see that there is nothing here"
	mWriteLn "Do you want to"
	mWriteLn "1: Go back"
	call ReadInt 
	cmp eax,1
	je insideHouse
	jmp checkLight
keepExploring:
	call Clrscr
	mov eax, 0
	mWriteLn "You decide to keep exploring"
	mWriteLn "After a while you find a road"
	mWriteLn "Do you want to"
	mWriteLn "1: Follow it"
	mWriteLn "2: Go back"
	call ReadInt
	cmp eax,1
	je followRoad
	cmp eax,2
	je Explore
	jmp keepExploring
followRoad:
	call Clrscr
	mov eax, 0
	mWriteLn "You decide to follow the road"
	mWriteLn "Do you want to "
	mWriteLn "1: Continue"
	mWriteLn "2: Go back"
	call ReadInt
	cmp eax, 1
	je crossroad
	cmp eax, 2
	je keepExploring
	jmp followRoad
crossroad:
	call Clrscr
	mov eax,0
	mov ebx,0
	mWriteLn "You found your way to what looks like"
	mWriteLn "A crossroad"
	mWriteLn "Do you want to go"
	mWriteLn "1: East"
	mWriteLn "2: West"
	mWriteLn "3: Go back"
	call ReadInt
	cmp eax, 1
	je east
	cmp eax, 2
	je west
	cmp eax, 3
	je followRoad
	jmp crossroad
;New Stuff
east: 
	call Clrscr
	mov eax,0
	mWriteLn "You decide to head east"
	mWriteLn "After you have walked for a bit you decide to rest"
	mWriteLn "Do you want to "
	mWriteLn "1: Look around"
	mWriteLn "2: Continue"
	mWriteLn "3: Go back"
	call ReadInt 
	cmp eax, 1
	je lookAround
	cmp eax, 2
	je continueEast
	cmp eax, 3
	je crossroad
	jmp east
lookAround:
	call Clrscr
	mov eax, 0
	mWriteLn "You decided to look around"
	exit
continueEast:
	call Clrscr
	mov eax, 0
	mWriteLn "You decided to continue going east"
	exit
west: 
	call Clrscr
	mov eax,0
	mWriteLn "You decide to head west"
	exit


;End of new stuff

credits:
	call Clrscr
	mov eax, 0
	mWriteLn "----------------------"
	mWriteLn "Coded by: Jerk"
	mWriteLn "Written in: X86 assembly"
	mWriteLn "Using Irvine32 library"
	mWriteLn "and Macros.inc"
	mWriteLn "Started on: 5 oct 2020"
	mWriteLn "Lines of code: 289"
	mWriteLn "------1: Go Back------"
	call ReadInt
	cmp eax,1
	je startOfProg
	jmp Credits
main ENDP
END main