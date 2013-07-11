;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Feb  3 2010) (UNIX)
; This file was generated Wed Jul 10 23:43:18 2013
;--------------------------------------------------------
	.module 8052
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _bitn
	.globl _sfrn
	.globl _JumpToMonitor
	.globl _set_timer1_priority
	.globl _getchar
	.globl __sdcc_external_startup
	.globl _main
	.globl _asm_code_sfr
	.globl _last_interrupt
	.globl _TF2
	.globl _EXF2
	.globl _RCLK
	.globl _TCLK
	.globl _EXEN2
	.globl _TR2
	.globl _C_T2
	.globl _CP_RL2
	.globl _T2CON_7
	.globl _T2CON_6
	.globl _T2CON_5
	.globl _T2CON_4
	.globl _T2CON_3
	.globl _T2CON_2
	.globl _T2CON_1
	.globl _T2CON_0
	.globl _PT2
	.globl _ET2
	.globl _CY
	.globl _AC
	.globl _F0
	.globl _RS1
	.globl _RS0
	.globl _OV
	.globl _F1
	.globl _P
	.globl _PS
	.globl _PT1
	.globl _PX1
	.globl _PT0
	.globl _PX0
	.globl _RD
	.globl _WR
	.globl _T1
	.globl _T0
	.globl _INT1
	.globl _INT0
	.globl _TXD
	.globl _RXD
	.globl _P3_7
	.globl _P3_6
	.globl _P3_5
	.globl _P3_4
	.globl _P3_3
	.globl _P3_2
	.globl _P3_1
	.globl _P3_0
	.globl _EA
	.globl _ES
	.globl _ET1
	.globl _EX1
	.globl _ET0
	.globl _EX0
	.globl _P2_7
	.globl _P2_6
	.globl _P2_5
	.globl _P2_4
	.globl _P2_3
	.globl _P2_2
	.globl _P2_1
	.globl _P2_0
	.globl _SM0
	.globl _SM1
	.globl _SM2
	.globl _REN
	.globl _TB8
	.globl _RB8
	.globl _TI
	.globl _RI
	.globl _P1_7
	.globl _P1_6
	.globl _P1_5
	.globl _P1_4
	.globl _P1_3
	.globl _P1_2
	.globl _P1_1
	.globl _P1_0
	.globl _TF1
	.globl _TR1
	.globl _TF0
	.globl _TR0
	.globl _IE1
	.globl _IT1
	.globl _IE0
	.globl _IT0
	.globl _P0_7
	.globl _P0_6
	.globl _P0_5
	.globl _P0_4
	.globl _P0_3
	.globl _P0_2
	.globl _P0_1
	.globl _P0_0
	.globl _TH2
	.globl _TL2
	.globl _RCAP2H
	.globl _RCAP2L
	.globl _T2CON
	.globl _B
	.globl _ACC
	.globl _PSW
	.globl _IP
	.globl _P3
	.globl _IE
	.globl _P2
	.globl _SBUF
	.globl _SCON
	.globl _P1
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _P0
	.globl _putnl
	.globl _loadintelhex
	.globl _read_sfr
	.globl _write_sfr
	.globl _restorePC
	.globl _cpuid
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (DATA)
_P0	=	0x0080
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_PCON	=	0x0087
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_P1	=	0x0090
_SCON	=	0x0098
_SBUF	=	0x0099
_P2	=	0x00a0
_IE	=	0x00a8
_P3	=	0x00b0
_IP	=	0x00b8
_PSW	=	0x00d0
_ACC	=	0x00e0
_B	=	0x00f0
_T2CON	=	0x00c8
_RCAP2L	=	0x00ca
_RCAP2H	=	0x00cb
_TL2	=	0x00cc
_TH2	=	0x00cd
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (DATA)
_P0_0	=	0x0080
_P0_1	=	0x0081
_P0_2	=	0x0082
_P0_3	=	0x0083
_P0_4	=	0x0084
_P0_5	=	0x0085
_P0_6	=	0x0086
_P0_7	=	0x0087
_IT0	=	0x0088
_IE0	=	0x0089
_IT1	=	0x008a
_IE1	=	0x008b
_TR0	=	0x008c
_TF0	=	0x008d
_TR1	=	0x008e
_TF1	=	0x008f
_P1_0	=	0x0090
_P1_1	=	0x0091
_P1_2	=	0x0092
_P1_3	=	0x0093
_P1_4	=	0x0094
_P1_5	=	0x0095
_P1_6	=	0x0096
_P1_7	=	0x0097
_RI	=	0x0098
_TI	=	0x0099
_RB8	=	0x009a
_TB8	=	0x009b
_REN	=	0x009c
_SM2	=	0x009d
_SM1	=	0x009e
_SM0	=	0x009f
_P2_0	=	0x00a0
_P2_1	=	0x00a1
_P2_2	=	0x00a2
_P2_3	=	0x00a3
_P2_4	=	0x00a4
_P2_5	=	0x00a5
_P2_6	=	0x00a6
_P2_7	=	0x00a7
_EX0	=	0x00a8
_ET0	=	0x00a9
_EX1	=	0x00aa
_ET1	=	0x00ab
_ES	=	0x00ac
_EA	=	0x00af
_P3_0	=	0x00b0
_P3_1	=	0x00b1
_P3_2	=	0x00b2
_P3_3	=	0x00b3
_P3_4	=	0x00b4
_P3_5	=	0x00b5
_P3_6	=	0x00b6
_P3_7	=	0x00b7
_RXD	=	0x00b0
_TXD	=	0x00b1
_INT0	=	0x00b2
_INT1	=	0x00b3
_T0	=	0x00b4
_T1	=	0x00b5
_WR	=	0x00b6
_RD	=	0x00b7
_PX0	=	0x00b8
_PT0	=	0x00b9
_PX1	=	0x00ba
_PT1	=	0x00bb
_PS	=	0x00bc
_P	=	0x00d0
_F1	=	0x00d1
_OV	=	0x00d2
_RS0	=	0x00d3
_RS1	=	0x00d4
_F0	=	0x00d5
_AC	=	0x00d6
_CY	=	0x00d7
_ET2	=	0x00ad
_PT2	=	0x00bd
_T2CON_0	=	0x00c8
_T2CON_1	=	0x00c9
_T2CON_2	=	0x00ca
_T2CON_3	=	0x00cb
_T2CON_4	=	0x00cc
_T2CON_5	=	0x00cd
_T2CON_6	=	0x00ce
_T2CON_7	=	0x00cf
_CP_RL2	=	0x00c8
_C_T2	=	0x00c9
_TR2	=	0x00ca
_EXEN2	=	0x00cb
_TCLK	=	0x00cc
_RCLK	=	0x00cd
_EXF2	=	0x00ce
_TF2	=	0x00cf
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_loadintelhex_size_1_1:
	.ds 1
_loadintelhex_type_1_1:
	.ds 1
_loadintelhex_check_1_1:
	.ds 1
_loadintelhex_xptr_1_1:
	.ds 3
_loadintelhex_cptr_1_1:
	.ds 3
_loadintelhex_sloc0_1_0:
	.ds 3
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG	(DATA)
__start__stack:
	.ds	1

;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
_loadintelhex_errorbit_1_1:
	.ds 1
_loadintelhex_errorprog_1_1:
	.ds 1
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
	reti
	.ds	7
	reti
	.ds	7
	reti
	.ds	7
	ljmp	_step_and_break
	.ds	5
	reti
	.ds	7
	ljmp	_last_interrupt
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genXINIT
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genRAMCLEAR
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	lcall	_main
;	return from main will lock up
	sjmp .
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'last_interrupt'
;------------------------------------------------------------
;------------------------------------------------------------
;	8052.c:44: void last_interrupt (void) interrupt 5 _naked {}  //timer 2
;	-----------------------------------------
;	 function last_interrupt
;	-----------------------------------------
_last_interrupt:
;	naked function: no prologue.
;	naked function: no epilogue.
;------------------------------------------------------------
;Allocation info for local variables in function 'asm_code_sfr'
;------------------------------------------------------------
;------------------------------------------------------------
;	8052.c:53: void asm_code_sfr (void) _naked
;	-----------------------------------------
;	 function asm_code_sfr
;	-----------------------------------------
_asm_code_sfr:
;	naked function: no prologue.
;	8052.c:63: _endasm;
	
	     _code_sfr:
  ; Write sfr
	  mov 0xff, dpl
	  ret
  ; Read sfr
	  mov dpl, 0xff
	  ret
	    
;	naked function: no epilogue.
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;------------------------------------------------------------
;	8052.c:149: void main (void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	ar2 = 0x02
	ar3 = 0x03
	ar4 = 0x04
	ar5 = 0x05
	ar6 = 0x06
	ar7 = 0x07
	ar0 = 0x00
	ar1 = 0x01
;	8052.c:151: _asm ljmp _do_cmd _endasm; //All the work is done in cmon51.c
	 ljmp _do_cmd 
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_sdcc_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	8052.c:154: unsigned char _sdcc_external_startup(void)
;	-----------------------------------------
;	 function _sdcc_external_startup
;	-----------------------------------------
__sdcc_external_startup:
;	8052.c:156: IE=0;
	mov	_IE,#0x00
;	8052.c:157: TR1=0;
	clr	_TR1
;	8052.c:158: TMOD=(TMOD&0x0f)|0x20;
	mov	a,#0x0F
	anl	a,_TMOD
	mov	b,a
	mov	a,#0x20
	orl	a,b
	mov	_TMOD,a
;	8052.c:159: PCON|=0x80; //x2 baudrate
	orl	_PCON,#0x80
;	8052.c:160: TH1=TIMER1_K2_115200;
	mov	_TH1,#0xFF
;	8052.c:161: TR1=1;
	setb	_TR1
;	8052.c:162: SCON=0x52;
	mov	_SCON,#0x52
;	8052.c:164: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'getchar'
;------------------------------------------------------------
;------------------------------------------------------------
;	8052.c:167: char getchar(void)
;	-----------------------------------------
;	 function getchar
;	-----------------------------------------
_getchar:
;	8052.c:169: while (!RI);
00101$:
;	8052.c:170: RI=0;
	jbc	_RI,00108$
	sjmp	00101$
00108$:
;	8052.c:171: return SBUF;
	mov	dpl,_SBUF
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'putnl'
;------------------------------------------------------------
;------------------------------------------------------------
;	8052.c:174: void putnl (void)
;	-----------------------------------------
;	 function putnl
;	-----------------------------------------
_putnl:
;	8052.c:176: while (!TI);
00101$:
;	8052.c:177: TI=0;
	jbc	_TI,00113$
	sjmp	00101$
00113$:
;	8052.c:178: SBUF='\n';
	mov	_SBUF,#0x0A
;	8052.c:179: while (!TI);
00104$:
;	8052.c:180: TI=0;
	jbc	_TI,00114$
	sjmp	00104$
00114$:
;	8052.c:181: SBUF='\r';
	mov	_SBUF,#0x0D
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'loadintelhex'
;------------------------------------------------------------
;j                         Allocated to registers r0 r3 
;address                   Allocated to registers r4 r5 
;size                      Allocated with name '_loadintelhex_size_1_1'
;type                      Allocated with name '_loadintelhex_type_1_1'
;check                     Allocated with name '_loadintelhex_check_1_1'
;n                         Allocated to registers r2 
;xptr                      Allocated with name '_loadintelhex_xptr_1_1'
;cptr                      Allocated with name '_loadintelhex_cptr_1_1'
;sloc0                     Allocated with name '_loadintelhex_sloc0_1_0'
;------------------------------------------------------------
;	8052.c:184: void loadintelhex (void)
;	-----------------------------------------
;	 function loadintelhex
;	-----------------------------------------
_loadintelhex:
;	8052.c:192: putsp("Send file or <Esc>\n");
	mov	dptr,#__str_0
	mov	b,#0x80
	lcall	_putsp
;	8052.c:194: errorbit=0;
	clr	_loadintelhex_errorbit_1_1
;	8052.c:195: errorprog=0;
	clr	_loadintelhex_errorprog_1_1
;	8052.c:197: while(1)
00121$:
;	8052.c:199: n=getchar();
	lcall	_getchar
	mov	r2,dpl
;	8052.c:201: if(n==0x1b) break; //Provide a way out
	cjne	r2,#0x1B,00154$
	ljmp	00122$
00154$:
;	8052.c:203: if(n==':')
	cjne	r2,#0x3A,00121$
;	8052.c:205: size=getbytene();
	lcall	_getbytene
	mov	_loadintelhex_size_1_1,dpl
;	8052.c:208: address=getbytene();
	lcall	_getbytene
	mov	r4,dpl
;	8052.c:209: check+=address;
	mov	a,r4
	add	a,_loadintelhex_size_1_1
	mov	_loadintelhex_check_1_1,a
;	8052.c:210: address*=0x100;
	mov	ar5,r4
	mov	r4,#0x00
;	8052.c:211: n=getbytene();
	push	ar4
	push	ar5
	lcall	_getbytene
	mov	r2,dpl
	pop	ar5
	pop	ar4
;	8052.c:212: check+=n;
	mov	a,r2
	add	a,_loadintelhex_check_1_1
	mov	_loadintelhex_check_1_1,a
;	8052.c:213: address+=n;
	mov	ar7,r2
	mov	r0,#0x00
	mov	a,r7
	add	a,r4
	mov	r4,a
	mov	a,r0
	addc	a,r5
	mov	r5,a
;	8052.c:215: type=getbytene();
	push	ar4
	push	ar5
	lcall	_getbytene
	mov	_loadintelhex_type_1_1,dpl
	pop	ar5
	pop	ar4
;	8052.c:216: check+=type;
	mov	a,_loadintelhex_type_1_1
	add	a,_loadintelhex_check_1_1
	mov	_loadintelhex_check_1_1,a
;	8052.c:219: xptr=(unsigned char xdata *)address;
	mov	ar0,r4
	mov	ar1,r5
	mov	_loadintelhex_xptr_1_1,r0
	mov	(_loadintelhex_xptr_1_1 + 1),r1
	mov	(_loadintelhex_xptr_1_1 + 2),#0x00
;	8052.c:221: cptr=(unsigned char code *)address;
	mov	_loadintelhex_cptr_1_1,r4
	mov	(_loadintelhex_cptr_1_1 + 1),r5
	mov	(_loadintelhex_cptr_1_1 + 2),#0x80
;	8052.c:223: for(j=0; j<size; j++)
	mov	r1,_loadintelhex_xptr_1_1
	mov	r4,(_loadintelhex_xptr_1_1 + 1)
	mov	r5,(_loadintelhex_xptr_1_1 + 2)
	mov	_loadintelhex_sloc0_1_0,_loadintelhex_cptr_1_1
	mov	(_loadintelhex_sloc0_1_0 + 1),(_loadintelhex_cptr_1_1 + 1)
	mov	(_loadintelhex_sloc0_1_0 + 2),(_loadintelhex_cptr_1_1 + 2)
	mov	r0,#0x00
	mov	r3,#0x00
00131$:
	mov	r7,_loadintelhex_size_1_1
	mov	r6,#0x00
	clr	c
	mov	a,r0
	subb	a,r7
	mov	a,r3
	subb	a,r6
	jnc	00134$
;	8052.c:225: n=getbytene();
	push	ar3
	push	ar4
	push	ar5
	push	ar0
	push	ar1
	lcall	_getbytene
	mov	r2,dpl
	pop	ar1
	pop	ar0
	pop	ar5
	pop	ar4
	pop	ar3
;	8052.c:226: check+=n;
	mov	a,r2
	add	a,_loadintelhex_check_1_1
	mov	_loadintelhex_check_1_1,a
;	8052.c:227: if(type==0x00)
	mov	a,_loadintelhex_type_1_1
	jnz	00106$
;	8052.c:229: *xptr=n;
	mov	dpl,r1
	mov	dph,r4
	mov	b,r5
	mov	a,r2
	lcall	__gptrput
;	8052.c:230: if(*cptr!=n) errorprog=1;
	mov	dpl,_loadintelhex_sloc0_1_0
	mov	dph,(_loadintelhex_sloc0_1_0 + 1)
	mov	b,(_loadintelhex_sloc0_1_0 + 2)
	lcall	__gptrget
	mov	r6,a
	cjne	a,ar2,00159$
	sjmp	00106$
00159$:
	setb	_loadintelhex_errorprog_1_1
00106$:
;	8052.c:232: xptr++;
	inc	r1
	cjne	r1,#0x00,00160$
	inc	r4
00160$:
;	8052.c:233: cptr++;
	inc	_loadintelhex_sloc0_1_0
	clr	a
	cjne	a,_loadintelhex_sloc0_1_0,00161$
	inc	(_loadintelhex_sloc0_1_0 + 1)
00161$:
;	8052.c:223: for(j=0; j<size; j++)
	inc	r0
	cjne	r0,#0x00,00131$
	inc	r3
	sjmp	00131$
00134$:
;	8052.c:236: check+=getbytene();
	lcall	_getbytene
	mov	a,dpl
	mov	r2,a
	add	a,_loadintelhex_check_1_1
	mov	_loadintelhex_check_1_1,a
;	8052.c:238: if(type!=0x00) break; //Most likely end record (type=0x01)
	mov	a,_loadintelhex_type_1_1
	jnz	00122$
;	8052.c:239: if(check!=0)
	mov	a,_loadintelhex_check_1_1
	jz	00112$
;	8052.c:241: errorbit=1;
	setb	_loadintelhex_errorbit_1_1
;	8052.c:242: putc('X'); //This means there was a checksum error in the record
00109$:
	jbc	_TI,00165$
	sjmp	00109$
00165$:
	mov	_SBUF,#0x58
	ljmp	00121$
;	8052.c:244: else putc('.');
00112$:
	jbc	_TI,00166$
	sjmp	00112$
00166$:
	mov	_SBUF,#0x2E
	ljmp	00121$
00122$:
;	8052.c:248: if(errorbit) putsp("\nChecksum error!\n");
	jnb	_loadintelhex_errorbit_1_1,00127$
	mov	dptr,#__str_1
	mov	b,#0x80
	lcall	_putsp
	sjmp	00128$
00127$:
;	8052.c:249: else if (errorprog) putsp("\nWrite error!\n");
	jnb	_loadintelhex_errorprog_1_1,00124$
	mov	dptr,#__str_2
	mov	b,#0x80
	lcall	_putsp
	sjmp	00128$
00124$:
;	8052.c:250: else putsp("\nDone.\n");
	mov	dptr,#__str_3
	mov	b,#0x80
	lcall	_putsp
00128$:
;	8052.c:252: if(RI) getchar();//Last newline from final record
	jnb	_RI,00130$
	lcall	_getchar
00130$:
;	8052.c:254: restorePC();
	ljmp	_restorePC
;------------------------------------------------------------
;Allocation info for local variables in function 'read_sfr'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;j                         Allocated to registers r3 
;ptr                       Allocated to registers 
;------------------------------------------------------------
;	8052.c:257: unsigned char read_sfr (unsigned char x)
;	-----------------------------------------
;	 function read_sfr
;	-----------------------------------------
_read_sfr:
	mov	r2,dpl
;	8052.c:263: for(j=0; j<8; j++) ptr[j]=code_sfr[j];
	mov	r3,#0x00
00101$:
	cjne	r3,#0x08,00110$
00110$:
	jnc	00104$
	mov	a,#0xF8
	add	a,r3
	mov	r4,a
	clr	a
	addc	a,#0x7F
	mov	r5,a
	mov	a,r3
	mov	dptr,#_code_sfr
	movc	a,@a+dptr
	mov	r6,a
	mov	dpl,r4
	mov	dph,r5
	movx	@dptr,a
	inc	r3
	sjmp	00101$
00104$:
;	8052.c:264: ptr[2]=x;
	mov	dptr,#0x7FFA
	mov	a,r2
	movx	@dptr,a
;	8052.c:265: ptr[5]=x;
	mov	dptr,#0x7FFD
	mov	a,r2
	movx	@dptr,a
;	8052.c:269: _endasm;
	
	  ljmp 0x7ff8 +4;
	 
;	8052.c:271: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'write_sfr'
;------------------------------------------------------------
;val                       Allocated to registers 
;------------------------------------------------------------
;	8052.c:275: void write_sfr (unsigned char val)
;	-----------------------------------------
;	 function write_sfr
;	-----------------------------------------
_write_sfr:
;	8052.c:279: _endasm;
	
	  ljmp 0x7ff8
	 
;	8052.c:280: val; //To prevent a sdcc warning. Optimized out by sdcc.
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'restorePC'
;------------------------------------------------------------
;------------------------------------------------------------
;	8052.c:283: void restorePC (void)
;	-----------------------------------------
;	 function restorePC
;	-----------------------------------------
_restorePC:
;	8052.c:285: PC_save=XRAM_CODE_LOC;
	mov	dptr,#_PC_save
	clr	a
	movx	@dptr,a
	inc	dptr
	mov	a,#0x20
	movx	@dptr,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'cpuid'
;------------------------------------------------------------
;------------------------------------------------------------
;	8052.c:288: void cpuid (void)
;	-----------------------------------------
;	 function cpuid
;	-----------------------------------------
_cpuid:
;	8052.c:290: putsp(CPUPID);
	mov	dptr,#__str_4
	mov	b,#0x80
	ljmp	_putsp
;------------------------------------------------------------
;Allocation info for local variables in function 'set_timer1_priority'
;------------------------------------------------------------
;------------------------------------------------------------
;	8052.c:293: void set_timer1_priority (void) _naked
;	-----------------------------------------
;	 function set_timer1_priority
;	-----------------------------------------
_set_timer1_priority:
;	naked function: no prologue.
;	8052.c:298: _endasm;
	
	        setb PT1 ; Highest priority for timer 1 interrupt
	        ret
	    
;	naked function: no epilogue.
;------------------------------------------------------------
;Allocation info for local variables in function 'JumpToMonitor'
;------------------------------------------------------------
;------------------------------------------------------------
;	8052.c:303: void JumpToMonitor (void) _naked
;	-----------------------------------------
;	 function JumpToMonitor
;	-----------------------------------------
_JumpToMonitor:
;	naked function: no prologue.
;	8052.c:336: _endasm;
	
	 .area JUMPCSEG (ABS,CODE)
	
	    .org 0x0000
	    ljmp __sdcc_gsinit_startup
	
	    .org 0x0003
	    ljmp 0x2000 +0x03
	
	    .org 0x000B
	    ljmp 0x2000 +0x0B
	
	    .org 0x0013
	    ljmp 0x2000 +0x13
	
    ;Vector 0x001B used by cmon51!
	    .org 0x001B
	    ljmp _step_and_break
	
	    .org 0x0023
	    jnb RI, _ignore_tx
	    ljmp _step_and_break
    ;ljmp 0x2000 +0x23
	
	    .org 0x002B
	    ljmp 0x2000 +0x2B
	
	 _ignore_tx:
	    clr TI
	    reti
	
	    
;	naked function: no epilogue.
	.area CSEG    (CODE)
	.area CONST   (CODE)
_sfrn:
	.db 0x80
	.ascii "P0"
	.db 0x81
	.ascii "SP"
	.db 0x82
	.ascii "DPL"
	.db 0x83
	.ascii "DPH"
	.db 0x87
	.ascii "PCON"
	.db 0x88
	.ascii "TCON"
	.db 0x89
	.ascii "TMOD"
	.db 0x8A
	.ascii "TL0"
	.db 0x8B
	.ascii "TL1"
	.db 0x8C
	.ascii "TH0"
	.db 0x8D
	.ascii "TH1"
	.db 0x90
	.ascii "P1"
	.db 0x98
	.ascii "SCON"
	.db 0x99
	.ascii "SBUF"
	.db 0xA0
	.ascii "P"
	.ascii "2"
	.db 0xA8
	.ascii "IE"
	.db 0xB0
	.ascii "P3"
	.db 0xB8
	.ascii "IP"
	.db 0xC8
	.ascii "T2CON"
	.db 0xC9
	.ascii "T2MOD"
	.db 0xCA
	.ascii "RCAP2L"
	.db 0xCB
	.ascii "RCAP2H"
	.db 0xCC
	.ascii "TL2"
	.db 0xCD
	.ascii "TH2"
	.db 0xD0
	.ascii "PSW"
	.db 0xE0
	.ascii "ACC"
	.db 0xE0
	.ascii "A"
	.db 0xF0
	.ascii "B"
	.db 0x80
	.db 0x00
	.db 0x00
_bitn:
	.db 0x88
	.ascii "IT0"
	.db 0x89
	.ascii "IE0"
	.db 0x8A
	.ascii "IT1"
	.db 0x8B
	.ascii "IE1"
	.db 0x8C
	.ascii "TR0"
	.db 0x8D
	.ascii "TF0"
	.db 0x8E
	.ascii "TR1"
	.db 0x8F
	.ascii "TF1"
	.db 0x98
	.ascii "RI"
	.db 0x99
	.ascii "TI"
	.db 0x9A
	.ascii "RB8"
	.db 0x9B
	.ascii "TB8"
	.db 0x9C
	.ascii "REN"
	.db 0xA8
	.ascii "EX0"
	.db 0xA9
	.ascii "ET0"
	.db 0xAA
	.ascii "E"
	.ascii "X1"
	.db 0xAB
	.ascii "ET1"
	.db 0xAC
	.ascii "ES"
	.db 0xAD
	.ascii "ET2"
	.db 0xAF
	.ascii "EA"
	.db 0xB8
	.ascii "PX0"
	.db 0xB9
	.ascii "PT0"
	.db 0xBA
	.ascii "PX1"
	.db 0xBB
	.ascii "PT1"
	.db 0xBC
	.ascii "PS"
	.db 0xBD
	.ascii "PT2"
	.db 0xD0
	.ascii "P"
	.db 0xD1
	.ascii "F1"
	.db 0xD2
	.ascii "OV"
	.db 0xD3
	.ascii "RS0"
	.db 0xD4
	.ascii "RS1"
	.db 0xD5
	.ascii "F0"
	.db 0xD6
	.ascii "A"
	.ascii "C"
	.db 0xD7
	.ascii "CY"
	.db 0xC8
	.ascii "CP_RL2"
	.db 0xC9
	.ascii "C_T2"
	.db 0xCA
	.ascii "TR2"
	.db 0xCB
	.ascii "EXEN2"
	.db 0xCC
	.ascii "TCLK"
	.db 0xCD
	.ascii "RCLK"
	.db 0xCE
	.ascii "EXF2"
	.db 0xCF
	.ascii "TF2"
	.db 0xFF
	.db 0x00
	.db 0x00
__str_0:
	.ascii "Send file or <Esc>"
	.db 0x0A
	.db 0x00
__str_1:
	.db 0x0A
	.ascii "Checksum error!"
	.db 0x0A
	.db 0x00
__str_2:
	.db 0x0A
	.ascii "Write error!"
	.db 0x0A
	.db 0x00
__str_3:
	.db 0x0A
	.ascii "Done."
	.db 0x0A
	.db 0x00
__str_4:
	.ascii "Port: 8052 V1.1"
	.db 0x0A
	.db 0x00
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
