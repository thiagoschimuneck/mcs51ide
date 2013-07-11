;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Feb  3 2010) (UNIX)
; This file was generated Wed Jul 10 23:43:18 2013
;--------------------------------------------------------
	.module d51
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _mnemtbl
	.globl _mnem
	.globl _addword
	.globl _addstr
	.globl _addbyte
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
	.globl _discnt
	.globl _cur
	.globl _unassemble
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
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_cur::
	.ds 1
_discnt::
	.ds 2
_unassemble_j_1_1:
	.ds 2
_unassemble_i_1_1:
	.ds 1
_unassemble_ptr_1_1:
	.ds 3
_unassemble_absadd_1_1:
	.ds 2
_unassemble_pcounter_1_1:
	.ds 2
_unassemble_sloc0_1_0:
	.ds 1
_unassemble_sloc1_1_0:
	.ds 3
_unassemble_sloc2_1_0:
	.ds 3
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
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
_unassemble_bitncheck_1_1:
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
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'addbyte'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	d51.c:34: void addbyte (unsigned char x)
;	-----------------------------------------
;	 function addbyte
;	-----------------------------------------
_addbyte:
	ar2 = 0x02
	ar3 = 0x03
	ar4 = 0x04
	ar5 = 0x05
	ar6 = 0x06
	ar7 = 0x07
	ar0 = 0x00
	ar1 = 0x01
	mov	r2,dpl
;	d51.c:36: addchar(hexval[x/0x10]);
	mov	r3,_cur
	inc	_cur
	mov	a,r3
	add	a,#_buff
	mov	r0,a
	mov	a,r2
	swap	a
	anl	a,#0x0f
	mov	dptr,#_hexval
	movc	a,@a+dptr
	mov	@r0,a
;	d51.c:37: addchar(hexval[x&0xf]);
	mov	r3,_cur
	inc	_cur
	mov	a,r3
	add	a,#_buff
	mov	r0,a
	mov	a,#0x0F
	anl	a,r2
	mov	dptr,#_hexval
	movc	a,@a+dptr
	mov	@r0,a
;	d51.c:38: outbyte(x);
	mov	dpl,r2
	lcall	_outbyte
;	d51.c:39: putc(' ');
00101$:
	jbc	_TI,00108$
	sjmp	00101$
00108$:
	mov	_SBUF,#0x20
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'addstr'
;------------------------------------------------------------
;x                         Allocated to registers r2 r3 r4 
;------------------------------------------------------------
;	d51.c:42: void addstr(unsigned char * x)
;	-----------------------------------------
;	 function addstr
;	-----------------------------------------
_addstr:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
;	d51.c:44: while ((*x!=0)&&(*x<0x80))
00102$:
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	r5,a
	jz	00105$
	cjne	r5,#0x80,00112$
00112$:
	jnc	00105$
;	d51.c:46: addchar(*x);
	mov	r6,_cur
	inc	_cur
	mov	a,r6
	add	a,#_buff
	mov	r0,a
	mov	@r0,ar5
;	d51.c:47: x++;
	inc	r2
	cjne	r2,#0x00,00102$
	inc	r3
	sjmp	00102$
00105$:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'addword'
;------------------------------------------------------------
;x                         Allocated to registers r2 r3 
;------------------------------------------------------------
;	d51.c:51: void addword (unsigned int x)
;	-----------------------------------------
;	 function addword
;	-----------------------------------------
_addword:
	mov	r2,dpl
	mov	r3,dph
;	d51.c:53: addchar(hexval[(x/0x1000)&0xf]);
	mov	r4,_cur
	inc	_cur
	mov	a,r4
	add	a,#_buff
	mov	r0,a
	mov	a,r3
	swap	a
	anl	a,#0x0f
	mov	r4,a
	anl	ar4,#0x0F
	mov	r5,#0x00
	mov	a,r4
	add	a,#_hexval
	mov	dpl,a
	mov	a,r5
	addc	a,#(_hexval >> 8)
	mov	dph,a
	clr	a
	movc	a,@a+dptr
	mov	@r0,a
;	d51.c:54: addchar(hexval[(x/0x100)&0xf]);
	mov	r4,_cur
	inc	_cur
	mov	a,r4
	add	a,#_buff
	mov	r0,a
	mov	ar4,r3
	anl	ar4,#0x0F
	mov	r5,#0x00
	mov	a,r4
	add	a,#_hexval
	mov	dpl,a
	mov	a,r5
	addc	a,#(_hexval >> 8)
	mov	dph,a
	clr	a
	movc	a,@a+dptr
	mov	@r0,a
;	d51.c:55: addchar(hexval[(x/0x10)&0xf]);
	mov	r4,_cur
	inc	_cur
	mov	a,r4
	add	a,#_buff
	mov	r0,a
	mov	ar4,r2
	mov	a,r3
	swap	a
	xch	a,r4
	swap	a
	anl	a,#0x0f
	xrl	a,r4
	xch	a,r4
	anl	a,#0x0f
	xch	a,r4
	xrl	a,r4
	xch	a,r4
	anl	ar4,#0x0F
	mov	r5,#0x00
	mov	a,r4
	add	a,#_hexval
	mov	dpl,a
	mov	a,r5
	addc	a,#(_hexval >> 8)
	mov	dph,a
	clr	a
	movc	a,@a+dptr
	mov	@r0,a
;	d51.c:56: addchar(hexval[x&0xf]);
	mov	r4,_cur
	inc	_cur
	mov	a,r4
	add	a,#_buff
	mov	r0,a
	anl	ar2,#0x0F
	mov	r3,#0x00
	mov	a,r2
	add	a,#_hexval
	mov	dpl,a
	mov	a,r3
	addc	a,#(_hexval >> 8)
	mov	dph,a
	clr	a
	movc	a,@a+dptr
	mov	@r0,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'unassemble'
;------------------------------------------------------------
;address                   Allocated to registers r2 r3 
;j                         Allocated with name '_unassemble_j_1_1'
;n                         Allocated to registers r7 
;opcode                    Allocated to registers r5 
;i                         Allocated with name '_unassemble_i_1_1'
;ptr                       Allocated with name '_unassemble_ptr_1_1'
;absadd                    Allocated with name '_unassemble_absadd_1_1'
;pcounter                  Allocated with name '_unassemble_pcounter_1_1'
;bitnum                    Allocated to registers r2 
;sloc0                     Allocated with name '_unassemble_sloc0_1_0'
;sloc1                     Allocated with name '_unassemble_sloc1_1_0'
;sloc2                     Allocated with name '_unassemble_sloc2_1_0'
;------------------------------------------------------------
;	d51.c:61: void unassemble (unsigned int address)
;	-----------------------------------------
;	 function unassemble
;	-----------------------------------------
_unassemble:
	mov	r2,dpl
	mov	r3,dph
;	d51.c:64: unsigned char n, opcode, i=0;
	mov	_unassemble_i_1_1,#0x00
;	d51.c:71: pcounter=(unsigned char code *)address;
	mov	_unassemble_pcounter_1_1,r2
	mov	(_unassemble_pcounter_1_1 + 1),r3
;	d51.c:72: if(discnt==0) discnt=1;
	mov	a,_discnt
	orl	a,(_discnt + 1)
	jnz	00233$
	mov	_discnt,#0x01
	clr	a
	mov	(_discnt + 1),a
;	d51.c:74: while(discnt--)
00233$:
00169$:
	mov	r5,_discnt
	mov	r6,(_discnt + 1)
	dec	_discnt
	mov	a,#0xff
	cjne	a,_discnt,00242$
	dec	(_discnt + 1)
00242$:
	mov	a,r5
	orl	a,r6
	jnz	00243$
	ret
00243$:
;	d51.c:76: outword((int) pcounter);
	mov	dpl,_unassemble_pcounter_1_1
	mov	dph,(_unassemble_pcounter_1_1 + 1)
	lcall	_outword
;	d51.c:77: putsp(": ");
	mov	dptr,#__str_0
	mov	b,#0x80
	lcall	_putsp
;	d51.c:78: opcode=*pcounter;
	mov	dpl,_unassemble_pcounter_1_1
	mov	dph,(_unassemble_pcounter_1_1 + 1)
	clr	a
	movc	a,@a+dptr
;	d51.c:79: outbyte(opcode);
	mov	r5,a
	mov	dpl,a
	push	ar5
	lcall	_outbyte
	pop	ar5
;	d51.c:80: putc(' ');
00103$:
	jbc	_TI,00244$
	sjmp	00103$
00244$:
	mov	_SBUF,#0x20
;	d51.c:82: addchar('\t');
	mov	_cur,#0x01
	mov	_buff,#0x09
;	d51.c:87: for(j=0, n=0; (mnemtbl[j]!=0)&&(opcode!=n); j++)
	mov	r6,#0x00
	mov	r7,#0x00
	mov	r4,#0x00
00173$:
	mov	a,r7
	add	a,#_mnemtbl
	mov	dpl,a
	mov	a,r4
	addc	a,#(_mnemtbl >> 8)
	mov	dph,a
	clr	a
	movc	a,@a+dptr
	mov	r2,a
	jz	00198$
	mov	a,r5
	cjne	a,ar6,00246$
	sjmp	00198$
00246$:
;	d51.c:89: if(mnemtbl[j]=='\n') n++;
	cjne	r2,#0x0A,00175$
	inc	r6
00175$:
;	d51.c:87: for(j=0, n=0; (mnemtbl[j]!=0)&&(opcode!=n); j++)
	inc	r7
;	d51.c:95: while (mnemtbl[j]=='\n') j++; 
	cjne	r7,#0x00,00173$
	inc	r4
	sjmp	00173$
00198$:
	mov	ar2,r7
	mov	ar3,r4
00108$:
	mov	a,r2
	add	a,#_mnemtbl
	mov	dpl,a
	mov	a,r3
	addc	a,#(_mnemtbl >> 8)
	mov	dph,a
	clr	a
	movc	a,@a+dptr
	mov	r4,a
	cjne	r4,#0x0A,00232$
	inc	r2
	cjne	r2,#0x00,00108$
	inc	r3
	sjmp	00108$
00232$:
	mov	a,#0x07
	anl	a,r5
	mov	b,a
	mov	a,#0x30
	orl	a,b
	mov	_unassemble_sloc0_1_0,a
	mov	a,#0x01
	anl	a,r5
	mov	b,a
	mov	a,#0x30
	orl	a,b
	mov	r6,a
	clr	a
	cjne	r5,#0x90,00252$
	inc	a
00252$:
	mov	r5,a
	mov	_unassemble_j_1_1,r2
	mov	(_unassemble_j_1_1 + 1),r3
00181$:
;	d51.c:98: for(; mnemtbl[j]!='\n'; j++)
	mov	a,_unassemble_j_1_1
	add	a,#_mnemtbl
	mov	dpl,a
	mov	a,(_unassemble_j_1_1 + 1)
	addc	a,#(_mnemtbl >> 8)
	mov	dph,a
	clr	a
	movc	a,@a+dptr
	mov	r7,a
	cjne	r7,#0x0A,00254$
	ljmp	00184$
00254$:
;	d51.c:100: n=mnemtbl[j];
;	d51.c:102: bitncheck=0;
	clr	_unassemble_bitncheck_1_1
;	d51.c:104: if((n>='A')&&(n<='Z')) //Replace with string in table
	cjne	r7,#0x41,00255$
00255$:
	jc	00158$
	mov	a,r7
	add	a,#0xff - 0x5A
	jc	00158$
;	d51.c:105: addstr(mnem[n-'A']);
	mov	a,r7
	add	a,#0xbf
	add	a,acc
	mov	r2,a
	mov	dptr,#_mnem
	movc	a,@a+dptr
	xch	a,r2
	inc	dptr
	movc	a,@a+dptr
	mov	r3,a
	mov	r4,#0x80
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	push	ar5
	push	ar6
	lcall	_addstr
	pop	ar6
	pop	ar5
	ljmp	00183$
00158$:
;	d51.c:106: else switch (n)
	cjne	r7,#0x21,00258$
	sjmp	00115$
00258$:
	cjne	r7,#0x23,00259$
	sjmp	00111$
00259$:
	cjne	r7,#0x25,00260$
	sjmp	00114$
00260$:
	cjne	r7,#0x26,00261$
	ljmp	00142$
00261$:
	cjne	r7,#0x2A,00262$
	ljmp	00153$
00262$:
	cjne	r7,#0x2E,00263$
	ljmp	00138$
00263$:
	cjne	r7,#0x3A,00264$
	ljmp	00146$
00264$:
	cjne	r7,#0x3F,00265$
	ljmp	00154$
00265$:
	ljmp	00155$
;	d51.c:108: case '#': //Numeric constant (in hex)
00111$:
;	d51.c:109: addchar('#');
	mov	r2,_cur
	inc	_cur
	mov	a,r2
	add	a,#_buff
	mov	r0,a
	mov	@r0,#0x23
;	d51.c:110: addbyte(*(++pcounter));
	inc	_unassemble_pcounter_1_1
	clr	a
	cjne	a,_unassemble_pcounter_1_1,00266$
	inc	(_unassemble_pcounter_1_1 + 1)
00266$:
	mov	dpl,_unassemble_pcounter_1_1
	mov	dph,(_unassemble_pcounter_1_1 + 1)
	clr	a
	movc	a,@a+dptr
	mov	dpl,a
	push	ar5
	push	ar6
	lcall	_addbyte
	pop	ar6
	pop	ar5
;	d51.c:111: if(opcode==0x90) //"mov dptr,#1234" uses two bytes (Only exception)
	mov	a,r5
	jnz	00267$
	ljmp	00183$
00267$:
;	d51.c:113: addbyte(*(++pcounter));
	inc	_unassemble_pcounter_1_1
	clr	a
	cjne	a,_unassemble_pcounter_1_1,00268$
	inc	(_unassemble_pcounter_1_1 + 1)
00268$:
	mov	dpl,_unassemble_pcounter_1_1
	mov	dph,(_unassemble_pcounter_1_1 + 1)
	clr	a
	movc	a,@a+dptr
	mov	dpl,a
	push	ar5
	push	ar6
	lcall	_addbyte
	pop	ar6
	pop	ar5
;	d51.c:115: break;
	ljmp	00183$
;	d51.c:117: case '%': //Direct bit addressing
00114$:
;	d51.c:118: bitncheck=1;
	setb	_unassemble_bitncheck_1_1
;	d51.c:119: case '!': //Direct memory addressing including sfrs
00115$:
;	d51.c:120: ptr=(bitncheck?bitn:sfrn); //Select the right table of names
	jnb	_unassemble_bitncheck_1_1,00187$
	mov	r2,#_bitn
	mov	r3,#(_bitn >> 8)
	sjmp	00188$
00187$:
	mov	r2,#_sfrn
	mov	r3,#(_sfrn >> 8)
00188$:
	mov	_unassemble_ptr_1_1,r2
	mov	(_unassemble_ptr_1_1 + 1),r3
	mov	(_unassemble_ptr_1_1 + 2),#0x80
;	d51.c:121: n=*(++pcounter);
	inc	_unassemble_pcounter_1_1
	clr	a
	cjne	a,_unassemble_pcounter_1_1,00270$
	inc	(_unassemble_pcounter_1_1 + 1)
00270$:
	mov	dpl,_unassemble_pcounter_1_1
	mov	dph,(_unassemble_pcounter_1_1 + 1)
	clr	a
	movc	a,@a+dptr
	mov	r7,a
;	d51.c:123: bitnum=0;
	mov	r2,#0x00
;	d51.c:125: checkagain:
00116$:
;	d51.c:126: if(n>0x7f)  //Search for sfr or bit names
	mov	a,r7
	add	a,#0xff - 0x7F
	jc	00271$
	ljmp	00136$
00271$:
;	d51.c:157: }
	mov	_unassemble_sloc1_1_0,_unassemble_ptr_1_1
	mov	(_unassemble_sloc1_1_0 + 1),(_unassemble_ptr_1_1 + 1)
	mov	(_unassemble_sloc1_1_0 + 2),(_unassemble_ptr_1_1 + 2)
00124$:
;	d51.c:128: for(; *ptr; ptr++)
	mov	dpl,_unassemble_sloc1_1_0
	mov	dph,(_unassemble_sloc1_1_0 + 1)
	mov	b,(_unassemble_sloc1_1_0 + 2)
	lcall	__gptrget
	mov	r3,a
	jnz	00272$
	ljmp	00127$
00272$:
;	d51.c:130: if(*ptr==n)
	mov	a,r3
	cjne	a,ar7,00273$
	sjmp	00274$
00273$:
	ljmp	00126$
00274$:
;	d51.c:132: outbyte(n);
	mov	dpl,r7
	push	ar2
	push	ar5
	push	ar6
	push	ar7
	lcall	_outbyte
	pop	ar7
	pop	ar6
	pop	ar5
	pop	ar2
;	d51.c:133: putc(' ');
00117$:
	jbc	_TI,00275$
	sjmp	00117$
00275$:
	mov	_SBUF,#0x20
;	d51.c:134: for(ptr++; *ptr<0x80; ptr++) addchar(*ptr);
	inc	_unassemble_ptr_1_1
	clr	a
	cjne	a,_unassemble_ptr_1_1,00276$
	inc	(_unassemble_ptr_1_1 + 1)
00276$:
	mov	_unassemble_sloc2_1_0,_unassemble_ptr_1_1
	mov	(_unassemble_sloc2_1_0 + 1),(_unassemble_ptr_1_1 + 1)
	mov	(_unassemble_sloc2_1_0 + 2),(_unassemble_ptr_1_1 + 2)
00177$:
	mov	dpl,_unassemble_sloc2_1_0
	mov	dph,(_unassemble_sloc2_1_0 + 1)
	mov	b,(_unassemble_sloc2_1_0 + 2)
	lcall	__gptrget
	mov	r3,a
	cjne	r3,#0x80,00277$
00277$:
	jnc	00239$
	mov	r4,_cur
	inc	_cur
	mov	a,r4
	add	a,#_buff
	mov	r0,a
	mov	@r0,ar3
	inc	_unassemble_sloc2_1_0
	clr	a
	cjne	a,_unassemble_sloc2_1_0,00177$
	inc	(_unassemble_sloc2_1_0 + 1)
	sjmp	00177$
00239$:
	mov	_unassemble_ptr_1_1,_unassemble_sloc2_1_0
	mov	(_unassemble_ptr_1_1 + 1),(_unassemble_sloc2_1_0 + 1)
	mov	(_unassemble_ptr_1_1 + 2),(_unassemble_sloc2_1_0 + 2)
;	d51.c:135: if(bitnum>0)
	clr	c
	mov	a,#(0x00 ^ 0x80)
	mov	b,r2
	xrl	b,#0x80
	subb	a,b
	jnc	00127$
;	d51.c:137: addchar('.');
	mov	r3,_cur
	inc	_cur
	mov	a,r3
	add	a,#_buff
	mov	r0,a
	mov	@r0,#0x2E
;	d51.c:138: addchar(bitnum);
	mov	r3,_cur
	inc	_cur
	mov	a,r3
	add	a,#_buff
	mov	r0,a
	mov	@r0,ar2
;	d51.c:140: break;
	sjmp	00127$
00126$:
;	d51.c:128: for(; *ptr; ptr++)
	inc	_unassemble_sloc1_1_0
	clr	a
	cjne	a,_unassemble_sloc1_1_0,00280$
	inc	(_unassemble_sloc1_1_0 + 1)
00280$:
	mov	_unassemble_ptr_1_1,_unassemble_sloc1_1_0
	mov	(_unassemble_ptr_1_1 + 1),(_unassemble_sloc1_1_0 + 1)
	mov	(_unassemble_ptr_1_1 + 2),(_unassemble_sloc1_1_0 + 2)
	ljmp	00124$
00127$:
;	d51.c:143: if(*ptr==0)
	mov	dpl,_unassemble_ptr_1_1
	mov	dph,(_unassemble_ptr_1_1 + 1)
	mov	b,(_unassemble_ptr_1_1 + 2)
	lcall	__gptrget
	jz	00281$
	ljmp	00183$
00281$:
;	d51.c:145: if(bitnum>0) n|=(bitnum&7);
	clr	c
	mov	a,#(0x00 ^ 0x80)
	mov	b,r2
	xrl	b,#0x80
	subb	a,b
	jnc	00129$
	mov	a,#0x07
	anl	a,r2
	orl	ar7,a
00129$:
;	d51.c:146: if(bitncheck)
;	d51.c:149: bitncheck=0;
	jbc	_unassemble_bitncheck_1_1,00283$
	sjmp	00131$
00283$:
;	d51.c:150: bitnum=(n&7)|'0';
	mov	a,#0x07
	anl	a,r7
	mov	b,a
	mov	a,#0x30
	orl	a,b
	mov	r2,a
;	d51.c:151: n&=0xf8;
	anl	ar7,#0xF8
;	d51.c:152: ptr=sfrn;
	mov	_unassemble_ptr_1_1,#_sfrn
	mov	(_unassemble_ptr_1_1 + 1),#(_sfrn >> 8)
	mov	(_unassemble_ptr_1_1 + 2),#0x80
;	d51.c:153: goto checkagain;
	ljmp	00116$
00131$:
;	d51.c:155: else addbyte(n); //sfr name not found in table, print the number
	mov	dpl,r7
	push	ar5
	push	ar6
	lcall	_addbyte
	pop	ar6
	pop	ar5
	ljmp	00183$
00136$:
;	d51.c:158: else addbyte(n); //Not an sfr name print the number
	mov	dpl,r7
	push	ar5
	push	ar6
	lcall	_addbyte
	pop	ar6
	pop	ar5
;	d51.c:159: break;
	ljmp	00183$
;	d51.c:161: case '.': //8 bit relative address
00138$:
;	d51.c:162: pcounter++;
	push	ar6
	inc	_unassemble_pcounter_1_1
	clr	a
	cjne	a,_unassemble_pcounter_1_1,00284$
	inc	(_unassemble_pcounter_1_1 + 1)
00284$:
;	d51.c:163: absadd=(unsigned int)pcounter+(char)*pcounter+1;
	mov	r2,_unassemble_pcounter_1_1
	mov	r3,(_unassemble_pcounter_1_1 + 1)
	mov	dpl,_unassemble_pcounter_1_1
	mov	dph,(_unassemble_pcounter_1_1 + 1)
	clr	a
	movc	a,@a+dptr
	mov	r4,a
	rlc	a
	subb	a,acc
	mov	r6,a
	mov	a,r4
	add	a,r2
	mov	r2,a
	mov	a,r6
	addc	a,r3
	mov	r3,a
	mov	a,#0x01
	add	a,r2
	mov	_unassemble_absadd_1_1,a
	clr	a
	addc	a,r3
	mov	(_unassemble_absadd_1_1 + 1),a
;	d51.c:164: addword(absadd);
	mov	dpl,_unassemble_absadd_1_1
	mov	dph,(_unassemble_absadd_1_1 + 1)
	push	ar5
	push	ar6
	lcall	_addword
;	d51.c:165: outbyte(*pcounter);
	mov	dpl,_unassemble_pcounter_1_1
	mov	dph,(_unassemble_pcounter_1_1 + 1)
	clr	a
	movc	a,@a+dptr
	mov	dpl,a
	lcall	_outbyte
	pop	ar6
	pop	ar5
;	d51.c:213: else i=0;
	pop	ar6
;	d51.c:166: putc(' ');
00139$:
	jbc	_TI,00285$
	sjmp	00139$
00285$:
	mov	_SBUF,#0x20
;	d51.c:167: break;
	ljmp	00183$
;	d51.c:169: case '&': //11 bit paged address
00142$:
;	d51.c:170: n=(*pcounter/0x20)|((((unsigned int)pcounter+2)/0x100)&0xf8);
	push	ar6
	mov	dpl,_unassemble_pcounter_1_1
	mov	dph,(_unassemble_pcounter_1_1 + 1)
	clr	a
	movc	a,@a+dptr
	swap	a
	rr	a
	anl	a,#0x07
	mov	r2,a
	mov	r3,_unassemble_pcounter_1_1
	mov	r4,(_unassemble_pcounter_1_1 + 1)
	mov	a,#0x02
	add	a,r3
	clr	a
	addc	a,r4
	mov	r3,a
	anl	ar3,#0xF8
	clr	a
	mov	r4,a
	mov	r6,a
	mov	a,r2
	orl	ar3,a
	mov	a,r6
	orl	ar4,a
	mov	ar7,r3
;	d51.c:171: pcounter++;
	inc	_unassemble_pcounter_1_1
	clr	a
	cjne	a,_unassemble_pcounter_1_1,00286$
	inc	(_unassemble_pcounter_1_1 + 1)
00286$:
;	d51.c:172: absadd=(n*0x100)+(*pcounter);
	mov	ar2,r7
	mov	ar3,r2
	mov	r2,#0x00
	mov	dpl,_unassemble_pcounter_1_1
	mov	dph,(_unassemble_pcounter_1_1 + 1)
	clr	a
	movc	a,@a+dptr
	mov	r6,#0x00
	add	a,r2
	mov	_unassemble_absadd_1_1,a
	mov	a,r6
	addc	a,r3
	mov	(_unassemble_absadd_1_1 + 1),a
;	d51.c:173: addword(absadd);
	mov	dpl,_unassemble_absadd_1_1
	mov	dph,(_unassemble_absadd_1_1 + 1)
	push	ar5
	push	ar6
	lcall	_addword
;	d51.c:174: outbyte(*pcounter);
	mov	dpl,_unassemble_pcounter_1_1
	mov	dph,(_unassemble_pcounter_1_1 + 1)
	clr	a
	movc	a,@a+dptr
	mov	dpl,a
	lcall	_outbyte
	pop	ar6
	pop	ar5
;	d51.c:213: else i=0;
	pop	ar6
;	d51.c:175: putc(' ');
00143$:
	jbc	_TI,00287$
	sjmp	00143$
00287$:
	mov	_SBUF,#0x20
;	d51.c:176: break;
	ljmp	00183$
;	d51.c:178: case ':': // 16 bit absolute address
00146$:
;	d51.c:179: absadd=*(++pcounter)*0x100;
	inc	_unassemble_pcounter_1_1
	clr	a
	cjne	a,_unassemble_pcounter_1_1,00288$
	inc	(_unassemble_pcounter_1_1 + 1)
00288$:
	mov	dpl,_unassemble_pcounter_1_1
	mov	dph,(_unassemble_pcounter_1_1 + 1)
	clr	a
	movc	a,@a+dptr
	mov	r2,a
	mov	r3,a
	mov	(_unassemble_absadd_1_1 + 1),r3
	mov	_unassemble_absadd_1_1,#0x00
;	d51.c:180: outbyte(*pcounter);
	mov	dpl,r2
	push	ar5
	push	ar6
	lcall	_outbyte
	pop	ar6
	pop	ar5
;	d51.c:181: putc(' ');
00147$:
	jbc	_TI,00289$
	sjmp	00147$
00289$:
	mov	_SBUF,#0x20
;	d51.c:182: outbyte(*(++pcounter));
	inc	_unassemble_pcounter_1_1
	clr	a
	cjne	a,_unassemble_pcounter_1_1,00290$
	inc	(_unassemble_pcounter_1_1 + 1)
00290$:
	mov	dpl,_unassemble_pcounter_1_1
	mov	dph,(_unassemble_pcounter_1_1 + 1)
	clr	a
	movc	a,@a+dptr
	mov	dpl,a
	push	ar5
	push	ar6
	lcall	_outbyte
	pop	ar6
	pop	ar5
;	d51.c:183: putc(' ');
00150$:
	jbc	_TI,00291$
	sjmp	00150$
00291$:
	mov	_SBUF,#0x20
;	d51.c:184: absadd+=*pcounter;
	mov	dpl,_unassemble_pcounter_1_1
	mov	dph,(_unassemble_pcounter_1_1 + 1)
	clr	a
	movc	a,@a+dptr
	mov	r3,#0x00
	add	a,_unassemble_absadd_1_1
	mov	_unassemble_absadd_1_1,a
	mov	a,r3
	addc	a,(_unassemble_absadd_1_1 + 1)
	mov	(_unassemble_absadd_1_1 + 1),a
;	d51.c:185: addword(absadd);
	mov	dpl,_unassemble_absadd_1_1
	mov	dph,(_unassemble_absadd_1_1 + 1)
	push	ar5
	push	ar6
	lcall	_addword
	pop	ar6
	pop	ar5
;	d51.c:186: break;
;	d51.c:188: case '*': //@r0 or @r1
	sjmp	00183$
00153$:
;	d51.c:189: addstr("@r");
	mov	dptr,#__str_1
	mov	b,#0x80
	push	ar5
	push	ar6
	lcall	_addstr
	pop	ar6
	pop	ar5
;	d51.c:190: addchar((opcode&0x1)|'0');
	mov	r2,_cur
	inc	_cur
	mov	a,r2
	add	a,#_buff
	mov	r0,a
	mov	@r0,ar6
;	d51.c:191: break;
;	d51.c:193: case '?': //r0 to r7
	sjmp	00183$
00154$:
;	d51.c:194: addchar('r');
	mov	r2,_cur
	inc	_cur
	mov	a,r2
	add	a,#_buff
	mov	r0,a
	mov	@r0,#0x72
;	d51.c:195: addchar((opcode&0x7)|'0');
	mov	r2,_cur
	inc	_cur
	mov	a,r2
	add	a,#_buff
	mov	r0,a
	mov	@r0,_unassemble_sloc0_1_0
;	d51.c:196: break;
;	d51.c:198: default:
	sjmp	00183$
00155$:
;	d51.c:199: addchar(n);
	mov	r2,_cur
	inc	_cur
	mov	a,r2
	add	a,#_buff
	mov	r0,a
	mov	@r0,ar7
;	d51.c:201: }
00183$:
;	d51.c:98: for(; mnemtbl[j]!='\n'; j++)
	inc	_unassemble_j_1_1
	clr	a
	cjne	a,_unassemble_j_1_1,00292$
	inc	(_unassemble_j_1_1 + 1)
00292$:
	ljmp	00181$
00184$:
;	d51.c:203: addchar('\n');
	mov	r2,_cur
	inc	_cur
	mov	a,r2
	add	a,#_buff
	mov	r0,a
	mov	@r0,#0x0A
;	d51.c:204: addchar(0);
	mov	r2,_cur
	inc	_cur
	mov	a,r2
	add	a,#_buff
	mov	r0,a
	mov	@r0,#0x00
;	d51.c:205: putsp(buff);
	mov	dptr,#_buff
	mov	b,#0x40
	lcall	_putsp
;	d51.c:206: pcounter++; //points to next opcode
	inc	_unassemble_pcounter_1_1
	clr	a
	cjne	a,_unassemble_pcounter_1_1,00293$
	inc	(_unassemble_pcounter_1_1 + 1)
00293$:
;	d51.c:208: if(++i==23) 
	inc	_unassemble_i_1_1
	mov	a,#0x17
	cjne	a,_unassemble_i_1_1,00294$
	sjmp	00295$
00294$:
	ljmp	00169$
00295$:
;	d51.c:210: n=hitanykey();
	lcall	_hitanykey
	mov	r7,dpl
;	d51.c:211: if (n==0x1b) break;
	cjne	r7,#0x1B,00296$
	ret
00296$:
;	d51.c:212: else if (n==' ') i--;
	cjne	r7,#0x20,00162$
	dec	_unassemble_i_1_1
	ljmp	00169$
00162$:
;	d51.c:213: else i=0;
	mov	_unassemble_i_1_1,#0x00
	ljmp	00169$
	.area CSEG    (CODE)
	.area CONST   (CODE)
_mnem:
	.byte _str_2,(_str_2 >> 8)
	.byte _str_3,(_str_3 >> 8)
	.byte _str_4,(_str_4 >> 8)
	.byte _str_5,(_str_5 >> 8)
	.byte _str_6,(_str_6 >> 8)
	.byte _str_7,(_str_7 >> 8)
	.byte _str_8,(_str_8 >> 8)
	.byte _str_9,(_str_9 >> 8)
	.byte _str_10,(_str_10 >> 8)
	.byte _str_11,(_str_11 >> 8)
	.byte _str_12,(_str_12 >> 8)
	.byte _str_13,(_str_13 >> 8)
	.byte _str_14,(_str_14 >> 8)
	.byte _str_15,(_str_15 >> 8)
	.byte _str_16,(_str_16 >> 8)
	.byte _str_17,(_str_17 >> 8)
_mnemtbl:
	.ascii "nop"
	.db 0x0A
	.ascii "H&"
	.db 0x0A
	.ascii "ljmp"
	.db 0x09
	.ascii ":"
	.db 0x0A
	.ascii "rr"
	.db 0x09
	.ascii "a"
	.db 0x0A
	.ascii "Ba"
	.db 0x0A
	.ascii "B!"
	.db 0x0A
	.db 0x0A
	.ascii "B*"
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.ascii "B?"
	.db 0x0A
	.ascii "jbc"
	.db 0x09
	.ascii "%,."
	.db 0x0A
	.ascii "D&"
	.db 0x0A
	.ascii "lcall"
	.db 0x09
	.ascii ":"
	.db 0x0A
	.ascii "rr"
	.ascii "c a"
	.db 0x0A
	.ascii "Ca"
	.db 0x0A
	.ascii "C!"
	.db 0x0A
	.db 0x0A
	.ascii "C*"
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.ascii "C?"
	.db 0x0A
	.ascii "jb"
	.db 0x09
	.ascii "%,."
	.db 0x0A
	.ascii "H&"
	.db 0x0A
	.ascii "ret"
	.db 0x0A
	.ascii "rl"
	.db 0x09
	.ascii "a"
	.db 0x0A
	.ascii "E#"
	.db 0x0A
	.ascii "E!"
	.db 0x0A
	.db 0x0A
	.ascii "E*"
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.ascii "E?"
	.db 0x0A
	.ascii "jnb"
	.db 0x09
	.ascii "%,."
	.db 0x0A
	.ascii "D&"
	.db 0x0A
	.ascii "reti"
	.db 0x0A
	.ascii "rlc"
	.db 0x09
	.ascii "a"
	.db 0x0A
	.ascii "F#"
	.db 0x0A
	.ascii "F!"
	.db 0x0A
	.db 0x0A
	.ascii "F*"
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.ascii "F?"
	.db 0x0A
	.ascii "jc"
	.db 0x09
	.ascii "."
	.db 0x0A
	.ascii "H&"
	.db 0x0A
	.ascii "orl"
	.db 0x09
	.ascii "!,a"
	.db 0x0A
	.ascii "orl"
	.db 0x09
	.ascii "!,#"
	.db 0x0A
	.ascii "G#"
	.db 0x0A
	.ascii "G!"
	.db 0x0A
	.db 0x0A
	.ascii "G*"
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.ascii "G?"
	.db 0x0A
	.ascii "jnc"
	.db 0x09
	.ascii "."
	.db 0x0A
	.ascii "D&"
	.db 0x0A
	.ascii "anl"
	.db 0x09
	.ascii "!,a"
	.db 0x0A
	.ascii "anl"
	.db 0x09
	.ascii "!,#"
	.db 0x0A
	.ascii "I#"
	.db 0x0A
	.ascii "I!"
	.db 0x0A
	.db 0x0A
	.ascii "I*"
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.ascii "I?"
	.db 0x0A
	.ascii "jz"
	.db 0x09
	.ascii "."
	.db 0x0A
	.ascii "H&"
	.db 0x0A
	.ascii "xrl"
	.db 0x09
	.ascii "!,a"
	.db 0x0A
	.ascii "xrl"
	.db 0x09
	.ascii "!,#"
	.db 0x0A
	.ascii "J#"
	.db 0x0A
	.ascii "J!"
	.db 0x0A
	.db 0x0A
	.ascii "J*"
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.ascii "J?"
	.db 0x0A
	.ascii "jn"
	.ascii "z"
	.db 0x09
	.ascii "."
	.db 0x0A
	.ascii "D&"
	.db 0x0A
	.ascii "orl"
	.db 0x09
	.ascii "c,%"
	.db 0x0A
	.ascii "jmp"
	.db 0x09
	.ascii "@a+P"
	.db 0x0A
	.ascii "Aa,#"
	.db 0x0A
	.ascii "A!,#"
	.db 0x0A
	.db 0x0A
	.ascii "A*,#"
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.ascii "A?,#"
	.db 0x0A
	.ascii "sjmp"
	.db 0x09
	.ascii "."
	.db 0x0A
	.ascii "H"
	.ascii "&"
	.db 0x0A
	.ascii "anl c,%"
	.db 0x0A
	.ascii "movc"
	.db 0x09
	.ascii "a,@a+pc"
	.db 0x0A
	.ascii "div"
	.db 0x09
	.ascii "ab"
	.db 0x0A
	.ascii "A!,!"
	.db 0x0A
	.db 0x0A
	.ascii "A!,*"
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.ascii "A!,?"
	.db 0x0A
	.ascii "AP,#"
	.db 0x0A
	.ascii "D&"
	.db 0x0A
	.ascii "A%,c"
	.db 0x0A
	.ascii "movc"
	.db 0x09
	.ascii "a,@a+P"
	.db 0x0A
	.ascii "K#"
	.db 0x0A
	.ascii "K."
	.db 0x0A
	.db 0x0A
	.ascii "K*"
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.ascii "K?"
	.db 0x0A
	.ascii "orl"
	.db 0x09
	.ascii "c,/."
	.db 0x0A
	.ascii "H&"
	.db 0x0A
	.ascii "Ac,%"
	.db 0x0A
	.ascii "BP"
	.db 0x0A
	.ascii "mu"
	.ascii "l"
	.db 0x09
	.ascii "ab"
	.db 0x0A
	.ascii "db"
	.db 0x09
	.ascii "a5"
	.db 0x0A
	.db 0x0A
	.ascii "A*,!"
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.ascii "A?,!"
	.db 0x0A
	.ascii "anl"
	.db 0x09
	.ascii "c,/."
	.db 0x0A
	.ascii "D&"
	.db 0x0A
	.ascii "cpl"
	.db 0x09
	.ascii "%"
	.db 0x0A
	.ascii "cpl"
	.db 0x09
	.ascii "c"
	.db 0x0A
	.ascii "La,# ."
	.db 0x0A
	.ascii "La,! ."
	.db 0x0A
	.db 0x0A
	.ascii "L*,# ."
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.ascii "L?,# ."
	.db 0x0A
	.ascii "push"
	.db 0x09
	.ascii "!"
	.db 0x0A
	.ascii "H&"
	.db 0x0A
	.ascii "clr"
	.db 0x09
	.ascii "%"
	.db 0x0A
	.ascii "clr"
	.db 0x09
	.ascii "c"
	.db 0x0A
	.ascii "swap"
	.db 0x09
	.ascii "a"
	.db 0x0A
	.ascii "M!"
	.db 0x0A
	.db 0x0A
	.ascii "M*"
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.ascii "M?"
	.db 0x0A
	.ascii "pop"
	.db 0x09
	.ascii "!"
	.db 0x0A
	.ascii "D&"
	.db 0x0A
	.ascii "setb"
	.db 0x09
	.ascii "%"
	.db 0x0A
	.ascii "setb"
	.db 0x09
	.ascii "c"
	.db 0x0A
	.ascii "da/ta"
	.db 0x0A
	.ascii "N! ."
	.db 0x0A
	.db 0x0A
	.ascii "xchd"
	.db 0x09
	.ascii "a,*"
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.ascii "N?,."
	.db 0x0A
	.ascii "Oa,@P"
	.db 0x0A
	.ascii "H&"
	.db 0x0A
	.db 0x0A
	.ascii "Oa,*"
	.db 0x0A
	.ascii "clr"
	.db 0x09
	.ascii "a"
	.db 0x0A
	.ascii "Aa,!"
	.db 0x0A
	.db 0x0A
	.ascii "Aa,*"
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.ascii "Aa,?"
	.db 0x0A
	.ascii "O@P,a"
	.db 0x0A
	.ascii "D&"
	.db 0x0A
	.db 0x0A
	.ascii "O*,a"
	.db 0x0A
	.ascii "cpl"
	.db 0x09
	.ascii "a"
	.db 0x0A
	.ascii "A!,a"
	.db 0x0A
	.db 0x0A
	.ascii "A*,a"
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.db 0x0A
	.ascii "A?,a"
	.db 0x0A
	.db 0x00
__str_0:
	.ascii ": "
	.db 0x00
__str_1:
	.ascii "@r"
	.db 0x00
_str_2:
	.ascii "mov"
	.db 0x09
	.db 0x00
_str_3:
	.ascii "inc"
	.db 0x09
	.db 0x00
_str_4:
	.ascii "dec"
	.db 0x09
	.db 0x00
_str_5:
	.ascii "acall"
	.db 0x09
	.db 0x00
_str_6:
	.ascii "add"
	.db 0x09
	.ascii "a,"
	.db 0x00
_str_7:
	.ascii "addc"
	.db 0x09
	.ascii "a,"
	.db 0x00
_str_8:
	.ascii "orl"
	.db 0x09
	.ascii "a,"
	.db 0x00
_str_9:
	.ascii "ajmp"
	.db 0x09
	.db 0x00
_str_10:
	.ascii "anl"
	.db 0x09
	.ascii "a,"
	.db 0x00
_str_11:
	.ascii "xrl"
	.db 0x09
	.ascii "a,"
	.db 0x00
_str_12:
	.ascii "subb"
	.db 0x09
	.ascii "a,"
	.db 0x00
_str_13:
	.ascii "cjne"
	.db 0x09
	.db 0x00
_str_14:
	.ascii "xch"
	.db 0x09
	.ascii "a,"
	.db 0x00
_str_15:
	.ascii "djnz"
	.db 0x09
	.db 0x00
_str_16:
	.ascii "movx"
	.db 0x09
	.db 0x00
_str_17:
	.ascii "dptr"
	.db 0x00
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
