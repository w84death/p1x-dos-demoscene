	CPU 486
	[map symbols /home/piec/DOS/p1x-dos-demoscene/demo-01/TP/demo01/symbols.map]
	[ORG 0x100]
	; LineNumber: 158
	jmp block1
	; LineNumber: 3
Memory_i1:	dw	0
	; LineNumber: 6
Memory_error_code:	dw	0x00
	; LineNumber: 8
Memory_blocks:	dw	0
	; LineNumber: 4
Screen_i:	dw	0
	; LineNumber: 4
Screen_noBuffers:	dw	0
	; LineNumber: 7
Screen_color:	db	0
	; LineNumber: 7
Screen_red:	db	0
	; LineNumber: 7
Screen_green:	db	0
	; LineNumber: 7
Screen_blue:	db	0
	; LineNumber: 10
Screen_buffer1: dw  0,0
	; LineNumber: 10
Screen_buffer2: dw  0,0
	; LineNumber: 10
Screen_buffer3: dw  0,0
	; LineNumber: 10
Screen_buffer4: dw  0,0
	; LineNumber: 10
Screen_buffer5: dw  0,0
	; LineNumber: 13
Screen_source: dw  0,0
	; LineNumber: 13
Screen_dest: dw  0,0
	; LineNumber: 5
File_fp: dw  0,0
	; LineNumber: 5
File_tp: dw  0,0
	; LineNumber: 6
File_val:	dw	0
	; LineNumber: 6
File_size:	dw	0
	; LineNumber: 6
File_val2:	dw	0
	; LineNumber: 7
File_dst: dw  0,0
	; LineNumber: 8
File_attr:	db	0
	; LineNumber: 31
File_File_this: dw  0,0
	; LineNumber: 117
	File_file: times 4 db 0
	; LineNumber: 3
Gfx_y:	dw	0
	; LineNumber: 3
Gfx_color:	dw	0
	; LineNumber: 4
Fonts_font_size_x:	dw	0
	; LineNumber: 4
Fonts_font_size_y:	dw	0
	; LineNumber: 4
Fonts_font_columns:	dw	0
	; LineNumber: 6
Fonts_lookup:	 times 64 dw 0
	; LineNumber: 7
Fonts_data: dw  0,0
	; LineNumber: 7
Fonts_dst: dw  0,0
	; LineNumber: 7
Fonts_dst2: dw  0,0
	; LineNumber: 7
Fonts_src: dw  0,0
	; LineNumber: 8
Fonts_tp: dw  0,0
	; LineNumber: 9
Fonts_x:	dw	0
	; LineNumber: 9
Fonts_y:	dw	0
	; LineNumber: 9
Fonts_c:	dw	0
	; LineNumber: 9
Fonts_i:	dw	0
	; LineNumber: 9
Fonts_xx:	dw	0
	; LineNumber: 9
Fonts_shift:	dw	0
	; LineNumber: 9
Fonts_len:	dw	0
	; LineNumber: 12
Fonts_addValue:	db	0x00
	; LineNumber: 12
Fonts_maskColor:	db	0x00
	; LineNumber: 17
Fonts_writeType:	dw	0x00
	; LineNumber: 5
BeePlay_ptrOrder: dw  0,0
	; LineNumber: 5
BeePlay_ptrPattern: dw  0,0
	; LineNumber: 5
BeePlay_zp: dw  0,0
	; LineNumber: 6
BeePlay_noChannels:	db	0
	; LineNumber: 6
BeePlay_oct:	db	0
	; LineNumber: 6
BeePlay_o3:	db	0
	; LineNumber: 7
BeePlay_octShift:	db	0x02
	; LineNumber: 7
BeePlay_o4:	db	0x02
	; LineNumber: 10
BeePlay_i:	dw	0
	; LineNumber: 10
BeePlay_noRows:	dw	0
	; LineNumber: 10
BeePlay_val:	dw	0
	; LineNumber: 10
BeePlay_v2:	dw	0
	; LineNumber: 10
BeePlay_j:	dw	0
	; LineNumber: 11
BeePlay_curOrder:	dw	0
	; LineNumber: 11
BeePlay_noOrder:	dw	0
	; LineNumber: 11
BeePlay_curRow:	dw	0
	; LineNumber: 11
BeePlay_speed:	dw	0
	; LineNumber: 11
BeePlay_counter:	dw	0
	; LineNumber: 14
BeePlay_decayLength:	dw 0x2, 0x2, 0x2, 0x2, 0x2, 0x2, 0x2, 0x2
	dw 
	; LineNumber: 15
BeePlay_curNotes:	dw 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
	dw 
	; LineNumber: 17
BeePlay_curDecay:	dw 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
	dw 
	; LineNumber: 21
BeePlay_curN:	dw	0x00
	; LineNumber: 24
BeePlay_noteTable:	dw 0x8e88, 0x8683, 0x7ef6, 0x77d8, 0x7120, 0x6ac7, 0x64c6, 0x5f1e
	dw 0x59c9, 0x54be, 0x4ffc, 0x4b7d
	; LineNumber: 33
BeePlay_pow2:	dw 0x1, 0x2, 0x4, 0x8, 0x10, 0x20, 0x40, 0x80
	dw 0x100, 0x200
	; LineNumber: 9
Compression_inb: dw  0,0
	; LineNumber: 9
Compression_outb: dw  0,0
	; LineNumber: 4
Random_Seed:	dw	0
	; LineNumber: 14
song:
	incbin	 "/home/piec/DOS/p1x-dos-demoscene/demo-01/TP/demo01///music.bin"
end_incbin_song:
	; LineNumber: 18
font		db	"font.bin"
	db	0
	; LineNumber: 20
i:	dw	0x00
	; LineNumber: 20
time:	dw	0x00
	; LineNumber: 20
scene_time:	dw	0x00
	; LineNumber: 21
color:	dw	0x00
	; LineNumber: 21
c:	dw	0x00
	; LineNumber: 22
current_scene:	dw	0x00
	; LineNumber: 23
current_scene_len:	dw	0
	; LineNumber: 24
last_scene:	dw	0x02
	; LineNumber: 29
x1:	dw	0xa0
	; LineNumber: 29
x2:	dw	0xa0
	; LineNumber: 30
y1:	dw	0x64
	; LineNumber: 30
y2:	dw	0x64
	; LineNumber: 31
sx:	dw	0
	; LineNumber: 31
sy:	dw	0
	; LineNumber: 32
shift:	dw	0x00
	; LineNumber: 35
sinx:	dw 0x98, 0x9b, 0x9f, 0xa3, 0xa6, 0xaa, 0xae, 0xb1
	dw 0xb5, 0xb9, 0xbc, 0xc0, 0xc4, 0xc7, 0xcb, 0xce
	dw 0xd2, 0xd5, 0xd8, 0xdc, 0xdf, 0xe2, 0xe6, 0xe9
	dw 0xec, 0xef, 0xf2, 0xf5, 0xf8, 0xfb, 0xfe, 0x100
	dw 0x103, 0x106, 0x108, 0x10b, 0x10d, 0x10f, 0x112, 0x114
	dw 0x116, 0x118, 0x11a, 0x11c, 0x11e, 0x11f, 0x121, 0x122
	dw 0x124, 0x125, 0x127, 0x128, 0x129, 0x12a, 0x12b, 0x12c
	dw 0x12d, 0x12d, 0x12e, 0x12e, 0x12f, 0x12f, 0x12f, 0x12f
	dw 0x130, 0x12f, 0x12f, 0x12f, 0x12f, 0x12e, 0x12e, 0x12d
	dw 0x12d, 0x12c, 0x12b, 0x12a, 0x129, 0x128, 0x127, 0x125
	dw 0x124, 0x122, 0x121, 0x11f, 0x11e, 0x11c, 0x11a, 0x118
	dw 0x116, 0x114, 0x112, 0x10f, 0x10d, 0x10b, 0x108, 0x106
	dw 0x103, 0x100, 0xfe, 0xfb, 0xf8, 0xf5, 0xf2, 0xef
	dw 0xec, 0xe9, 0xe6, 0xe2, 0xdf, 0xdc, 0xd8, 0xd5
	dw 0xd2, 0xce, 0xcb, 0xc7, 0xc4, 0xc0, 0xbc, 0xb9
	dw 0xb5, 0xb1, 0xae, 0xaa, 0xa6, 0xa3, 0x9f, 0x9b
	dw 0x98, 0x94, 0x90, 0x8c, 0x89, 0x85, 0x81, 0x7e
	dw 0x7a, 0x76, 0x73, 0x6f, 0x6b, 0x68, 0x64, 0x61
	dw 0x5d, 0x5a, 0x57, 0x53, 0x50, 0x4d, 0x49, 0x46
	dw 0x43, 0x40, 0x3d, 0x3a, 0x37, 0x34, 0x31, 0x2f
	dw 0x2c, 0x29, 0x27, 0x24, 0x22, 0x20, 0x1d, 0x1b
	dw 0x19, 0x17, 0x15, 0x13, 0x11, 0x10, 0x0e, 0x0d
	dw 0x0b, 0x0a, 0x08, 0x07, 0x06, 0x05, 0x04, 0x03
	dw 0x02, 0x02, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00
	dw 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x02
	dw 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x0a
	dw 0x0b, 0x0d, 0x0e, 0x10, 0x11, 0x13, 0x15, 0x17
	dw 0x19, 0x1b, 0x1d, 0x20, 0x22, 0x24, 0x27, 0x29
	dw 0x2c, 0x2f, 0x31, 0x34, 0x37, 0x3a, 0x3d, 0x40
	dw 0x43, 0x46, 0x49, 0x4d, 0x50, 0x53, 0x57, 0x5a
	dw 0x5d, 0x61, 0x64, 0x68, 0x6b, 0x6f, 0x73, 0x76
	dw 0x7a, 0x7e, 0x81, 0x85, 0x89, 0x8c, 0x90, 0x94
	dw 
	; LineNumber: 36
siny:	dw 0x5c, 0x5e, 0x60, 0x62, 0x65, 0x67, 0x69, 0x6b
	dw 0x6d, 0x70, 0x72, 0x74, 0x76, 0x78, 0x7a, 0x7d
	dw 0x7f, 0x81, 0x83, 0x85, 0x87, 0x89, 0x8b, 0x8d
	dw 0x8f, 0x90, 0x92, 0x94, 0x96, 0x98, 0x99, 0x9b
	dw 0x9d, 0x9e, 0xa0, 0xa1, 0xa3, 0xa4, 0xa5, 0xa7
	dw 0xa8, 0xa9, 0xaa, 0xac, 0xad, 0xae, 0xaf, 0xb0
	dw 0xb0, 0xb1, 0xb2, 0xb3, 0xb4, 0xb4, 0xb5, 0xb5
	dw 0xb6, 0xb6, 0xb7, 0xb7, 0xb7, 0xb7, 0xb7, 0xb7
	dw 0xb8, 0xb7, 0xb7, 0xb7, 0xb7, 0xb7, 0xb7, 0xb6
	dw 0xb6, 0xb5, 0xb5, 0xb4, 0xb4, 0xb3, 0xb2, 0xb1
	dw 0xb0, 0xb0, 0xaf, 0xae, 0xad, 0xac, 0xaa, 0xa9
	dw 0xa8, 0xa7, 0xa5, 0xa4, 0xa3, 0xa1, 0xa0, 0x9e
	dw 0x9d, 0x9b, 0x99, 0x98, 0x96, 0x94, 0x92, 0x90
	dw 0x8f, 0x8d, 0x8b, 0x89, 0x87, 0x85, 0x83, 0x81
	dw 0x7f, 0x7d, 0x7a, 0x78, 0x76, 0x74, 0x72, 0x70
	dw 0x6d, 0x6b, 0x69, 0x67, 0x65, 0x62, 0x60, 0x5e
	dw 0x5c, 0x59, 0x57, 0x55, 0x52, 0x50, 0x4e, 0x4c
	dw 0x4a, 0x47, 0x45, 0x43, 0x41, 0x3f, 0x3d, 0x3a
	dw 0x38, 0x36, 0x34, 0x32, 0x30, 0x2e, 0x2c, 0x2a
	dw 0x28, 0x27, 0x25, 0x23, 0x21, 0x1f, 0x1e, 0x1c
	dw 0x1a, 0x19, 0x17, 0x16, 0x14, 0x13, 0x12, 0x10
	dw 0x0f, 0x0e, 0x0d, 0x0b, 0x0a, 0x09, 0x08, 0x07
	dw 0x07, 0x06, 0x05, 0x04, 0x03, 0x03, 0x02, 0x02
	dw 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	dw 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01
	dw 0x01, 0x02, 0x02, 0x03, 0x03, 0x04, 0x05, 0x06
	dw 0x07, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0d, 0x0e
	dw 0x0f, 0x10, 0x12, 0x13, 0x14, 0x16, 0x17, 0x19
	dw 0x1a, 0x1c, 0x1e, 0x1f, 0x21, 0x23, 0x25, 0x27
	dw 0x28, 0x2a, 0x2c, 0x2e, 0x30, 0x32, 0x34, 0x36
	dw 0x38, 0x3a, 0x3d, 0x3f, 0x41, 0x43, 0x45, 0x47
	dw 0x4a, 0x4c, 0x4e, 0x50, 0x52, 0x55, 0x57, 0x59
	dw 
	; LineNumber: 37
grad:	db 0x20, 0x21, 0x23, 0x24, 0x26, 0x27, 0x29, 0x2a
	db 0x2c, 0x2d, 0x2f, 0x30, 0x31, 0x33, 0x34, 0x35
	db 0x36, 0x37, 0x38, 0x39, 0x3a, 0x3b, 0x3c, 0x3c
	db 0x3d, 0x3e, 0x3e, 0x3f, 0x3f, 0x3f, 0x3f, 0x3f
	db 0x40, 0x3f, 0x3f, 0x3f, 0x3f, 0x3f, 0x3e, 0x3e
	db 0x3d, 0x3c, 0x3c, 0x3b, 0x3a, 0x39, 0x38, 0x37
	db 0x36, 0x35, 0x34, 0x33, 0x31, 0x30, 0x2f, 0x2d
	db 0x2c, 0x2a, 0x29, 0x27, 0x26, 0x24, 0x23, 0x21
	db 0x20, 0x1e, 0x1c, 0x1b, 0x19, 0x18, 0x16, 0x15
	db 0x13, 0x12, 0x10, 0x0f, 0x0e, 0x0c, 0x0b, 0x0a
	db 0x09, 0x08, 0x07, 0x06, 0x05, 0x04, 0x03, 0x03
	db 0x02, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
	db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01
	db 0x02, 0x03, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08
	db 0x09, 0x0a, 0x0b, 0x0c, 0x0e, 0x0f, 0x10, 0x12
	db 0x13, 0x15, 0x16, 0x18, 0x19, 0x1b, 0x1c, 0x1e
	db 
	; LineNumber: 39
intro_text		db	"HELLO, TURBO RASCAL!"
	db	0
	; LineNumber: 40
lines_text		db	"PLACEHOLDER EFFECT"
	db	0
	; LineNumber: 41
outro_text		db	"END OF THE DEMO..."
	db	0
	; LineNumber: 42
tp: dw  0,0
	; ***********  Defining procedure : Memory_SetTimer
	;    Procedure type : User-defined procedure
	; LineNumber: 23
	; LineNumber: 22
Memory_ticks:	dw	0
 ; Temp vars section
 ; Temp vars section ends
Memory_SetTimer_block2:
Memory_SetTimer:
	; LineNumber: 24
	; ****** Inline assembler section
	cli 
	; LineNumber: 25
	; ****** Inline assembler section
  	  mov al,0x36
  	  out 0x43,al
  	  mov dx,0x40
  	  mov ax,[Memory_ticks]
  	  out 0x40,al
  	  mov al,ah
  	  out 0x40,al
  
	; LineNumber: 34
	; ****** Inline assembler section
	sti 
	; LineNumber: 35
	ret
end_procedure_Memory_SetTimer:
	; ***********  Defining procedure : Memory_Init
	;    Procedure type : User-defined procedure
	; LineNumber: 39
Memory_Init:
	; LineNumber: 42
	; ****** Inline assembler section
	mov	dx,ss		; Stack segment
	mov	bx,128 / 16 + 1 ; stack size in paragraphs
	add	bx,dx		; BX = end
	mov	ax,es		; ES = PSP (start)
	sub	bx,ax		; BX = new size in paragraphs
	mov	ah,0x4A
	int	21h
	; Allocate some memory up to 1024*2
	mov ah,0x48
	mov bx, 0x2000-0x160-0x3D
	int 0x21
	
	; LineNumber: 58
	ret
end_procedure_Memory_Init:
	
; // 0x2000
	; ***********  Defining procedure : Memory_GetBlockMem
	;    Procedure type : User-defined procedure
	; LineNumber: 61
	; LineNumber: 60
Memory_GetBlockMem_block4:
Memory_GetBlockMem:
	; LineNumber: 63
	mov [Memory_error_code], word 0x0
	; LineNumber: 65
	; ****** Inline assembler section
	mov ah,0x48
		mov bx, [Memory_blocks]
		int 0x21
		mov [Memory_i1],ax
		jnc gbe_ok
		mov [Memory_error_code], ax
gbe_ok:
	
	; LineNumber: 74
	; LineNumber: 80
	mov ax, [Memory_i1]
	mov es,ax
	mov ax, 0x0
	mov di,ax
	ret
end_procedure_Memory_GetBlockMem:
	; ***********  Defining procedure : Screen_InitVGABuffers
	;    Procedure type : User-defined procedure
	; LineNumber: 37
	; LineNumber: 36
Screen_InitVGABuffers_block5:
Screen_InitVGABuffers:
	; LineNumber: 38
	; Binary clause Simplified: GREATER
	; Compare with pure num / var optimization
	cmp [Screen_noBuffers],word 0x0
	jbe Screen_InitVGABuffers_elsedoneblock9
Screen_InitVGABuffers_ConditionalTrueBlock7: ;Main true block ;keep :
	; LineNumber: 38
	; Assigning pointer
	; Setting PURE POINTER 0
	mov [Memory_blocks], word 0xfff
	call Memory_GetBlockMem
	; Setting PURE POINTER ends
	mov [Screen_buffer1+2], es
	mov [Screen_buffer1], di
Screen_InitVGABuffers_elsedoneblock9:
	; LineNumber: 40
	; Binary clause Simplified: GREATER
	; Compare with pure num / var optimization
	cmp [Screen_noBuffers],word 0x1
	jbe Screen_InitVGABuffers_elsedoneblock15
Screen_InitVGABuffers_ConditionalTrueBlock13: ;Main true block ;keep :
	; LineNumber: 40
	; Assigning pointer
	; Setting PURE POINTER 0
	mov [Memory_blocks], word 0xfff
	call Memory_GetBlockMem
	; Setting PURE POINTER ends
	mov [Screen_buffer2+2], es
	mov [Screen_buffer2], di
Screen_InitVGABuffers_elsedoneblock15:
	; LineNumber: 42
	; Binary clause Simplified: GREATER
	; Compare with pure num / var optimization
	cmp [Screen_noBuffers],word 0x2
	jbe Screen_InitVGABuffers_elsedoneblock21
Screen_InitVGABuffers_ConditionalTrueBlock19: ;Main true block ;keep :
	; LineNumber: 42
	; Assigning pointer
	; Setting PURE POINTER 0
	mov [Memory_blocks], word 0xfff
	call Memory_GetBlockMem
	; Setting PURE POINTER ends
	mov [Screen_buffer3+2], es
	mov [Screen_buffer3], di
Screen_InitVGABuffers_elsedoneblock21:
	; LineNumber: 44
	; Binary clause Simplified: GREATER
	; Compare with pure num / var optimization
	cmp [Screen_noBuffers],word 0x3
	jbe Screen_InitVGABuffers_elsedoneblock27
Screen_InitVGABuffers_ConditionalTrueBlock25: ;Main true block ;keep :
	; LineNumber: 44
	; Assigning pointer
	; Setting PURE POINTER 0
	mov [Memory_blocks], word 0xfff
	call Memory_GetBlockMem
	; Setting PURE POINTER ends
	mov [Screen_buffer4+2], es
	mov [Screen_buffer4], di
Screen_InitVGABuffers_elsedoneblock27:
	; LineNumber: 46
	; Binary clause Simplified: GREATER
	; Compare with pure num / var optimization
	cmp [Screen_noBuffers],word 0x4
	jbe Screen_InitVGABuffers_elsedoneblock33
Screen_InitVGABuffers_ConditionalTrueBlock31: ;Main true block ;keep :
	; LineNumber: 46
	; Assigning pointer
	; Setting PURE POINTER 0
	mov [Memory_blocks], word 0xfff
	call Memory_GetBlockMem
	; Setting PURE POINTER ends
	mov [Screen_buffer5+2], es
	mov [Screen_buffer5], di
Screen_InitVGABuffers_elsedoneblock33:
	; LineNumber: 48
	ret
end_procedure_Screen_InitVGABuffers:
	; ***********  Defining procedure : Screen_SetColor
	;    Procedure type : User-defined procedure
	; LineNumber: 91
	; LineNumber: 90
	; LineNumber: 90
	; LineNumber: 90
	; LineNumber: 90
Screen_SetColor_block36:
Screen_SetColor:
	; LineNumber: 93
	; ****** Inline assembler section
	Cli
    mov dx,0x3c8
    mov al,[Screen_color]
    out dx,al
    inc dx
    mov al,[Screen_red]
    out dx,al
    mov al,[Screen_green]
    out dx,al
    mov al,[Screen_blue]
    out dx,al
    Sti
   
	; LineNumber: 107
	ret
end_procedure_Screen_SetColor:
	; ***********  Defining procedure : Screen_CopyVGABuffer32bit
	;    Procedure type : User-defined procedure
	; LineNumber: 126
	; LineNumber: 125
	; LineNumber: 125
Screen_CopyVGABuffer32bit_block37:
Screen_CopyVGABuffer32bit:
	; LineNumber: 128
	; ****** Inline assembler section
	cld
  	push ds
    les di,[Screen_dest]
    lds si,[Screen_source]
    mov ecx, 16000
    rep movsd
    pop ds
  
	; LineNumber: 136
	ret
end_procedure_Screen_CopyVGABuffer32bit:
	; ***********  Defining procedure : Screen_ClearBuffer32bit
	;    Procedure type : User-defined procedure
	; LineNumber: 140
	; LineNumber: 139
	; LineNumber: 139
_ax:	dw	0
Screen_ClearBuffer32bit_block38:
Screen_ClearBuffer32bit:
	; LineNumber: 142
	; ****** Inline assembler section
	les di,[Screen_dest]
    mov     cx, 16000
    rep stosD
  
	; LineNumber: 146
	ret
end_procedure_Screen_ClearBuffer32bit:
	; ***********  Defining procedure : Screen_SetMode
	;    Procedure type : User-defined procedure
	; LineNumber: 164
	; LineNumber: 163
Screen_SetMode_block39:
Screen_SetMode:
	; LineNumber: 165
	; ****** Inline assembler section
		mov ax,[Screen_i]
		int 0x10
	
	; LineNumber: 169
	ret
end_procedure_Screen_SetMode:
	
; // TRSE's first proper class
	; ***********  Defining procedure : File_File_Open
	;    Procedure type : User-defined procedure
	; LineNumber: 21
	; LineNumber: 20
	; LineNumber: 20
File_File_Open_block40:
File_File_Open:
	; LineNumber: 22
	; ****** Inline assembler section
			mov ah, 0x3D
			mov al, [File_attr] ; open attribute: 0 - read-only, 1 - write-only, 2 -read&write
			mov dx, word [File_fp] ; ASCIIZ filename to open
			int 21h
			mov [File_val],ax
			
	; LineNumber: 29
	; Assigning pointer with index, type:INTEGER right is pointer: 0
	mov ax, [File_val]
	les di, [File_File_this]
	mov [es:di+0x0*1],al
	; LineNumber: 30
	ret
end_procedure_File_File_Open:
	; ***********  Defining procedure : File_File_Read
	;    Procedure type : User-defined procedure
	; LineNumber: 46
	; LineNumber: 45
	; LineNumber: 45
File_File_Read_block41:
File_File_Read:
	; LineNumber: 47
	les di,[File_File_this]
	mov ax, word [es:di + 0x0*4]
	mov ah,0
	mov [File_val], ax
	; LineNumber: 48
	; ****** Inline assembler section
			cli
			mov ah, 0x3F
			mov bx, [File_val]
			mov cx, [File_size] ; number of bytes to read
;			mov dx, [File_dst] ; were to put read data
			push ds
			lds dx,[File_dst]	
			int 21h	
			pop ds
			mov [File_val2],ax
			sti
			
	; LineNumber: 61
	; Assigning pointer with index, type:INTEGER right is pointer: 0
	mov ax, [File_val2]
	mov [es:di+0x2*1],al
	; LineNumber: 62
	ret
end_procedure_File_File_Read:
	; ***********  Defining procedure : File_File_Close
	;    Procedure type : User-defined procedure
	; LineNumber: 103
File_File_Close:
	; LineNumber: 104
	les di,[File_File_this]
	mov ax, word [es:di + 0x0*4]
	mov ah,0
	mov [File_val], ax
	; LineNumber: 105
	; ****** Inline assembler section
			mov ah, 0x3E
			mov bx, [File_val] ; file handle
			int 21h	
			
	; LineNumber: 110
	ret
end_procedure_File_File_Close:
	; ***********  Defining procedure : File_ReadAll
	;    Procedure type : User-defined procedure
	; LineNumber: 122
	; LineNumber: 121
	; LineNumber: 121
File_ReadAll_block43:
File_ReadAll:
	; LineNumber: 123
	; Assigning pointer
	lea si, [File_file]
	mov [File_File_this+2], ds
	mov [File_File_this], si
	mov [File_attr], byte 0x0
	call File_File_Open
	; LineNumber: 124
	; Assigning pointer
	lea si, [File_file]
	mov [File_File_this+2], ds
	mov [File_File_this], si
	mov [File_size], word 0xfde8
	; Assigning pointer
	les di, [File_tp]
	mov [File_dst+2], es
	mov [File_dst], di
	call File_File_Read
	; LineNumber: 125
	; Assigning pointer
	lea si, [File_file]
	mov [File_File_this+2], ds
	mov [File_File_this], si
	call File_File_Close
	; LineNumber: 126
	ret
end_procedure_File_ReadAll:
	; ***********  Defining procedure : Gfx_DrawLine
	;    Procedure type : User-defined procedure
	; LineNumber: 128
	; LineNumber: 117
Gfx_i:	dw	0
	; LineNumber: 117
Gfx_s:	dw	0
	; LineNumber: 117
Gfx_d1x:	dw	0
	; LineNumber: 117
Gfx_d1y:	dw	0
	; LineNumber: 117
Gfx_d2x:	dw	0
	; LineNumber: 117
Gfx_d2y:	dw	0
	; LineNumber: 117
Gfx_u:	dw	0
	; LineNumber: 117
Gfx_v:	dw	0
	; LineNumber: 117
Gfx_m:	dw	0
	; LineNumber: 117
Gfx_n:	dw	0
	; LineNumber: 116
Gfx_a:	dw	0
	; LineNumber: 116
Gfx_b:	dw	0
	; LineNumber: 116
Gfx_c:	dw	0
	; LineNumber: 116
Gfx_d:	dw	0
	; LineNumber: 116
	; LineNumber: 116
Gfx_where: dw  0,0
Gfx_DrawLine_block44:
Gfx_DrawLine:
	; LineNumber: 130
	; ****** Inline assembler section
	mov ax,word [Gfx_where+2]
     mov es,Ax
     Mov Ax,[Gfx_a]
     Cmp Ax,[Gfx_c]
     Jne @@Nopes
     Mov Ax,[Gfx_b]
     Cmp Ax,[Gfx_d]
     Jne @@Nopes
;     Mov AX,320
;     Mul word [Gfx_b]
;     Add Ax,[Gfx_a]
;     Mov Di,Ax
;     Mov Al,[Gfx_color]
 ;    StosB
     Jmp @@Ending
@@Nopes:
     Jmp @@There
@@Sgn:
     Cmp Ax,0
     Jg @@Plus
     Jl @@Neg
@@Plus:   Mov Ax,1
     Jmp @@Ferds
@@Neg:Mov Ax,-1
@@Ferds:Ret
@@There:
        Mov Ax,[Gfx_c]
        Sub Ax,[Gfx_a]
        Mov [Gfx_u],Ax
        Call @@Sgn
        Mov [Gfx_d1x],Ax
        Mov [Gfx_d2x],Ax
        Mov Ax,[Gfx_d]
        Sub Ax,[Gfx_b]
        Mov [Gfx_v],Ax
        Call @@Sgn
        Mov [Gfx_d1y],Ax
        Mov [Gfx_d2y],word 0
        Mov Ax,[Gfx_u]
        Cmp Ax,0
        Jg @@Not1
        Sub Ax,[Gfx_u]
        Sub Ax,[Gfx_u]
@@Not1: Mov [Gfx_m],Ax
        Mov Ax,[Gfx_v]
        Cmp Ax,0
        Jg @@Not2
        Sub Ax,[Gfx_v]
        Sub Ax,[Gfx_v]
@@Not2: Mov [Gfx_n],Ax
     Mov Ax,[Gfx_m]
     Cmp Ax,[Gfx_n]
     Ja @@Hmm
              Mov Ax,[Gfx_v]
              Call @@Sgn
              Mov [Gfx_d2y],Ax
              Mov [Gfx_d2x],word 0
              Mov Ax,[Gfx_v]
              Cmp Ax,0
              Jnl @@Vidr
              Sub Ax,[Gfx_v]
              Sub Ax,[Gfx_v]
          @@Vidr:
              Mov [Gfx_m],Ax
              Mov Ax,[Gfx_u]
              Cmp Ax,0
              Jnl @@Vidr2
              Sub Ax,[Gfx_u]
              Sub Ax,[Gfx_u]
          @@Vidr2:
              Mov [Gfx_n],Ax
@@Hmm:
          Mov ax,[Gfx_m]
          Shr Ax,1
          Mov [Gfx_s],Ax
  
         Mov Cx,[Gfx_m]
@@Luup:
		
	; LineNumber: 238
	; LineNumber: 42
	; LineNumber: 44
	; ****** Inline assembler section
	Mov     bx,[Gfx_a]
         Mov     dx,[Gfx_b]
         Mov     di,bx
         Mov     bx, dx                  ;
        
	; LineNumber: 50
	; ****** Inline assembler section
         Shl     dx, 8
         Shl     bx, 6
         
	; LineNumber: 66
	; ****** Inline assembler section
	Add     dx, bx                  ;
         Add     di, dx                  ; finalise location
         Mov     al, [Gfx_color]
 ;        Cli
;         add es:[di],al
         mov [es:di],al
	
		
	; LineNumber: 74
	; LineNumber: 242
	; ****** Inline assembler section
	;         inc di
  ;       Sti
@@DoNo:
         Mov Ax,[Gfx_s]
         Mov Bx,[Gfx_a]
         Mov Dx,[Gfx_b]
         Add Ax,[Gfx_n]     ;S:=S+N
         Cmp Ax,[Gfx_m]        ;IF S<M then goto @@Not
         Jbe @@Not
         Sub Ax,[Gfx_m]         ;S:=S-M
         Add Bx,[Gfx_d1x]       ;A:=A+D2X
         Add Dx,[Gfx_d1y]       ;B:=B+D2Y
         Jmp @@Ferd       ;Else
@@Not:                    ;Do @@Not
         Add Bx,[Gfx_d2x]       ;A:=A+D2X
         Add Dx,[Gfx_d2y]       ;B:=B+D2Y
@@Ferd:
         Mov [Gfx_s],Ax
         Mov [Gfx_a],Bx
         Mov [Gfx_b],Dx
         Loop @@Luup
@@Ending:
	
	; LineNumber: 271
	ret
end_procedure_Gfx_DrawLine:
	; ***********  Defining procedure : Fonts_Init
	;    Procedure type : User-defined procedure
	; LineNumber: 22
	; LineNumber: 21
	; LineNumber: 21
	; LineNumber: 21
	; LineNumber: 21
	; LineNumber: 21
Fonts_Init_block46:
Fonts_Init:
	; LineNumber: 23
	mov [Fonts_y], word 0x0
	; LineNumber: 24
	mov [Fonts_xx], word 0x0
	; LineNumber: 25
	mov [Fonts_c], word 0x0
	; LineNumber: 26
	; Generic add/sub
	mov ax, [Fonts_font_size_x]
	mov cx, 0x2
	sar  ax,cl; bop
	mov [Fonts_len], ax
	; LineNumber: 40
	mov [Fonts_i], word 0x0
Fonts_Init_forloop47:
	; LineNumber: 28
	; LineNumber: 29
	; RHS is pure optimization
	mov ax, [Fonts_xx]
	; Forcetype IS POINTER: 0
	add  ax, [Fonts_y]
	mov [Fonts_c], ax
	; LineNumber: 30
	;Is array index
	; Assign value to regular array
	mov ax, [Fonts_c]
	mov di,[Fonts_i] ; index is word
	shl di,1
	mov [Fonts_lookup+di], ax
	; LineNumber: 31
	; 'a:=a + const'  optimization 
	add [Fonts_x], word 0x1
	; LineNumber: 32
	; 'a:=a + expression'  optimization 
	mov ax, [Fonts_font_size_x]
	; Type : INTEGER
	add [Fonts_xx], ax
	; LineNumber: 33
	; Binary clause Simplified: EQUALS
	; Compare two vars optimization
	mov ax, [Fonts_font_columns]
	cmp  [Fonts_x],ax
	jne Fonts_Init_elsedoneblock61
Fonts_Init_ConditionalTrueBlock59: ;Main true block ;keep :
	; LineNumber: 34
	; LineNumber: 35
	mov [Fonts_x], word 0x0
	; LineNumber: 36
	mov [Fonts_xx], word 0x0
	; LineNumber: 37
	; 'a:=a + expression'  optimization 
	mov ax, [Fonts_font_size_y]
	mov bx, 0x140
	mul  bx
	; Type : INTEGER
	add [Fonts_y], ax
	; LineNumber: 38
Fonts_Init_elsedoneblock61:
	; LineNumber: 39
Fonts_Init_loopstart48:
	add [Fonts_i],word 1
	mov ax, 0x40
	cmp ax,word [Fonts_i]
	jne Fonts_Init_forloop47
Fonts_Init_loopend49:
	; LineNumber: 41
	ret
end_procedure_Fonts_Init:
	; ***********  Defining procedure : Fonts_PrintChar
	;    Procedure type : User-defined procedure
	; LineNumber: 45
	; LineNumber: 44
	; LineNumber: 44
Fonts_PrintChar_block64:
Fonts_PrintChar:
	; LineNumber: 46
	; Assigning pointer
	les di, [Fonts_data]
	mov [Fonts_src+2], es
	mov [Fonts_src], di
	; LineNumber: 47
	; 'a:=a + expression'  optimization 
	; RHS is pure optimization
	mov ax, [Fonts_c]
	; Forcetype IS POINTER: 0
	sub  ax, [Fonts_shift]
	mov di,ax
	shl di,1 ; Accomodate for word
	mov ax, [Fonts_lookup+di]
	; Type : POINTER
	add [Fonts_src], ax
	; LineNumber: 50
	; Binary clause Simplified: EQUALS
	; Compare with pure num / var optimization
	cmp [Fonts_writeType],word 0x0
	jne Fonts_PrintChar_elsedoneblock68
Fonts_PrintChar_ConditionalTrueBlock66: ;Main true block ;keep :
	; LineNumber: 50
	mov [Fonts_i], word 0x0
Fonts_PrintChar_forloop76:
	; LineNumber: 52
	; LineNumber: 53
	
; //	font_size_x:=16;
; //	font_size_y:=20;
	; Memcpy
	push ds
	mov ax, [Fonts_len]
	push ax
	les di,[Fonts_dst]
	lds si,[Fonts_src]
	pop cx
	rep movsd
	pop ds
	; LineNumber: 54
	; 'a:=a + const'  optimization 
	add [Fonts_src], word 0x140
	; LineNumber: 55
	; 'a:=a + const'  optimization 
	add [Fonts_dst], word 0x140
	; LineNumber: 56
Fonts_PrintChar_loopstart77:
	add [Fonts_i],word 1
	mov ax, [Fonts_font_size_y]
	cmp ax,word [Fonts_i]
	jne Fonts_PrintChar_forloop76
Fonts_PrintChar_loopend78:
Fonts_PrintChar_elsedoneblock68:
	; LineNumber: 57
	; Binary clause Simplified: EQUALS
	; Compare with pure num / var optimization
	cmp [Fonts_writeType],word 0x1
	jne Fonts_PrintChar_elsedoneblock84
Fonts_PrintChar_ConditionalTrueBlock82: ;Main true block ;keep :
	; LineNumber: 58
	mov [Fonts_i], word 0x0
Fonts_PrintChar_forloop92:
	; LineNumber: 60
	; LineNumber: 61
	; ****** Inline assembler section
		mov dl,byte [Fonts_addValue]
		push ds
		mov ax, [Fonts_font_size_x]
		mov bl, [Fonts_maskColor]
		push ax
		les di,[Fonts_dst]
		lds si,[Fonts_src]
		pop cx
@fsb_topp:
		lodsb
		cmp al,bl
		jl @fsb_nxt
		add al,dl
		mov [es:di],al
@fsb_nxt:
		inc di
		loop @fsb_topp
		
		pop ds
		
		
	; LineNumber: 84
	
; //		memcpy32(src,dst,len);
	; 'a:=a + const'  optimization 
	add [Fonts_src], word 0x140
	; LineNumber: 85
	; 'a:=a + const'  optimization 
	add [Fonts_dst], word 0x140
	; LineNumber: 86
Fonts_PrintChar_loopstart93:
	add [Fonts_i],word 1
	mov ax, [Fonts_font_size_y]
	cmp ax,word [Fonts_i]
	jne Fonts_PrintChar_forloop92
Fonts_PrintChar_loopend94:
Fonts_PrintChar_elsedoneblock84:
	; LineNumber: 87
	ret
end_procedure_Fonts_PrintChar:
	; ***********  Defining procedure : Fonts_PrintString
	;    Procedure type : User-defined procedure
	; LineNumber: 91
	; LineNumber: 90
	; LineNumber: 90
	; LineNumber: 90
	; LineNumber: 90
Fonts_PrintString_block97:
Fonts_PrintString:
	; LineNumber: 92
	; 'a:=a + expression'  optimization 
	mov ax, [Fonts_y]
	mov bx, 0x140
	mul  bx
	; Type : POINTER
	add [Fonts_dst2], ax
	; LineNumber: 93
	; 'a:=a + expression'  optimization 
	mov ax, [Fonts_x]
	; Type : POINTER
	add [Fonts_dst2], ax
	; LineNumber: 94
Fonts_PrintString_while98:
Fonts_PrintString_loopstart102:
	; Binary clause Simplified: NOTEQUALS
	; Compare with pure num / var optimization
	les di,[Fonts_tp]
	mov ax, word [es:di + 0x0*1]
	mov ah,0
	cmp ax,0x0
	je Fonts_PrintString_elsedoneblock101
Fonts_PrintString_ConditionalTrueBlock99: ;Main true block ;keep :
	; LineNumber: 95
	; LineNumber: 96
	les di,[Fonts_tp]
	mov ax, word [es:di + 0x0*1]
	mov ah,0
	mov [Fonts_c], ax
	; Assigning pointer
	les di, [Fonts_dst2]
	mov [Fonts_dst+2], es
	mov [Fonts_dst], di
	call Fonts_PrintChar
	; LineNumber: 97
	; 'a:=a + expression'  optimization 
	mov ax, [Fonts_font_size_x]
	; Type : POINTER
	add [Fonts_dst2], ax
	; LineNumber: 98
	; 'a:=a + const'  optimization 
	add [Fonts_tp], word 0x1
	; LineNumber: 99
	jmp Fonts_PrintString_while98
Fonts_PrintString_elsedoneblock101:
Fonts_PrintString_loopend103:
	; LineNumber: 100
	ret
end_procedure_Fonts_PrintString:
	; ***********  Defining procedure : BeePlay_Beep
	;    Procedure type : User-defined procedure
	; LineNumber: 38
	; LineNumber: 37
BeePlay_bi:	dw	0
BeePlay_Beep_block106:
BeePlay_Beep:
	; LineNumber: 39
	; ****** Inline assembler section
    mov     al, 182         ; Prepare the speaker for the
    out     43h, al         ;  note.
    mov ax,[BeePlay_bi]
                        ;  for middle C.
    out     042h, al         ; Output low byte.
    mov     al, ah          ; Output high byte.
    out     042h, al
	in      al, 61h         
    or      al, 00000011b   ; Set bits 1 and 0.
    out     61h, al         ; Send new value.
	
	; LineNumber: 52
	ret
end_procedure_BeePlay_Beep:
	; ***********  Defining procedure : BeePlay_Stop
	;    Procedure type : User-defined procedure
	; LineNumber: 55
BeePlay_Stop:
	; LineNumber: 56
	; ****** Inline assembler section
    in      al, 61h         ; Turn off note (get value from
                            ;  port 61h).
    and     al, 11111100b   ; Reset bits 1 and 0.
    out     61h, al         ; Send new value.	
	; LineNumber: 63
	ret
end_procedure_BeePlay_Stop:
	; ***********  Defining procedure : BeePlay_Initialize
	;    Procedure type : User-defined procedure
	; LineNumber: 67
	; LineNumber: 66
BeePlay_Initialize_block108:
BeePlay_Initialize:
	; LineNumber: 68
	les di,[BeePlay_zp]
	mov ax, word [es:di + 0x0*1]
	mov ah,0
	mov [BeePlay_noChannels], al
	; LineNumber: 69
	mov ax, word [es:di + 0x1*1]
	mov ah,0
	mov [BeePlay_noRows], ax
	; LineNumber: 70
	; ****** Inline assembler section
	mov [BeePlay_noRows+1], byte 0 
	; LineNumber: 71
	mov ax, word [es:di + 0x2*1]
	mov ah,0
	mov [BeePlay_noOrder], ax
	; LineNumber: 72
	mov ax, [BeePlay_noOrder]
	mov bx, [BeePlay_noChannels]
	mov bh,0 ; forcetype clear high bit
	mul  bx
	mov [BeePlay_noOrder], ax
	; LineNumber: 73
	; 'a:=a + expression'  optimization 
	mov ax, 0x0
	mov es,ax
	mov ax, 0x5
	mov di,ax
	; Type : POINTER
	add [BeePlay_zp], ax
	; LineNumber: 74
	; Assigning pointer
	; Setting PURE POINTER 0
	; RHS is NOT pointer, only updating DI since LHS is pure
	mov ax, [BeePlay_noOrder]
	les di, [BeePlay_zp]
	add  di,ax ; generic binop when rhs is NOT pointer
	; Setting PURE POINTER ends
	mov [BeePlay_ptrPattern+2], es
	mov [BeePlay_ptrPattern], di
	; LineNumber: 77
	lea di,[BeePlay_decayLength]
	mov cl, [BeePlay_noChannels]
	mov al, 0x3
	 rep stosb
	; LineNumber: 79
	mov [BeePlay_speed], word 0x3
	; LineNumber: 80
	mov [BeePlay_counter], word 0x0
	; LineNumber: 81
	; Assigning pointer
	les di, [BeePlay_zp]
	mov [BeePlay_ptrOrder+2], es
	mov [BeePlay_ptrOrder], di
	; LineNumber: 82
	mov [BeePlay_curOrder], word 0x0
	; LineNumber: 83
	mov [BeePlay_curRow], word 0x0
	; LineNumber: 84
	mov [BeePlay_curOrder], word 0x0
	; LineNumber: 85
init_playnote:
    jmp init_playnote_cont
player_notes:	dw 0x023a1, 0x021a1, 0x01fbe, 0x01df6, 0x01c47, 0x01ab1, 0x01931, 0x017c7
            dw 0x01672, 0x0152f, 0x013ff, 0x012df, 0x011d0, 0x010d0, 0x0fdf, 0x0efa
            dw 0x0e23, 0x0d58, 0x0c98, 0x0be3, 0x0b39, 0x0a97, 0x09ff, 0x096f
            dw 0x08e8, 0x0868, 0x07ef, 0x077d, 0x0711, 0x06b3, 0x064c, 0x05f1
            dw 0x059c, 0x054b, 0x050c, 0x04b7, 0x01
init_playnote_call:
    mov ah,0
    mov di,ax
    shl di,1 ; Accomodate for word
    mov ax, [player_notes+di]
    push ax
    mov     al, 182         ; Prepare the speaker for the
    out     43h, al         ;  note.
    pop     ax
                        ;  for middle C.
    out     42h, al         ; Output low byte.
    mov     al, ah          ; Output high byte.
    out     42h, al
    in      al, 61h         ; Turn on note(get value from
                        ;  port 61h).
    or      al, 00000011b   ; Set bits 1 and 0.
    out     61h, al         ; Send new value.
    ret
init_playnote_cont:
	; LineNumber: 87
	ret
end_procedure_BeePlay_Initialize:
	; ***********  Defining procedure : BeePlay_Play
	;    Procedure type : User-defined procedure
	; LineNumber: 91
BeePlay_Play:
	; LineNumber: 93
	
; // Get note of current channel
	mov di,[BeePlay_curN] ; index is word
	shl di,1 ; Accomodate for word
	mov ax, [BeePlay_curNotes+di]
	mov [BeePlay_i], ax
	; LineNumber: 94
	; Binary clause Simplified: NOTEQUALS
	; Compare with pure num / var optimization
	mov ah,0 ; Accomodate for byte
	mov di,[BeePlay_curN] ; index is word
	shl di,1 ; Accomodate for word
	mov ax, [BeePlay_curDecay+di]
	cmp ax,0x0
	je BeePlay_Play_elseblock112
BeePlay_Play_ConditionalTrueBlock111: ;Main true block ;keep :
	; LineNumber: 94
	;Is array index
	; Assign value to regular array
	; RHS is pure optimization
	mov di,[BeePlay_curN] ; index is word
	shl di,1 ; Accomodate for word
	mov ax, [BeePlay_curDecay+di]
	; Forcetype IS POINTER: 0
	sub  ax, 0x1
	mov di,[BeePlay_curN] ; index is word
	shl di,1
	mov [BeePlay_curDecay+di], ax
	jmp BeePlay_Play_elsedoneblock113
BeePlay_Play_elseblock112:
	; LineNumber: 96
	mov [BeePlay_i], word 0x0
BeePlay_Play_elsedoneblock113:
	; LineNumber: 100
	; 'a:=a + const'  optimization 
	add [BeePlay_curN], word 0x1
	; LineNumber: 102
	; Binary clause Simplified: EQUALS
	; Compare two vars optimization
	mov al, [BeePlay_noChannels]
	cmp  [BeePlay_curN],al
	jne BeePlay_Play_elsedoneblock121
BeePlay_Play_ConditionalTrueBlock119: ;Main true block ;keep :
	; LineNumber: 102
	mov [BeePlay_curN], word 0x0
BeePlay_Play_elsedoneblock121:
	; LineNumber: 105
	; Binary clause Simplified: EQUALS
	; Compare with pure num / var optimization
	cmp [BeePlay_i],word 0xff
	jne BeePlay_Play_localfailed152
	jmp BeePlay_Play_ConditionalTrueBlock125
BeePlay_Play_localfailed152: ;keep:
	; ; logical OR, second chance
	; Binary clause Simplified: EQUALS
	; Compare with pure num / var optimization
	cmp [BeePlay_i],word 0x0
	jne BeePlay_Play_elsedoneblock127
BeePlay_Play_ConditionalTrueBlock125: ;Main true block ;keep :
	; LineNumber: 106
	; LineNumber: 107
	mov [BeePlay_v2], word 0x1
	; LineNumber: 113
	mov [BeePlay_j], word 0x0
BeePlay_Play_forloop154:
	; LineNumber: 109
	; LineNumber: 110
	; Binary clause Simplified: NOTEQUALS
	; Compare with pure num / var optimization
	mov ah,0 ; Accomodate for byte
	mov di,[BeePlay_j] ; index is word
	shl di,1 ; Accomodate for word
	mov ax, [BeePlay_curDecay+di]
	cmp ax,0x0
	je BeePlay_Play_elsedoneblock168
BeePlay_Play_ConditionalTrueBlock166: ;Main true block ;keep :
	; LineNumber: 110
	
; // prepare to stop
	mov [BeePlay_v2], word 0x0
BeePlay_Play_elsedoneblock168:
	; LineNumber: 112
BeePlay_Play_loopstart155:
	add [BeePlay_j],word 1
	mov ax, [BeePlay_noChannels]
	mov ah,0 ; forcetype clear high bit
	cmp ax,word [BeePlay_j]
	jne BeePlay_Play_forloop154
BeePlay_Play_loopend156:
	; LineNumber: 114
	; Binary clause Simplified: NOTEQUALS
	; Compare with pure num / var optimization
	cmp [BeePlay_v2],word 0x0
	je BeePlay_Play_elsedoneblock174
BeePlay_Play_ConditionalTrueBlock172: ;Main true block ;keep :
	; LineNumber: 114
	call BeePlay_Stop
BeePlay_Play_elsedoneblock174:
	; LineNumber: 117
	ret
	; LineNumber: 118
BeePlay_Play_elsedoneblock127:
	; LineNumber: 125
	
; // Play note
; //i:=curRow;
; // Calculate octave		
	mov ax, [BeePlay_i]
	xor dx,dx
	mov bx, 0xc
	div  bx
	mov [BeePlay_oct], al
	; LineNumber: 126
	mov ax, 0xc
	mov bx,ax
	mov ax, [BeePlay_i]
	xor dx,dx
	div bx
	mov ax,dx
	mov [BeePlay_i], ax
	; LineNumber: 128
	
; // Look up note
	mov di,[BeePlay_i] ; index is word
	shl di,1 ; Accomodate for word
	mov ax, [BeePlay_noteTable+di]
	mov [BeePlay_val], ax
	; LineNumber: 130
	; ****** Inline assembler section
;bug, fix, byte lookup in array
	; LineNumber: 131
	; 'a:=a + expression'  optimization 
	mov al, [BeePlay_octShift]
	; Type : BYTE
	add [BeePlay_oct], al
	; LineNumber: 132
	mov ax, [BeePlay_val]
	xor dx,dx
	mov di,[BeePlay_oct] ; index is word
	mov cl,[BeePlay_oct]
	mov ch,0
	mov di,cx
	shl di,1 ; Accomodate for word
	mov bx, [BeePlay_pow2+di]
	div  bx
	mov [BeePlay_val], ax
	; LineNumber: 134
	mov ax, [BeePlay_val]
	mov [BeePlay_bi], ax
	call BeePlay_Beep
	; LineNumber: 138
	ret
end_procedure_BeePlay_Play:
	; ***********  Defining procedure : BeePlay_Update
	;    Procedure type : User-defined procedure
	; LineNumber: 141
BeePlay_Update:
	; LineNumber: 143
	
; // Advance counter
	; 'a:=a + const'  optimization 
	add [BeePlay_counter], word 0x1
	; LineNumber: 144
	; Binary clause Simplified: LESS
	; Compare two vars optimization
	mov ax, [BeePlay_speed]
	cmp  [BeePlay_counter],ax
	jae BeePlay_Update_elsedoneblock181
BeePlay_Update_ConditionalTrueBlock179: ;Main true block ;keep :
	; LineNumber: 144
	ret
BeePlay_Update_elsedoneblock181:
	; LineNumber: 147
	mov [BeePlay_counter], word 0x0
	; LineNumber: 183
	mov [BeePlay_i], word 0x0
BeePlay_Update_forloop184:
	; LineNumber: 157
	; LineNumber: 159
	
; // Calculate new notes for each channel	
; //	Screen::Print("  ROW ");
; //	Screen::PrintInt(curRow);
; //	Screen::Print(" - ");
; //
; // Get current order
	les di,[BeePlay_ptrOrder]
	; RHS is pure optimization
	mov ax, [BeePlay_curOrder]
	; Forcetype IS POINTER: 0
	add  ax, [BeePlay_i]
	add di,ax
	mov al, byte [es:di]; Is byte
	mov ah,0
	mov [BeePlay_j], ax
	; LineNumber: 161
	
; // Get pattern
	; Assigning pointer
	; Setting PURE POINTER 0
	; RHS is NOT pointer, only updating DI since LHS is pure
	mov ax, [BeePlay_j]
	mov bx, [BeePlay_noRows]
	mul  bx
	les di, [BeePlay_ptrPattern]
	add  di,ax ; generic binop when rhs is NOT pointer
	; Setting PURE POINTER ends
	mov [BeePlay_zp+2], es
	mov [BeePlay_zp], di
	; LineNumber: 163
	
; // Get data from row
	les di,[BeePlay_zp]
	add di,word [BeePlay_curRow]
	mov ax, word [es:di]
	mov ah,0
	mov [BeePlay_j], ax
	; LineNumber: 167
	; Binary clause Simplified: NOTEQUALS
	; RHS is pure optimization
	mov ax, [BeePlay_j]
	; Forcetype IS POINTER: 0
	and  ax, 0x80
	cmp  ax, 0x0
	je BeePlay_Update_elsedoneblock210
BeePlay_Update_ConditionalTrueBlock208: ;Main true block ;keep :
	; LineNumber: 168
	; LineNumber: 169
	
; // Do we have a note?
; //		curNotes[i] := 0;
; //		curDecay[i] := 0;
	; 'a:=a + const'  optimization 
	and [BeePlay_j], word 0x7f
	; LineNumber: 171
	; Binary clause Simplified: NOTEQUALS
	; Compare with pure num / var optimization
	cmp [BeePlay_j],word 0x7f
	je BeePlay_Update_elsedoneblock222
BeePlay_Update_ConditionalTrueBlock220: ;Main true block ;keep :
	; LineNumber: 172
	; LineNumber: 173
	
; // Semitone
; //			octave := j/12;
	mov ax, [BeePlay_j]
	mov [BeePlay_val], ax
	; LineNumber: 174
	; ****** Inline assembler section
	mov [BeePlay_val+1], byte 0 
	; LineNumber: 175
	;Is array index
	; Assign value to regular array
	mov ax, [BeePlay_val]
	mov di,[BeePlay_i] ; index is word
	shl di,1
	mov [BeePlay_curNotes+di], ax
	; LineNumber: 177
	;Is array index
	; Assign value to regular array
	mov di,[BeePlay_i] ; index is word
	shl di,1 ; Accomodate for word
	mov ax, [BeePlay_decayLength+di]
	mov di,[BeePlay_i] ; index is word
	shl di,1
	mov [BeePlay_curDecay+di], ax
	; LineNumber: 178
BeePlay_Update_elsedoneblock222:
	; LineNumber: 180
BeePlay_Update_elsedoneblock210:
	; LineNumber: 182
BeePlay_Update_loopstart185:
	add [BeePlay_i],word 1
	mov ax, [BeePlay_noChannels]
	mov ah,0 ; forcetype clear high bit
	cmp ax,word [BeePlay_i]
	jne BeePlay_Update_forloop184
BeePlay_Update_loopend186:
	; LineNumber: 185
	
; //	Screen::NewLine();
	; 'a:=a + const'  optimization 
	add [BeePlay_curRow], word 0x1
	; LineNumber: 188
	; Binary clause Simplified: EQUALS
	; Compare two vars optimization
	mov ax, [BeePlay_noRows]
	cmp  [BeePlay_curRow],ax
	jne BeePlay_Update_elsedoneblock228
BeePlay_Update_ConditionalTrueBlock226: ;Main true block ;keep :
	; LineNumber: 189
	; LineNumber: 190
	mov [BeePlay_curRow], word 0x0
	; LineNumber: 191
	; 'a:=a + expression'  optimization 
	mov ax, [BeePlay_noChannels]
	mov ah,0 ; forcetype clear high bit
	; Type : INTEGER
	add [BeePlay_curOrder], ax
	; LineNumber: 192
	
; //Reset to start of song
	; Binary clause Simplified: EQUALS
	; Compare two vars optimization
	mov ax, [BeePlay_noOrder]
	cmp  [BeePlay_curOrder],ax
	jne BeePlay_Update_elsedoneblock240
BeePlay_Update_ConditionalTrueBlock238: ;Main true block ;keep :
	; LineNumber: 193
	; LineNumber: 194
	mov [BeePlay_curOrder], word 0x0
	; LineNumber: 195
BeePlay_Update_elsedoneblock240:
	; LineNumber: 197
BeePlay_Update_elsedoneblock228:
	; LineNumber: 199
	ret
end_procedure_BeePlay_Update:
	; ***********  Defining procedure : Compression_Decompress
	;    Procedure type : User-defined procedure
	; LineNumber: 110
	; LineNumber: 109
	; LineNumber: 109
Compression_Decompress_block243:
Compression_Decompress:
	; LineNumber: 112
	; ****** Inline assembler section
; Decompresses Y. Collet's LZ4 compressed stream data in 16-bit real mode.
; Optimized for 8088/8086 CPUs.
; Code by Trixter/Hornet (trixter@oldskool.org) on 20130105
; Updated 20190617 -- thanks to Peter Ferrie, Terje Mathsen,
; and Axel Kern for suggestions and improvements!
; Updated 20190630: Fixed an alignment bug in lz4_decompress_small
; Updated 20200314: Speed updates from Pavel Zagrebin
;---------------------------------------------------------------
; function lz4_decompress(Compression_inb,Compression_outb:pointer):word;
;
; Decompresses an LZ4 stream file with a compressed chunk 64K or less in size.
; Input:
;   DS:SI Location of source data.  DWORD magic header and DWORD chunk size
;         must be intact; it is best to load the entire LZ4 file into this
;         location before calling this code.
;
; Output:
;   ES:DI Decompressed data.  If using an entire 64K segment, decompression
;         is safe because overruns will wrap around the segment.
;   AX    Size of decompressed data.
;
; Trashes AX, BX, CX, DX, SI, DI
;         ...so preserve what you need before calling this code.
;---------------------------------------------------------------
;Speed optimization history (decompression times in microseconds @ 4.77 MHz):
;before segment fixups: shuttle 108976 text 48742 broken code, invalid output
; after segment fixups: shuttle 112494 text 50940                 -
; after match copy opt: shuttle 110971 text 49890                 +
; after misc opt:       shuttle 109707 text 49056                 +
; after rep stosb opt:  shuttle 104877 text 51435                 +
; after rep stosw opt:  shuttle 104918 text 51412 robotron 365292 -+*
; after match+RLE opt:  shuttle  94274 text 49641 robotron 345426 +++
; after token unpack:   shuttle  93418 text 49140 robotron 342696 +++
; after accum opt:      shuttle  91992 text 48213 robotron 336635 +++
; after dx regswap opt: shuttle  90461 text 47218 robotron 330449 +++
; after repmovsb only:  shuttle  96231 text 46472 robotron 333068 -+- aborted
; after 1-byteRLE only: shuttle  96201 text 46472 robotron 333270 -+- aborted
; after cmp cl, -> al,: shuttle  90091 text 46894 robotron 327713 +++
; after likely(ll<15):  shuttle  89378 text 46487 robotron 323677 +++
; after ll=0 removechk: shuttle  90880 text 47957 robotron 323375 --+ aborted
; after likely(ml<15):  shuttle  89205 text 45388 robotron 317959 +++
; after mov r,ax->xchg: shuttle  88462 text 44963 robotron 315099 +++
; after es:movsw:       shuttle  90408 text 45295 robotron 321030 --- aborted
; after mcopy shortcir: shuttle  89710 text 45597 robotron 319660 --- aborted
; after rep es: movsb:  shuttle  88907 text 45076 robotron 316138 --- aborted
; after main lp unroll: shuttle  86153 text 43502 robotron 307923 +++
;Peter Ferrie is credited with the following suggestions/speedups:
; remove unnecess. xor: shuttle  85781 text 43487 robotron 307660 +++
; xor ax,ax->xchg ax,r: shuttle  85037 text 43035 robotron 304574 +++
;Terje Mathisen is credited with the following suggestions/speedups:
; RLE overshoot->adjus: shuttle  85022 text 43035 robotron 304571 +0+
;---------------------------------------------------------------
;Pavel Zagrebin is credited with the following speedups:
; Changing the end-of-file comparison to self-modifying offset
; push ds;pop ds->mov ds,bp
; adc cx,cx;rep movsb->jnc
; NOTE:  I can't explain it, but with no extraneous background interrupts,
; timings are taking longer than normal on my IBM 5160.  So, we have to
; reset our timing numbers here:
; Old timings:          shuttle  85038 text 45720 robotron 307796 ---
; After Pavel's speedups:
; New timings:          shuttle  81982 text 43664 robotron 296081 +++
;PROC    lz4_decompress          NEAR
;ARG     Compression_inb:DWORD, Compression_outb:DWORD
        push    ds              ;preserve compiler assumptions
        les     di,[Compression_outb]       ;load target buffer
        lds     si,[Compression_inb]        ;load source buffer
        cld                     ;make strings copy forward
        lodsw
        lodsw                   ;skip magic number, smaller than add si,4
        lodsw                   ;load chunk size low 16-bit word
        xchg    bx,ax           ;BX = size of compressed chunk
        add     bx,si           ;BX = threshold to stop decompression
        lodsw                   ;load chunk size high 16-bit word
        or      ax,ax           ;is high word non-zero?
        jnz     @@done          ;If so, chunk too big or malformed, abort
@@parsetoken:                   ;CX=0 here because of REP at end of loop
        lodsb                   ;grab token to AL
        mov     dx,ax           ;preserve packed token in DX
@@copyliterals:
        mov     cx,4            ;set full CX reg to ensure CH is 0
        shr     al,cl           ;unpack upper 4 bits
	        call    buildfullcount  ;build full literal count if necessary
@@doliteralcopy:                  ;src and dst might overlap so do this by bytes
        rep     movsb           ;if cx=0 nothing happens
;At this point, we might be done; all LZ4 data ends with five literals and the
;offset token is ignored.  If we're at the end of our compressed chunk, stop.
        cmp     si,bx           ;are we at the end of our compressed chunk?
        jae     @@done          ;if so, jump to exit; otherwise, process match
@@copymatches:
        lodsw                   ;AX = match offset
        xchg    dx,ax           ;AX = packed token, DX = match offset
        and     al,0Fh          ;unpack match length token
        call    buildfullcount  ;build full match count if necessary
@@domatchcopy:
        push    ds
        push    si              ;ds:si saved, xchg with ax would destroy ah
        mov     si,di
        sub     si,dx
        push    es
        pop     ds              ;ds:si points at match; es:di points at dest
        add     cx,4            ;minmatch = 4
                                ;Can't use MOVSWx2 because [es:di+1] is unknown
        rep     movsb           ;copy match run if any left
        pop     si
        pop     ds              ;ds:si restored
        jmp     @@parsetoken
buildfullcount:
                                ;CH has to be 0 here to ensure AH remains 0
        cmp     al,0Fh          ;test if unpacked literal length token is 15?
        xchg    cx,ax           ;CX = unpacked literal length token; flags unchanged
        jne     builddone       ;if AL was not 15, we have nothing to build
buildloop:
        lodsb                   ;load a byte
        add     cx,ax           ;add it to the full count
        cmp     al,0FFh         ;was it FF?
        je      buildloop       ;if so, keep going
builddone:
        retn
@@done:
        sub     di,[dword Compression_outb];subtract original offset from where we are now
        xchg    ax,di           ;AX = decompressed size
        pop     ds              ;restore compiler assumptions
        ret
; Must declare this in the code segment.
SHR4table:
        DB 00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h,00h
        DB 01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h,01h
        DB 02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h,02h
        DB 03h,03h,03h,03h,03h,03h,03h,03h,03h,03h,03h,03h,03h,03h,03h,03h
        DB 04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h,04h
        DB 05h,05h,05h,05h,05h,05h,05h,05h,05h,05h,05h,05h,05h,05h,05h,05h
        DB 06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h,06h
        DB 07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h,07h
        DB 08h,08h,08h,08h,08h,08h,08h,08h,08h,08h,08h,08h,08h,08h,08h,08h
        DB 09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h,09h
        DB 0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah,0Ah
        DB 0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh,0Bh
        DB 0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch,0Ch
        DB 0Dh,0Dh,0Dh,0Dh,0Dh,0Dh,0Dh,0Dh,0Dh,0Dh,0Dh,0Dh,0Dh,0Dh,0Dh,0Dh
        DB 0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh,0Eh
        DB 0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh,0Fh
	; LineNumber: 274
	ret
end_procedure_Compression_Decompress:
	; ***********  Defining procedure : Random_Random
	;    Procedure type : User-defined procedure
	; LineNumber: 22
Random_Random:
	; LineNumber: 23
	; ****** Inline assembler section
	push dx
    mov ax, 25173       ; LCG Multiplier
    mul word [Random_Seed] ; DX:AX = LCG multiplier * seed
    add ax, 13849       ; Add LCG increment value
    mov [Random_Seed], ax      ; Update seed
    ; AX = (multiplier * seed + increment) mod 65536
    pop dx
    
	; LineNumber: 33
	ret
end_procedure_Random_Random:
	; ***********  Defining procedure : SetPalette
	;    Procedure type : User-defined procedure
	; LineNumber: 45
	; LineNumber: 44
pal:	dw	0
SetPalette_block245:
SetPalette:
	; LineNumber: 46
	mov ax, [pal]
	mov bx, 0x0
	cmp ax,bx
	jne SetPalette_casenext247
	; LineNumber: 46
	; LineNumber: 56
	mov [i], word 0x0
SetPalette_forloop249:
	; LineNumber: 49
	; LineNumber: 50
	; Generic add/sub
	mov ax, 0x20
	mov di,[i] ; index is word
	mov bx, [grad+di]
	mov bh,0 ; forcetype clear high bit
	add  ax,bx; bop
	mov [c], ax
	; LineNumber: 51
	mov ax, [i]
	mov [Screen_color], al
	mov ax, [c]
	mov [Screen_red], al
	mov [Screen_green], al
	mov [Screen_blue], al
	call Screen_SetColor
	; LineNumber: 52
	; RHS is pure optimization
	mov ax, 0x40
	; Forcetype IS POINTER: 0
	add  ax, [i]
	mov [Screen_color], al
	mov ax, [c]
	xor dx,dx
	mov bx, 0x2
	div  bx
	mov [Screen_red], al
	mov ax, [c]
	mov [Screen_green], al
	mov [Screen_blue], al
	call Screen_SetColor
	; LineNumber: 53
	; RHS is pure optimization
	mov ax, 0x80
	; Forcetype IS POINTER: 0
	add  ax, [i]
	mov [Screen_color], al
	mov ax, [c]
	mov [Screen_red], al
	xor dx,dx
	mov bx, 0x2
	div  bx
	mov [Screen_green], al
	mov ax, [c]
	mov [Screen_blue], al
	call Screen_SetColor
	; LineNumber: 54
	; RHS is pure optimization
	mov ax, 0xc0
	; Forcetype IS POINTER: 0
	add  ax, [i]
	mov [Screen_color], al
	mov ax, [c]
	mov [Screen_red], al
	mov [Screen_green], al
	xor dx,dx
	mov bx, 0x2
	div  bx
	mov [Screen_blue], al
	call Screen_SetColor
	; LineNumber: 55
SetPalette_loopstart250:
	add [i],word 1
	mov ax, 0x40
	cmp ax,word [i]
	jne SetPalette_forloop249
SetPalette_loopend251:
	; LineNumber: 56
	jmp SetPalette_caseend246
SetPalette_casenext247:
	mov ax, [pal]
	mov bx, 0x1
	cmp ax,bx
	jne SetPalette_casenext254
	; LineNumber: 57
	; LineNumber: 67
	mov [i], word 0x0
SetPalette_forloop256:
	; LineNumber: 60
	; LineNumber: 61
	; Generic add/sub
	mov ax, 0x20
	mov di,[i] ; index is word
	mov bx, [grad+di]
	mov bh,0 ; forcetype clear high bit
	add  ax,bx; bop
	mov [c], ax
	; LineNumber: 62
	mov ax, [i]
	mov [Screen_color], al
	mov ax, [c]
	mov [Screen_red], al
	mov [Screen_green], al
	mov [Screen_blue], al
	call Screen_SetColor
	; LineNumber: 63
	; RHS is pure optimization
	mov ax, 0x40
	; Forcetype IS POINTER: 0
	add  ax, [i]
	mov [Screen_color], al
	mov ax, [c]
	mov [Screen_red], al
	mov [Screen_green], byte 0x0
	mov [Screen_blue], byte 0x0
	call Screen_SetColor
	; LineNumber: 64
	; RHS is pure optimization
	mov ax, 0x80
	; Forcetype IS POINTER: 0
	add  ax, [i]
	mov [Screen_color], al
	mov [Screen_red], byte 0x0
	mov ax, [c]
	mov [Screen_green], al
	mov [Screen_blue], byte 0x0
	call Screen_SetColor
	; LineNumber: 65
	; RHS is pure optimization
	mov ax, 0xc0
	; Forcetype IS POINTER: 0
	add  ax, [i]
	mov [Screen_color], al
	mov [Screen_red], byte 0x0
	mov [Screen_green], byte 0x0
	mov ax, [c]
	mov [Screen_blue], al
	call Screen_SetColor
	; LineNumber: 66
SetPalette_loopstart257:
	add [i],word 1
	mov ax, 0x40
	cmp ax,word [i]
	jne SetPalette_forloop256
SetPalette_loopend258:
	; LineNumber: 67
SetPalette_casenext254:
SetPalette_caseend246:
	; LineNumber: 69
	ret
end_procedure_SetPalette:
	; ***********  Defining procedure : DrawPalette
	;    Procedure type : User-defined procedure
	; LineNumber: 72
DrawPalette:
	; LineNumber: 76
	mov [i], word 0x0
DrawPalette_forloop262:
	; LineNumber: 74
	; LineNumber: 75
	mov ax, [i]
	mov [Gfx_a], ax
	mov [Gfx_b], word 0x0
	mov [Gfx_c], ax
	mov [Gfx_d], word 0x8
	mov [Gfx_color], ax
	; Assigning pointer
	les di, [Screen_buffer1]
	mov [Gfx_where+2], es
	mov [Gfx_where], di
	call Gfx_DrawLine
	; LineNumber: 76
DrawPalette_loopstart263:
	add [i],word 1
	mov ax, 0x100
	cmp ax,word [i]
	jne DrawPalette_forloop262
DrawPalette_loopend264:
	; LineNumber: 77
	ret
end_procedure_DrawPalette:
	; ***********  Defining procedure : SceneLinesReset
	;    Procedure type : User-defined procedure
	; LineNumber: 80
SceneLinesReset:
	; LineNumber: 81
	; Assigning pointer
	lea si, [lines_text]
	mov [tp+2], ds
	mov [tp], si
	; LineNumber: 82
	mov [shift], word 0x0
	; LineNumber: 83
	mov [current_scene_len], word 0x12c
	; LineNumber: 84
	ret
end_procedure_SceneLinesReset:
	; ***********  Defining procedure : SceneLinesRender
	;    Procedure type : User-defined procedure
	; LineNumber: 87
SceneLinesRender:
	; LineNumber: 100
	mov [i], word 0x0
SceneLinesRender_forloop269:
	; LineNumber: 89
	; LineNumber: 90
	; RHS is pure optimization
	; Generic add/sub
	mov ax, [i]
	mov bx, 0xf
	mul  bx
	mov bx, [scene_time]
	mov cx, 0x2
	push ax
	mov ax,bx
	mul  cx
	mov bx,ax
	pop ax
	add  ax,bx; bop
	; Forcetype IS POINTER: 0
	and  ax, 0xff
	mov di,ax
	shl di,1 ; Accomodate for word
	mov ax, [sinx+di]
	mov [sx], ax
	; LineNumber: 91
	; RHS is pure optimization
	; RHS is pure optimization
	; Generic add/sub
	mov ax, [i]
	mov bx, 0xf
	mul  bx
	mov bx, [scene_time]
	mov cx, 0x3
	push ax
	mov ax,bx
	mul  cx
	mov bx,ax
	pop ax
	add  ax,bx; bop
	; Forcetype IS POINTER: 0
	add  ax, [shift]
	; Forcetype IS POINTER: 0
	and  ax, 0xff
	mov di,ax
	shl di,1 ; Accomodate for word
	mov ax, [siny+di]
	mov [sy], ax
	; LineNumber: 93
	mov ax, [x2]
	mov [x1], ax
	; LineNumber: 94
	mov ax, [y2]
	mov [y1], ax
	; LineNumber: 95
	; RHS is pure optimization
	mov ax, 0xf
	mov bx,ax
	call Random_Random
	xor dx,dx
	div bx
	mov ax,dx
	; Forcetype IS POINTER: 0
	add  ax, [sx]
	mov [x2], ax
	; LineNumber: 96
	; RHS is pure optimization
	mov ax, 0xf
	mov bx,ax
	call Random_Random
	xor dx,dx
	div bx
	mov ax,dx
	; Forcetype IS POINTER: 0
	add  ax, [sy]
	mov [y2], ax
	; LineNumber: 98
	mov ax, [x1]
	mov [Gfx_a], ax
	mov ax, [y1]
	mov [Gfx_b], ax
	mov ax, [x2]
	mov [Gfx_c], ax
	mov ax, [y2]
	mov [Gfx_d], ax
	; RHS is pure optimization
	; RHS is pure optimization
	mov ax, [color]
	; Forcetype IS POINTER: 0
	add  ax, [i]
	; Forcetype IS POINTER: 0
	and  ax, 0xff
	mov [Gfx_color], ax
	; Assigning pointer
	les di, [Screen_buffer1]
	mov [Gfx_where+2], es
	mov [Gfx_where], di
	call Gfx_DrawLine
	; LineNumber: 99
SceneLinesRender_loopstart270:
	add [i],word 1
	mov ax, 0x20
	cmp ax,word [i]
	jne SceneLinesRender_forloop269
SceneLinesRender_loopend271:
	; LineNumber: 100
	; Binary clause Simplified: EQUALS
	; RHS is pure optimization
	mov ax, [scene_time]
	; Forcetype IS POINTER: 0
	and  ax, 0xf
	cmp  ax, 0x0
	jne SceneLinesRender_elsedoneblock277
SceneLinesRender_ConditionalTrueBlock275: ;Main true block ;keep :
	; LineNumber: 99
	; 'a:=a + const'  optimization 
	add [shift], word 0x1
SceneLinesRender_elsedoneblock277:
	; LineNumber: 101
	; RHS is pure optimization
	mov ax, [color]
	; Forcetype IS POINTER: 0
	and  ax, 0xff
	mov [Fonts_addValue], al
	; LineNumber: 102
	; Assigning pointer
	les di, [tp]
	mov [Fonts_tp+2], es
	mov [Fonts_tp], di
	; Generic add/sub
	mov ax, 0xa0
	mov bx,es
	mov cx, 0x5
	push ax
	mov ax,bx
	mul  cx
	mov bx,ax
	pop ax
	sub  ax,bx; bop
	mov [Fonts_x], ax
	mov [Fonts_y], word 0x64
	; Assigning pointer
	les di, [Screen_buffer1]
	mov [Fonts_dst2+2], es
	mov [Fonts_dst2], di
	call Fonts_PrintString
	; LineNumber: 102
	; 'a:=a + const'  optimization 
	add [color], word 0x1
	; LineNumber: 104
	ret
end_procedure_SceneLinesRender:
	; ***********  Defining procedure : SceneIntroRender
	;    Procedure type : User-defined procedure
	; LineNumber: 107
SceneIntroRender:
	; LineNumber: 108
	mov [Fonts_addValue], byte 0x1f
	; LineNumber: 109
	; Assigning pointer
	les di, [tp]
	mov [Fonts_tp+2], es
	mov [Fonts_tp], di
	; Generic add/sub
	mov ax, 0xa0
	mov bx,es
	mov cx, 0x5
	push ax
	mov ax,bx
	mul  cx
	mov bx,ax
	pop ax
	sub  ax,bx; bop
	mov [Fonts_x], ax
	mov [Fonts_y], word 0x64
	; Assigning pointer
	les di, [Screen_buffer1]
	mov [Fonts_dst2+2], es
	mov [Fonts_dst2], di
	call Fonts_PrintString
	; LineNumber: 110
	ret
end_procedure_SceneIntroRender:
	; ***********  Defining procedure : SceneIntroReset
	;    Procedure type : User-defined procedure
	; LineNumber: 113
SceneIntroReset:
	; LineNumber: 114
	; Assigning pointer
	lea si, [intro_text]
	mov [tp+2], ds
	mov [tp], si
	; LineNumber: 115
	mov [current_scene_len], word 0x1e
	; LineNumber: 116
	ret
end_procedure_SceneIntroReset:
	; ***********  Defining procedure : SceneOutroRender
	;    Procedure type : User-defined procedure
	; LineNumber: 119
SceneOutroRender:
	; LineNumber: 120
	mov [Fonts_addValue], byte 0x80
	; LineNumber: 121
	; Assigning pointer
	les di, [tp]
	mov [Fonts_tp+2], es
	mov [Fonts_tp], di
	; Generic add/sub
	mov ax, 0xa0
	mov bx,es
	mov cx, 0x5
	push ax
	mov ax,bx
	mul  cx
	mov bx,ax
	pop ax
	sub  ax,bx; bop
	mov [Fonts_x], ax
	mov [Fonts_y], word 0x64
	; Assigning pointer
	les di, [Screen_buffer1]
	mov [Fonts_dst2+2], es
	mov [Fonts_dst2], di
	call Fonts_PrintString
	; LineNumber: 122
	ret
end_procedure_SceneOutroRender:
	; ***********  Defining procedure : SceneOutroReset
	;    Procedure type : User-defined procedure
	; LineNumber: 125
SceneOutroReset:
	; LineNumber: 126
	; Assigning pointer
	lea si, [outro_text]
	mov [tp+2], ds
	mov [tp], si
	; LineNumber: 127
	mov [current_scene_len], word 0x1e
	; LineNumber: 128
	ret
end_procedure_SceneOutroReset:
	; ***********  Defining procedure : ResetScene
	;    Procedure type : User-defined procedure
	; LineNumber: 131
	; LineNumber: 130
scene_to_reset:	dw	0
ResetScene_block284:
ResetScene:
	; LineNumber: 132
	mov ax, [scene_to_reset]
	mov bx, 0x0
	cmp ax,bx
	jne ResetScene_casenext286
	; LineNumber: 132
	call SceneIntroReset
	jmp ResetScene_caseend285
ResetScene_casenext286:
	mov ax, [scene_to_reset]
	mov bx, 0x1
	cmp ax,bx
	jne ResetScene_casenext288
	; LineNumber: 133
	call SceneLinesReset
	jmp ResetScene_caseend285
ResetScene_casenext288:
	mov ax, [scene_to_reset]
	mov bx, 0x2
	cmp ax,bx
	jne ResetScene_casenext290
	; LineNumber: 134
	call SceneOutroReset
ResetScene_casenext290:
ResetScene_caseend285:
	; LineNumber: 137
	ret
end_procedure_ResetScene:
	; ***********  Defining procedure : RenderScene
	;    Procedure type : User-defined procedure
	; LineNumber: 140
	; LineNumber: 139
scene_to_render:	dw	0
RenderScene_block292:
RenderScene:
	; LineNumber: 141
	mov ax, [scene_to_render]
	mov bx, 0x0
	cmp ax,bx
	jne RenderScene_casenext294
	; LineNumber: 141
	call SceneIntroRender
	jmp RenderScene_caseend293
RenderScene_casenext294:
	mov ax, [scene_to_render]
	mov bx, 0x1
	cmp ax,bx
	jne RenderScene_casenext296
	; LineNumber: 142
	call SceneLinesRender
	jmp RenderScene_caseend293
RenderScene_casenext296:
	mov ax, [scene_to_render]
	mov bx, 0x2
	cmp ax,bx
	jne RenderScene_casenext298
	; LineNumber: 143
	call SceneOutroRender
RenderScene_casenext298:
RenderScene_caseend293:
	; LineNumber: 146
	ret
end_procedure_RenderScene:
	; ***********  Defining procedure : RasterIRQ
	;    Procedure type : User-defined procedure
	; LineNumber: 150
RasterIRQ:
	; LineNumber: 151
	pusha
	push es
	push ds
	mov ax,192h ; reset DS 
	mov ds,ax
	; LineNumber: 152
	call BeePlay_Update
	; LineNumber: 153
	call BeePlay_Play
	; LineNumber: 154
	mov al,20h
	out 20h,al
	pop ds
	pop es
	popa
	; LineNumber: 155
	iret
end_procedure_RasterIRQ:
block1:
main_block_begin_:
	; LineNumber: 159
	call Memory_Init
	; LineNumber: 160
	mov [Screen_i], word 0x13
	call Screen_SetMode
	; LineNumber: 161
	mov [Screen_noBuffers], word 0x4
	call Screen_InitVGABuffers
	; LineNumber: 162
	mov ax, [current_scene]
	mov [scene_to_reset], ax
	call ResetScene
	; LineNumber: 163
	mov ax, [current_scene]
	mov [pal], ax
	call SetPalette
	; LineNumber: 165
	; Assigning pointer
	lea si, [song]
	mov [BeePlay_zp+2], ds
	mov [BeePlay_zp], si
	call BeePlay_Initialize
	; LineNumber: 166
	mov [BeePlay_octShift], byte 0x1
	; LineNumber: 167
	
; // octave shift
	;Is array index
	; Assign value to regular array
	mov ax, 0x2
	mov [BeePlay_decayLength+0x00],ax
	; LineNumber: 168
	
; // Sustain of columm 0
	;Is array index
	; Assign value to regular array
	mov ax, 0x4
	mov [BeePlay_decayLength+0x02],ax
	; LineNumber: 169
	
; // Sustain of column 1
	mov [BeePlay_speed], word 0x3
	; LineNumber: 171
	; Assigning pointer
	lea si, [font]
	mov [File_fp+2], ds
	mov [File_fp], si
	; Assigning pointer
	les di, [Screen_buffer4]
	mov [File_tp+2], es
	mov [File_tp], di
	call File_ReadAll
	; LineNumber: 172
	; Assigning pointer
	les di, [Screen_buffer4]
	mov [Compression_inb+2], es
	mov [Compression_inb], di
	; Assigning pointer
	les di, [Screen_buffer3]
	mov [Compression_outb+2], es
	mov [Compression_outb], di
	call Compression_Decompress
	; LineNumber: 173
	; Assigning pointer
	les di, [Screen_buffer3]
	mov [Fonts_data+2], es
	mov [Fonts_data], di
	mov [Fonts_font_size_x], word 0xa
	mov [Fonts_font_size_y], word 0x10
	mov [Fonts_font_columns], word 0x20
	mov [Fonts_shift], word 0x20
	call Fonts_Init
	; LineNumber: 174
	mov [Fonts_writeType], word 0x1
	; LineNumber: 175
	mov [Fonts_maskColor], byte 0x1
	; LineNumber: 177
	mov [Memory_ticks], word 0x8444
	call Memory_SetTimer
	; LineNumber: 178
	cli
	; Install new ISR
	mov al,0x8
	mov ah,25h
	mov dx, RasterIRQ
	int 21h
	sti
	; LineNumber: 180
MainProgram_while301:
MainProgram_loopstart305:
	; Binary clause Simplified: NOTEQUALS
	; Compare with pure num / var optimization
	; Compare two const numbers
	mov ax,1
	sub ax,2
	je MainProgram_elsedoneblock304
MainProgram_ConditionalTrueBlock302: ;Main true block ;keep :
	; LineNumber: 181
	; LineNumber: 182
	mov dx, 0x3da
MainProgram_vblank1329:
	in al, dx
	test al, 8
	je MainProgram_vblank1329
MainProgram_vblank2330:
	in al, dx
	test al, 8
	jne MainProgram_vblank2330
	; LineNumber: 184
	; Assigning pointer
	les di, [Screen_buffer1]
	mov [Screen_source+2], es
	mov [Screen_source], di
	; Assigning pointer
	; Setting PURE POINTER 0
	mov ax, 0xa000
	mov es,ax
	mov ax, 0x0
	mov di,ax
	; Setting PURE POINTER ends
	mov [Screen_dest+2], es
	mov [Screen_dest], di
	call Screen_CopyVGABuffer32bit
	; LineNumber: 186
	; Binary clause Simplified: GREATER
	; Compare two vars optimization
	mov ax, [current_scene_len]
	cmp  [scene_time],ax
	jbe MainProgram_elsedoneblock334
MainProgram_ConditionalTrueBlock332: ;Main true block ;keep :
	; LineNumber: 187
	; LineNumber: 188
	; 'a:=a + const'  optimization 
	add [current_scene], word 0x1
	; LineNumber: 189
	mov [scene_time], word 0x0
	; LineNumber: 190
	; Binary clause Simplified: GREATER
	; Compare two vars optimization
	mov ax, [last_scene]
	cmp  [current_scene],ax
	jbe MainProgram_elsedoneblock346
MainProgram_ConditionalTrueBlock344: ;Main true block ;keep :
	; LineNumber: 191
	; LineNumber: 192
	mov [current_scene], word 0x0
	; LineNumber: 193
	mov [time], word 0x0
	; LineNumber: 194
MainProgram_elsedoneblock346:
	; LineNumber: 196
	mov ax, [current_scene]
	mov [scene_to_reset], ax
	call ResetScene
	; LineNumber: 197
	mov ax, [current_scene]
	mov [pal], ax
	call SetPalette
	; LineNumber: 198
MainProgram_elsedoneblock334:
	; LineNumber: 200
	; Assigning pointer
	les di, [Screen_buffer1]
	mov [Screen_dest+2], es
	mov [Screen_dest], di
	; Assigning to register
	mov ax, 0x0
	call Screen_ClearBuffer32bit
	; LineNumber: 201
	mov ax, [current_scene]
	mov [scene_to_render], ax
	call RenderScene
	; LineNumber: 203
	call DrawPalette
	; LineNumber: 204
	; 'a:=a + const'  optimization 
	add [time], word 0x1
	; LineNumber: 205
	; 'a:=a + const'  optimization 
	add [scene_time], word 0x1
	; LineNumber: 206
	jmp MainProgram_while301
MainProgram_elsedoneblock304:
MainProgram_loopend306:
	; LineNumber: 208
main_block_end_:
