	CPU 486
	[map symbols /home/piec/DOS/p1x-dos-demoscene/demo-01/TRSE/demo01/symbols.map]
	[ORG 0x100]
	; LineNumber: 581
	jmp block1
	; LineNumber: 3
Memory_i1:	dw	0
	; LineNumber: 6
Memory_error_code:	dw	0x00
	; LineNumber: 7
Memory_source: dw  0,0
	; LineNumber: 7
Memory_dest: dw  0,0
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
	; LineNumber: 31
File_File_this: dw  0,0
	; LineNumber: 3
Gfx_x1:	dw	0
	; LineNumber: 3
Gfx_x2:	dw	0
	; LineNumber: 3
Gfx_y:	dw	0
	; LineNumber: 3
Gfx_y1:	dw	0
	; LineNumber: 3
Gfx_y2:	dw	0
	; LineNumber: 3
Gfx_color:	dw	0
	; LineNumber: 4
Gfx_addr: dw  0,0
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
	; LineNumber: 24
song:
	incbin	 "/home/piec/DOS/p1x-dos-demoscene/demo-01/TRSE/demo01///music.bin"
end_incbin_song:
	; LineNumber: 25
font:
	incbin	 "/home/piec/DOS/p1x-dos-demoscene/demo-01/TRSE/demo01///font.bin"
end_incbin_font:
	; LineNumber: 26
sprites:
	incbin	 "/home/piec/DOS/p1x-dos-demoscene/demo-01/TRSE/demo01///sprites.bin"
end_incbin_sprites:
	; LineNumber: 27
logos:
	incbin	 "/home/piec/DOS/p1x-dos-demoscene/demo-01/TRSE/demo01///logos.bin"
end_incbin_logos:
	; LineNumber: 29
i:	dw	0x00
	; LineNumber: 29
j:	dw	0x00
	; LineNumber: 29
time:	dw	0x00
	; LineNumber: 29
scene_time:	dw	0x00
	; LineNumber: 30
color:	dw	0x00
	; LineNumber: 30
color2:	dw	0x00
	; LineNumber: 30
c:	dw	0x00
	; LineNumber: 31
current_scene:	dw	0x03
	; LineNumber: 32
current_scene_len:	dw	0
	; LineNumber: 33
last_scene:	dw	0x03
	; LineNumber: 34
debug:	db	0x00
	; LineNumber: 44
stars_particle_type_particle_type_x	dw	0
	    dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
stars_particle_type_particle_type_y	dw	0
	    dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
stars_particle_type_particle_type_z	dw	0
	    dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
stars_particle_type_particle_type_speed	dw	0
	    dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	; LineNumber: 45
stars_colors:	db 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x02, 0x02
	db 0x03, 0x03, 0x03, 0x04, 0x04, 0x05, 0x05, 0x05
	db 0x06, 0x06, 0x06, 0x07, 0x07, 0x08, 0x08, 0x08
	db 0x09, 0x09, 0x0a, 0x0a, 0x0a, 0x0b, 0x0b, 0x0b
	db 0x0c, 0x0c, 0x0d, 0x0d, 0x0d, 0x0e, 0x0e, 0x0e
	db 0x0f, 0x0f, 0x10, 0x10, 0x10, 0x11, 0x11, 0x11
	db 0x12, 0x12, 0x13, 0x13, 0x13, 0x14, 0x14, 0x14
	db 0x15, 0x15, 0x15, 0x16, 0x16, 0x17, 0x17, 0x17
	db 0x18, 0x18, 0x18, 0x19, 0x19, 0x19, 0x1a, 0x1a
	db 0x1a, 0x1b, 0x1b, 0x1b, 0x1c, 0x1c, 0x1d, 0x1d
	db 0x1d, 0x1e, 0x1e, 0x1e, 0x1f, 0x1f, 0x1f, 0x20
	db 0x20, 0x20, 0x21, 0x21, 0x21, 0x22, 0x22, 0x22
	db 0x23, 0x23, 0x23, 0x23, 0x24, 0x24, 0x24, 0x25
	db 0x25, 0x25, 0x26, 0x26, 0x26, 0x27, 0x27, 0x27
	db 0x27, 0x28, 0x28, 0x28, 0x29, 0x29, 0x29, 0x2a
	db 0x2a, 0x2a, 0x2a, 0x2b, 0x2b, 0x2b, 0x2b, 0x2c
	db 0x2c, 0x2c, 0x2d, 0x2d, 0x2d, 0x2d, 0x2e, 0x2e
	db 0x2e, 0x2e, 0x2f, 0x2f, 0x2f, 0x2f, 0x30, 0x30
	db 0x30, 0x30, 0x31, 0x31, 0x31, 0x31, 0x32, 0x32
	db 0x32, 0x32, 0x33, 0x33, 0x33, 0x33, 0x33, 0x34
	db 0x34, 0x34, 0x34, 0x35, 0x35, 0x35, 0x35, 0x35
	db 0x36, 0x36, 0x36, 0x36, 0x36, 0x37, 0x37, 0x37
	db 0x37, 0x37, 0x37, 0x38, 0x38, 0x38, 0x38, 0x38
	db 0x38, 0x39, 0x39, 0x39, 0x39, 0x39, 0x39, 0x3a
	db 0x3a, 0x3a, 0x3a, 0x3a, 0x3a, 0x3a, 0x3b, 0x3b
	db 0x3b, 0x3b, 0x3b, 0x3b, 0x3b, 0x3b, 0x3c, 0x3c
	db 0x3c, 0x3c, 0x3c, 0x3c, 0x3c, 0x3c, 0x3c, 0x3d
	db 0x3d, 0x3d, 0x3d, 0x3d, 0x3d, 0x3d, 0x3d, 0x3d
	db 0x3d, 0x3d, 0x3d, 0x3e, 0x3e, 0x3e, 0x3e, 0x3e
	db 0x3e, 0x3e, 0x3e, 0x3e, 0x3e, 0x3e, 0x3e, 0x3e
	db 0x3e, 0x3e, 0x3e, 0x3e, 0x3e, 0x3e, 0x3e, 0x3e
	db 0x3e, 0x3e, 0x3e, 0x3e, 0x3e, 0x3e, 0x3e, 0x3e
	db 
	; LineNumber: 52
spr_kkj_anim_sprite_type_sprite_type_x	dw	0
	    dw 0,0,0,0,0,0,0,0
spr_kkj_anim_sprite_type_sprite_type_y	dw	0
	    dw 0,0,0,0,0,0,0,0
spr_kkj_anim_sprite_type_sprite_type_w	dw	0
	    dw 0,0,0,0,0,0,0,0
spr_kkj_anim_sprite_type_sprite_type_h	dw	0
	    dw 0,0,0,0,0,0,0,0
	; LineNumber: 53
spr_ship_big_sprite_type_sprite_type_x	dw	0
	    dw 0,0,0
spr_ship_big_sprite_type_sprite_type_y	dw	0
	    dw 0,0,0
spr_ship_big_sprite_type_sprite_type_w	dw	0
	    dw 0,0,0
spr_ship_big_sprite_type_sprite_type_h	dw	0
	    dw 0,0,0
	; LineNumber: 55
spr_logos_sprite_type_sprite_type_x	dw	0
	    dw 0,0,0
spr_logos_sprite_type_sprite_type_y	dw	0
	    dw 0,0,0
spr_logos_sprite_type_sprite_type_w	dw	0
	    dw 0,0,0
spr_logos_sprite_type_sprite_type_h	dw	0
	    dw 0,0,0
	; LineNumber: 57
skyline_distribution:	dw 0x04, 0x04, 0x04, 0x04, 0x04, 0x05, 0x06, 0x05
	dw 0x07, 0x05, 0x06, 0x04, 0x04, 0x04, 0x05, 0x05
	dw 0x05, 0x06, 0x04, 0x09, 0x09, 0x04, 0x0b, 0x0a
	dw 0x09, 0x04, 0x0c, 0x04, 0x0b, 0x0e, 0x06, 0x0f
	dw 0x0a, 0x0d, 0x04, 0x07, 0x07, 0x06, 0x0c, 0x10
	dw 0x12, 0x05, 0x05, 0x0a, 0x09, 0x13, 0x0a, 0x10
	dw 0x10, 0x09, 0x0b, 0x09, 0x13, 0x14, 0x13, 0x11
	dw 0x05, 0x09, 0x15, 0x08, 0x0f, 0x10, 0x0c, 0x0b
	dw 0x19, 0x0d, 0x16, 0x0a, 0x04, 0x16, 0x0e, 0x13
	dw 0x1a, 0x07, 0x18, 0x0b, 0x0c, 0x0f, 0x15, 0x17
	dw 0x07, 0x0f, 0x11, 0x15, 0x11, 0x06, 0x13, 0x17
	dw 0x18, 0x0e, 0x07, 0x05, 0x20, 0x1f, 0x08, 0x06
	dw 0x20, 0x14, 0x14, 0x0b, 0x06, 0x11, 0x1d, 0x04
	dw 0x10, 0x10, 0x1f, 0x1f, 0x20, 0x07, 0x0b, 0x17
	dw 0x05, 0x0a, 0x21, 0x12, 0x13, 0x21, 0x11, 0x1f
	dw 0x1c, 0x1c, 0x06, 0x1b, 0x0c, 0x15, 0x10, 0x1a
	dw 0x17, 0x16, 0x19, 0x06, 0x10, 0x11, 0x1c, 0x20
	dw 0x0d, 0x0a, 0x0a, 0x22, 0x10, 0x08, 0x19, 0x10
	dw 0x05, 0x12, 0x0f, 0x0a, 0x15, 0x1c, 0x0b, 0x05
	dw 0x04, 0x1a, 0x21, 0x0a, 0x0b, 0x11, 0x1c, 0x21
	dw 0x0d, 0x15, 0x09, 0x07, 0x14, 0x10, 0x0a, 0x14
	dw 0x0b, 0x07, 0x1e, 0x1f, 0x1f, 0x04, 0x1d, 0x0b
	dw 0x0f, 0x05, 0x1d, 0x1a, 0x08, 0x1b, 0x1b, 0x07
	dw 0x16, 0x11, 0x05, 0x18, 0x11, 0x17, 0x18, 0x08
	dw 0x09, 0x14, 0x0a, 0x17, 0x0f, 0x10, 0x11, 0x05
	dw 0x0c, 0x11, 0x13, 0x08, 0x0d, 0x16, 0x13, 0x10
	dw 0x11, 0x0f, 0x12, 0x0f, 0x0a, 0x07, 0x05, 0x08
	dw 0x09, 0x11, 0x06, 0x06, 0x07, 0x0a, 0x08, 0x0a
	dw 0x06, 0x0d, 0x0b, 0x05, 0x06, 0x06, 0x04, 0x0c
	dw 0x04, 0x07, 0x04, 0x04, 0x06, 0x06, 0x05, 0x07
	dw 0x07, 0x05, 0x05, 0x08, 0x04, 0x08, 0x04, 0x06
	dw 0x06, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04
	dw 
	; LineNumber: 58
skyline_sizes:	dw 0x26, 0x12, 0x19, 0x26, 0x1a, 0x0f, 0x0e, 0x16
	dw 
	; LineNumber: 59
depth_color:	dw 0x3f, 0x3e, 0x3e, 0x3d, 0x3d, 0x3d, 0x3c, 0x3c
	dw 0x3b, 0x3b, 0x3b, 0x3a, 0x3a, 0x39, 0x39, 0x39
	dw 0x38, 0x38, 0x38, 0x37, 0x37, 0x36, 0x36, 0x36
	dw 0x35, 0x35, 0x34, 0x34, 0x34, 0x33, 0x33, 0x33
	dw 0x32, 0x32, 0x31, 0x31, 0x31, 0x30, 0x30, 0x30
	dw 0x2f, 0x2f, 0x2e, 0x2e, 0x2e, 0x2d, 0x2d, 0x2d
	dw 0x2c, 0x2c, 0x2b, 0x2b, 0x2b, 0x2a, 0x2a, 0x2a
	dw 0x29, 0x29, 0x29, 0x28, 0x28, 0x27, 0x27, 0x27
	dw 0x26, 0x26, 0x26, 0x25, 0x25, 0x25, 0x24, 0x24
	dw 0x24, 0x23, 0x23, 0x23, 0x22, 0x22, 0x21, 0x21
	dw 0x21, 0x20, 0x20, 0x20, 0x1f, 0x1f, 0x1f, 0x1e
	dw 0x1e, 0x1e, 0x1d, 0x1d, 0x1d, 0x1c, 0x1c, 0x1c
	dw 0x1b, 0x1b, 0x1b, 0x1b, 0x1a, 0x1a, 0x1a, 0x19
	dw 0x19, 0x19, 0x18, 0x18, 0x18, 0x17, 0x17, 0x17
	dw 0x17, 0x16, 0x16, 0x16, 0x15, 0x15, 0x15, 0x14
	dw 0x14, 0x14, 0x14, 0x13, 0x13, 0x13, 0x13, 0x12
	dw 
	; LineNumber: 61
factor:	dw	0
	; LineNumber: 63
scene_intro_bar_size:	db	0x00
	; LineNumber: 64
last_spr:	db	0x00
	; LineNumber: 68
x1:	dw	0xa0
	; LineNumber: 68
x2:	dw	0xa0
	; LineNumber: 69
y1:	dw	0x64
	; LineNumber: 69
y2:	dw	0x64
	; LineNumber: 70
x:	dw	0
	; LineNumber: 70
y:	dw	0
	; LineNumber: 71
size:	dw	0
	; LineNumber: 71
w:	dw	0
	; LineNumber: 71
h:	dw	0
	; LineNumber: 72
sx:	dw	0
	; LineNumber: 72
sy:	dw	0
	; LineNumber: 72
sz:	dw	0
	; LineNumber: 73
shift:	dw	0x00
	; LineNumber: 78
sin64:	db 0x20, 0x21, 0x23, 0x24, 0x26, 0x27, 0x29, 0x2a
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
	; LineNumber: 79
sin32:	db 0x10, 0x10, 0x10, 0x11, 0x11, 0x11, 0x12, 0x12
	db 0x13, 0x13, 0x13, 0x14, 0x14, 0x15, 0x15, 0x15
	db 0x16, 0x16, 0x16, 0x17, 0x17, 0x17, 0x18, 0x18
	db 0x18, 0x19, 0x19, 0x19, 0x1a, 0x1a, 0x1a, 0x1b
	db 0x1b, 0x1b, 0x1b, 0x1c, 0x1c, 0x1c, 0x1c, 0x1d
	db 0x1d, 0x1d, 0x1d, 0x1d, 0x1e, 0x1e, 0x1e, 0x1e
	db 0x1e, 0x1e, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f
	db 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f
	db 0x20, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f
	db 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1e
	db 0x1e, 0x1e, 0x1e, 0x1e, 0x1e, 0x1d, 0x1d, 0x1d
	db 0x1d, 0x1d, 0x1c, 0x1c, 0x1c, 0x1c, 0x1b, 0x1b
	db 0x1b, 0x1b, 0x1a, 0x1a, 0x1a, 0x19, 0x19, 0x19
	db 0x18, 0x18, 0x18, 0x17, 0x17, 0x17, 0x16, 0x16
	db 0x16, 0x15, 0x15, 0x15, 0x14, 0x14, 0x13, 0x13
	db 0x13, 0x12, 0x12, 0x11, 0x11, 0x11, 0x10, 0x10
	db 0x10, 0x0f, 0x0f, 0x0e, 0x0e, 0x0e, 0x0d, 0x0d
	db 0x0c, 0x0c, 0x0c, 0x0b, 0x0b, 0x0a, 0x0a, 0x0a
	db 0x09, 0x09, 0x09, 0x08, 0x08, 0x08, 0x07, 0x07
	db 0x07, 0x06, 0x06, 0x06, 0x05, 0x05, 0x05, 0x04
	db 0x04, 0x04, 0x04, 0x03, 0x03, 0x03, 0x03, 0x02
	db 0x02, 0x02, 0x02, 0x02, 0x01, 0x01, 0x01, 0x01
	db 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01
	db 0x01, 0x01, 0x01, 0x01, 0x01, 0x02, 0x02, 0x02
	db 0x02, 0x02, 0x03, 0x03, 0x03, 0x03, 0x04, 0x04
	db 0x04, 0x04, 0x05, 0x05, 0x05, 0x06, 0x06, 0x06
	db 0x07, 0x07, 0x07, 0x08, 0x08, 0x08, 0x09, 0x09
	db 0x09, 0x0a, 0x0a, 0x0a, 0x0b, 0x0b, 0x0c, 0x0c
	db 0x0c, 0x0d, 0x0d, 0x0e, 0x0e, 0x0e, 0x0f, 0x0f
	db 
	; LineNumber: 80
sin256:	db 0x80, 0x83, 0x86, 0x89, 0x8c, 0x8f, 0x92, 0x95
	db 0x98, 0x9c, 0x9f, 0xa2, 0xa5, 0xa8, 0xab, 0xae
	db 0xb0, 0xb3, 0xb6, 0xb9, 0xbc, 0xbf, 0xc1, 0xc4
	db 0xc7, 0xc9, 0xcc, 0xce, 0xd1, 0xd3, 0xd5, 0xd8
	db 0xda, 0xdc, 0xde, 0xe0, 0xe2, 0xe4, 0xe6, 0xe8
	db 0xea, 0xec, 0xed, 0xef, 0xf0, 0xf2, 0xf3, 0xf5
	db 0xf6, 0xf7, 0xf8, 0xf9, 0xfa, 0xfb, 0xfc, 0xfc
	db 0xfd, 0xfe, 0xfe, 0xff, 0xff, 0xff, 0xff, 0xff
	db 0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xfe, 0xfe
	db 0xfd, 0xfc, 0xfc, 0xfb, 0xfa, 0xf9, 0xf8, 0xf7
	db 0xf6, 0xf5, 0xf3, 0xf2, 0xf0, 0xef, 0xed, 0xec
	db 0xea, 0xe8, 0xe6, 0xe4, 0xe2, 0xe0, 0xde, 0xdc
	db 0xda, 0xd8, 0xd5, 0xd3, 0xd1, 0xce, 0xcc, 0xc9
	db 0xc7, 0xc4, 0xc1, 0xbf, 0xbc, 0xb9, 0xb6, 0xb3
	db 0xb0, 0xae, 0xab, 0xa8, 0xa5, 0xa2, 0x9f, 0x9c
	db 0x98, 0x95, 0x92, 0x8f, 0x8c, 0x89, 0x86, 0x83
	db 0x80, 0x7c, 0x79, 0x76, 0x73, 0x70, 0x6d, 0x6a
	db 0x67, 0x63, 0x60, 0x5d, 0x5a, 0x57, 0x54, 0x51
	db 0x4f, 0x4c, 0x49, 0x46, 0x43, 0x40, 0x3e, 0x3b
	db 0x38, 0x36, 0x33, 0x31, 0x2e, 0x2c, 0x2a, 0x27
	db 0x25, 0x23, 0x21, 0x1f, 0x1d, 0x1b, 0x19, 0x17
	db 0x15, 0x13, 0x12, 0x10, 0x0f, 0x0d, 0x0c, 0x0a
	db 0x09, 0x08, 0x07, 0x06, 0x05, 0x04, 0x03, 0x03
	db 0x02, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
	db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01
	db 0x02, 0x03, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08
	db 0x09, 0x0a, 0x0c, 0x0d, 0x0f, 0x10, 0x12, 0x13
	db 0x15, 0x17, 0x19, 0x1b, 0x1d, 0x1f, 0x21, 0x23
	db 0x25, 0x27, 0x2a, 0x2c, 0x2e, 0x31, 0x33, 0x36
	db 0x38, 0x3b, 0x3e, 0x40, 0x43, 0x46, 0x49, 0x4c
	db 0x4f, 0x51, 0x54, 0x57, 0x5a, 0x5d, 0x60, 0x63
	db 0x67, 0x6a, 0x6d, 0x70, 0x73, 0x76, 0x79, 0x7c
	db 
	; LineNumber: 82
scene_intro_color:	db	0x00
	; LineNumber: 87
demo_name_text		db	" C:/>DEMO1.EXE "
	db	0
	; LineNumber: 88
powered_by_text		db	"POWERED BY TRSE"
	db	0
	; LineNumber: 89
intel486_text		db	" FOR INTEL 486 "
	db	0
	; LineNumber: 90
outro_text		db	"* SCENE.P1X.IN *"
	db	0
	; LineNumber: 91
date_text		db	"OCTOBER 2023"
	db	0
	; LineNumber: 92
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
	; ***********  Defining procedure : Memory_CopyData16
	;    Procedure type : User-defined procedure
	; LineNumber: 130
	; LineNumber: 129
	; LineNumber: 129
	; LineNumber: 129
Memory_CopyData16_block5:
Memory_CopyData16:
	; LineNumber: 132
	; ****** Inline assembler section
	mov     cx, [Memory_i1]
    push    ds
    les di,[Memory_dest]
    lds si,[Memory_source]
    
    Rep MovsW
    pop     ds
  
	; LineNumber: 140
	ret
end_procedure_Memory_CopyData16:
	; ***********  Defining procedure : Screen_InitVGABuffers
	;    Procedure type : User-defined procedure
	; LineNumber: 37
	; LineNumber: 36
Screen_InitVGABuffers_block6:
Screen_InitVGABuffers:
	; LineNumber: 38
	; Binary clause Simplified: GREATER
	; Compare with pure num / var optimization
	cmp [Screen_noBuffers],word 0x0
	jbe Screen_InitVGABuffers_elsedoneblock10
Screen_InitVGABuffers_ConditionalTrueBlock8: ;Main true block ;keep :
	; LineNumber: 38
	; Assigning pointer
	; Setting PURE POINTER 0
	mov [Memory_blocks], word 0xfff
	call Memory_GetBlockMem
	; Setting PURE POINTER ends
	mov [Screen_buffer1+2], es
	mov [Screen_buffer1], di
Screen_InitVGABuffers_elsedoneblock10:
	; LineNumber: 40
	; Binary clause Simplified: GREATER
	; Compare with pure num / var optimization
	cmp [Screen_noBuffers],word 0x1
	jbe Screen_InitVGABuffers_elsedoneblock16
Screen_InitVGABuffers_ConditionalTrueBlock14: ;Main true block ;keep :
	; LineNumber: 40
	; Assigning pointer
	; Setting PURE POINTER 0
	mov [Memory_blocks], word 0xfff
	call Memory_GetBlockMem
	; Setting PURE POINTER ends
	mov [Screen_buffer2+2], es
	mov [Screen_buffer2], di
Screen_InitVGABuffers_elsedoneblock16:
	; LineNumber: 42
	; Binary clause Simplified: GREATER
	; Compare with pure num / var optimization
	cmp [Screen_noBuffers],word 0x2
	jbe Screen_InitVGABuffers_elsedoneblock22
Screen_InitVGABuffers_ConditionalTrueBlock20: ;Main true block ;keep :
	; LineNumber: 42
	; Assigning pointer
	; Setting PURE POINTER 0
	mov [Memory_blocks], word 0xfff
	call Memory_GetBlockMem
	; Setting PURE POINTER ends
	mov [Screen_buffer3+2], es
	mov [Screen_buffer3], di
Screen_InitVGABuffers_elsedoneblock22:
	; LineNumber: 44
	; Binary clause Simplified: GREATER
	; Compare with pure num / var optimization
	cmp [Screen_noBuffers],word 0x3
	jbe Screen_InitVGABuffers_elsedoneblock28
Screen_InitVGABuffers_ConditionalTrueBlock26: ;Main true block ;keep :
	; LineNumber: 44
	; Assigning pointer
	; Setting PURE POINTER 0
	mov [Memory_blocks], word 0xfff
	call Memory_GetBlockMem
	; Setting PURE POINTER ends
	mov [Screen_buffer4+2], es
	mov [Screen_buffer4], di
Screen_InitVGABuffers_elsedoneblock28:
	; LineNumber: 46
	; Binary clause Simplified: GREATER
	; Compare with pure num / var optimization
	cmp [Screen_noBuffers],word 0x4
	jbe Screen_InitVGABuffers_elsedoneblock34
Screen_InitVGABuffers_ConditionalTrueBlock32: ;Main true block ;keep :
	; LineNumber: 46
	; Assigning pointer
	; Setting PURE POINTER 0
	mov [Memory_blocks], word 0xfff
	call Memory_GetBlockMem
	; Setting PURE POINTER ends
	mov [Screen_buffer5+2], es
	mov [Screen_buffer5], di
Screen_InitVGABuffers_elsedoneblock34:
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
Screen_SetColor_block37:
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
	; LineNumber: 123
	; LineNumber: 122
	; LineNumber: 122
Screen_CopyVGABuffer32bit_block38:
Screen_CopyVGABuffer32bit:
	; LineNumber: 125
	; ****** Inline assembler section
	cld
  	push ds
    les di,[Screen_dest]
    lds si,[Screen_source]
    mov ecx, 16000
    rep movsd
    pop ds
  
	; LineNumber: 133
	ret
end_procedure_Screen_CopyVGABuffer32bit:
	; ***********  Defining procedure : Screen_ClearBuffer32bit
	;    Procedure type : User-defined procedure
	; LineNumber: 136
	; LineNumber: 135
	; LineNumber: 135
_ax:	dw	0
Screen_ClearBuffer32bit_block39:
Screen_ClearBuffer32bit:
	; LineNumber: 138
	; ****** Inline assembler section
	les di,[Screen_dest]
    mov     cx, 16000
    rep stosD
  
	; LineNumber: 142
	ret
end_procedure_Screen_ClearBuffer32bit:
	; ***********  Defining procedure : Screen_SetMode
	;    Procedure type : User-defined procedure
	; LineNumber: 160
	; LineNumber: 159
Screen_SetMode_block40:
Screen_SetMode:
	; LineNumber: 161
	; ****** Inline assembler section
		mov ax,[Screen_i]
		int 0x10
	
	; LineNumber: 165
	ret
end_procedure_Screen_SetMode:
	; ***********  Defining procedure : Gfx_PutPixel
	;    Procedure type : User-defined procedure
	; LineNumber: 79
	; LineNumber: 78
	; LineNumber: 78
	; LineNumber: 78
	; LineNumber: 78
Gfx_buffer: dw  0,0
Gfx_PutPixel_block41:
Gfx_PutPixel:
	; LineNumber: 101
	; ****** Inline assembler section
	mov 	ax,word [Gfx_buffer+2]
	mov     bx,[Gfx_x1]
    mov     dx,[Gfx_y]
    mov     di,bx
    mov     bx, dx                  ; bx = dx
    shl     dx, 8
    shl     bx, 6
    add     dx, bx                  ; dx = dx + bx (ie y*320)
    add     di, dx                  ; finalise location
    Dec     Di
    mov     al, [Gfx_color]
    stosb
   
	; LineNumber: 115
	ret
end_procedure_Gfx_PutPixel:
	; ***********  Defining procedure : Gfx_DrawLine
	;    Procedure type : User-defined procedure
	; LineNumber: 130
	; LineNumber: 119
Gfx_i:	dw	0
	; LineNumber: 119
Gfx_s:	dw	0
	; LineNumber: 119
Gfx_d1x:	dw	0
	; LineNumber: 119
Gfx_d1y:	dw	0
	; LineNumber: 119
Gfx_d2x:	dw	0
	; LineNumber: 119
Gfx_d2y:	dw	0
	; LineNumber: 119
Gfx_u:	dw	0
	; LineNumber: 119
Gfx_v:	dw	0
	; LineNumber: 119
Gfx_m:	dw	0
	; LineNumber: 119
Gfx_n:	dw	0
	; LineNumber: 118
Gfx_a:	dw	0
	; LineNumber: 118
Gfx_b:	dw	0
	; LineNumber: 118
Gfx_c:	dw	0
	; LineNumber: 118
Gfx_d:	dw	0
	; LineNumber: 118
	; LineNumber: 118
Gfx_where: dw  0,0
Gfx_DrawLine_block42:
Gfx_DrawLine:
	; LineNumber: 132
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
		
	; LineNumber: 240
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
	; LineNumber: 244
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
	
	; LineNumber: 273
	ret
end_procedure_Gfx_DrawLine:
	; ***********  Defining procedure : Gfx_Hline
	;    Procedure type : User-defined procedure
	; LineNumber: 279
	; LineNumber: 278
	; LineNumber: 278
	; LineNumber: 278
	; LineNumber: 278
	; LineNumber: 278
Gfx_Hline_block44:
Gfx_Hline:
	; LineNumber: 281
	; ****** Inline assembler section
	;cmp [Gfx_y],200
  ;jge @@nei
  ;cmp [Gfx_y],0
  ;jle @@nei
  Mov Bx,[Gfx_x1]
  Mov Dx,[Gfx_x2]
  Cld
  Cli
  mov   ax,[Gfx_addr+2]
  mov   es,ax
  mov   ax,[Gfx_y]
  mov   di,ax
  shl   ax,8
  shl   di,6
  add   di,ax
  add   di,[Gfx_x1]
  mov   al,[Gfx_color]
  mov   ah,al
  mov   cx,Dx
  sub   cx,Bx
  shr   cx,1
  jnc   @start
  stosb
@start:
  rep   stosw
  sti
@@nei:
	; LineNumber: 315
	ret
end_procedure_Gfx_Hline:
	; ***********  Defining procedure : Gfx_DrawSquare
	;    Procedure type : User-defined procedure
	; LineNumber: 318
	; LineNumber: 317
	; LineNumber: 317
	; LineNumber: 317
	; LineNumber: 317
	; LineNumber: 317
	; LineNumber: 317
Gfx_DrawSquare_block45:
Gfx_DrawSquare:
	; LineNumber: 323
	mov ax, [Gfx_y1]
	mov [Gfx_y], ax
Gfx_DrawSquare_forloop46:
	; LineNumber: 320
	; LineNumber: 321
	call Gfx_Hline
	; LineNumber: 322
Gfx_DrawSquare_loopstart47:
	add [Gfx_y],word 1
	mov ax, [Gfx_y2]
	cmp ax,word [Gfx_y]
	jne Gfx_DrawSquare_forloop46
Gfx_DrawSquare_loopend48:
	; LineNumber: 323
	ret
end_procedure_Gfx_DrawSquare:
	; ***********  Defining procedure : Fonts_Init
	;    Procedure type : User-defined procedure
	; LineNumber: 22
	; LineNumber: 21
	; LineNumber: 21
	; LineNumber: 21
	; LineNumber: 21
	; LineNumber: 21
Fonts_Init_block51:
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
Fonts_Init_forloop52:
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
	jne Fonts_Init_elsedoneblock66
Fonts_Init_ConditionalTrueBlock64: ;Main true block ;keep :
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
Fonts_Init_elsedoneblock66:
	; LineNumber: 39
Fonts_Init_loopstart53:
	add [Fonts_i],word 1
	mov ax, 0x40
	cmp ax,word [Fonts_i]
	jne Fonts_Init_forloop52
Fonts_Init_loopend54:
	; LineNumber: 41
	ret
end_procedure_Fonts_Init:
	; ***********  Defining procedure : Fonts_PrintChar
	;    Procedure type : User-defined procedure
	; LineNumber: 45
	; LineNumber: 44
	; LineNumber: 44
Fonts_PrintChar_block69:
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
	; LineNumber: 48
	; Binary clause Simplified: EQUALS
	; Compare with pure num / var optimization
	cmp [Fonts_writeType],word 0x0
	jne Fonts_PrintChar_elsedoneblock73
Fonts_PrintChar_ConditionalTrueBlock71: ;Main true block ;keep :
	; LineNumber: 48
	mov [Fonts_i], word 0x0
Fonts_PrintChar_forloop81:
	; LineNumber: 50
	; LineNumber: 51
	; Memcpy
	push ds
	mov ax, [Fonts_len]
	push ax
	les di,[Fonts_dst]
	lds si,[Fonts_src]
	pop cx
	rep movsd
	pop ds
	; LineNumber: 52
	; 'a:=a + const'  optimization 
	add [Fonts_src], word 0x140
	; LineNumber: 53
	; 'a:=a + const'  optimization 
	add [Fonts_dst], word 0x140
	; LineNumber: 54
Fonts_PrintChar_loopstart82:
	add [Fonts_i],word 1
	mov ax, [Fonts_font_size_y]
	cmp ax,word [Fonts_i]
	jne Fonts_PrintChar_forloop81
Fonts_PrintChar_loopend83:
Fonts_PrintChar_elsedoneblock73:
	; LineNumber: 55
	; Binary clause Simplified: EQUALS
	; Compare with pure num / var optimization
	cmp [Fonts_writeType],word 0x1
	jne Fonts_PrintChar_elsedoneblock89
Fonts_PrintChar_ConditionalTrueBlock87: ;Main true block ;keep :
	; LineNumber: 56
	mov [Fonts_i], word 0x0
Fonts_PrintChar_forloop97:
	; LineNumber: 58
	; LineNumber: 59
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
		
		
	; LineNumber: 82
	
; //		memcpy32(src,dst,len);
	; 'a:=a + const'  optimization 
	add [Fonts_src], word 0x140
	; LineNumber: 83
	; 'a:=a + const'  optimization 
	add [Fonts_dst], word 0x140
	; LineNumber: 84
Fonts_PrintChar_loopstart98:
	add [Fonts_i],word 1
	mov ax, [Fonts_font_size_y]
	cmp ax,word [Fonts_i]
	jne Fonts_PrintChar_forloop97
Fonts_PrintChar_loopend99:
Fonts_PrintChar_elsedoneblock89:
	; LineNumber: 85
	ret
end_procedure_Fonts_PrintChar:
	; ***********  Defining procedure : Fonts_PrintString
	;    Procedure type : User-defined procedure
	; LineNumber: 89
	; LineNumber: 88
	; LineNumber: 88
	; LineNumber: 88
	; LineNumber: 88
Fonts_PrintString_block102:
Fonts_PrintString:
	; LineNumber: 90
	; 'a:=a + expression'  optimization 
	mov ax, [Fonts_y]
	mov bx, 0x140
	mul  bx
	; Type : POINTER
	add [Fonts_dst2], ax
	; LineNumber: 91
	; 'a:=a + expression'  optimization 
	mov ax, [Fonts_x]
	; Type : POINTER
	add [Fonts_dst2], ax
	; LineNumber: 92
Fonts_PrintString_while103:
Fonts_PrintString_loopstart107:
	; Binary clause Simplified: NOTEQUALS
	; Compare with pure num / var optimization
	les di,[Fonts_tp]
	mov ax, word [es:di + 0x0*1]
	mov ah,0
	cmp ax,0x0
	je Fonts_PrintString_elsedoneblock106
Fonts_PrintString_ConditionalTrueBlock104: ;Main true block ;keep :
	; LineNumber: 93
	; LineNumber: 94
	les di,[Fonts_tp]
	mov ax, word [es:di + 0x0*1]
	mov ah,0
	mov [Fonts_c], ax
	; Assigning pointer
	les di, [Fonts_dst2]
	mov [Fonts_dst+2], es
	mov [Fonts_dst], di
	call Fonts_PrintChar
	; LineNumber: 95
	; 'a:=a + expression'  optimization 
	mov ax, [Fonts_font_size_x]
	; Type : POINTER
	add [Fonts_dst2], ax
	; LineNumber: 96
	; 'a:=a + const'  optimization 
	add [Fonts_tp], word 0x1
	; LineNumber: 97
	jmp Fonts_PrintString_while103
Fonts_PrintString_elsedoneblock106:
Fonts_PrintString_loopend108:
	; LineNumber: 98
	ret
end_procedure_Fonts_PrintString:
	; ***********  Defining procedure : BeePlay_Beep
	;    Procedure type : User-defined procedure
	; LineNumber: 38
	; LineNumber: 37
BeePlay_bi:	dw	0
BeePlay_Beep_block111:
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
BeePlay_Initialize_block113:
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
	je BeePlay_Play_elseblock117
BeePlay_Play_ConditionalTrueBlock116: ;Main true block ;keep :
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
	jmp BeePlay_Play_elsedoneblock118
BeePlay_Play_elseblock117:
	; LineNumber: 96
	mov [BeePlay_i], word 0x0
BeePlay_Play_elsedoneblock118:
	; LineNumber: 100
	; 'a:=a + const'  optimization 
	add [BeePlay_curN], word 0x1
	; LineNumber: 102
	; Binary clause Simplified: EQUALS
	; Compare two vars optimization
	mov al, [BeePlay_noChannels]
	cmp  [BeePlay_curN],al
	jne BeePlay_Play_elsedoneblock126
BeePlay_Play_ConditionalTrueBlock124: ;Main true block ;keep :
	; LineNumber: 102
	mov [BeePlay_curN], word 0x0
BeePlay_Play_elsedoneblock126:
	; LineNumber: 105
	; Binary clause Simplified: EQUALS
	; Compare with pure num / var optimization
	cmp [BeePlay_i],word 0xff
	jne BeePlay_Play_localfailed157
	jmp BeePlay_Play_ConditionalTrueBlock130
BeePlay_Play_localfailed157: ;keep:
	; ; logical OR, second chance
	; Binary clause Simplified: EQUALS
	; Compare with pure num / var optimization
	cmp [BeePlay_i],word 0x0
	jne BeePlay_Play_elsedoneblock132
BeePlay_Play_ConditionalTrueBlock130: ;Main true block ;keep :
	; LineNumber: 106
	; LineNumber: 107
	mov [BeePlay_v2], word 0x1
	; LineNumber: 113
	mov [BeePlay_j], word 0x0
BeePlay_Play_forloop159:
	; LineNumber: 109
	; LineNumber: 110
	; Binary clause Simplified: NOTEQUALS
	; Compare with pure num / var optimization
	mov ah,0 ; Accomodate for byte
	mov di,[BeePlay_j] ; index is word
	shl di,1 ; Accomodate for word
	mov ax, [BeePlay_curDecay+di]
	cmp ax,0x0
	je BeePlay_Play_elsedoneblock173
BeePlay_Play_ConditionalTrueBlock171: ;Main true block ;keep :
	; LineNumber: 110
	
; // prepare to stop
	mov [BeePlay_v2], word 0x0
BeePlay_Play_elsedoneblock173:
	; LineNumber: 112
BeePlay_Play_loopstart160:
	add [BeePlay_j],word 1
	mov ax, [BeePlay_noChannels]
	mov ah,0 ; forcetype clear high bit
	cmp ax,word [BeePlay_j]
	jne BeePlay_Play_forloop159
BeePlay_Play_loopend161:
	; LineNumber: 114
	; Binary clause Simplified: NOTEQUALS
	; Compare with pure num / var optimization
	cmp [BeePlay_v2],word 0x0
	je BeePlay_Play_elsedoneblock179
BeePlay_Play_ConditionalTrueBlock177: ;Main true block ;keep :
	; LineNumber: 114
	call BeePlay_Stop
BeePlay_Play_elsedoneblock179:
	; LineNumber: 117
	ret
	; LineNumber: 118
BeePlay_Play_elsedoneblock132:
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
	jae BeePlay_Update_elsedoneblock186
BeePlay_Update_ConditionalTrueBlock184: ;Main true block ;keep :
	; LineNumber: 144
	ret
BeePlay_Update_elsedoneblock186:
	; LineNumber: 147
	mov [BeePlay_counter], word 0x0
	; LineNumber: 183
	mov [BeePlay_i], word 0x0
BeePlay_Update_forloop189:
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
	je BeePlay_Update_elsedoneblock215
BeePlay_Update_ConditionalTrueBlock213: ;Main true block ;keep :
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
	je BeePlay_Update_elsedoneblock227
BeePlay_Update_ConditionalTrueBlock225: ;Main true block ;keep :
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
BeePlay_Update_elsedoneblock227:
	; LineNumber: 180
BeePlay_Update_elsedoneblock215:
	; LineNumber: 182
BeePlay_Update_loopstart190:
	add [BeePlay_i],word 1
	mov ax, [BeePlay_noChannels]
	mov ah,0 ; forcetype clear high bit
	cmp ax,word [BeePlay_i]
	jne BeePlay_Update_forloop189
BeePlay_Update_loopend191:
	; LineNumber: 185
	
; //	Screen::NewLine();
	; 'a:=a + const'  optimization 
	add [BeePlay_curRow], word 0x1
	; LineNumber: 188
	; Binary clause Simplified: EQUALS
	; Compare two vars optimization
	mov ax, [BeePlay_noRows]
	cmp  [BeePlay_curRow],ax
	jne BeePlay_Update_elsedoneblock233
BeePlay_Update_ConditionalTrueBlock231: ;Main true block ;keep :
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
	jne BeePlay_Update_elsedoneblock245
BeePlay_Update_ConditionalTrueBlock243: ;Main true block ;keep :
	; LineNumber: 193
	; LineNumber: 194
	mov [BeePlay_curOrder], word 0x0
	; LineNumber: 195
BeePlay_Update_elsedoneblock245:
	; LineNumber: 197
BeePlay_Update_elsedoneblock233:
	; LineNumber: 199
	ret
end_procedure_BeePlay_Update:
	; ***********  Defining procedure : Compression_Decompress
	;    Procedure type : User-defined procedure
	; LineNumber: 110
	; LineNumber: 109
	; LineNumber: 109
Compression_Decompress_block248:
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
	
; //	 * STRINGS
; //	 
	; ***********  Defining procedure : SetPalette
	;    Procedure type : User-defined procedure
	; LineNumber: 95
	; LineNumber: 94
pal:	dw	0
SetPalette_block250:
SetPalette:
	; LineNumber: 96
	mov ax, [pal]
	mov bx, 0x0
	cmp ax,bx
	jne SetPalette_casenext252
	; LineNumber: 96
	; LineNumber: 105
	mov [i], word 0x0
SetPalette_forloop254:
	; LineNumber: 98
	; LineNumber: 100
	; Generic add/sub
	mov ax, 0x20
	mov di,[i] ; index is word
	mov bx, [sin64+di]
	mov bh,0 ; forcetype clear high bit
	add  ax,bx; bop
	mov [c], ax
	; LineNumber: 101
	mov ax, [i]
	mov [Screen_color], al
	mov ax, [c]
	xor dx,dx
	mov bx, 0x2
	div  bx
	mov [Screen_red], al
	mov ax, [c]
	xor dx,dx
	mov bx, 0x4
	div  bx
	mov [Screen_green], al
	; RHS is pure optimization
	mov ax, 0x3f
	; Forcetype IS POINTER: 0
	sub  ax, [c]
	mov [Screen_blue], al
	call Screen_SetColor
	; LineNumber: 102
	; RHS is pure optimization
	mov ax, 0x40
	; Forcetype IS POINTER: 0
	add  ax, [i]
	mov [Screen_color], al
	; Generic add/sub
	mov ax, 0x4
	mov bx, [i]
	xor dx,dx
	mov cx, 0x2
	push ax
	mov ax,bx
	div  cx
	mov bx,ax
	pop ax
	add  ax,bx; bop
	mov [Screen_red], al
	; Generic add/sub
	mov ax, 0x4
	mov bx, [i]
	xor dx,dx
	push ax
	mov ax,bx
	div  cx
	mov bx,ax
	pop ax
	add  ax,bx; bop
	mov [Screen_green], al
	; Generic add/sub
	mov ax, 0x4
	mov bx, [i]
	xor dx,dx
	push ax
	mov ax,bx
	div  cx
	mov bx,ax
	pop ax
	add  ax,bx; bop
	mov [Screen_blue], al
	call Screen_SetColor
	; LineNumber: 103
	; RHS is pure optimization
	mov ax, 0x80
	; Forcetype IS POINTER: 0
	add  ax, [i]
	mov [Screen_color], al
	mov ax, [i]
	xor dx,dx
	mov bx, 0x2
	div  bx
	mov [Screen_red], al
	mov ax, [i]
	xor dx,dx
	mov bx, 0x3
	div  bx
	mov [Screen_green], al
	mov ax, [i]
	mov [Screen_blue], al
	call Screen_SetColor
	; LineNumber: 104
SetPalette_loopstart255:
	add [i],word 1
	mov ax, 0x40
	cmp ax,word [i]
	jne SetPalette_forloop254
SetPalette_loopend256:
	; LineNumber: 106
	mov [Screen_color], byte 0x0
	mov [Screen_red], byte 0x4
	mov [Screen_green], byte 0x4
	mov [Screen_blue], byte 0x4
	call Screen_SetColor
	; LineNumber: 111
	mov [i], word 0x1
SetPalette_forloop259:
	; LineNumber: 107
	; LineNumber: 109
	mov ax, [i]
	mov [Screen_color], al
	; Generic add/sub
	mov ax, 0x8
	mov bx, [i]
	mov cx, 0x2
	push ax
	mov ax,bx
	mul  cx
	mov bx,ax
	pop ax
	add  ax,bx; bop
	mov [Screen_red], al
	; Generic add/sub
	mov ax, 0x8
	mov bx, [i]
	mov cx, 0x4
	push ax
	mov ax,bx
	mul  cx
	mov bx,ax
	pop ax
	add  ax,bx; bop
	mov [Screen_green], al
	; Generic add/sub
	mov ax, 0x8
	mov bx, [i]
	mov cx, 0x2
	push ax
	mov ax,bx
	mul  cx
	mov bx,ax
	pop ax
	add  ax,bx; bop
	mov [Screen_blue], al
	call Screen_SetColor
	; LineNumber: 110
SetPalette_loopstart260:
	add [i],word 1
	mov ax, 0x10
	cmp ax,word [i]
	jne SetPalette_forloop259
SetPalette_loopend261:
	; LineNumber: 111
	jmp SetPalette_caseend251
SetPalette_casenext252:
	mov ax, [pal]
	mov bx, 0x1
	cmp ax,bx
	jne SetPalette_casenext264
	; LineNumber: 112
	; LineNumber: 121
	mov [i], word 0x0
SetPalette_forloop266:
	; LineNumber: 114
	; LineNumber: 116
	; Generic add/sub
	mov ax, 0x20
	mov di,[i] ; index is word
	mov bx, [sin64+di]
	mov bh,0 ; forcetype clear high bit
	add  ax,bx; bop
	mov [c], ax
	; LineNumber: 117
	mov ax, [i]
	mov [Screen_color], al
	mov ax, [c]
	xor dx,dx
	mov bx, 0x2
	div  bx
	mov [Screen_red], al
	mov ax, [c]
	xor dx,dx
	mov bx, 0x4
	div  bx
	mov [Screen_green], al
	; RHS is pure optimization
	mov ax, 0x3f
	; Forcetype IS POINTER: 0
	sub  ax, [c]
	mov [Screen_blue], al
	call Screen_SetColor
	; LineNumber: 118
	; RHS is pure optimization
	mov ax, 0x40
	; Forcetype IS POINTER: 0
	add  ax, [i]
	mov [Screen_color], al
	; Generic add/sub
	mov ax, 0x4
	mov bx, [i]
	xor dx,dx
	mov cx, 0x2
	push ax
	mov ax,bx
	div  cx
	mov bx,ax
	pop ax
	add  ax,bx; bop
	mov [Screen_red], al
	; Generic add/sub
	mov ax, 0x4
	mov bx, [i]
	xor dx,dx
	push ax
	mov ax,bx
	div  cx
	mov bx,ax
	pop ax
	add  ax,bx; bop
	mov [Screen_green], al
	; Generic add/sub
	mov ax, 0x4
	mov bx, [i]
	xor dx,dx
	push ax
	mov ax,bx
	div  cx
	mov bx,ax
	pop ax
	add  ax,bx; bop
	mov [Screen_blue], al
	call Screen_SetColor
	; LineNumber: 119
	; RHS is pure optimization
	mov ax, 0x80
	; Forcetype IS POINTER: 0
	add  ax, [i]
	mov [Screen_color], al
	mov ax, [i]
	xor dx,dx
	mov bx, 0x2
	div  bx
	mov [Screen_red], al
	mov ax, [i]
	xor dx,dx
	mov bx, 0x3
	div  bx
	mov [Screen_green], al
	mov ax, [i]
	mov [Screen_blue], al
	call Screen_SetColor
	; LineNumber: 120
SetPalette_loopstart267:
	add [i],word 1
	mov ax, 0x40
	cmp ax,word [i]
	jne SetPalette_forloop266
SetPalette_loopend268:
	; LineNumber: 121
	mov [Screen_color], byte 0x0
	mov [Screen_red], byte 0x4
	mov [Screen_green], byte 0x4
	mov [Screen_blue], byte 0x4
	call Screen_SetColor
	; LineNumber: 128
	mov [i], word 0x1
SetPalette_forloop271:
	; LineNumber: 123
	; LineNumber: 125
	mov ax, [i]
	mov [Screen_color], al
	; Generic add/sub
	mov ax, 0x8
	mov bx, [i]
	mov cx, 0x2
	push ax
	mov ax,bx
	mul  cx
	mov bx,ax
	pop ax
	add  ax,bx; bop
	mov [Screen_red], al
	; Generic add/sub
	mov ax, 0x8
	mov bx, [i]
	push ax
	mov ax,bx
	mul  cx
	mov bx,ax
	pop ax
	add  ax,bx; bop
	mov [Screen_green], al
	; Generic add/sub
	mov ax, 0x8
	mov bx, [i]
	mov cx, 0x4
	push ax
	mov ax,bx
	mul  cx
	mov bx,ax
	pop ax
	add  ax,bx; bop
	mov [Screen_blue], al
	call Screen_SetColor
	; LineNumber: 126
	; RHS is pure optimization
	mov ax, [i]
	; Forcetype IS POINTER: 0
	add  ax, 0x10
	mov [Screen_color], al
	; Generic add/sub
	mov ax, 0x8
	mov bx, [i]
	mov cx, 0x2
	push ax
	mov ax,bx
	mul  cx
	mov bx,ax
	pop ax
	add  ax,bx; bop
	mov [Screen_red], al
	; Generic add/sub
	mov ax, 0x8
	mov bx, [i]
	mov cx, 0x1
	push ax
	mov ax,bx
	mul  cx
	mov bx,ax
	pop ax
	add  ax,bx; bop
	mov [Screen_green], al
	; Generic add/sub
	mov ax, 0x8
	mov bx, [i]
	push ax
	mov ax,bx
	mul  cx
	mov bx,ax
	pop ax
	add  ax,bx; bop
	mov [Screen_blue], al
	call Screen_SetColor
	; LineNumber: 127
SetPalette_loopstart272:
	add [i],word 1
	mov ax, 0x10
	cmp ax,word [i]
	jne SetPalette_forloop271
SetPalette_loopend273:
	; LineNumber: 128
	jmp SetPalette_caseend251
SetPalette_casenext264:
	mov ax, [pal]
	mov bx, 0x2
	cmp ax,bx
	jne SetPalette_casenext276
	; LineNumber: 129
	; LineNumber: 139
	mov [i], word 0x0
SetPalette_forloop278:
	; LineNumber: 132
	; LineNumber: 133
	; Generic add/sub
	mov ax, 0x20
	mov di,[i] ; index is word
	mov bx, [sin64+di]
	mov bh,0 ; forcetype clear high bit
	add  ax,bx; bop
	mov [c], ax
	; LineNumber: 134
	mov ax, [i]
	mov [Screen_color], al
	; Generic add/sub
	mov ax, 0x2
	mov bx, [i]
	xor dx,dx
	mov cx, 0x2
	push ax
	mov ax,bx
	div  cx
	mov bx,ax
	pop ax
	add  ax,bx; bop
	mov [Screen_red], al
	; Generic add/sub
	mov ax, 0x2
	mov bx, [i]
	xor dx,dx
	push ax
	mov ax,bx
	div  cx
	mov bx,ax
	pop ax
	add  ax,bx; bop
	mov [Screen_green], al
	; Generic add/sub
	mov ax, 0x2
	mov bx, [i]
	xor dx,dx
	push ax
	mov ax,bx
	div  cx
	mov bx,ax
	pop ax
	add  ax,bx; bop
	mov [Screen_blue], al
	call Screen_SetColor
	; LineNumber: 135
	; RHS is pure optimization
	mov ax, 0x40
	; Forcetype IS POINTER: 0
	add  ax, [i]
	mov [Screen_color], al
	mov ax, [i]
	xor dx,dx
	mov bx, 0x4
	div  bx
	mov [Screen_red], al
	mov ax, [i]
	xor dx,dx
	mov bx, 0x2
	div  bx
	mov [Screen_green], al
	mov ax, [i]
	xor dx,dx
	mov bx, 0x4
	div  bx
	mov [Screen_blue], al
	call Screen_SetColor
	; LineNumber: 136
	; RHS is pure optimization
	mov ax, 0x80
	; Forcetype IS POINTER: 0
	add  ax, [i]
	mov [Screen_color], al
	mov ax, [i]
	xor dx,dx
	mov bx, 0x4
	div  bx
	mov [Screen_red], al
	mov [Screen_green], byte 0x0
	; Generic add/sub
	mov ax, 0x10
	mov bx, [i]
	xor dx,dx
	mov cx, 0x8
	push ax
	mov ax,bx
	div  cx
	mov bx,ax
	pop ax
	sub  ax,bx; bop
	mov [Screen_blue], al
	call Screen_SetColor
	; LineNumber: 137
	; RHS is pure optimization
	mov ax, 0xc0
	; Forcetype IS POINTER: 0
	add  ax, [i]
	mov [Screen_color], al
	mov ax, [i]
	xor dx,dx
	mov bx, 0x2
	div  bx
	mov [Screen_red], al
	mov ax, [i]
	xor dx,dx
	div  bx
	mov [Screen_green], al
	mov [Screen_blue], byte 0x0
	call Screen_SetColor
	; LineNumber: 138
SetPalette_loopstart279:
	add [i],word 1
	mov ax, 0x40
	cmp ax,word [i]
	jne SetPalette_forloop278
SetPalette_loopend280:
	; LineNumber: 139
	jmp SetPalette_caseend251
SetPalette_casenext276:
	mov ax, [pal]
	mov bx, 0x3
	cmp ax,bx
	jne SetPalette_casenext283
	; LineNumber: 140
	; LineNumber: 150
	mov [i], word 0x0
SetPalette_forloop285:
	; LineNumber: 143
	; LineNumber: 144
	; Generic add/sub
	mov ax, 0x20
	mov di,[i] ; index is word
	mov bx, [sin64+di]
	mov bh,0 ; forcetype clear high bit
	add  ax,bx; bop
	mov [c], ax
	; LineNumber: 145
	mov ax, [i]
	mov [Screen_color], al
	; Generic add/sub
	mov ax, 0x4
	mov bx, [i]
	mov cx, 0x2
	push ax
	mov ax,bx
	mul  cx
	mov bx,ax
	pop ax
	add  ax,bx; bop
	mov [Screen_red], al
	; Generic add/sub
	mov ax, 0x8
	mov bx, [i]
	mov cx, 0x3
	push ax
	mov ax,bx
	mul  cx
	mov bx,ax
	pop ax
	add  ax,bx; bop
	mov [Screen_green], al
	; Generic add/sub
	mov ax, 0x10
	mov bx, [i]
	mov cx, 0x4
	push ax
	mov ax,bx
	mul  cx
	mov bx,ax
	pop ax
	add  ax,bx; bop
	mov [Screen_blue], al
	call Screen_SetColor
	; LineNumber: 146
	; RHS is pure optimization
	mov ax, 0x40
	; Forcetype IS POINTER: 0
	add  ax, [i]
	mov [Screen_color], al
	mov ax, [i]
	xor dx,dx
	mov bx, 0x4
	div  bx
	mov [Screen_red], al
	mov ax, [i]
	xor dx,dx
	mov bx, 0x2
	div  bx
	mov [Screen_green], al
	mov ax, [i]
	xor dx,dx
	mov bx, 0x4
	div  bx
	mov [Screen_blue], al
	call Screen_SetColor
	; LineNumber: 147
	; RHS is pure optimization
	mov ax, 0x80
	; Forcetype IS POINTER: 0
	add  ax, [i]
	mov [Screen_color], al
	mov ax, [i]
	xor dx,dx
	mov bx, 0x4
	div  bx
	mov [Screen_red], al
	mov [Screen_green], byte 0x0
	; Generic add/sub
	mov ax, 0x10
	mov bx, [i]
	xor dx,dx
	mov cx, 0x8
	push ax
	mov ax,bx
	div  cx
	mov bx,ax
	pop ax
	sub  ax,bx; bop
	mov [Screen_blue], al
	call Screen_SetColor
	; LineNumber: 148
	; RHS is pure optimization
	mov ax, 0xc0
	; Forcetype IS POINTER: 0
	add  ax, [i]
	mov [Screen_color], al
	mov ax, [i]
	xor dx,dx
	mov bx, 0x2
	div  bx
	mov [Screen_red], al
	mov ax, [i]
	xor dx,dx
	div  bx
	mov [Screen_green], al
	mov [Screen_blue], byte 0x0
	call Screen_SetColor
	; LineNumber: 149
SetPalette_loopstart286:
	add [i],word 1
	mov ax, 0x40
	cmp ax,word [i]
	jne SetPalette_forloop285
SetPalette_loopend287:
	; LineNumber: 150
	mov [Screen_color], byte 0x0
	mov [Screen_red], byte 0x2
	mov [Screen_green], byte 0x2
	mov [Screen_blue], byte 0x2
	call Screen_SetColor
	; LineNumber: 151
SetPalette_casenext283:
SetPalette_caseend251:
	; LineNumber: 153
	ret
end_procedure_SetPalette:
	; ***********  Defining procedure : DrawPalette
	;    Procedure type : User-defined procedure
	; LineNumber: 156
DrawPalette:
	; LineNumber: 160
	mov [i], word 0x0
DrawPalette_forloop291:
	; LineNumber: 158
	; LineNumber: 159
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
	; LineNumber: 160
DrawPalette_loopstart292:
	add [i],word 1
	mov ax, 0x100
	cmp ax,word [i]
	jne DrawPalette_forloop291
DrawPalette_loopend293:
	; LineNumber: 161
	ret
end_procedure_DrawPalette:
	; ***********  Defining procedure : VFXSpriteDraw
	;    Procedure type : User-defined procedure
	; LineNumber: 164
	; LineNumber: 163
	; LineNumber: 163
	; LineNumber: 163
	; LineNumber: 163
	; LineNumber: 163
	; LineNumber: 163
	; LineNumber: 163
bank: dw  0,0
VFXSpriteDraw_block296:
VFXSpriteDraw:
	; LineNumber: 169
	mov [i], word 0x0
VFXSpriteDraw_forloop297:
	; LineNumber: 166
	; LineNumber: 167
	; Assigning pointer
	; Setting PURE POINTER 0
	; RHS is NOT pointer, only updating DI since LHS is pure
	; RHS is pure optimization
	; RHS is pure optimization
	mov ax, [y1]
	; Forcetype IS POINTER: 0
	add  ax, [i]
	mov bx, 0x140
	mul  bx
	; Forcetype IS POINTER: 0
	add  ax, [x1]
	les di, [bank]
	add  di,ax ; generic binop when rhs is NOT pointer
	; Setting PURE POINTER ends
	mov [Memory_source+2], es
	mov [Memory_source], di
	; Assigning pointer
	; Setting PURE POINTER 0
	; RHS is NOT pointer, only updating DI since LHS is pure
	; RHS is pure optimization
	; RHS is pure optimization
	mov ax, [y2]
	; Forcetype IS POINTER: 0
	add  ax, [i]
	mul  bx
	; Forcetype IS POINTER: 0
	add  ax, [x2]
	les di, [Screen_buffer1]
	add  di,ax ; generic binop when rhs is NOT pointer
	; Setting PURE POINTER ends
	mov [Memory_dest+2], es
	mov [Memory_dest], di
	mov ax, [w]
	xor dx,dx
	mov bx, 0x2
	div  bx
	mov [Memory_i1], ax
	call Memory_CopyData16
	; LineNumber: 168
VFXSpriteDraw_loopstart298:
	add [i],word 1
	mov ax, [h]
	cmp ax,word [i]
	jne VFXSpriteDraw_forloop297
VFXSpriteDraw_loopend299:
	; LineNumber: 169
	ret
end_procedure_VFXSpriteDraw:
	; ***********  Defining procedure : P1XLogoDraw
	;    Procedure type : User-defined procedure
	; LineNumber: 172
	; LineNumber: 171
logo_color:	db	0
P1XLogoDraw_block302:
P1XLogoDraw:
	; LineNumber: 173
	mov [x], word 0x78
	; LineNumber: 174
	mov [y], word 0x28
	; LineNumber: 176
	mov ax, [x]
	mov [Gfx_x1], ax
	mov ax, [y]
	mov [Gfx_y1], ax
	; RHS is pure optimization
	mov ax, [x]
	; Forcetype IS POINTER: 0
	add  ax, 0x5
	mov [Gfx_x2], ax
	; RHS is pure optimization
	mov ax, [y]
	; Forcetype IS POINTER: 0
	add  ax, 0x64
	mov [Gfx_y2], ax
	mov ax, [logo_color]
	mov ah,0 ; forcetype clear high bit
	mov [Gfx_color], ax
	; Assigning pointer
	les di, [Screen_buffer1]
	mov [Gfx_addr+2], es
	mov [Gfx_addr], di
	call Gfx_DrawSquare
	; LineNumber: 177
	; RHS is pure optimization
	mov ax, [x]
	; Forcetype IS POINTER: 0
	add  ax, 0x5
	mov [Gfx_x1], ax
	mov ax, [y]
	mov [Gfx_y1], ax
	; RHS is pure optimization
	mov ax, [x]
	; Forcetype IS POINTER: 0
	add  ax, 0x19
	mov [Gfx_x2], ax
	; RHS is pure optimization
	mov ax, [y]
	; Forcetype IS POINTER: 0
	add  ax, 0x5
	mov [Gfx_y2], ax
	mov ax, [logo_color]
	mov ah,0 ; forcetype clear high bit
	mov [Gfx_color], ax
	; Assigning pointer
	les di, [Screen_buffer1]
	mov [Gfx_addr+2], es
	mov [Gfx_addr], di
	call Gfx_DrawSquare
	; LineNumber: 178
	; RHS is pure optimization
	mov ax, [x]
	; Forcetype IS POINTER: 0
	add  ax, 0x5
	mov [Gfx_x1], ax
	; RHS is pure optimization
	mov ax, [y]
	; Forcetype IS POINTER: 0
	add  ax, 0x37
	mov [Gfx_y1], ax
	; RHS is pure optimization
	mov ax, [x]
	; Forcetype IS POINTER: 0
	add  ax, 0x19
	mov [Gfx_x2], ax
	; RHS is pure optimization
	mov ax, [y]
	; Forcetype IS POINTER: 0
	add  ax, 0x3c
	mov [Gfx_y2], ax
	mov ax, [logo_color]
	mov ah,0 ; forcetype clear high bit
	mov [Gfx_color], ax
	; Assigning pointer
	les di, [Screen_buffer1]
	mov [Gfx_addr+2], es
	mov [Gfx_addr], di
	call Gfx_DrawSquare
	; LineNumber: 179
	; RHS is pure optimization
	mov ax, [x]
	; Forcetype IS POINTER: 0
	add  ax, 0x19
	mov [Gfx_x1], ax
	mov ax, [y]
	mov [Gfx_y1], ax
	; RHS is pure optimization
	mov ax, [x]
	; Forcetype IS POINTER: 0
	add  ax, 0x1e
	mov [Gfx_x2], ax
	; RHS is pure optimization
	mov ax, [y]
	; Forcetype IS POINTER: 0
	add  ax, 0x3c
	mov [Gfx_y2], ax
	mov ax, [logo_color]
	mov ah,0 ; forcetype clear high bit
	mov [Gfx_color], ax
	; Assigning pointer
	les di, [Screen_buffer1]
	mov [Gfx_addr+2], es
	mov [Gfx_addr], di
	call Gfx_DrawSquare
	; LineNumber: 181
	; RHS is pure optimization
	mov ax, [x]
	; Forcetype IS POINTER: 0
	add  ax, 0x28
	mov [Gfx_x1], ax
	mov ax, [y]
	mov [Gfx_y1], ax
	; RHS is pure optimization
	mov ax, [x]
	; Forcetype IS POINTER: 0
	add  ax, 0x2d
	mov [Gfx_x2], ax
	; RHS is pure optimization
	mov ax, [y]
	; Forcetype IS POINTER: 0
	add  ax, 0x64
	mov [Gfx_y2], ax
	mov ax, [logo_color]
	mov ah,0 ; forcetype clear high bit
	mov [Gfx_color], ax
	; Assigning pointer
	les di, [Screen_buffer1]
	mov [Gfx_addr+2], es
	mov [Gfx_addr], di
	call Gfx_DrawSquare
	; LineNumber: 182
	; RHS is pure optimization
	mov ax, [x]
	; Forcetype IS POINTER: 0
	add  ax, 0x23
	mov [Gfx_x1], ax
	; RHS is pure optimization
	mov ax, [y]
	; Forcetype IS POINTER: 0
	add  ax, 0x5
	mov [Gfx_y1], ax
	; RHS is pure optimization
	mov ax, [x]
	; Forcetype IS POINTER: 0
	add  ax, 0x28
	mov [Gfx_x2], ax
	; RHS is pure optimization
	mov ax, [y]
	; Forcetype IS POINTER: 0
	add  ax, 0xa
	mov [Gfx_y2], ax
	mov ax, [logo_color]
	mov ah,0 ; forcetype clear high bit
	mov [Gfx_color], ax
	; Assigning pointer
	les di, [Screen_buffer1]
	mov [Gfx_addr+2], es
	mov [Gfx_addr], di
	call Gfx_DrawSquare
	; LineNumber: 184
	; RHS is pure optimization
	mov ax, [x]
	; Forcetype IS POINTER: 0
	add  ax, 0x37
	mov [Gfx_x1], ax
	mov ax, [y]
	mov [Gfx_y1], ax
	; RHS is pure optimization
	mov ax, [x]
	; Forcetype IS POINTER: 0
	add  ax, 0x3c
	mov [Gfx_x2], ax
	; RHS is pure optimization
	mov ax, [y]
	; Forcetype IS POINTER: 0
	add  ax, 0x28
	mov [Gfx_y2], ax
	mov ax, [logo_color]
	mov ah,0 ; forcetype clear high bit
	mov [Gfx_color], ax
	; Assigning pointer
	les di, [Screen_buffer1]
	mov [Gfx_addr+2], es
	mov [Gfx_addr], di
	call Gfx_DrawSquare
	; LineNumber: 185
	; RHS is pure optimization
	mov ax, [x]
	; Forcetype IS POINTER: 0
	add  ax, 0x4b
	mov [Gfx_x1], ax
	mov ax, [y]
	mov [Gfx_y1], ax
	; RHS is pure optimization
	mov ax, [x]
	; Forcetype IS POINTER: 0
	add  ax, 0x50
	mov [Gfx_x2], ax
	; RHS is pure optimization
	mov ax, [y]
	; Forcetype IS POINTER: 0
	add  ax, 0x28
	mov [Gfx_y2], ax
	mov ax, [logo_color]
	mov ah,0 ; forcetype clear high bit
	mov [Gfx_color], ax
	; Assigning pointer
	les di, [Screen_buffer1]
	mov [Gfx_addr+2], es
	mov [Gfx_addr], di
	call Gfx_DrawSquare
	; LineNumber: 186
	; RHS is pure optimization
	mov ax, [x]
	; Forcetype IS POINTER: 0
	add  ax, 0x37
	mov [Gfx_x1], ax
	; RHS is pure optimization
	mov ax, [y]
	; Forcetype IS POINTER: 0
	add  ax, 0x37
	mov [Gfx_y1], ax
	; RHS is pure optimization
	mov ax, [x]
	; Forcetype IS POINTER: 0
	add  ax, 0x3c
	mov [Gfx_x2], ax
	; RHS is pure optimization
	mov ax, [y]
	; Forcetype IS POINTER: 0
	add  ax, 0x64
	mov [Gfx_y2], ax
	mov ax, [logo_color]
	mov ah,0 ; forcetype clear high bit
	mov [Gfx_color], ax
	; Assigning pointer
	les di, [Screen_buffer1]
	mov [Gfx_addr+2], es
	mov [Gfx_addr], di
	call Gfx_DrawSquare
	; LineNumber: 187
	; RHS is pure optimization
	mov ax, [x]
	; Forcetype IS POINTER: 0
	add  ax, 0x4b
	mov [Gfx_x1], ax
	; RHS is pure optimization
	mov ax, [y]
	; Forcetype IS POINTER: 0
	add  ax, 0x37
	mov [Gfx_y1], ax
	; RHS is pure optimization
	mov ax, [x]
	; Forcetype IS POINTER: 0
	add  ax, 0x50
	mov [Gfx_x2], ax
	; RHS is pure optimization
	mov ax, [y]
	; Forcetype IS POINTER: 0
	add  ax, 0x64
	mov [Gfx_y2], ax
	mov ax, [logo_color]
	mov ah,0 ; forcetype clear high bit
	mov [Gfx_color], ax
	; Assigning pointer
	les di, [Screen_buffer1]
	mov [Gfx_addr+2], es
	mov [Gfx_addr], di
	call Gfx_DrawSquare
	; LineNumber: 189
	; RHS is pure optimization
	mov ax, [x]
	; Forcetype IS POINTER: 0
	add  ax, 0x3c
	mov [Gfx_x1], ax
	; RHS is pure optimization
	mov ax, [y]
	; Forcetype IS POINTER: 0
	add  ax, 0x28
	mov [Gfx_y1], ax
	; RHS is pure optimization
	mov ax, [x]
	; Forcetype IS POINTER: 0
	add  ax, 0x41
	mov [Gfx_x2], ax
	; RHS is pure optimization
	mov ax, [y]
	; Forcetype IS POINTER: 0
	add  ax, 0x2d
	mov [Gfx_y2], ax
	mov ax, [logo_color]
	mov ah,0 ; forcetype clear high bit
	mov [Gfx_color], ax
	; Assigning pointer
	les di, [Screen_buffer1]
	mov [Gfx_addr+2], es
	mov [Gfx_addr], di
	call Gfx_DrawSquare
	; LineNumber: 190
	; RHS is pure optimization
	mov ax, [x]
	; Forcetype IS POINTER: 0
	add  ax, 0x3c
	mov [Gfx_x1], ax
	; RHS is pure optimization
	mov ax, [y]
	; Forcetype IS POINTER: 0
	add  ax, 0x32
	mov [Gfx_y1], ax
	; RHS is pure optimization
	mov ax, [x]
	; Forcetype IS POINTER: 0
	add  ax, 0x41
	mov [Gfx_x2], ax
	; RHS is pure optimization
	mov ax, [y]
	; Forcetype IS POINTER: 0
	add  ax, 0x37
	mov [Gfx_y2], ax
	mov ax, [logo_color]
	mov ah,0 ; forcetype clear high bit
	mov [Gfx_color], ax
	; Assigning pointer
	les di, [Screen_buffer1]
	mov [Gfx_addr+2], es
	mov [Gfx_addr], di
	call Gfx_DrawSquare
	; LineNumber: 191
	; RHS is pure optimization
	mov ax, [x]
	; Forcetype IS POINTER: 0
	add  ax, 0x46
	mov [Gfx_x1], ax
	; RHS is pure optimization
	mov ax, [y]
	; Forcetype IS POINTER: 0
	add  ax, 0x28
	mov [Gfx_y1], ax
	; RHS is pure optimization
	mov ax, [x]
	; Forcetype IS POINTER: 0
	add  ax, 0x4b
	mov [Gfx_x2], ax
	; RHS is pure optimization
	mov ax, [y]
	; Forcetype IS POINTER: 0
	add  ax, 0x2d
	mov [Gfx_y2], ax
	mov ax, [logo_color]
	mov ah,0 ; forcetype clear high bit
	mov [Gfx_color], ax
	; Assigning pointer
	les di, [Screen_buffer1]
	mov [Gfx_addr+2], es
	mov [Gfx_addr], di
	call Gfx_DrawSquare
	; LineNumber: 192
	; RHS is pure optimization
	mov ax, [x]
	; Forcetype IS POINTER: 0
	add  ax, 0x46
	mov [Gfx_x1], ax
	; RHS is pure optimization
	mov ax, [y]
	; Forcetype IS POINTER: 0
	add  ax, 0x32
	mov [Gfx_y1], ax
	; RHS is pure optimization
	mov ax, [x]
	; Forcetype IS POINTER: 0
	add  ax, 0x4b
	mov [Gfx_x2], ax
	; RHS is pure optimization
	mov ax, [y]
	; Forcetype IS POINTER: 0
	add  ax, 0x37
	mov [Gfx_y2], ax
	mov ax, [logo_color]
	mov ah,0 ; forcetype clear high bit
	mov [Gfx_color], ax
	; Assigning pointer
	les di, [Screen_buffer1]
	mov [Gfx_addr+2], es
	mov [Gfx_addr], di
	call Gfx_DrawSquare
	; LineNumber: 193
	; RHS is pure optimization
	mov ax, [x]
	; Forcetype IS POINTER: 0
	add  ax, 0x41
	mov [Gfx_x1], ax
	; RHS is pure optimization
	mov ax, [y]
	; Forcetype IS POINTER: 0
	add  ax, 0x2d
	mov [Gfx_y1], ax
	; RHS is pure optimization
	mov ax, [x]
	; Forcetype IS POINTER: 0
	add  ax, 0x46
	mov [Gfx_x2], ax
	; RHS is pure optimization
	mov ax, [y]
	; Forcetype IS POINTER: 0
	add  ax, 0x32
	mov [Gfx_y2], ax
	mov ax, [logo_color]
	mov ah,0 ; forcetype clear high bit
	mov [Gfx_color], ax
	; Assigning pointer
	les di, [Screen_buffer1]
	mov [Gfx_addr+2], es
	mov [Gfx_addr], di
	call Gfx_DrawSquare
	; LineNumber: 194
	ret
end_procedure_P1XLogoDraw:
	; ***********  Defining procedure : VfxRenderStars
	;    Procedure type : User-defined procedure
	; LineNumber: 197
VfxRenderStars:
	; LineNumber: 216
	mov [i], word 0x0
VfxRenderStars_forloop304:
	; LineNumber: 199
	; LineNumber: 200
	;Is array index
	; Assign value to regular array
	; Generic add/sub
	mov di,[i] ; index is word
	shl di,1 ; Accomodate for word
	mov ax, [stars_particle_type_particle_type_z+di]
	mov di,[i] ; index is word
	shl di,1 ; Accomodate for word
	mov bx, [stars_particle_type_particle_type_speed+di]
	sub  ax,bx; bop
	mov di,[i] ; index is word
	shl di,1
	mov [stars_particle_type_particle_type_z+di], ax
	; LineNumber: 201
	; Binary clause Simplified: LESSEQUAL
	; Compare with pure num / var optimization
	mov di,[i] ; index is word
	shl di,1 ; Accomodate for word
	mov ax, [stars_particle_type_particle_type_z+di]
	cmp ax,0x0
	jg VfxRenderStars_elsedoneblock327
VfxRenderStars_ConditionalTrueBlock325: ;Main true block ;keep :
	; LineNumber: 200
	;Is array index
	; Assign value to regular array
	mov ax, 0xff
	mov di,[i] ; index is word
	shl di,1
	mov [stars_particle_type_particle_type_z+di], ax
VfxRenderStars_elsedoneblock327:
	; LineNumber: 203
	; RHS is pure optimization
	mov di,[i] ; index is word
	shl di,1 ; Accomodate for word
	mov ax, [stars_particle_type_particle_type_x+di]
	; Forcetype IS POINTER: 0
	add  ax, 0x1388
	mov [sx], ax
	; LineNumber: 204
	; RHS is pure optimization
	mov di,[i] ; index is word
	shl di,1 ; Accomodate for word
	mov ax, [stars_particle_type_particle_type_y+di]
	; Forcetype IS POINTER: 0
	add  ax, 0x1388
	mov [sy], ax
	; LineNumber: 205
	mov di,[i] ; index is word
	shl di,1 ; Accomodate for word
	mov ax, [stars_particle_type_particle_type_z+di]
	mov [sz], ax
	; LineNumber: 206
	; RHS is pure optimization
	mov ax, [sx]
	xor dx,dx
	cwd
	mov bx, [sz]
	idiv  bx
	; Forcetype IS POINTER: 0
	add  ax, 0xa0
	mov [x], ax
	; LineNumber: 207
	; RHS is pure optimization
	mov ax, [sy]
	xor dx,dx
	cwd
	idiv  bx
	; Forcetype IS POINTER: 0
	add  ax, 0x64
	mov [y], ax
	; LineNumber: 209
	; Generic add/sub
	mov ax, 0x7f
	mov di,[sz] ; index is word
	mov bx, [stars_colors+di]
	mov bh,0 ; forcetype clear high bit
	sub  ax,bx; bop
	mov [color], ax
	; LineNumber: 211
	; Binary clause Simplified: GREATER
	; Compare with pure num / var optimization
	cmp [x],word 0x0
	jbe VfxRenderStars_elsedoneblock333
VfxRenderStars_localsuccess335: ;keep:
	; ; logical AND, second requirement
	; Binary clause Simplified: LESS
	; Compare with pure num / var optimization
	cmp [x],word 0x140
	jae VfxRenderStars_elsedoneblock333
VfxRenderStars_localsuccess336: ;keep:
	; ; logical AND, second requirement
	; Binary clause Simplified: GREATER
	; Compare with pure num / var optimization
	cmp [y],word 0x0
	jbe VfxRenderStars_elsedoneblock333
VfxRenderStars_localsuccess337: ;keep:
	; ; logical AND, second requirement
	; Binary clause Simplified: LESS
	; Compare with pure num / var optimization
	cmp [y],word 0xc8
	jae VfxRenderStars_elsedoneblock333
VfxRenderStars_ConditionalTrueBlock331: ;Main true block ;keep :
	; LineNumber: 212
	; LineNumber: 213
	mov ax, [x]
	mov [Gfx_x1], ax
	mov ax, [y]
	mov [Gfx_y], ax
	mov ax, [color]
	mov [Gfx_color], ax
	; Assigning pointer
	les di, [Screen_buffer1]
	mov [Gfx_buffer+2], es
	mov [Gfx_buffer], di
	call Gfx_PutPixel
	; LineNumber: 214
VfxRenderStars_elsedoneblock333:
VfxRenderStars_loopstart305:
	add [i],word 1
	mov ax, 0x12c
	cmp ax,word [i]
	jne VfxRenderStars_forloop304
VfxRenderStars_loopend306:
	; LineNumber: 216
	ret
end_procedure_VfxRenderStars:
	; ***********  Defining procedure : SceneIntroRender
	;    Procedure type : User-defined procedure
	; LineNumber: 219
SceneIntroRender:
	; LineNumber: 220
	call VfxRenderStars
	; LineNumber: 221
	; Binary clause Simplified: GREATER
	; Compare with pure num / var optimization
	cmp [scene_time],word 0x12c
	jbe SceneIntroRender_elseblock342
SceneIntroRender_ConditionalTrueBlock341: ;Main true block ;keep :
	; LineNumber: 222
	; LineNumber: 223
	; Binary clause Simplified: GREATEREQUAL
	; Compare with pure num / var optimization
	cmp [scene_intro_color],byte 0x2
	jb SceneIntroRender_elsedoneblock363
SceneIntroRender_ConditionalTrueBlock361: ;Main true block ;keep :
	; LineNumber: 222
	; 'a:=a + const'  optimization 
	sub [scene_intro_color], byte 0x2
SceneIntroRender_elsedoneblock363:
	; LineNumber: 225
	jmp SceneIntroRender_elsedoneblock343
SceneIntroRender_elseblock342:
	; LineNumber: 226
	; LineNumber: 227
	; Binary clause Simplified: GREATER
	; Compare with pure num / var optimization
	cmp [scene_time],word 0xb4
	jbe SceneIntroRender_elsedoneblock370
SceneIntroRender_localsuccess372: ;keep:
	; ; logical AND, second requirement
	; Binary clause Simplified: LESS
	; Compare with pure num / var optimization
	cmp [scene_intro_color],byte 0x3f
	jae SceneIntroRender_elsedoneblock370
SceneIntroRender_ConditionalTrueBlock368: ;Main true block ;keep :
	; LineNumber: 226
	; 'a:=a + const'  optimization 
	add [scene_intro_color], byte 0x1
SceneIntroRender_elsedoneblock370:
	; LineNumber: 228
SceneIntroRender_elsedoneblock343:
	; LineNumber: 230
	; Binary clause Simplified: GREATER
	; Compare with pure num / var optimization
	cmp [scene_time],word 0x96
	jbe SceneIntroRender_elseblock376
SceneIntroRender_ConditionalTrueBlock375: ;Main true block ;keep :
	; LineNumber: 231
	; LineNumber: 232
	; Binary clause Simplified: GREATER
	; Compare with pure num / var optimization
	cmp [scene_intro_bar_size],byte 0x0
	jbe SceneIntroRender_elsedoneblock396
SceneIntroRender_ConditionalTrueBlock394: ;Main true block ;keep :
	; LineNumber: 231
	; 'a:=a + const'  optimization 
	sub [scene_intro_bar_size], byte 0x1
SceneIntroRender_elsedoneblock396:
	; LineNumber: 234
	jmp SceneIntroRender_elsedoneblock377
SceneIntroRender_elseblock376:
	; LineNumber: 235
	; LineNumber: 236
	; Binary clause Simplified: LESS
	; Compare with pure num / var optimization
	cmp [scene_intro_bar_size],byte 0x20
	jae SceneIntroRender_elsedoneblock403
SceneIntroRender_ConditionalTrueBlock401: ;Main true block ;keep :
	; LineNumber: 235
	; 'a:=a + const'  optimization 
	add [scene_intro_bar_size], byte 0x1
SceneIntroRender_elsedoneblock403:
	; LineNumber: 237
SceneIntroRender_elsedoneblock377:
	; LineNumber: 239
	; Binary clause Simplified: GREATER
	; Compare with pure num / var optimization
	cmp [scene_intro_color],byte 0x1
	jbe SceneIntroRender_elsedoneblock409
SceneIntroRender_ConditionalTrueBlock407: ;Main true block ;keep :
	; LineNumber: 240
	; LineNumber: 241
	; RHS is pure optimization
	mov al, [scene_intro_color]
	; Forcetype IS POINTER: 0
	add  al, 0x40
	mov [logo_color], al
	call P1XLogoDraw
	; LineNumber: 242
SceneIntroRender_elsedoneblock409:
	; LineNumber: 244
	mov ax, 0xff
	mov bx,ax
	mov ax, [scene_time]
	xor dx,dx
	div bx
	mov ax,dx
	mov di,ax
	mov ax, [sin32+di]
	mov ah,0 ; forcetype clear high bit
	mov [y], ax
	; LineNumber: 245
	; Binary clause Simplified: GREATER
	; Compare with pure num / var optimization
	cmp [scene_intro_bar_size],byte 0x0
	jbe SceneIntroRender_elsedoneblock415
SceneIntroRender_ConditionalTrueBlock413: ;Main true block ;keep :
	; LineNumber: 246
	; LineNumber: 258
	mov [j], word 0x0
SceneIntroRender_forloop467:
	; LineNumber: 248
	; LineNumber: 249
	mov ax, 0x40
	mov bx,ax
	; RHS is pure optimization
	mov ax, [scene_time]
	; Forcetype IS POINTER: 0
	add  ax, [j]
	xor dx,dx
	div bx
	mov ax,dx
	mov di,ax
	mov ax, [sin32+di]
	mov ah,0 ; forcetype clear high bit
	mov [y2], ax
	; LineNumber: 250
	mov [Gfx_x1], word 0x0
	mov [Gfx_x2], word 0x140
	; RHS is pure optimization
	; RHS is pure optimization
	mov ax, 0xa6
	; Forcetype IS POINTER: 0
	sub  ax, [y]
	; Forcetype IS POINTER: 0
	add  ax, [j]
	mov [Gfx_y], ax
	; RHS is pure optimization
	mov ax, 0x10
	; Forcetype IS POINTER: 0
	add  ax, [y2]
	mov [Gfx_color], ax
	; Assigning pointer
	les di, [Screen_buffer1]
	mov [Gfx_addr+2], es
	mov [Gfx_addr], di
	call Gfx_Hline
	; LineNumber: 251
	; Binary clause Simplified: GREATER
	; Compare with pure num / var optimization
	cmp [j],word 0x2
	jbe SceneIntroRender_elsedoneblock494
SceneIntroRender_localsuccess502: ;keep:
	; ; logical AND, second requirement
	; Binary clause Simplified: LESS
	; Compare with pure num / var optimization
	cmp [j],word 0x1d
	jae SceneIntroRender_elsedoneblock494
SceneIntroRender_ConditionalTrueBlock492: ;Main true block ;keep :
	; LineNumber: 252
	; LineNumber: 253
	mov [c], word 0x1
	; LineNumber: 254
	; Binary clause Simplified: GREATER
	; Compare with pure num / var optimization
	cmp [scene_intro_bar_size],byte 0x1f
	jbe SceneIntroRender_elsedoneblock507
SceneIntroRender_ConditionalTrueBlock505: ;Main true block ;keep :
	; LineNumber: 253
	mov [c], word 0x3f
SceneIntroRender_elsedoneblock507:
	; LineNumber: 255
	mov [Gfx_x1], word 0x9
	mov [Gfx_x2], word 0x137
	; RHS is pure optimization
	; RHS is pure optimization
	mov ax, 0xa6
	; Forcetype IS POINTER: 0
	sub  ax, [y]
	; Forcetype IS POINTER: 0
	add  ax, [j]
	mov [Gfx_y], ax
	mov ax, [c]
	mov [Gfx_color], ax
	; Assigning pointer
	les di, [Screen_buffer1]
	mov [Gfx_addr+2], es
	mov [Gfx_addr], di
	call Gfx_Hline
	; LineNumber: 256
SceneIntroRender_elsedoneblock494:
	; LineNumber: 257
SceneIntroRender_loopstart468:
	add [j],word 1
	mov ax, [scene_intro_bar_size]
	mov ah,0 ; forcetype clear high bit
	cmp ax,word [j]
	jne SceneIntroRender_forloop467
SceneIntroRender_loopend469:
	; LineNumber: 259
	; Binary clause Simplified: GREATER
	; Compare with pure num / var optimization
	cmp [scene_intro_bar_size],byte 0x1f
	jbe SceneIntroRender_elsedoneblock513
SceneIntroRender_ConditionalTrueBlock511: ;Main true block ;keep :
	; LineNumber: 260
	; LineNumber: 261
	; Assigning pointer
	les di, [tp]
	mov [Fonts_tp+2], es
	mov [Fonts_tp], di
	mov [Fonts_x], word 0xa
	; RHS is pure optimization
	mov ax, 0xaa
	; Forcetype IS POINTER: 0
	sub  ax, [y]
	mov [Fonts_y], ax
	; Assigning pointer
	les di, [Screen_buffer1]
	mov [Fonts_dst2+2], es
	mov [Fonts_dst2], di
	call Fonts_PrintString
	; LineNumber: 262
SceneIntroRender_elsedoneblock513:
	; LineNumber: 263
SceneIntroRender_elsedoneblock415:
	; LineNumber: 264
	ret
end_procedure_SceneIntroRender:
	; ***********  Defining procedure : SceneIntroReset
	;    Procedure type : User-defined procedure
	; LineNumber: 267
SceneIntroReset:
	; LineNumber: 275
	mov [i], word 0x0
SceneIntroReset_forloop517:
	; LineNumber: 269
	; LineNumber: 270
	;Is array index
	; Assign value to regular array
	; Generic add/sub
	mov ax, 0x2710
	mov bx, 0x4e20
	mov bx,ax
	call Random_Random
	xor dx,dx
	div bx
	mov ax,dx
	sub  ax,bx; bop
	mov di,[i] ; index is word
	shl di,1
	mov [stars_particle_type_particle_type_x+di], ax
	; LineNumber: 271
	;Is array index
	; Assign value to regular array
	; Generic add/sub
	mov ax, 0x2710
	mov bx, 0x4e20
	mov bx,ax
	call Random_Random
	xor dx,dx
	div bx
	mov ax,dx
	sub  ax,bx; bop
	mov di,[i] ; index is word
	shl di,1
	mov [stars_particle_type_particle_type_y+di], ax
	; LineNumber: 272
	;Is array index
	; Assign value to regular array
	; RHS is pure optimization
	mov ax, 0xff
	mov bx,ax
	call Random_Random
	xor dx,dx
	div bx
	mov ax,dx
	; Forcetype IS POINTER: 0
	add  ax, 0x1
	mov di,[i] ; index is word
	shl di,1
	mov [stars_particle_type_particle_type_z+di], ax
	; LineNumber: 273
	;Is array index
	; Assign value to regular array
	; Generic add/sub
	mov ax, 0x2
	mov bx, 0xc
	mov bx,ax
	call Random_Random
	xor dx,dx
	div bx
	mov ax,dx
	add  ax,bx; bop
	mov di,[i] ; index is word
	shl di,1
	mov [stars_particle_type_particle_type_speed+di], ax
	; LineNumber: 274
SceneIntroReset_loopstart518:
	add [i],word 1
	mov ax, 0x12c
	cmp ax,word [i]
	jne SceneIntroReset_forloop517
SceneIntroReset_loopend519:
	; LineNumber: 275
	; Assigning pointer
	lea si, [demo_name_text]
	mov [tp+2], ds
	mov [tp], si
	; LineNumber: 276
	mov [current_scene_len], word 0x1b3
	; LineNumber: 277
	mov [scene_intro_color], byte 0x0
	; LineNumber: 278
	mov [Fonts_writeType], word 0x0
	; LineNumber: 279
	ret
end_procedure_SceneIntroReset:
	; ***********  Defining procedure : SceneSpaceReset
	;    Procedure type : User-defined procedure
	; LineNumber: 282
SceneSpaceReset:
	; LineNumber: 283
	; Assigning pointer
	lea si, [powered_by_text]
	mov [tp+2], ds
	mov [tp], si
	; LineNumber: 284
	mov [current_scene_len], word 0x4b0
	; LineNumber: 285
	ret
end_procedure_SceneSpaceReset:
	; ***********  Defining procedure : SceneSpaceRender
	;    Procedure type : User-defined procedure
	; LineNumber: 288
SceneSpaceRender:
	; LineNumber: 289
	call VfxRenderStars
	; LineNumber: 291
	mov ax, 0xff
	mov bx,ax
	mov ax, [scene_time]
	xor dx,dx
	div bx
	mov ax,dx
	mov di,ax
	mov ax, [sin32+di]
	mov ah,0 ; forcetype clear high bit
	mov [shift], ax
	; LineNumber: 294
	
; // TODO: fly in from bottom of the screen
	mov di,0x02
	mov ax, [spr_ship_big_sprite_type_sprite_type_x+di]
	mov [x1], ax
	mov ax, [spr_ship_big_sprite_type_sprite_type_y+di]
	mov [y1], ax
	mov ax, [spr_ship_big_sprite_type_sprite_type_w+di]
	mov [w], ax
	mov ax, [spr_ship_big_sprite_type_sprite_type_h+di]
	mov [h], ax
	mov [x2], word 0x6e
	; RHS is pure optimization
	mov ax, 0x78
	; Forcetype IS POINTER: 0
	sub  ax, [shift]
	mov [y2], ax
	; Assigning pointer
	les di, [Screen_buffer2]
	mov [bank+2], es
	mov [bank], di
	call VFXSpriteDraw
	; LineNumber: 304
	
; // talking
	mov [x], word 0xa
	; LineNumber: 305
	mov [y], word 0x78
	; LineNumber: 306
	; Binary clause Simplified: EQUALS
	mov ax, 0x8
	mov bx,ax
	mov ax, [scene_time]
	xor dx,dx
	div bx
	mov ax,dx
	cmp  al, 0x0
	jne SceneSpaceRender_elsedoneblock527
SceneSpaceRender_ConditionalTrueBlock525: ;Main true block ;keep :
	; LineNumber: 305
	mov ax, 0x5
	mov bx,ax
	call Random_Random
	xor dx,dx
	div bx
	mov ax,dx
	mov [last_spr], al
SceneSpaceRender_elsedoneblock527:
	; LineNumber: 307
	; Binary clause Simplified: GREATER
	; Compare with pure num / var optimization
	cmp [scene_time],word 0xc8
	jbe SceneSpaceRender_elsedoneblock533
SceneSpaceRender_ConditionalTrueBlock531: ;Main true block ;keep :
	; LineNumber: 306
	; Assigning pointer
	lea si, [intel486_text]
	mov [tp+2], ds
	mov [tp], si
SceneSpaceRender_elsedoneblock533:
	; LineNumber: 309
	; RHS is pure optimization
	mov ax, [x]
	; Forcetype IS POINTER: 0
	sub  ax, 0x4
	mov [Gfx_x1], ax
	; RHS is pure optimization
	mov ax, [y]
	; Forcetype IS POINTER: 0
	sub  ax, 0x4
	mov [Gfx_y1], ax
	; RHS is pure optimization
	mov ax, [x]
	; Forcetype IS POINTER: 0
	add  ax, 0x2c
	mov [Gfx_x2], ax
	; RHS is pure optimization
	mov ax, [y]
	; Forcetype IS POINTER: 0
	add  ax, 0x2c
	mov [Gfx_y2], ax
	mov [Gfx_color], word 0x1c
	; Assigning pointer
	les di, [Screen_buffer1]
	mov [Gfx_addr+2], es
	mov [Gfx_addr], di
	call Gfx_DrawSquare
	; LineNumber: 310
	; RHS is pure optimization
	mov ax, [x]
	; Forcetype IS POINTER: 0
	sub  ax, 0x1
	mov [Gfx_x1], ax
	; RHS is pure optimization
	mov ax, [y]
	; Forcetype IS POINTER: 0
	sub  ax, 0x1
	mov [Gfx_y1], ax
	; RHS is pure optimization
	mov ax, [x]
	; Forcetype IS POINTER: 0
	add  ax, 0x29
	mov [Gfx_x2], ax
	; RHS is pure optimization
	mov ax, [y]
	; Forcetype IS POINTER: 0
	add  ax, 0x29
	mov [Gfx_y2], ax
	mov [Gfx_color], word 0x1f
	; Assigning pointer
	les di, [Screen_buffer1]
	mov [Gfx_addr+2], es
	mov [Gfx_addr], di
	call Gfx_DrawSquare
	; LineNumber: 311
	mov di,[last_spr] ; index is word
	mov cl,[last_spr]
	mov ch,0
	mov di,cx
	shl di,1 ; Accomodate for word
	mov ax, [spr_kkj_anim_sprite_type_sprite_type_x+di]
	mov [x1], ax
	mov di,[last_spr] ; index is word
	mov cl,[last_spr]
	mov ch,0
	mov di,cx
	shl di,1 ; Accomodate for word
	mov ax, [spr_kkj_anim_sprite_type_sprite_type_y+di]
	mov [y1], ax
	mov di,[last_spr] ; index is word
	mov cl,[last_spr]
	mov ch,0
	mov di,cx
	shl di,1 ; Accomodate for word
	mov ax, [spr_kkj_anim_sprite_type_sprite_type_w+di]
	mov [w], ax
	mov di,[last_spr] ; index is word
	mov cl,[last_spr]
	mov ch,0
	mov di,cx
	shl di,1 ; Accomodate for word
	mov ax, [spr_kkj_anim_sprite_type_sprite_type_h+di]
	mov [h], ax
	mov ax, [x]
	mov [x2], ax
	mov ax, [y]
	mov [y2], ax
	; Assigning pointer
	les di, [Screen_buffer2]
	mov [bank+2], es
	mov [bank], di
	call VFXSpriteDraw
	; LineNumber: 319
	; RHS is pure optimization
	mov ax, [x]
	; Forcetype IS POINTER: 0
	sub  ax, 0x4
	mov [Gfx_x1], ax
	; RHS is pure optimization
	mov ax, [y]
	; Forcetype IS POINTER: 0
	add  ax, 0x2c
	mov [Gfx_y1], ax
	; RHS is pure optimization
	mov ax, [x]
	; Forcetype IS POINTER: 0
	add  ax, 0x130
	mov [Gfx_x2], ax
	; RHS is pure optimization
	; RHS is pure optimization
	mov ax, [y]
	; Forcetype IS POINTER: 0
	add  ax, 0x1e
	; Forcetype IS POINTER: 0
	add  ax, 0x28
	mov [Gfx_y2], ax
	mov [Gfx_color], word 0x1c
	; Assigning pointer
	les di, [Screen_buffer1]
	mov [Gfx_addr+2], es
	mov [Gfx_addr], di
	call Gfx_DrawSquare
	; LineNumber: 320
	; Assigning pointer
	les di, [tp]
	mov [Fonts_tp+2], es
	mov [Fonts_tp], di
	mov [Fonts_x], word 0xa
	; RHS is pure optimization
	mov ax, [y]
	; Forcetype IS POINTER: 0
	add  ax, 0x2d
	mov [Fonts_y], ax
	; Assigning pointer
	les di, [Screen_buffer1]
	mov [Fonts_dst2+2], es
	mov [Fonts_dst2], di
	call Fonts_PrintString
	; LineNumber: 321
	ret
end_procedure_SceneSpaceRender:
	; ***********  Defining procedure : SceneHighwaySkyLineDraw
	;    Procedure type : User-defined procedure
	; LineNumber: 326
	; LineNumber: 325
levels:	dw	0
SceneHighwaySkyLineDraw_block536:
SceneHighwaySkyLineDraw:
	; LineNumber: 332
	mov [i], word 0x0
SceneHighwaySkyLineDraw_forloop537:
	; LineNumber: 329
	; LineNumber: 330
	mov [Gfx_x1], word 0x0
	mov [Gfx_x2], word 0x140
	mov ax, [i]
	mov [Gfx_y], ax
	; Generic add/sub
	mov ax, 0x80
	mov bx, [i]
	xor dx,dx
	mov cx, 0x2
	push ax
	mov ax,bx
	div  cx
	mov bx,ax
	pop ax
	add  ax,bx; bop
	mov [Gfx_color], ax
	; Assigning pointer
	les di, [Screen_buffer1]
	mov [Gfx_addr+2], es
	mov [Gfx_addr], di
	call Gfx_Hline
	; LineNumber: 331
SceneHighwaySkyLineDraw_loopstart538:
	add [i],word 1
	mov ax, 0x50
	cmp ax,word [i]
	jne SceneHighwaySkyLineDraw_forloop537
SceneHighwaySkyLineDraw_loopend539:
	; LineNumber: 333
	mov [Gfx_x1], word 0x0
	mov [Gfx_x2], word 0x140
	mov [Gfx_y], word 0x50
	mov [Gfx_color], word 0x1f
	; Assigning pointer
	les di, [Screen_buffer1]
	mov [Gfx_addr+2], es
	mov [Gfx_addr], di
	call Gfx_Hline
	; LineNumber: 335
	; Assigning pointer
	lea si, [date_text]
	mov [tp+2], ds
	mov [tp], si
	; LineNumber: 343
	mov [i], word 0x1
SceneHighwaySkyLineDraw_forloop542:
	; LineNumber: 337
	; LineNumber: 338
	; Generic add/sub
	mov ax, 0xa0; binop is pure numeric
	mov bx, [i]
	mov cx, 0x4
	push ax
	mov ax,bx
	mul  cx
	mov bx,ax
	pop ax
	add  ax,bx; bop
	mov [Fonts_addValue], al
	; LineNumber: 339
	mov [Fonts_writeType], word 0x1
	; LineNumber: 340
	mov ax, [i]
	mov [Fonts_maskColor], al
	; LineNumber: 341
	; Assigning pointer
	les di, [tp]
	mov [Fonts_tp+2], es
	mov [Fonts_tp], di
	mov [Fonts_x], word 0x28
	mov [Fonts_y], word 0x1e
	; Assigning pointer
	les di, [Screen_buffer1]
	mov [Fonts_dst2+2], es
	mov [Fonts_dst2], di
	call Fonts_PrintString
	; LineNumber: 342
SceneHighwaySkyLineDraw_loopstart543:
	add [i],word 1
	mov ax, 0x7
	cmp ax,word [i]
	jne SceneHighwaySkyLineDraw_forloop542
SceneHighwaySkyLineDraw_loopend544:
	; LineNumber: 351
	mov [i], word 0x0
SceneHighwaySkyLineDraw_forloop547:
	; LineNumber: 345
	; LineNumber: 346
	; RHS is pure optimization
	mov ax, 0x20
	; Forcetype IS POINTER: 0
	add  ax, [i]
	mov [x], ax
	; LineNumber: 347
	mov di,[i] ; index is word
	shl di,1 ; Accomodate for word
	mov ax, [skyline_distribution+di]
	mov [levels], ax
	; LineNumber: 348
	; Generic add/sub
	mov ax, 0x4
	mov bx, [i]
	xor dx,dx
	mov cx, 0x10
	push ax
	mov ax,bx
	div  cx
	mov bx,ax
	pop ax
	mov di,ax
	shl di,1 ; Accomodate for word
	mov bx, [skyline_sizes+di]
	add  ax,bx; bop
	mov [size], ax
	; LineNumber: 349
	mov ax, [x]
	mov [Gfx_x1], ax
	; RHS is pure optimization
	mov ax, 0x50
	; Forcetype IS POINTER: 0
	sub  ax, [levels]
	mov [Gfx_y1], ax
	; RHS is pure optimization
	mov ax, [x]
	; Forcetype IS POINTER: 0
	add  ax, [size]
	mov [Gfx_x2], ax
	mov [Gfx_y2], word 0x50
	mov [Gfx_color], word 0x0
	; Assigning pointer
	les di, [Screen_buffer1]
	mov [Gfx_addr+2], es
	mov [Gfx_addr], di
	call Gfx_DrawSquare
	; LineNumber: 350
SceneHighwaySkyLineDraw_loopstart548:
	mov ax, 0x10
	mov cx,ax
	add [i],cx
	mov ax, 0x100
	cmp ax,word [i]
	jne SceneHighwaySkyLineDraw_forloop547
SceneHighwaySkyLineDraw_loopend549:
	; LineNumber: 351
	ret
end_procedure_SceneHighwaySkyLineDraw:
	; ***********  Defining procedure : SceneHighwayTerrainDraw
	;    Procedure type : User-defined procedure
	; LineNumber: 356
	; LineNumber: 355
factor2:	dw	0
SceneHighwayTerrainDraw_block552:
SceneHighwayTerrainDraw:
	; LineNumber: 373
	mov [i], word 0x0
SceneHighwayTerrainDraw_forloop553:
	; LineNumber: 358
	; LineNumber: 359
	; Generic add/sub
	mov ax, 0x1
	mov bx, [i]
	mov cx, 0x64
	push ax
	mov ax,bx
	mul  cx
	mov bx,ax
	pop ax
	xor dx,dx
	mov cx, 0x78
	push ax
	mov ax,bx
	div  cx
	mov bx,ax
	pop ax
	add  ax,bx; bop
	mov [factor], ax
	; LineNumber: 360
	; Generic add/sub
	mov ax, 0x1
	; RHS is pure optimization
	mov bx, [i]
	mov cx, 0x64
	push ax
	mov ax,bx
	mul  cx
	mov bx,ax
	pop ax
	; Forcetype IS POINTER: 0
	add  bx, 0x1
	xor dx,dx
	mov cx, [factor]
	push ax
	mov ax,bx
	div  cx
	mov bx,ax
	pop ax
	add  ax,bx; bop
	mov [factor2], ax
	; LineNumber: 361
	; Generic add/sub
	mov ax, 0x3f
	mov di,[i] ; index is word
	shl di,1 ; Accomodate for word
	mov bx, [depth_color+di]
	sub  ax,bx; bop
	mov [color], ax
	; LineNumber: 362
	; Generic add/sub
	mov ax, 0x7f
	mov di,[i] ; index is word
	shl di,1 ; Accomodate for word
	sub  ax,bx; bop
	mov [color2], ax
	; LineNumber: 363
	; Generic add/sub
	mov ax, 0xff
	mov di,[i] ; index is word
	shl di,1 ; Accomodate for word
	sub  ax,bx; bop
	mov [c], ax
	; LineNumber: 365
	mov [Gfx_x1], word 0x0
	; RHS is pure optimization
	mov ax, 0xa0
	; Forcetype IS POINTER: 0
	sub  ax, [factor]
	mov [Gfx_x2], ax
	; RHS is pure optimization
	mov ax, 0x50
	; Forcetype IS POINTER: 0
	add  ax, [i]
	mov [Gfx_y], ax
	mov ax, [color2]
	mov [Gfx_color], ax
	; Assigning pointer
	les di, [Screen_buffer1]
	mov [Gfx_addr+2], es
	mov [Gfx_addr], di
	call Gfx_Hline
	; LineNumber: 366
	; RHS is pure optimization
	mov ax, 0xa0
	; Forcetype IS POINTER: 0
	sub  ax, [factor]
	mov [Gfx_x1], ax
	; RHS is pure optimization
	mov ax, 0xa0
	; Forcetype IS POINTER: 0
	add  ax, [factor]
	mov [Gfx_x2], ax
	; RHS is pure optimization
	mov ax, 0x50
	; Forcetype IS POINTER: 0
	add  ax, [i]
	mov [Gfx_y], ax
	mov ax, [color]
	mov [Gfx_color], ax
	; Assigning pointer
	les di, [Screen_buffer1]
	mov [Gfx_addr+2], es
	mov [Gfx_addr], di
	call Gfx_Hline
	; LineNumber: 367
	; Binary clause Simplified: GREATER
	mov ax, 0x14
	mov bx,ax
	; RHS is pure optimization
	mov ax, [scene_time]
	; Forcetype IS POINTER: 0
	sub  ax, [factor2]
	xor dx,dx
	div bx
	mov ax,dx
	cmp  al, 0xf
	jbe SceneHighwayTerrainDraw_elsedoneblock567
SceneHighwayTerrainDraw_ConditionalTrueBlock565: ;Main true block ;keep :
	; LineNumber: 368
	; LineNumber: 369
	; Generic add/sub
	mov ax, 0xa0
	mov bx, [factor]
	xor dx,dx
	mov cx, 0x5
	push ax
	mov ax,bx
	div  cx
	mov bx,ax
	pop ax
	sub  ax,bx; bop
	mov [Gfx_x1], ax
	; Generic add/sub
	mov ax, 0xa0
	mov bx, [factor]
	xor dx,dx
	push ax
	mov ax,bx
	div  cx
	mov bx,ax
	pop ax
	add  ax,bx; bop
	mov [Gfx_x2], ax
	; RHS is pure optimization
	mov ax, 0x50
	; Forcetype IS POINTER: 0
	add  ax, [i]
	mov [Gfx_y], ax
	mov ax, [c]
	mov [Gfx_color], ax
	; Assigning pointer
	les di, [Screen_buffer1]
	mov [Gfx_addr+2], es
	mov [Gfx_addr], di
	call Gfx_Hline
	; LineNumber: 370
SceneHighwayTerrainDraw_elsedoneblock567:
	; LineNumber: 371
	; RHS is pure optimization
	mov ax, 0xa0
	; Forcetype IS POINTER: 0
	add  ax, [factor]
	mov [Gfx_x1], ax
	mov [Gfx_x2], word 0x140
	; RHS is pure optimization
	mov ax, 0x50
	; Forcetype IS POINTER: 0
	add  ax, [i]
	mov [Gfx_y], ax
	mov ax, [color2]
	mov [Gfx_color], ax
	; Assigning pointer
	les di, [Screen_buffer1]
	mov [Gfx_addr+2], es
	mov [Gfx_addr], di
	call Gfx_Hline
	; LineNumber: 372
SceneHighwayTerrainDraw_loopstart554:
	add [i],word 1
	mov ax, 0x78
	cmp ax,word [i]
	jne SceneHighwayTerrainDraw_forloop553
SceneHighwayTerrainDraw_loopend555:
	; LineNumber: 373
	ret
end_procedure_SceneHighwayTerrainDraw:
	; ***********  Defining procedure : SceneHighwayCarDraw
	;    Procedure type : User-defined procedure
	; LineNumber: 376
SceneHighwayCarDraw:
	; LineNumber: 378
	ret
end_procedure_SceneHighwayCarDraw:
	; ***********  Defining procedure : SceneHighwayReset
	;    Procedure type : User-defined procedure
	; LineNumber: 381
SceneHighwayReset:
	; LineNumber: 382
	mov [current_scene_len], word 0x12c
	; LineNumber: 383
	call SceneHighwaySkyLineDraw
	; LineNumber: 384
	call SceneHighwayTerrainDraw
	; LineNumber: 385
	ret
end_procedure_SceneHighwayReset:
	; ***********  Defining procedure : SceneHighwayRender
	;    Procedure type : User-defined procedure
	; LineNumber: 387
SceneHighwayRender:
	; LineNumber: 391
	
; // once 2 sec refresh city
	call SceneHighwayTerrainDraw
	; LineNumber: 392
	call SceneHighwayCarDraw
	; LineNumber: 393
	ret
end_procedure_SceneHighwayRender:
	; ***********  Defining procedure : SceneOutroRender
	;    Procedure type : User-defined procedure
	; LineNumber: 396
SceneOutroRender:
	; LineNumber: 397
	mov ax, 0x100
	mov bx,ax
	mov ax, [scene_time]
	xor dx,dx
	div bx
	mov ax,dx
	mov di,ax
	mov ax, [sin256+di]
	mov ah,0 ; forcetype clear high bit
	mov bx, 0x2
	mul  bx
	mov [x], ax
	; LineNumber: 398
	; Binary clause Simplified: GREATER
	; Compare with pure num / var optimization
	cmp [scene_time],word 0x64
	jbe SceneOutroRender_elsedoneblock577
SceneOutroRender_localsuccess579: ;keep:
	; ; logical AND, second requirement
	; Binary clause Simplified: LESS
	; Compare with pure num / var optimization
	cmp [scene_time],word 0x12c
	jae SceneOutroRender_elsedoneblock577
SceneOutroRender_ConditionalTrueBlock575: ;Main true block ;keep :
	; LineNumber: 399
	; LineNumber: 400
	mov di,0x00
	mov ax, [spr_logos_sprite_type_sprite_type_x+di]
	mov [x1], ax
	mov ax, [spr_logos_sprite_type_sprite_type_y+di]
	mov [y1], ax
	mov ax, [spr_logos_sprite_type_sprite_type_w+di]
	mov [w], ax
	mov ax, [spr_logos_sprite_type_sprite_type_h+di]
	mov [h], ax
	mov ax, [x]
	mov [x2], ax
	mov [y2], word 0x29
	; Assigning pointer
	les di, [Screen_buffer4]
	mov [bank+2], es
	mov [bank], di
	call VFXSpriteDraw
	; LineNumber: 406
SceneOutroRender_elsedoneblock577:
	; LineNumber: 408
	; Binary clause Simplified: GREATER
	; Compare with pure num / var optimization
	cmp [scene_time],word 0x15e
	jbe SceneOutroRender_elsedoneblock584
SceneOutroRender_localsuccess586: ;keep:
	; ; logical AND, second requirement
	; Binary clause Simplified: LESS
	; Compare with pure num / var optimization
	cmp [scene_time],word 0x226
	jae SceneOutroRender_elsedoneblock584
SceneOutroRender_ConditionalTrueBlock582: ;Main true block ;keep :
	; LineNumber: 409
	; LineNumber: 410
	mov di,0x02
	mov ax, [spr_logos_sprite_type_sprite_type_x+di]
	mov [x1], ax
	mov ax, [spr_logos_sprite_type_sprite_type_y+di]
	mov [y1], ax
	mov ax, [spr_logos_sprite_type_sprite_type_w+di]
	mov [w], ax
	mov ax, [spr_logos_sprite_type_sprite_type_h+di]
	mov [h], ax
	mov ax, [x]
	mov [x2], ax
	mov [y2], word 0x3b
	; Assigning pointer
	les di, [Screen_buffer4]
	mov [bank+2], es
	mov [bank], di
	call VFXSpriteDraw
	; LineNumber: 416
SceneOutroRender_elsedoneblock584:
	; LineNumber: 418
	; Binary clause Simplified: GREATER
	; Compare with pure num / var optimization
	cmp [scene_time],word 0x258
	jbe SceneOutroRender_elsedoneblock591
SceneOutroRender_localsuccess593: ;keep:
	; ; logical AND, second requirement
	; Binary clause Simplified: LESS
	; Compare with pure num / var optimization
	cmp [scene_time],word 0x320
	jae SceneOutroRender_elsedoneblock591
SceneOutroRender_ConditionalTrueBlock589: ;Main true block ;keep :
	; LineNumber: 419
	; LineNumber: 420
	mov di,0x04
	mov ax, [spr_logos_sprite_type_sprite_type_x+di]
	mov [x1], ax
	mov ax, [spr_logos_sprite_type_sprite_type_y+di]
	mov [y1], ax
	mov ax, [spr_logos_sprite_type_sprite_type_w+di]
	mov [w], ax
	mov ax, [spr_logos_sprite_type_sprite_type_h+di]
	mov [h], ax
	mov ax, [x]
	mov [x2], ax
	mov [y2], word 0x38
	; Assigning pointer
	les di, [Screen_buffer4]
	mov [bank+2], es
	mov [bank], di
	call VFXSpriteDraw
	; LineNumber: 426
SceneOutroRender_elsedoneblock591:
	; LineNumber: 428
	; Assigning pointer
	les di, [tp]
	mov [Fonts_tp+2], es
	mov [Fonts_tp], di
	; RHS is pure optimization
	mov ax, 0x0
	; Forcetype IS POINTER: 0
	sub  ax, [scene_time]
	mov [Fonts_x], ax
	mov [Fonts_y], word 0x0
	; Assigning pointer
	les di, [Screen_buffer1]
	mov [Fonts_dst2+2], es
	mov [Fonts_dst2], di
	call Fonts_PrintString
	; LineNumber: 429
	; Assigning pointer
	les di, [tp]
	mov [Fonts_tp+2], es
	mov [Fonts_tp], di
	; RHS is pure optimization
	mov ax, 0x0
	; Forcetype IS POINTER: 0
	add  ax, [scene_time]
	mov [Fonts_x], ax
	mov [Fonts_y], word 0xaa
	; Assigning pointer
	les di, [Screen_buffer1]
	mov [Fonts_dst2+2], es
	mov [Fonts_dst2], di
	call Fonts_PrintString
	; LineNumber: 430
	ret
end_procedure_SceneOutroRender:
	; ***********  Defining procedure : SceneOutroReset
	;    Procedure type : User-defined procedure
	; LineNumber: 433
SceneOutroReset:
	; LineNumber: 434
	; Assigning pointer
	lea si, [outro_text]
	mov [tp+2], ds
	mov [tp], si
	; LineNumber: 435
	mov [current_scene_len], word 0x352
	; LineNumber: 436
	mov [Fonts_writeType], word 0x0
	; LineNumber: 437
	ret
end_procedure_SceneOutroReset:
	; ***********  Defining procedure : ResetScene
	;    Procedure type : User-defined procedure
	; LineNumber: 441
	; LineNumber: 440
scene_to_reset:	dw	0
ResetScene_block596:
ResetScene:
	; LineNumber: 442
	; Assigning pointer
	les di, [Screen_buffer1]
	mov [Screen_dest+2], es
	mov [Screen_dest], di
	; Assigning to register
	mov ax, 0x0
	call Screen_ClearBuffer32bit
	; LineNumber: 443
	mov ax, [scene_to_reset]
	mov bx, 0x0
	cmp ax,bx
	jne ResetScene_casenext598
	; LineNumber: 444
	; LineNumber: 445
	call SceneIntroReset
	; LineNumber: 446
	jmp ResetScene_caseend597
ResetScene_casenext598:
	mov ax, [scene_to_reset]
	mov bx, 0x1
	cmp ax,bx
	jne ResetScene_casenext600
	; LineNumber: 447
	; LineNumber: 448
	call SceneSpaceReset
	; LineNumber: 449
	jmp ResetScene_caseend597
ResetScene_casenext600:
	mov ax, [scene_to_reset]
	mov bx, 0x2
	cmp ax,bx
	jne ResetScene_casenext602
	; LineNumber: 450
	; LineNumber: 451
	call SceneHighwayReset
	; LineNumber: 452
	jmp ResetScene_caseend597
ResetScene_casenext602:
	mov ax, [scene_to_reset]
	mov bx, 0x3
	cmp ax,bx
	jne ResetScene_casenext604
	; LineNumber: 453
	; LineNumber: 454
	call SceneOutroReset
	; LineNumber: 455
ResetScene_casenext604:
ResetScene_caseend597:
	; LineNumber: 457
	ret
end_procedure_ResetScene:
	; ***********  Defining procedure : RenderScene
	;    Procedure type : User-defined procedure
	; LineNumber: 460
	; LineNumber: 459
scene_to_render:	dw	0
RenderScene_block606:
RenderScene:
	; LineNumber: 461
	mov ax, [scene_to_render]
	mov bx, 0x0
	cmp ax,bx
	jne RenderScene_casenext608
	; LineNumber: 462
	; LineNumber: 463
	; Assigning pointer
	les di, [Screen_buffer1]
	mov [Screen_dest+2], es
	mov [Screen_dest], di
	; Assigning to register
	mov ax, 0x0
	call Screen_ClearBuffer32bit
	; LineNumber: 464
	call SceneIntroRender
	; LineNumber: 465
	jmp RenderScene_caseend607
RenderScene_casenext608:
	mov ax, [scene_to_render]
	mov bx, 0x1
	cmp ax,bx
	jne RenderScene_casenext610
	; LineNumber: 466
	; LineNumber: 467
	; Assigning pointer
	les di, [Screen_buffer1]
	mov [Screen_dest+2], es
	mov [Screen_dest], di
	; Assigning to register
	mov ax, 0x0
	call Screen_ClearBuffer32bit
	; LineNumber: 468
	call SceneSpaceRender
	; LineNumber: 469
	jmp RenderScene_caseend607
RenderScene_casenext610:
	mov ax, [scene_to_render]
	mov bx, 0x2
	cmp ax,bx
	jne RenderScene_casenext612
	; LineNumber: 470
	; LineNumber: 471
	call SceneHighwayRender
	; LineNumber: 472
	jmp RenderScene_caseend607
RenderScene_casenext612:
	mov ax, [scene_to_render]
	mov bx, 0x3
	cmp ax,bx
	jne RenderScene_casenext614
	; LineNumber: 473
	; LineNumber: 474
	; Assigning pointer
	les di, [Screen_buffer1]
	mov [Screen_dest+2], es
	mov [Screen_dest], di
	; Assigning to register
	mov ax, 0x0
	call Screen_ClearBuffer32bit
	; LineNumber: 475
	call SceneOutroRender
	; LineNumber: 476
RenderScene_casenext614:
RenderScene_caseend607:
	; LineNumber: 478
	ret
end_procedure_RenderScene:
	; ***********  Defining procedure : RasterIRQ
	;    Procedure type : User-defined procedure
	; LineNumber: 482
RasterIRQ:
	; LineNumber: 483
	pusha
	push es
	push ds
	mov ax,192h ; reset DS 
	mov ds,ax
	; LineNumber: 484
	call BeePlay_Update
	; LineNumber: 485
	call BeePlay_Play
	; LineNumber: 486
	; 'a:=a + const'  optimization 
	add [time], word 0x1
	; LineNumber: 487
	; 'a:=a + const'  optimization 
	add [scene_time], word 0x1
	; LineNumber: 488
	mov al,20h
	out 20h,al
	pop ds
	pop es
	popa
	; LineNumber: 489
	iret
end_procedure_RasterIRQ:
	; ***********  Defining procedure : ReColorSprite
	;    Procedure type : User-defined procedure
	; LineNumber: 492
	; LineNumber: 491
	; LineNumber: 491
	; LineNumber: 491
	; LineNumber: 491
	; LineNumber: 491
color_shift:	db	0
ReColorSprite_block617:
ReColorSprite:
	; LineNumber: 503
	mov ax, [y]
	mov [y2], ax
ReColorSprite_forloop618:
	; LineNumber: 494
	; LineNumber: 502
	mov ax, [x]
	mov [x2], ax
ReColorSprite_forloop628:
	; LineNumber: 496
	; LineNumber: 500
	;c:=Screen_buffer2[(y2*320)+x2]+color_shift;
; //			if(c>1) then Gfx::PutPixel(x2,y2,c,Screen::buffer2);
; //			if(c<=1) then Gfx::PutPixel(x2,y2,0,Screen::buffer2);
	mov ax, [x2]
	mov [Gfx_x1], ax
	mov ax, [y2]
	mov [Gfx_y], ax
	mov cx, [color_shift]
	mov ch,0 ; forcetype clear high bit
	push cx
	les di,[Screen_buffer2]
	; RHS is pure optimization
	mov bx, 0x140
	mul  bx
	; Forcetype IS POINTER: 0
	add  ax, [x2]
	add di,ax
	mov al, byte [es:di]; Is byte
	mov ah,0
	;  bop type PLUS
	pop cx
	add  ax,cx ; generic binop when rhs is NOT pointer
	mov [Gfx_color], ax
	; Assigning pointer
	les di, [Screen_buffer2]
	mov [Gfx_buffer+2], es
	mov [Gfx_buffer], di
	call Gfx_PutPixel
	; LineNumber: 501
ReColorSprite_loopstart629:
	add [x2],word 1
	; RHS is pure optimization
	mov ax, [x]
	; Forcetype IS POINTER: 0
	add  ax, [w]
	cmp ax,word [x2]
	jne ReColorSprite_forloop628
ReColorSprite_loopend630:
	; LineNumber: 502
ReColorSprite_loopstart619:
	add [y2],word 1
	; RHS is pure optimization
	mov ax, [y]
	; Forcetype IS POINTER: 0
	add  ax, [h]
	cmp ax,word [y2]
	jne ReColorSprite_forloop618
ReColorSprite_loopend620:
	; LineNumber: 503
	ret
end_procedure_ReColorSprite:
	; ***********  Defining procedure : MapSprites
	;    Procedure type : User-defined procedure
	; LineNumber: 506
MapSprites:
	; LineNumber: 508
	;Is array index
	; Assign value to regular array
	mov ax, 0x0
	mov [spr_logos_sprite_type_sprite_type_x+0x00],ax
	; LineNumber: 509
	;Is array index
	; Assign value to regular array
	mov [spr_logos_sprite_type_sprite_type_y+0x00],ax
	; LineNumber: 510
	;Is array index
	; Assign value to regular array
	mov ax, 0x5f
	mov [spr_logos_sprite_type_sprite_type_w+0x00],ax
	; LineNumber: 511
	;Is array index
	; Assign value to regular array
	mov ax, 0x76
	mov [spr_logos_sprite_type_sprite_type_h+0x00],ax
	; LineNumber: 513
	;Is array index
	; Assign value to regular array
	mov ax, 0x5e
	mov [spr_logos_sprite_type_sprite_type_x+0x02],ax
	; LineNumber: 514
	;Is array index
	; Assign value to regular array
	mov ax, 0x57
	mov [spr_logos_sprite_type_sprite_type_y+0x02],ax
	; LineNumber: 515
	;Is array index
	; Assign value to regular array
	mov ax, 0xc5
	mov [spr_logos_sprite_type_sprite_type_w+0x02],ax
	; LineNumber: 516
	;Is array index
	; Assign value to regular array
	mov ax, 0x4f
	mov [spr_logos_sprite_type_sprite_type_h+0x02],ax
	; LineNumber: 518
	;Is array index
	; Assign value to regular array
	mov ax, 0x5f
	mov [spr_logos_sprite_type_sprite_type_x+0x04],ax
	; LineNumber: 519
	;Is array index
	; Assign value to regular array
	mov ax, 0x0
	mov [spr_logos_sprite_type_sprite_type_y+0x04],ax
	; LineNumber: 520
	;Is array index
	; Assign value to regular array
	mov ax, 0xa5
	mov [spr_logos_sprite_type_sprite_type_w+0x04],ax
	; LineNumber: 521
	;Is array index
	; Assign value to regular array
	mov ax, 0x57
	mov [spr_logos_sprite_type_sprite_type_h+0x04],ax
	; LineNumber: 524
	
; // flying side
	;Is array index
	; Assign value to regular array
	mov ax, 0x0
	mov [spr_ship_big_sprite_type_sprite_type_x+0x00],ax
	; LineNumber: 525
	;Is array index
	; Assign value to regular array
	mov ax, 0x73
	mov [spr_ship_big_sprite_type_sprite_type_y+0x00],ax
	; LineNumber: 526
	;Is array index
	; Assign value to regular array
	mov ax, 0x84
	mov [spr_ship_big_sprite_type_sprite_type_w+0x00],ax
	; LineNumber: 527
	;Is array index
	; Assign value to regular array
	mov ax, 0x54
	mov [spr_ship_big_sprite_type_sprite_type_h+0x00],ax
	; LineNumber: 530
	
; // flying stright
	;Is array index
	; Assign value to regular array
	mov ax, 0x94
	mov [spr_ship_big_sprite_type_sprite_type_x+0x02],ax
	; LineNumber: 531
	;Is array index
	; Assign value to regular array
	mov ax, 0x5a
	mov [spr_ship_big_sprite_type_sprite_type_y+0x02],ax
	; LineNumber: 532
	;Is array index
	; Assign value to regular array
	mov ax, 0x64
	mov [spr_ship_big_sprite_type_sprite_type_w+0x02],ax
	; LineNumber: 533
	;Is array index
	; Assign value to regular array
	mov ax, 0x36
	mov [spr_ship_big_sprite_type_sprite_type_h+0x02],ax
	; LineNumber: 538
	
; //ReColorSprite(spr_ship_big[1].x,spr_ship_big[1].y,spr_ship_big[1].w,spr_ship_big[1].h,90);
; // flying up  corner
	;Is array index
	; Assign value to regular array
	mov ax, 0xfc
	mov [spr_ship_big_sprite_type_sprite_type_x+0x04],ax
	; LineNumber: 539
	;Is array index
	; Assign value to regular array
	mov ax, 0x6e
	mov [spr_ship_big_sprite_type_sprite_type_y+0x04],ax
	; LineNumber: 540
	;Is array index
	; Assign value to regular array
	mov ax, 0x44
	mov [spr_ship_big_sprite_type_sprite_type_w+0x04],ax
	; LineNumber: 541
	;Is array index
	; Assign value to regular array
	mov ax, 0x29
	mov [spr_ship_big_sprite_type_sprite_type_h+0x04],ax
	; LineNumber: 544
	
; // landed
	;Is array index
	; Assign value to regular array
	mov ax, 0xaf
	mov [spr_ship_big_sprite_type_sprite_type_x+0x06],ax
	; LineNumber: 545
	;Is array index
	; Assign value to regular array
	mov ax, 0x95
	mov [spr_ship_big_sprite_type_sprite_type_y+0x06],ax
	; LineNumber: 546
	;Is array index
	; Assign value to regular array
	mov ax, 0x91
	mov [spr_ship_big_sprite_type_sprite_type_w+0x06],ax
	; LineNumber: 547
	;Is array index
	; Assign value to regular array
	mov ax, 0x33
	mov [spr_ship_big_sprite_type_sprite_type_h+0x06],ax
	; LineNumber: 577
	mov [i], word 0x0
MapSprites_forloop634:
	; LineNumber: 551
	; LineNumber: 552
	
; // 
	mov [y], word 0x18
	; LineNumber: 553
	mov ax, [i]
	mov bx, 0x0
	cmp ax,bx
	jne MapSprites_casenext659
	; LineNumber: 553
	mov [x], word 0x28
	jmp MapSprites_caseend658
MapSprites_casenext659:
	mov ax, [i]
	mov bx, 0x1
	cmp ax,bx
	jne MapSprites_casenext661
	; LineNumber: 554
	mov [x], word 0x50
	jmp MapSprites_caseend658
MapSprites_casenext661:
	mov ax, [i]
	mov bx, 0x2
	cmp ax,bx
	jne MapSprites_casenext663
	; LineNumber: 555
	mov [x], word 0x78
	jmp MapSprites_caseend658
MapSprites_casenext663:
	mov ax, [i]
	mov bx, 0x3
	cmp ax,bx
	jne MapSprites_casenext665
	; LineNumber: 556
	mov [x], word 0xa0
	jmp MapSprites_caseend658
MapSprites_casenext665:
	mov ax, [i]
	mov bx, 0x4
	cmp ax,bx
	jne MapSprites_casenext667
	; LineNumber: 557
	mov [x], word 0xc8
	jmp MapSprites_caseend658
MapSprites_casenext667:
	mov ax, [i]
	mov bx, 0x5
	cmp ax,bx
	jne MapSprites_casenext669
	; LineNumber: 558
	mov [x], word 0xf0
	jmp MapSprites_caseend658
MapSprites_casenext669:
	mov ax, [i]
	mov bx, 0x6
	cmp ax,bx
	jne MapSprites_casenext671
	; LineNumber: 559
	mov [x], word 0x118
	jmp MapSprites_caseend658
MapSprites_casenext671:
	mov ax, [i]
	mov bx, 0x7
	cmp ax,bx
	jne MapSprites_casenext673
	; LineNumber: 561
	; LineNumber: 562
	mov [x], word 0x0
	; LineNumber: 563
	mov [y], word 0x30
	; LineNumber: 564
	jmp MapSprites_caseend658
MapSprites_casenext673:
	mov ax, [i]
	mov bx, 0x8
	cmp ax,bx
	jne MapSprites_casenext675
	; LineNumber: 565
	; LineNumber: 566
	mov [x], word 0x28
	; LineNumber: 567
	mov [y], word 0x40
	; LineNumber: 568
MapSprites_casenext675:
MapSprites_caseend658:
	; LineNumber: 570
	;Is array index
	; Assign value to regular array
	mov ax, [x]
	mov di,[i] ; index is word
	shl di,1
	mov [spr_kkj_anim_sprite_type_sprite_type_x+di], ax
	; LineNumber: 571
	;Is array index
	; Assign value to regular array
	mov ax, [y]
	mov di,[i] ; index is word
	shl di,1
	mov [spr_kkj_anim_sprite_type_sprite_type_y+di], ax
	; LineNumber: 572
	;Is array index
	; Assign value to regular array
	mov ax, 0x28
	mov di,[i] ; index is word
	shl di,1
	mov [spr_kkj_anim_sprite_type_sprite_type_w+di], ax
	; LineNumber: 573
	;Is array index
	; Assign value to regular array
	mov di,[i] ; index is word
	shl di,1
	mov [spr_kkj_anim_sprite_type_sprite_type_h+di], ax
	; LineNumber: 575
	mov di,[i] ; index is word
	shl di,1 ; Accomodate for word
	mov ax, [spr_kkj_anim_sprite_type_sprite_type_x+di]
	mov [x], ax
	mov di,[i] ; index is word
	shl di,1 ; Accomodate for word
	mov ax, [spr_kkj_anim_sprite_type_sprite_type_y+di]
	mov [y], ax
	mov di,[i] ; index is word
	shl di,1 ; Accomodate for word
	mov ax, [spr_kkj_anim_sprite_type_sprite_type_w+di]
	mov [w], ax
	mov di,[i] ; index is word
	shl di,1 ; Accomodate for word
	mov ax, [spr_kkj_anim_sprite_type_sprite_type_h+di]
	mov [h], ax
	mov [color_shift], byte 0x11
	call ReColorSprite
	; LineNumber: 576
MapSprites_loopstart635:
	add [i],word 1
	mov ax, 0x9
	cmp ax,word [i]
	jne MapSprites_forloop634
MapSprites_loopend636:
	; LineNumber: 577
	ret
end_procedure_MapSprites:
block1:
main_block_begin_:
	; LineNumber: 582
	call Memory_Init
	; LineNumber: 583
	mov [Screen_i], word 0x13
	call Screen_SetMode
	; LineNumber: 584
	mov [Screen_noBuffers], word 0x5
	call Screen_InitVGABuffers
	; LineNumber: 591
	
; //	 * LOAD TUNE
; //	 
	; Assigning pointer
	lea si, [song]
	mov [BeePlay_zp+2], ds
	mov [BeePlay_zp], si
	call BeePlay_Initialize
	; LineNumber: 592
	;Is array index
	; Assign value to regular array
	mov ax, 0x4
	mov [BeePlay_decayLength+0x00],ax
	; LineNumber: 593
	
; // Sustain of columm 0
	;Is array index
	; Assign value to regular array
	mov ax, 0x6
	mov [BeePlay_decayLength+0x02],ax
	; LineNumber: 594
	
; // Sustain of column 1
	mov [BeePlay_speed], word 0x3
	; LineNumber: 595
	mov [BeePlay_octShift], byte 0x1
	; LineNumber: 597
	mov [Memory_ticks], word 0x8444
	call Memory_SetTimer
	; LineNumber: 598
	cli
	; Install new ISR
	mov al,0x8
	mov ah,25h
	mov dx, RasterIRQ
	int 21h
	sti
	; LineNumber: 603
	
; //	 * LOAD FONT
; //	 
	; Assigning pointer
	lea si, [font]
	mov [Screen_source+2], ds
	mov [Screen_source], si
	; Assigning pointer
	les di, [Screen_buffer5]
	mov [Screen_dest+2], es
	mov [Screen_dest], di
	call Screen_CopyVGABuffer32bit
	; LineNumber: 604
	; Assigning pointer
	les di, [Screen_buffer5]
	mov [Compression_inb+2], es
	mov [Compression_inb], di
	; Assigning pointer
	les di, [Screen_buffer3]
	mov [Compression_outb+2], es
	mov [Compression_outb], di
	call Compression_Decompress
	; LineNumber: 605
	; Assigning pointer
	les di, [Screen_buffer3]
	mov [Fonts_data+2], es
	mov [Fonts_data], di
	mov [Fonts_font_size_x], word 0x14
	mov [Fonts_font_size_y], word 0x18
	mov [Fonts_font_columns], word 0x10
	mov [Fonts_shift], word 0x20
	call Fonts_Init
	; LineNumber: 610
	
; //	 * LOAD SPRITES
; //	 
	; Assigning pointer
	lea si, [sprites]
	mov [Screen_source+2], ds
	mov [Screen_source], si
	; Assigning pointer
	les di, [Screen_buffer5]
	mov [Screen_dest+2], es
	mov [Screen_dest], di
	call Screen_CopyVGABuffer32bit
	; LineNumber: 611
	; Assigning pointer
	les di, [Screen_buffer5]
	mov [Compression_inb+2], es
	mov [Compression_inb], di
	; Assigning pointer
	les di, [Screen_buffer2]
	mov [Compression_outb+2], es
	mov [Compression_outb], di
	call Compression_Decompress
	; LineNumber: 613
	; Assigning pointer
	lea si, [logos]
	mov [Screen_source+2], ds
	mov [Screen_source], si
	; Assigning pointer
	les di, [Screen_buffer5]
	mov [Screen_dest+2], es
	mov [Screen_dest], di
	call Screen_CopyVGABuffer32bit
	; LineNumber: 614
	; Assigning pointer
	les di, [Screen_buffer5]
	mov [Compression_inb+2], es
	mov [Compression_inb], di
	; Assigning pointer
	les di, [Screen_buffer4]
	mov [Compression_outb+2], es
	mov [Compression_outb], di
	call Compression_Decompress
	; LineNumber: 616
	call MapSprites
	; LineNumber: 621
	
; //	 * INIT FIRST SCENE
; //	 
	mov ax, [current_scene]
	mov [scene_to_reset], ax
	call ResetScene
	; LineNumber: 622
	mov ax, [current_scene]
	mov [pal], ax
	call SetPalette
	; LineNumber: 627
MainProgram_while677:
MainProgram_loopstart681:
	; Binary clause Simplified: NOTEQUALS
	; Compare with pure num / var optimization
	; Compare two const numbers
	mov ax,1
	sub ax,2
	je MainProgram_elsedoneblock680
MainProgram_ConditionalTrueBlock678: ;Main true block ;keep :
	; LineNumber: 628
	; LineNumber: 629
	
; //	 * DEMO LOOP
; //	 
	mov dx, 0x3da
MainProgram_vblank1711:
	in al, dx
	test al, 8
	je MainProgram_vblank1711
MainProgram_vblank2712:
	in al, dx
	test al, 8
	jne MainProgram_vblank2712
	; LineNumber: 630
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
	; LineNumber: 632
	; Binary clause Simplified: GREATER
	; Compare two vars optimization
	mov ax, [current_scene_len]
	cmp  [scene_time],ax
	jbe MainProgram_elsedoneblock716
MainProgram_ConditionalTrueBlock714: ;Main true block ;keep :
	; LineNumber: 633
	; LineNumber: 634
	; 'a:=a + const'  optimization 
	add [current_scene], word 0x1
	; LineNumber: 635
	mov [scene_time], word 0x0
	; LineNumber: 636
	; Binary clause Simplified: GREATER
	; Compare two vars optimization
	mov ax, [last_scene]
	cmp  [current_scene],ax
	jbe MainProgram_elsedoneblock728
MainProgram_ConditionalTrueBlock726: ;Main true block ;keep :
	; LineNumber: 637
	; LineNumber: 638
	mov [current_scene], word 0x0
	; LineNumber: 639
	mov [time], word 0x0
	; LineNumber: 640
MainProgram_elsedoneblock728:
	; LineNumber: 642
	mov ax, [current_scene]
	mov [scene_to_reset], ax
	call ResetScene
	; LineNumber: 643
	mov ax, [current_scene]
	mov [pal], ax
	call SetPalette
	; LineNumber: 644
MainProgram_elsedoneblock716:
	; LineNumber: 646
	mov ax, [current_scene]
	mov [scene_to_render], ax
	call RenderScene
	; LineNumber: 648
	; Binary clause Simplified: EQUALS
	; Compare with pure num / var optimization
	cmp [debug],byte 0x1
	jne MainProgram_elsedoneblock734
MainProgram_ConditionalTrueBlock732: ;Main true block ;keep :
	; LineNumber: 647
	call DrawPalette
MainProgram_elsedoneblock734:
	; LineNumber: 649
	jmp MainProgram_while677
MainProgram_elsedoneblock680:
MainProgram_loopend682:
	; LineNumber: 651
main_block_end_:
