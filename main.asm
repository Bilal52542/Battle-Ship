INCLUDE Irvine32.inc
.data
	menu_msg db "==== Battleship Game ====",0Dh,0Ah ; 0dh and 0ah for new line
	         db "1. Start Game",0Dh,0Ah
			 db "2. Exit",0Dh,0Ah
			 db "=========================",0Dh,0Ah
			 db "Choose Options : ",0
	choice   db ?
	ext_msg  db "Exiting the game !",0
	inv_msg  db "Invalid Input !",0
	player1_board db 100 dup('~')
	player2_board db 100 dup('~')
	player3_board db 100 dup('~')
	player4_board db 100 dup('~')
	ship1 db ?
	ship2 db ?
	ship3 db ?
	ship4 db 2 dup(?)
.code
main proc
	;menu ko print ka loop hai
	menu_loop:
		mov edx,OFFSET menu_msg
		call writestring
		call readchar
		call crlf

		cmp al,'1' ;starts
		je start_game

		cmp al,'2' ;exit
		je exit_game

		jmp invalid_input
	start_game:
		call StartGame
		call clrscr
		call crlf
		jmp menu_loop
	invalid_input:
		mov edx,offset inv_msg
		call writestring
		call crlf
		jmp menu_loop 
	exit_game:
		mov edx,offset ext_msg
		call writestring
		call crlf
		exit
main endp

StartGame proc
	;game start ho toh draw grid aur ask player to input ships
	call crlf
	push offset player1_board
	call DrawGrid
	call PlaceShips
	ret
StartGame endp
DrawGrid proc 
	; simple draw grid function which draws which ever grid tha in offset
	mov esi,[esp+4]
	mov ecx,10
	row_loop:
		push ecx
		mov ecx,10
		col_loop:
			mov al,[esi]
			call writechar
			inc esi
			mov al,' '
			call writechar
		loop col_loop
		call crlf
		pop ecx
	loop row_loop
	ret 4
DrawGrid endp
PlaceShips proc
	; ask for coordinates (using msg) and then validate then place ship :cry:
	call readint
	call writedec
	call readint
	call writedec
	ret
PlaceShips endp
END main
