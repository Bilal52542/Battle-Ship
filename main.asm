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
.code
main PROC
	;menu ko print ka loop hai
	menu_loop:
		mov edx,OFFSET menu_msg
		call WriteString
		call ReadChar
		call Crlf

		cmp al,'1' ;starts
		je start_game

		cmp al,'2' ;exit
		je exit_game

		jmp invalid_input
	start_game:
		call Crlf
		jmp menu_loop
	invalid_input:
		mov edx,OFFSET inv_msg
		call WriteString
		call Crlf
		jmp menu_loop 
	exit_game:
		mov edx,OFFSET ext_msg
		call WriteString
		call Crlf
		exit
main ENDP
END main
