INCLUDE Irvine32.inc
INCLUDE Macros.inc
.data 
; cmp = compare
; je = jump if equal
; jg = jump if greater
; jl = jump if less
.code
main PROC
	jmp StartOfProg
StartOfProg:
	call Clrscr
	mov bl, 0
	mWriteLn "Do you want to"
	mWriteLn "1: Start"
	mWriteLn "2: Credits"
	mWriteLn "3: exit"
	call ReadInt 
	cmp eax, 1
	je Start
	cmp eax, 2
	je Credits
	cmp eax, 3
	je ExitProg
	cmp eax,4
	je KeepExploring
	jmp StartOfProg

ExitProg:
	mWriteLn "Ok exiting"
	exit
Start:
	call Clrscr 
	mov eax, 0
	mWriteLn "You stand in a hallway do you want to go"
	mWriteLn "1: Left"
	mWriteLn "2: Right"
	call ReadInt 
	cmp eax,1
	je Left 
	cmp eax,2
	je Right 
	jmp Start
Right:
	call Clrscr
	mov eax, 0
	mWriteLn "You decided to go right"
	mWriteLn "You find a door do you want to"
	mWriteLn "1: Open it"
	mWriteLn "2: Go back"
	call ReadInt
	cmp eax, 1
	je HasKey
	cmp eax, 2
	je Start
	jmp Right
Left:
	call Clrscr
	mov eax, 0
	mWriteLn "You decided to go left"
	mWriteLn "You find a door do you want to"
	mWriteLn "1: Open it"
	mWriteLn "2: Go back"
	call ReadInt
	cmp eax, 1
	je OpenLDoor
	cmp eax, 2
	je Start
	jmp Left
HasKey:
	call Clrscr
	cmp bl, 1
	je OpenRDoor
	mWriteLn "You need a key"
	mWriteLn "1: Go back"
	call ReadInt
	cmp eax, 1
	je Right
	jmp HasKey
OpenLDoor:
	call Clrscr
	mov eax, 0
	mWriteLn "You opened the door and went inside"
	mWriteLn "There is a room do you want to"
	mWriteLn "1: Search it"
	mWriteLn "2: Go back"
	call ReadInt
	cmp eax, 1
	je SearchLRoom
	cmp eax, 2
	je Left
	jmp OpenLDoor
SearchLRoom:
	call Clrscr
	mov eax, 0
	mWriteLn "You searched the room and found a key"
	mWriteLn "Do you want to"
	mWriteLn "1: take it"
	mWriteLn "2: Go back"	
	call ReadInt
	cmp eax, 1
	je TakeLRoomKey
	cmp eax, 2
	je OpenLDoor
	jmp SearchLRoom
TakeLRoomKey:
	call Clrscr
	mov bl, 1
	mWriteLn "You decide to take the key"
	mWriteLn "Do you want to"
	mWriteLn "1: Go back"
	call ReadInt
	cmp eax, 1
	je Start
	jmp TakeLRoomKey
OpenRDoor:
	call Clrscr
	mov eax, 0
	mWriteLn "You decided to open it and it lead outside"
	mWriteLn "Do you want to"
	mWriteLn "1: Explore"
	mWriteLn "2: Go back inside"
	call ReadInt 
	cmp eax, 1
	je Explore
	cmp eax, 2
	je Right
	jmp OpenRDoor
Explore:
	call Clrscr
	mov eax, 0
	mWriteLn "You decided to explore"
	mWriteLn "You stumble upon a small house"
	mWriteLn "Do you want to"
	mWriteLn "1: Explore it"
	mWriteLn "2: keep on exploring"
	call ReadInt
	cmp eax, 1
	je ExploreHouse
	cmp eax, 2
	je KeepExploring
	jmp Explore
ExploreHouse:
	call Clrscr
	mov eax, 0
	mWriteLn "You decide to explore it"
	mWriteLn "It looks abandon"
	mWriteLn "Do you want to"
	mWriteLn "1: Check the front door"
	mWriteLn "2: Go back"
	call ReadInt
	cmp eax, 1
	je CheckFDoor
	cmp eax, 2
	je Explore
	jmp ExploreHouse
CheckFDoor:
	call Clrscr
	mov eax, 0
	mWriteLn "You check the front door"
	mWriteLn "It seems to be unlocked do you want to"
	mWriteLn "1: Try to open it"
	mWriteLn "2: Go back"
	call ReadInt
	cmp eax, 1
	je OpenFDoor
	cmp eax, 2
	je ExploreHouse
	jmp CheckFDoor
OpenFDoor:
	call Clrscr
	mov eax, 0
	mWriteLn "You decide to try opening it"
	mWriteLn "It was unlocked do you want to"
	mWriteLn "1: Go inside"
	mWriteLn "2: Go back"
	call ReadInt
	cmp eax,1
	je InsideHouse
	cmp eax, 2
	je CheckFDoor
	jmp OpenFDoor
InsideHouse:
	call Clrscr
	mov eax, 0
	mWriteLn "You decide to go inside"
	mWriteLn "There is a light in the middle of"
	mWriteLn "The room do you want to"
	mWriteLn "1: Check on it"
	mWriteLn "2: Go back"
	call ReadInt
	cmp eax,1
	je CheckLight
	cmp eax,2
	je OpenFDoor
	jmp InsideHouse
CheckLight:
	mov eax,0
	call Clrscr
	mWriteLn "You walk towards the light"
	mWriteLn "You see that there is nothing here"
	mWriteLn "Do you want to"
	mWriteLn "1: Go back"
	call ReadInt 
	cmp eax,1
	je InsideHouse
	jmp CheckLight
KeepExploring:
	call Clrscr
	mov eax, 0
	mWriteLn "You decide to keep exploring"
	mWriteLn "After a while you find a road"
	mWriteLn "Do you want to"
	mWriteLn "1: Follow it"
	mWriteLn "2: Go back"
	call ReadInt
	cmp eax,1
	je FollowRoad
	cmp eax,2
	je Explore
	jmp KeepExploring
FollowRoad:
	call Clrscr
	mov eax, 0
	mWriteLn "You decide to follow the road"
	exit
NotLost:
	call Clrscr
	mov eax,0
	mov ebx,0
	mWriteLn "You found your way to what looks like"
	mWriteLn "A crossroad"
	exit
Credits:
	call Clrscr
	mov eax, 0
	mWriteLn "----------------------"
	mWriteLn "Coded by: Jerk"
	mWriteLn "Written in: X86 assembly"
	mWriteLn "Using Irvine32 library"
	mWriteLn "and Macros.inc"
	mWriteLn "Started on: 5 oct 2020"
	mWriteLn "Lines of code: 250"
	mWriteLn "------1: Go Back------"
	call ReadInt
	cmp eax,1
	je StartOfProg
	jmp Credits
main ENDP
END main