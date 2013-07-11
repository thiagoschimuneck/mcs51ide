;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Feb  3 2010) (UNIX)
; This file was generated Wed Jul 10 23:43:18 2013
;--------------------------------------------------------
	.module cmon51
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _fillmem_PARM_3
	.globl _fillmem_PARM_2
	.globl _maskbit
	.globl _hexval
	.globl _cmdlst
	.globl _breakorstep
	.globl _nlist
	.globl _outwordnl
	.globl _disp_regs
	.globl _showreg
	.globl _getwordn
	.globl _cleanbuff
	.globl _dispmem
	.globl _modifymem
	.globl _getbyte
	.globl _getsn
	.globl _clearline
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
	.globl _trace_type
	.globl _break_address
	.globl _gostep
	.globl _saved_int
	.globl _saved_jmp
	.globl _step_start
	.globl _gotbreak
	.globl _PC_save
	.globl _SP_save
	.globl _DPH_save
	.globl _DPL_save
	.globl _IE_save
	.globl _B_save
	.globl _PSW_save
	.globl _A_save
	.globl _br
	.globl _iram_save
	.globl _breakpoint
	.globl _buff_hasdot
	.globl _buff_haseq
	.globl _keepediting
	.globl _validbyte
	.globl _showreg_PARM_2
	.globl _dispmem_PARM_3
	.globl _dispmem_PARM_2
	.globl _modifymem_PARM_2
	.globl _cursor
	.globl _buff
	.globl _putsp
	.globl _chartohex
	.globl _outbyte
	.globl _outword
	.globl _fillmem
	.globl _getbytene
	.globl _hitanykey
	.globl _do_cmd
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
_buff::
	.ds 32
_cursor::
	.ds 1
_modifymem_PARM_2:
	.ds 1
_dispmem_PARM_2:
	.ds 2
_dispmem_PARM_3:
	.ds 1
_dispmem_begin_1_1:
	.ds 3
_dispmem_k_1_1:
	.ds 1
_showreg_PARM_2:
	.ds 1
_do_cmd_i_1_1:
	.ds 2
_do_cmd_j_1_1:
	.ds 2
_do_cmd_n_1_1:
	.ds 2
_do_cmd_q_1_1:
	.ds 2
_do_cmd_d_1_1:
	.ds 1
_do_cmd_y_1_1:
	.ds 1
_do_cmd_cmd_1_1:
	.ds 1
_do_cmd_sloc0_1_0:
	.ds 2
_do_cmd_sloc1_1_0:
	.ds 3
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
_fillmem_PARM_2::
	.ds 2
_fillmem_PARM_3::
	.ds 1
	.area	OSEG    (OVR,DATA)
_nlist_q_1_1::
	.ds 1
_nlist_sloc0_1_0::
	.ds 3
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
_validbyte::
	.ds 1
_keepediting::
	.ds 1
_buff_haseq::
	.ds 1
_buff_hasdot::
	.ds 1
_breakpoint::
	.ds 1
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
_iram_save::
	.ds 128
_br::
	.ds 8
_A_save::
	.ds 1
_PSW_save::
	.ds 1
_B_save::
	.ds 1
_IE_save::
	.ds 1
_DPL_save::
	.ds 2
_DPH_save::
	.ds 2
_SP_save::
	.ds 1
_PC_save::
	.ds 2
_gotbreak::
	.ds 1
_step_start::
	.ds 2
_saved_jmp::
	.ds 3
_saved_int::
	.ds 3
_gostep::
	.ds 1
_break_address::
	.ds 2
_trace_type::
	.ds 1
_getsn_buff2_1_1:
	.ds 32
_getsn_count2_1_1:
	.ds 1
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
;Allocation info for local variables in function 'putsp'
;------------------------------------------------------------
;x                         Allocated to registers r2 r3 r4 
;------------------------------------------------------------
;	cmon51.c:58: void putsp(unsigned char * x)
;	-----------------------------------------
;	 function putsp
;	-----------------------------------------
_putsp:
	ar2 = 0x02
	ar3 = 0x03
	ar4 = 0x04
	ar5 = 0x05
	ar6 = 0x06
	ar7 = 0x07
	ar0 = 0x00
	ar1 = 0x01
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
;	cmon51.c:60: while( ((*x)>0) && ((*x)<0x80) )
00110$:
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	r5,a
	jz	00113$
	cjne	r5,#0x80,00123$
00123$:
	jnc	00113$
;	cmon51.c:62: putc(*x);
00101$:
	jbc	_TI,00125$
	sjmp	00101$
00125$:
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	r5,a
	mov	_SBUF,r5
;	cmon51.c:63: if(*x=='\n') putc('\r');
	cjne	r5,#0x0A,00108$
00104$:
	jbc	_TI,00128$
	sjmp	00104$
00128$:
	mov	_SBUF,#0x0D
00108$:
;	cmon51.c:64: x++;
	inc	r2
	cjne	r2,#0x00,00110$
	inc	r3
	sjmp	00110$
00113$:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'clearline'
;------------------------------------------------------------
;j                         Allocated to registers r2 
;------------------------------------------------------------
;	cmon51.c:68: void clearline (void)
;	-----------------------------------------
;	 function clearline
;	-----------------------------------------
_clearline:
;	cmon51.c:71: putc('\r');
00101$:
	jbc	_TI,00124$
	sjmp	00101$
00124$:
	mov	_SBUF,#0x0D
;	cmon51.c:72: for(j=0; j<79; j++) putc(' ');
	mov	r2,#0x00
00110$:
	cjne	r2,#0x4F,00125$
00125$:
	jnc	00107$
00104$:
	jbc	_TI,00127$
	sjmp	00104$
00127$:
	mov	_SBUF,#0x20
	inc	r2
;	cmon51.c:73: putc('\r');
	sjmp	00110$
00107$:
	jbc	_TI,00128$
	sjmp	00107$
00128$:
	mov	_SBUF,#0x0D
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'getsn'
;------------------------------------------------------------
;c                         Allocated to registers r3 
;count                     Allocated to registers r2 
;buff2                     Allocated with name '_getsn_buff2_1_1'
;count2                    Allocated with name '_getsn_count2_1_1'
;------------------------------------------------------------
;	cmon51.c:79: void getsn (void)
;	-----------------------------------------
;	 function getsn
;	-----------------------------------------
_getsn:
;	cmon51.c:82: unsigned char count=0;
	mov	r2,#0x00
;	cmon51.c:84: volatile xdata unsigned char count2=0;
	mov	dptr,#_getsn_count2_1_1
	clr	a
	movx	@dptr,a
;	cmon51.c:86: while (1)
00124$:
;	cmon51.c:88: c=getchar();
	push	ar2
	lcall	_getchar
	mov	r3,dpl
	pop	ar2
;	cmon51.c:90: switch(c)
	cjne	r3,#0x08,00155$
	sjmp	00101$
00155$:
	cjne	r3,#0x0A,00156$
	sjmp	00105$
00156$:
	cjne	r3,#0x0D,00157$
	sjmp	00105$
00157$:
	cjne	r3,#0x16,00158$
	sjmp	00108$
00158$:
	ljmp	00112$
;	cmon51.c:92: case '\b': // backspace
00101$:
;	cmon51.c:93: if (count)
	mov	a,r2
	jz	00124$
;	cmon51.c:95: putsp("\b \b");
	mov	dptr,#__str_0
	mov	b,#0x80
	push	ar2
	lcall	_putsp
	pop	ar2
;	cmon51.c:96: buff[count--]=0;
	mov	ar4,r2
	dec	r2
	mov	a,r4
	add	a,#_buff
	mov	r0,a
	mov	@r0,#0x00
;	cmon51.c:98: break;
;	cmon51.c:100: case '\r': // CR or LF
	sjmp	00124$
00105$:
;	cmon51.c:101: putnl();
	push	ar2
	lcall	_putnl
	pop	ar2
;	cmon51.c:102: buff[count]=0;
	mov	a,r2
	add	a,#_buff
	mov	r0,a
	mov	@r0,#0x00
;	cmon51.c:103: if(count)
	mov	a,r2
	jz	00107$
;	cmon51.c:105: count2=count;
	mov	dptr,#_getsn_count2_1_1
	mov	a,r2
	movx	@dptr,a
;	cmon51.c:106: for(c=0; c<=count; c++) buff2[c]=buff[c];
	mov	r4,#0x00
00126$:
	clr	c
	mov	a,r2
	subb	a,r4
	jc	00107$
	mov	a,r4
	add	a,#_getsn_buff2_1_1
	mov	dpl,a
	clr	a
	addc	a,#(_getsn_buff2_1_1 >> 8)
	mov	dph,a
	mov	a,r4
	add	a,#_buff
	mov	r0,a
	mov	a,@r0
	mov	r5,a
	movx	@dptr,a
	inc	r4
	sjmp	00126$
00107$:
;	cmon51.c:108: return;
;	cmon51.c:109: case 0x16: // <CTRL>+V
	ret
00108$:
;	cmon51.c:110: clearline();
	lcall	_clearline
;	cmon51.c:111: count=count2;
	mov	dptr,#_getsn_count2_1_1
	movx	a,@dptr
	mov	r2,a
;	cmon51.c:112: putsp("> ");
	mov	dptr,#__str_1
	mov	b,#0x80
	push	ar2
	lcall	_putsp
	pop	ar2
;	cmon51.c:113: for(c=0; c<=count; c++) {buff[c]=buff2[c]; putc(buff[c]);}
	mov	r4,#0x00
00130$:
	clr	c
	mov	a,r2
	subb	a,r4
	jnc	00162$
	ljmp	00124$
00162$:
	mov	a,r4
	add	a,#_buff
	mov	r0,a
	mov	a,r4
	add	a,#_getsn_buff2_1_1
	mov	dpl,a
	clr	a
	addc	a,#(_getsn_buff2_1_1 >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r5,a
	mov	@r0,a
00109$:
	jbc	_TI,00163$
	sjmp	00109$
00163$:
	mov	a,r4
	add	a,#_buff
	mov	r0,a
	mov	_SBUF,@r0
	inc	r4
;	cmon51.c:115: default:
	sjmp	00130$
00112$:
;	cmon51.c:116: if(count<(BUFFSIZE-1))
	cjne	r2,#0x1F,00164$
00164$:
	jnc	00116$
;	cmon51.c:118: buff[count++]=c;
	mov	ar4,r2
	inc	r2
	mov	a,r4
	add	a,#_buff
	mov	r0,a
	mov	@r0,ar3
;	cmon51.c:119: putc(c);
00113$:
	jbc	_TI,00166$
	sjmp	00113$
00166$:
	mov	_SBUF,r3
	ljmp	00124$
;	cmon51.c:121: else putc('\a'); //Ding!
00116$:
	jbc	_TI,00167$
	sjmp	00116$
00167$:
	mov	_SBUF,#0x07
;	cmon51.c:123: }
	ljmp	00124$
;------------------------------------------------------------
;Allocation info for local variables in function 'chartohex'
;------------------------------------------------------------
;c                         Allocated to registers r2 
;i                         Allocated to registers r2 
;------------------------------------------------------------
;	cmon51.c:127: unsigned char chartohex(char c)
;	-----------------------------------------
;	 function chartohex
;	-----------------------------------------
_chartohex:
;	cmon51.c:130: i=toupper(c)-'0';
	mov  r2,dpl
	push	ar2
	lcall	_islower
	mov	a,dpl
	pop	ar2
	jz	00105$
	mov	a,#0xDF
	anl	a,r2
	mov	r3,a
	sjmp	00106$
00105$:
	mov	ar3,r2
00106$:
	mov	a,r3
	add	a,#0xd0
;	cmon51.c:131: if(i>9) i-=7; //letter from A to F
	mov  r2,a
	add	a,#0xff - 0x09
	jnc	00102$
	mov	a,r2
	add	a,#0xf9
	mov	r2,a
00102$:
;	cmon51.c:132: return i;
	mov	dpl,r2
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'outbyte'
;------------------------------------------------------------
;x                         Allocated to registers r2 
;------------------------------------------------------------
;	cmon51.c:135: void outbyte(unsigned char x)
;	-----------------------------------------
;	 function outbyte
;	-----------------------------------------
_outbyte:
	mov	r2,dpl
;	cmon51.c:137: putc(hexval[x/0x10]);
00101$:
	jbc	_TI,00113$
	sjmp	00101$
00113$:
	mov	a,r2
	swap	a
	anl	a,#0x0f
	mov	r3,a
	mov	dptr,#_hexval
	movc	a,@a+dptr
	mov	_SBUF,a
;	cmon51.c:138: putc(hexval[x&0xf]);	
00104$:
	jbc	_TI,00114$
	sjmp	00104$
00114$:
	mov	a,#0x0F
	anl	a,r2
	mov	dptr,#_hexval
	movc	a,@a+dptr
	mov	_SBUF,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'outword'
;------------------------------------------------------------
;x                         Allocated to registers r2 r3 
;------------------------------------------------------------
;	cmon51.c:141: void outword(unsigned int x)
;	-----------------------------------------
;	 function outword
;	-----------------------------------------
_outword:
	mov	r2,dpl
	mov	r3,dph
;	cmon51.c:143: outbyte(highof(x));
	mov	ar4,r3
	mov	dpl,r4
	push	ar2
	push	ar3
	lcall	_outbyte
	pop	ar3
	pop	ar2
;	cmon51.c:144: outbyte(lowof(x));
	mov	dpl,r2
	ljmp	_outbyte
;------------------------------------------------------------
;Allocation info for local variables in function 'fillmem'
;------------------------------------------------------------
;len                       Allocated with name '_fillmem_PARM_2'
;val                       Allocated with name '_fillmem_PARM_3'
;begin                     Allocated to registers r2 r3 r4 
;------------------------------------------------------------
;	cmon51.c:148: void fillmem(unsigned char * begin,  unsigned int len, unsigned char val)
;	-----------------------------------------
;	 function fillmem
;	-----------------------------------------
_fillmem:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
;	cmon51.c:150: while(len)
	mov	r5,_fillmem_PARM_2
	mov	r6,(_fillmem_PARM_2 + 1)
00101$:
	mov	a,r5
	orl	a,r6
	jz	00104$
;	cmon51.c:152: *begin=val;
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,_fillmem_PARM_3
	lcall	__gptrput
	inc	dptr
	mov	r2,dpl
	mov	r3,dph
;	cmon51.c:153: begin++;
;	cmon51.c:154: len--;
	dec	r5
	cjne	r5,#0xff,00101$
	dec	r6
	sjmp	00101$
00104$:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'getbytene'
;------------------------------------------------------------
;j                         Allocated to registers r2 
;------------------------------------------------------------
;	cmon51.c:159: unsigned char getbytene (void)
;	-----------------------------------------
;	 function getbytene
;	-----------------------------------------
_getbytene:
;	cmon51.c:163: j=chartohex(getchar());
	lcall	_getchar
	lcall	_chartohex
;	cmon51.c:164: return (j*0x10+chartohex(getchar()));
	mov	a,dpl
	swap	a
	anl	a,#0xf0
	mov	r2,a
	push	ar2
	lcall	_getchar
	lcall	_chartohex
	mov	r3,dpl
	pop	ar2
	mov	a,r3
	add	a,r2
	mov	dpl,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'getbyte'
;------------------------------------------------------------
;i                         Allocated to registers r5 
;j                         Allocated to registers r2 
;k                         Allocated to registers r3 
;------------------------------------------------------------
;	cmon51.c:168: unsigned char getbyte (void)
;	-----------------------------------------
;	 function getbyte
;	-----------------------------------------
_getbyte:
;	cmon51.c:170: unsigned char i, j=0, k;
	mov	r2,#0x00
;	cmon51.c:172: for (k=0; k<2; k++)
	mov	r3,#0x00
	mov	r4,#0x00
00114$:
	cjne	r4,#0x02,00131$
00131$:
	jc	00132$
	ljmp	00117$
00132$:
;	cmon51.c:174: i=getchar();
	push	ar2
	push	ar3
	push	ar4
	lcall	_getchar
	mov	r5,dpl
	pop	ar4
	pop	ar3
	pop	ar2
;	cmon51.c:175: putc(i==' '?'x':i);
00101$:
	jbc	_TI,00133$
	sjmp	00101$
00133$:
	clr	a
	cjne	r5,#0x20,00134$
	inc	a
00134$:
	mov	r6,a
	jz	00120$
	mov	r7,#0x78
	sjmp	00121$
00120$:
	mov	ar7,r5
00121$:
	mov	_SBUF,r7
;	cmon51.c:176: if(!isxdigit(i))
	mov	dpl,r5
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_isxdigit
	mov	a,dpl
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	jnz	00113$
;	cmon51.c:178: validbyte=0;
	clr	_validbyte
;	cmon51.c:179: if(i==' ')
	mov	a,r6
	jz	00110$
;	cmon51.c:181: keepediting=1;
	setb	_keepediting
;	cmon51.c:182: if(k==0) putc('x');
	mov	a,r3
	jnz	00111$
00104$:
	jbc	_TI,00140$
	sjmp	00104$
00140$:
	mov	_SBUF,#0x78
	sjmp	00111$
00110$:
;	cmon51.c:184: else keepediting=0;
	clr	_keepediting
00111$:
;	cmon51.c:185: return j;
	mov	dpl,r2
	ret
00113$:
;	cmon51.c:187: j=j*0x10+chartohex(i);
	mov	a,r2
	swap	a
	anl	a,#0xf0
	mov	r6,a
	mov	dpl,r5
	push	ar4
	push	ar6
	lcall	_chartohex
	mov	r5,dpl
	pop	ar6
	pop	ar4
	mov	a,r5
	add	a,r6
	mov	r2,a
;	cmon51.c:172: for (k=0; k<2; k++)
	inc	r4
	mov	ar3,r4
	ljmp	00114$
00117$:
;	cmon51.c:189: keepediting=1;
	setb	_keepediting
;	cmon51.c:190: validbyte=1;
	setb	_validbyte
;	cmon51.c:191: return j;
	mov	dpl,r2
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'modifymem'
;------------------------------------------------------------
;loc                       Allocated with name '_modifymem_PARM_2'
;ptr                       Allocated to registers r2 r3 r4 
;j                         Allocated to registers r6 
;k                         Allocated to registers r5 
;------------------------------------------------------------
;	cmon51.c:195: void modifymem(unsigned char * ptr,  char loc)
;	-----------------------------------------
;	 function modifymem
;	-----------------------------------------
_modifymem:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
;	cmon51.c:197: unsigned char j, k=0;
	mov	r5,#0x00
;	cmon51.c:199: while(1)
00134$:
;	cmon51.c:201: if(k==0)
	mov	a,r5
	jnz	00116$
;	cmon51.c:203: putnl();
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	_putnl
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	cmon51.c:204: putc(loc);
00101$:
	jbc	_TI,00159$
	sjmp	00101$
00159$:
	mov	r6,_modifymem_PARM_2
	mov	_SBUF,r6
;	cmon51.c:205: putc(':');
00104$:
	jbc	_TI,00160$
	sjmp	00104$
00160$:
	mov	_SBUF,#0x3A
;	cmon51.c:206: if((loc=='D')||(loc=='I'))
	cjne	r6,#0x44,00161$
	sjmp	00107$
00161$:
	cjne	r6,#0x49,00108$
00107$:
;	cmon51.c:207: outbyte((unsigned char)ptr);
	mov	dpl,r2
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	_outbyte
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	sjmp	00111$
00108$:
;	cmon51.c:209: outword((unsigned int)ptr);
	mov	dpl,r2
	mov	dph,r3
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	_outword
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	cmon51.c:210: putc(':');
00111$:
	jbc	_TI,00164$
	sjmp	00111$
00164$:
	mov	_SBUF,#0x3A
;	cmon51.c:212: putc(' ');
00116$:
	jbc	_TI,00165$
	sjmp	00116$
00165$:
	mov	_SBUF,#0x20
;	cmon51.c:213: outbyte(*ptr);
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	dpl,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	_outbyte
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	cmon51.c:214: putc('.');
00119$:
	jbc	_TI,00166$
	sjmp	00119$
00166$:
	mov	_SBUF,#0x2E
;	cmon51.c:215: j=getbyte();
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	_getbyte
	mov	r6,dpl
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	cmon51.c:216: if((!validbyte)&&(!keepediting)) break;
	jb	_validbyte,00123$
	jnb	_keepediting,00135$
00123$:
;	cmon51.c:217: if(validbyte) *ptr=j;
	jnb	_validbyte,00127$
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	mov	a,r6
	lcall	__gptrput
;	cmon51.c:218: putc('\b');
00127$:
	jbc	_TI,00170$
	sjmp	00127$
00170$:
	mov	_SBUF,#0x08
;	cmon51.c:219: putc('\b');
00130$:
	jbc	_TI,00171$
	sjmp	00130$
00171$:
	mov	_SBUF,#0x08
;	cmon51.c:220: outbyte(*ptr);
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	r6,a
	inc	dptr
	mov	r2,dpl
	mov	r3,dph
	mov	dpl,r6
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	_outbyte
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	cmon51.c:221: ptr++;
;	cmon51.c:222: ++k;
	inc	r5
;	cmon51.c:223: k&=7;
	anl	ar5,#0x07
	ljmp	00134$
00135$:
;	cmon51.c:225: putnl();
	ljmp	_putnl
;------------------------------------------------------------
;Allocation info for local variables in function 'hitanykey'
;------------------------------------------------------------
;------------------------------------------------------------
;	cmon51.c:228: unsigned char hitanykey (void)
;	-----------------------------------------
;	 function hitanykey
;	-----------------------------------------
_hitanykey:
;	cmon51.c:230: putsp("<Space>=line <Enter>=page <ESC>=stop\r");
	mov	dptr,#__str_2
	mov	b,#0x80
	lcall	_putsp
;	cmon51.c:231: while (!RI);
00101$:
	jnb	_RI,00101$
;	cmon51.c:232: clearline();
	lcall	_clearline
;	cmon51.c:233: RI=0;
	clr	_RI
;	cmon51.c:234: return (SBUF);
	mov	dpl,_SBUF
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'dispmem'
;------------------------------------------------------------
;len                       Allocated with name '_dispmem_PARM_2'
;loc                       Allocated with name '_dispmem_PARM_3'
;begin                     Allocated with name '_dispmem_begin_1_1'
;j                         Allocated to registers r6 r7 
;n                         Allocated to registers r2 
;i                         Allocated to registers r3 
;k                         Allocated with name '_dispmem_k_1_1'
;------------------------------------------------------------
;	cmon51.c:238: void dispmem(unsigned char * begin,  unsigned int len, char loc)
;	-----------------------------------------
;	 function dispmem
;	-----------------------------------------
_dispmem:
	mov	_dispmem_begin_1_1,dpl
	mov	(_dispmem_begin_1_1 + 1),dph
	mov	(_dispmem_begin_1_1 + 2),b
;	cmon51.c:241: unsigned char n, i, k=0;
	mov	_dispmem_k_1_1,#0x00
;	cmon51.c:243: if(len==0) len=0x80;
	mov	a,_dispmem_PARM_2
	orl	a,(_dispmem_PARM_2 + 1)
	jnz	00102$
	mov	_dispmem_PARM_2,#0x80
	clr	a
	mov	(_dispmem_PARM_2 + 1),a
00102$:
;	cmon51.c:245: buff[16]=0;
	mov	(_buff + 0x0010),#0x00
;	cmon51.c:247: for(j=0; j<len; j++)
	mov	r6,#0x00
	mov	r7,#0x00
00133$:
	clr	c
	mov	a,r6
	subb	a,_dispmem_PARM_2
	mov	a,r7
	subb	a,(_dispmem_PARM_2 + 1)
	jc	00161$
	ret
00161$:
;	cmon51.c:249: n=begin[j];
	mov	a,r6
	add	a,_dispmem_begin_1_1
	mov	r5,a
	mov	a,r7
	addc	a,(_dispmem_begin_1_1 + 1)
	mov	r2,a
	mov	r3,(_dispmem_begin_1_1 + 2)
	mov	dpl,r5
	mov	dph,r2
	mov	b,r3
	lcall	__gptrget
	mov	r2,a
;	cmon51.c:250: i=j&0xf;
	mov	a,#0x0F
	anl	a,r6
;	cmon51.c:252: if(i==0) 
	mov	r3,a
	mov	r4,#0x00
	jnz	00114$
;	cmon51.c:254: putc(loc);  //A letter to indicate Data, Xram, Code, Idata
00103$:
	jbc	_TI,00163$
	sjmp	00103$
00163$:
	mov	r4,_dispmem_PARM_3
	mov	_SBUF,r4
;	cmon51.c:255: putc(':');
00106$:
	jbc	_TI,00164$
	sjmp	00106$
00164$:
	mov	_SBUF,#0x3A
;	cmon51.c:256: if((loc=='D')||(loc=='I'))
	cjne	r4,#0x44,00165$
	sjmp	00109$
00165$:
	cjne	r4,#0x49,00110$
00109$:
;	cmon51.c:257: outbyte((unsigned char)begin+j);
	mov	r4,_dispmem_begin_1_1
	mov	a,r6
	add	a,r4
	mov	dpl,a
	push	ar2
	push	ar3
	push	ar6
	push	ar7
	lcall	_outbyte
	pop	ar7
	pop	ar6
	pop	ar3
	pop	ar2
	sjmp	00111$
00110$:
;	cmon51.c:259: outword((unsigned int)begin+j);
	mov	r4,_dispmem_begin_1_1
	mov	r5,(_dispmem_begin_1_1 + 1)
	mov	a,r6
	add	a,r4
	mov	dpl,a
	mov	a,r7
	addc	a,r5
	mov	dph,a
	push	ar2
	push	ar3
	push	ar6
	push	ar7
	lcall	_outword
	pop	ar7
	pop	ar6
	pop	ar3
	pop	ar2
00111$:
;	cmon51.c:260: putsp(":  ");
	mov	dptr,#__str_3
	mov	b,#0x80
	push	ar2
	push	ar3
	push	ar6
	push	ar7
	lcall	_putsp
	pop	ar7
	pop	ar6
	pop	ar3
	pop	ar2
00114$:
;	cmon51.c:262: outbyte(n);
	mov	dpl,r2
	push	ar2
	push	ar3
	push	ar6
	push	ar7
	lcall	_outbyte
	pop	ar7
	pop	ar6
	pop	ar3
	pop	ar2
;	cmon51.c:263: putc(i==7?'-':' '); //A middle separator like the old good DOS debug
00115$:
	jbc	_TI,00168$
	sjmp	00115$
00168$:
	cjne	r3,#0x07,00139$
	mov	r4,#0x2D
	sjmp	00140$
00139$:
	mov	r4,#0x20
00140$:
	mov	_SBUF,r4
;	cmon51.c:265: if((n>0x20)&&(n<0x7f))
	mov	a,r2
	add	a,#0xff - 0x20
	jnc	00119$
	cjne	r2,#0x7F,00172$
00172$:
	jnc	00119$
;	cmon51.c:266: buff[i]=n;
	mov	a,r3
	add	a,#_buff
	mov	r0,a
	mov	@r0,ar2
	sjmp	00120$
00119$:
;	cmon51.c:268: buff[i]='.';
	mov	a,r3
	add	a,#_buff
	mov	r0,a
	mov	@r0,#0x2E
00120$:
;	cmon51.c:270: if(i==0xf)
	cjne	r3,#0x0F,00135$
;	cmon51.c:272: putsp("   ");
	mov	dptr,#__str_4
	mov	b,#0x80
	push	ar6
	push	ar7
	lcall	_putsp
;	cmon51.c:273: putsp(buff);
	mov	dptr,#_buff
	mov	b,#0x40
	lcall	_putsp
;	cmon51.c:274: putnl();
	lcall	_putnl
	pop	ar7
	pop	ar6
;	cmon51.c:275: if((++k==23) && (j<len)) 
	inc	_dispmem_k_1_1
	mov	a,#0x17
	cjne	a,_dispmem_k_1_1,00135$
	clr	c
	mov	a,r6
	subb	a,_dispmem_PARM_2
	mov	a,r7
	subb	a,(_dispmem_PARM_2 + 1)
	jnc	00135$
;	cmon51.c:277: n=hitanykey();
	push	ar6
	push	ar7
	lcall	_hitanykey
	mov	r2,dpl
	pop	ar7
	pop	ar6
;	cmon51.c:278: if (n==0x1b) break;
	cjne	r2,#0x1B,00179$
	ret
00179$:
;	cmon51.c:279: else if (n==' ') k--;
	cjne	r2,#0x20,00123$
	dec	_dispmem_k_1_1
	sjmp	00135$
00123$:
;	cmon51.c:280: else k=0;
	mov	_dispmem_k_1_1,#0x00
00135$:
;	cmon51.c:247: for(j=0; j<len; j++)
	inc	r6
	cjne	r6,#0x00,00182$
	inc	r7
00182$:
	ljmp	00133$
;------------------------------------------------------------
;Allocation info for local variables in function 'cleanbuff'
;------------------------------------------------------------
;j                         Allocated to registers r2 
;k                         Allocated to registers r2 
;------------------------------------------------------------
;	cmon51.c:287: void cleanbuff (void)
;	-----------------------------------------
;	 function cleanbuff
;	-----------------------------------------
_cleanbuff:
;	cmon51.c:291: buff_haseq=0;
	clr	_buff_haseq
;	cmon51.c:292: buff_hasdot=0;
	clr	_buff_hasdot
;	cmon51.c:295: for(j=0; j<BUFFSIZE; j++)
	mov	r2,#0x00
00113$:
	cjne	r2,#0x20,00144$
00144$:
	jnc	00116$
;	cmon51.c:297: buff[j]=toupper(buff[j]);
	mov	a,r2
	add	a,#_buff
	mov	r0,a
	mov	dpl,@r0
	push	ar2
	push	ar0
	lcall	_islower
	mov	a,dpl
	pop	ar0
	pop	ar2
	jz	00127$
	mov	a,r2
	add	a,#_buff
	mov	r1,a
	mov	ar3,@r1
	anl	ar3,#0xDF
	sjmp	00128$
00127$:
	mov	a,r2
	add	a,#_buff
	mov	r1,a
	mov	ar3,@r1
00128$:
	mov	@r0,ar3
;	cmon51.c:298: if(isspace(buff[j])) buff[j]=0;
	mov	a,r2
	add	a,#_buff
	mov	r0,a
	mov	dpl,@r0
	push	ar2
	lcall	_isspace
	mov	a,dpl
	pop	ar2
	jz	00102$
	mov	a,r2
	add	a,#_buff
	mov	r0,a
	mov	@r0,#0x00
00102$:
;	cmon51.c:299: if(buff[j]=='=')
	mov	a,r2
	add	a,#_buff
	mov	r0,a
	mov	ar3,@r0
	cjne	r3,#0x3D,00107$
;	cmon51.c:301: buff[j]=0;
	mov	@r0,#0x00
;	cmon51.c:302: buff_haseq=1;
	setb	_buff_haseq
	sjmp	00115$
00107$:
;	cmon51.c:304: else if((buff[j]=='.')||(buff[j]=='_'))
	mov	ar3,@r0
	cjne	r3,#0x2E,00150$
	sjmp	00103$
00150$:
	cjne	r3,#0x5F,00115$
00103$:
;	cmon51.c:306: buff[j]=0;
	mov	a,r2
	add	a,#_buff
	mov	r0,a
	mov	@r0,#0x00
;	cmon51.c:307: buff_hasdot=1;
	setb	_buff_hasdot
00115$:
;	cmon51.c:295: for(j=0; j<BUFFSIZE; j++)
	inc	r2
	sjmp	00113$
00116$:
;	cmon51.c:312: for(j=0, k=0; j<BUFFSIZE; j++)
	mov	r2,#0x00
	mov	r3,#0x00
00117$:
	cjne	r3,#0x20,00153$
00153$:
	jnc	00140$
;	cmon51.c:314: buff[k]=buff[j];
	mov	a,r2
	add	a,#_buff
	mov	r0,a
	mov	a,r3
	add	a,#_buff
	mov	r1,a
	mov	ar4,@r1
	mov	@r0,ar4
;	cmon51.c:315: if( ((buff[j]!=0)||(buff[j+1]!=0)) && buff[0]!=0) k++;
	mov	a,r4
	jnz	00112$
	mov	a,r3
	inc	a
	add	a,#_buff
	mov	r0,a
	mov	a,@r0
	jz	00119$
00112$:
	mov	a,_buff
	jz	00119$
	inc	r2
00119$:
;	cmon51.c:312: for(j=0, k=0; j<BUFFSIZE; j++)
	inc	r3
	sjmp	00117$
00140$:
00121$:
;	cmon51.c:317: for(; k<BUFFSIZE; k++) buff[k]=0;
	cjne	r2,#0x20,00158$
00158$:
	jnc	00125$
	mov	a,r2
	add	a,#_buff
	mov	r0,a
	mov	@r0,#0x00
	inc	r2
	sjmp	00121$
00125$:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'getwordn'
;------------------------------------------------------------
;word                      Allocated to registers r2 r3 
;------------------------------------------------------------
;	cmon51.c:321: unsigned int getwordn(void)
;	-----------------------------------------
;	 function getwordn
;	-----------------------------------------
_getwordn:
;	cmon51.c:323: unsigned int word=0;
	mov	r2,#0x00
	mov	r3,#0x00
;	cmon51.c:330: cursor++;
00103$:
;	cmon51.c:325: for( ; buff[cursor]!=0; cursor++)
	mov	a,_cursor
	add	a,#_buff
	mov	r0,a
	mov	ar4,@r0
	cjne	r4,#0x00,00112$
	sjmp	00106$
00112$:
;	cmon51.c:327: if(isxdigit(buff[cursor]))
	mov	dpl,r4
	push	ar2
	push	ar3
	lcall	_isxdigit
	mov	a,dpl
	pop	ar3
	pop	ar2
	jz	00105$
;	cmon51.c:328: word=(word*0x10)+chartohex(buff[cursor]);
	mov	ar4,r2
	mov	a,r3
	swap	a
	anl	a,#0xf0
	xch	a,r4
	swap	a
	xch	a,r4
	xrl	a,r4
	xch	a,r4
	anl	a,#0xf0
	xch	a,r4
	xrl	a,r4
	mov	r5,a
	mov	a,_cursor
	add	a,#_buff
	mov	r0,a
	mov	dpl,@r0
	push	ar4
	push	ar5
	lcall	_chartohex
	mov	r6,dpl
	pop	ar5
	pop	ar4
	mov	r7,#0x00
	mov	a,r6
	add	a,r4
	mov	r2,a
	mov	a,r7
	addc	a,r5
	mov	r3,a
00105$:
;	cmon51.c:325: for( ; buff[cursor]!=0; cursor++)
	inc	_cursor
	sjmp	00103$
00106$:
;	cmon51.c:330: cursor++;
	inc	_cursor
;	cmon51.c:331: return word;
	mov	dpl,r2
	mov	dph,r3
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'showreg'
;------------------------------------------------------------
;val                       Allocated with name '_showreg_PARM_2'
;name                      Allocated to registers r2 r3 r4 
;------------------------------------------------------------
;	cmon51.c:334: void showreg(char * name, unsigned char val)
;	-----------------------------------------
;	 function showreg
;	-----------------------------------------
_showreg:
;	cmon51.c:336: putsp(name);
	lcall	_putsp
;	cmon51.c:337: putc('=');
00101$:
	jbc	_TI,00118$
	sjmp	00101$
00118$:
	mov	_SBUF,#0x3D
;	cmon51.c:338: outbyte(val);
	mov	dpl,_showreg_PARM_2
	lcall	_outbyte
;	cmon51.c:339: putc(' ');
00104$:
	jbc	_TI,00119$
	sjmp	00104$
00119$:
	mov	_SBUF,#0x20
;	cmon51.c:340: putc(' ');
00107$:
	jbc	_TI,00120$
	sjmp	00107$
00120$:
	mov	_SBUF,#0x20
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'disp_regs'
;------------------------------------------------------------
;j                         Allocated to registers r4 
;bank                      Allocated to registers r2 
;------------------------------------------------------------
;	cmon51.c:343: void disp_regs(void)
;	-----------------------------------------
;	 function disp_regs
;	-----------------------------------------
_disp_regs:
;	cmon51.c:347: putnl();
	lcall	_putnl
;	cmon51.c:348: showreg("A ", A_save);
	mov	dptr,#_A_save
	movx	a,@dptr
	mov	_showreg_PARM_2,a
	mov	dptr,#__str_5
	mov	b,#0x80
	lcall	_showreg
;	cmon51.c:349: showreg("B ", B_save);
	mov	dptr,#_B_save
	movx	a,@dptr
	mov	_showreg_PARM_2,a
	mov	dptr,#__str_6
	mov	b,#0x80
	lcall	_showreg
;	cmon51.c:350: showreg("SP", SP_save);
	mov	dptr,#_SP_save
	movx	a,@dptr
	mov	_showreg_PARM_2,a
	mov	dptr,#__str_7
	mov	b,#0x80
	lcall	_showreg
;	cmon51.c:351: showreg("IE", IE_save);
	mov	dptr,#_IE_save
	movx	a,@dptr
	mov	_showreg_PARM_2,a
	mov	dptr,#__str_8
	mov	b,#0x80
	lcall	_showreg
;	cmon51.c:352: showreg("DPH", DPH_save);
	mov	dptr,#_DPH_save
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	_showreg_PARM_2,r2
	mov	dptr,#__str_9
	mov	b,#0x80
	lcall	_showreg
;	cmon51.c:353: showreg("DPL", DPL_save);
	mov	dptr,#_DPL_save
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	_showreg_PARM_2,r2
	mov	dptr,#__str_10
	mov	b,#0x80
	lcall	_showreg
;	cmon51.c:354: showreg("PSW", PSW_save);
	mov	dptr,#_PSW_save
	movx	a,@dptr
	mov	_showreg_PARM_2,a
	mov	dptr,#__str_11
	mov	b,#0x80
	lcall	_showreg
;	cmon51.c:355: putsp("PC=");
	mov	dptr,#__str_12
	mov	b,#0x80
	lcall	_putsp
;	cmon51.c:356: outword(PC_save);
	mov	dptr,#_PC_save
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	mov	dpl,r2
	mov	dph,r3
	lcall	_outword
;	cmon51.c:357: putnl();
	lcall	_putnl
;	cmon51.c:359: bank=(PSW_save/0x8)&0x3;
	mov	dptr,#_PSW_save
	movx	a,@dptr
	swap	a
	rl	a
	anl	a,#0x1f
	mov	r2,a
	anl	ar2,#0x03
;	cmon51.c:360: buff[0]='R';
	mov	_buff,#0x52
;	cmon51.c:361: buff[2]=0;
	mov	(_buff + 0x0002),#0x00
;	cmon51.c:362: for(j=0; j<8; j++)
	mov	a,r2
	swap	a
	rr	a
	anl	a,#0xf8
	mov	r3,a
	mov	r4,#0x00
00104$:
	cjne	r4,#0x08,00115$
00115$:
	jnc	00107$
;	cmon51.c:364: buff[1]='0'+j;
	mov	a,#0x30
	add	a,r4
	mov	(_buff + 0x0001),a
;	cmon51.c:365: showreg(buff, iram_save[j+bank*8]);
	mov	a,r3
	add	a,r4
	add	a,#_iram_save
	mov	dpl,a
	clr	a
	addc	a,#(_iram_save >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	_showreg_PARM_2,a
	mov	dptr,#_buff
	mov	b,#0x40
	push	ar2
	push	ar3
	push	ar4
	lcall	_showreg
	pop	ar4
	pop	ar3
	pop	ar2
;	cmon51.c:362: for(j=0; j<8; j++)
	inc	r4
	sjmp	00104$
00107$:
;	cmon51.c:367: putsp("BANK ");
	mov	dptr,#__str_13
	mov	b,#0x80
	push	ar2
	lcall	_putsp
	pop	ar2
;	cmon51.c:368: putc('0'+bank);
00101$:
	jbc	_TI,00117$
	sjmp	00101$
00117$:
	mov	a,#0x30
	add	a,r2
	mov	_SBUF,a
;	cmon51.c:369: putnl();
	ljmp	_putnl
;------------------------------------------------------------
;Allocation info for local variables in function 'outwordnl'
;------------------------------------------------------------
;val                       Allocated to registers r2 r3 
;------------------------------------------------------------
;	cmon51.c:372: void outwordnl (unsigned int val)
;	-----------------------------------------
;	 function outwordnl
;	-----------------------------------------
_outwordnl:
;	cmon51.c:374: outword(val);
	lcall	_outword
;	cmon51.c:375: putnl();
	ljmp	_putnl
;------------------------------------------------------------
;Allocation info for local variables in function 'nlist'
;------------------------------------------------------------
;slist                     Allocated to registers r2 r3 r4 
;x                         Allocated to registers r5 
;q                         Allocated with name '_nlist_q_1_1'
;sloc0                     Allocated with name '_nlist_sloc0_1_0'
;------------------------------------------------------------
;	cmon51.c:378: unsigned char nlist (unsigned char * slist)
;	-----------------------------------------
;	 function nlist
;	-----------------------------------------
_nlist:
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
;	cmon51.c:380: unsigned char x=0xff, q;
	mov	r5,#0xFF
;	cmon51.c:382: while(*slist)
00106$:
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	r6,a
	jz	00108$
;	cmon51.c:384: if((*slist)>0x7f)
	mov	a,r6
	add	a,#0xff - 0x7F
	jnc	00105$
;	cmon51.c:386: x=*(slist++);
	mov	ar5,r6
	inc	r2
	cjne	r2,#0x00,00129$
	inc	r3
00129$:
;	cmon51.c:387: for(q=0; (*slist<=0x7f) && (*slist==(unsigned char)buff[q]) ; q++) slist++;
	mov	_nlist_sloc0_1_0,r2
	mov	(_nlist_sloc0_1_0 + 1),r3
	mov	(_nlist_sloc0_1_0 + 2),r4
	mov	_nlist_q_1_1,#0x00
00112$:
	mov	dpl,_nlist_sloc0_1_0
	mov	dph,(_nlist_sloc0_1_0 + 1)
	mov	b,(_nlist_sloc0_1_0 + 2)
	lcall	__gptrget
	mov  r7,a
	add	a,#0xff - 0x7F
	jc	00126$
	mov	a,_nlist_q_1_1
	add	a,#_buff
	mov	r0,a
	mov	ar6,@r0
	mov	a,r7
	cjne	a,ar6,00126$
	inc	_nlist_sloc0_1_0
	clr	a
	cjne	a,_nlist_sloc0_1_0,00133$
	inc	(_nlist_sloc0_1_0 + 1)
00133$:
	inc	_nlist_q_1_1
	sjmp	00112$
00126$:
	mov	r2,_nlist_sloc0_1_0
	mov	r3,(_nlist_sloc0_1_0 + 1)
	mov	r4,(_nlist_sloc0_1_0 + 2)
;	cmon51.c:388: if((*slist>0x7f)&&(buff[q]==0)) break;
	mov	dpl,_nlist_sloc0_1_0
	mov	dph,(_nlist_sloc0_1_0 + 1)
	mov	b,(_nlist_sloc0_1_0 + 2)
	lcall	__gptrget
	mov  r6,a
	add	a,#0xff - 0x7F
	jnc	00105$
	mov	a,_nlist_q_1_1
	add	a,#_buff
	mov	r0,a
	mov	a,@r0
	jz	00108$
00105$:
;	cmon51.c:390: slist++;
	inc	r2
	cjne	r2,#0x00,00106$
	inc	r3
	sjmp	00106$
00108$:
;	cmon51.c:392: if(*slist) return x;//Found one!
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	jz	00110$
	mov	dpl,r5
;	cmon51.c:393: return 0xff; //What if a sfr is located at 0xff?
	ret
00110$:
	mov	dpl,#0xFF
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'breakorstep'
;------------------------------------------------------------
;n                         Allocated to registers r2 
;------------------------------------------------------------
;	cmon51.c:396: void breakorstep (void)
;	-----------------------------------------
;	 function breakorstep
;	-----------------------------------------
_breakorstep:
;	cmon51.c:400: gotbreak=0;
	mov	dptr,#_gotbreak
	clr	a
	movx	@dptr,a
;	cmon51.c:401: breakpoint=0;
	clr	_breakpoint
;	cmon51.c:402: if (trace_type)
	mov	dptr,#_trace_type
	movx	a,@dptr
	mov	r2,a
	jnz	00138$
	ljmp	00115$
00138$:
;	cmon51.c:404: if(trace_type==1) //Run in trace mode until a breapoint is hit
	mov	dptr,#_trace_type
	movx	a,@dptr
	mov	r2,a
	cjne	r2,#0x01,00104$
;	cmon51.c:406: for (n=0; n<4; n++)
	mov	r2,#0x00
00119$:
	cjne	r2,#0x04,00141$
00141$:
	jnc	00104$
;	cmon51.c:408: if(br[n]==PC_save)
	mov	a,r2
	add	a,r2
	add	a,#_br
	mov	dpl,a
	clr	a
	addc	a,#(_br >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	mov	dptr,#_PC_save
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	mov	a,r3
	cjne	a,ar5,00121$
	mov	a,r4
	cjne	a,ar6,00121$
;	cmon51.c:410: breakpoint=1;
	setb	_breakpoint
00121$:
;	cmon51.c:406: for (n=0; n<4; n++)
	inc	r2
	sjmp	00119$
00104$:
;	cmon51.c:414: if ((break_address!=PC_save))
	mov	dptr,#_break_address
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	mov	dptr,#_PC_save
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	mov	a,r2
	cjne	a,ar4,00145$
	mov	a,r3
	cjne	a,ar5,00145$
	sjmp	00115$
00145$:
;	cmon51.c:416: if (trace_type>=2)
	mov	dptr,#_trace_type
	movx	a,@dptr
	mov	r2,a
	cjne	r2,#0x02,00146$
00146$:
	jc	00106$
;	cmon51.c:418: discnt=1;
	mov	_discnt,#0x01
	clr	a
	mov	(_discnt + 1),a
;	cmon51.c:419: unassemble(step_start); //The executed assembly instruction...
	mov	dptr,#_step_start
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	mov	dpl,r2
	mov	dph,r3
	lcall	_unassemble
00106$:
;	cmon51.c:421: if((RI==0)&&(breakpoint==0))
	jb	_RI,00115$
	jb	_breakpoint,00115$
;	cmon51.c:423: if(trace_type==3) disp_regs();
	mov	dptr,#_trace_type
	movx	a,@dptr
	mov	r2,a
	cjne	r2,#0x03,00108$
	lcall	_disp_regs
00108$:
;	cmon51.c:424: step_start=PC_save;
	mov	dptr,#_PC_save
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	mov	dptr,#_step_start
	mov	a,r2
	movx	@dptr,a
	inc	dptr
	mov	a,r3
	movx	@dptr,a
;	cmon51.c:425: dostep();
	lcall	_dostep
00115$:
;	cmon51.c:429: if((trace_type>=2) && (RI==0))
	mov	dptr,#_trace_type
	movx	a,@dptr
	mov	r2,a
	cjne	r2,#0x02,00152$
00152$:
	jc	00117$
	jb	_RI,00117$
;	cmon51.c:431: discnt=1;
	mov	_discnt,#0x01
	clr	a
	mov	(_discnt + 1),a
;	cmon51.c:432: unassemble(step_start); //The executed assembly instruction...
	mov	dptr,#_step_start
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	mov	dpl,r2
	mov	dph,r3
	lcall	_unassemble
00117$:
;	cmon51.c:434: RI=0; //So the character does not show in the terminal
	clr	_RI
;	cmon51.c:436: disp_regs();
	lcall	_disp_regs
;	cmon51.c:437: discnt=1;
	mov	_discnt,#0x01
	clr	a
	mov	(_discnt + 1),a
;	cmon51.c:438: unassemble(PC_save); //The next assembly instruction...
	mov	dptr,#_PC_save
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	mov	dpl,r2
	mov	dph,r3
	ljmp	_unassemble
;------------------------------------------------------------
;Allocation info for local variables in function 'do_cmd'
;------------------------------------------------------------
;i                         Allocated with name '_do_cmd_i_1_1'
;j                         Allocated with name '_do_cmd_j_1_1'
;n                         Allocated with name '_do_cmd_n_1_1'
;p                         Allocated to registers r4 r5 
;q                         Allocated with name '_do_cmd_q_1_1'
;c                         Allocated to registers r6 
;d                         Allocated with name '_do_cmd_d_1_1'
;x                         Allocated to registers r7 
;y                         Allocated with name '_do_cmd_y_1_1'
;cmd                       Allocated with name '_do_cmd_cmd_1_1'
;sloc0                     Allocated with name '_do_cmd_sloc0_1_0'
;sloc1                     Allocated with name '_do_cmd_sloc1_1_0'
;------------------------------------------------------------
;	cmon51.c:441: void do_cmd (void)
;	-----------------------------------------
;	 function do_cmd
;	-----------------------------------------
_do_cmd:
;	cmon51.c:448: if (gotbreak!=1) //Power-on reset
	mov	dptr,#_gotbreak
	movx	a,@dptr
	mov	r2,a
	cjne	r2,#0x01,00281$
	sjmp	00102$
00281$:
;	cmon51.c:450: putsp(BANNER);
	mov	dptr,#__str_14
	mov	b,#0x80
	lcall	_putsp
;	cmon51.c:451: cpuid();
	lcall	_cpuid
;	cmon51.c:452: SP_save=7; //Default user stack location
	mov	dptr,#_SP_save
	mov	a,#0x07
	movx	@dptr,a
;	cmon51.c:453: restorePC();
	lcall	_restorePC
;	cmon51.c:454: cmd=0;
	mov	_do_cmd_cmd_1_1,#0x00
	sjmp	00224$
00102$:
;	cmon51.c:456: else breakorstep(); //Got here from the beak/step interrupt
	lcall	_breakorstep
;	cmon51.c:458: while(1)
00224$:
;	cmon51.c:460: putsp("> ");
	mov	dptr,#__str_1
	mov	b,#0x80
	lcall	_putsp
;	cmon51.c:461: fillmem(buff, BUFFSIZE, 0);;
	mov	_fillmem_PARM_2,#0x20
	clr	a
	mov	(_fillmem_PARM_2 + 1),a
	mov	_fillmem_PARM_3,#0x00
	mov	dptr,#_buff
	mov	b,#0x40
	lcall	_fillmem
;	cmon51.c:462: getsn();
	lcall	_getsn
;	cmon51.c:463: cleanbuff();
	lcall	_cleanbuff
;	cmon51.c:464: break_address=0;
	mov	dptr,#_break_address
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	cmon51.c:465: trace_type=0;
	mov	dptr,#_trace_type
	clr	a
	movx	@dptr,a
;	cmon51.c:468: cursor=0;
	mov	_cursor,#0x00
;	cmon51.c:469: getwordn();   //skip the command name
	lcall	_getwordn
;	cmon51.c:470: n=getwordn(); //n is the first parameter/number
	lcall	_getwordn
	mov	_do_cmd_n_1_1,dpl
	mov	(_do_cmd_n_1_1 + 1),dph
;	cmon51.c:471: p=getwordn(); //p is the second parameter/number
	lcall	_getwordn
	mov	r4,dpl
	mov	r5,dph
;	cmon51.c:472: q=getwordn(); //q is the third parameter/number
	push	ar4
	push	ar5
	lcall	_getwordn
	mov	_do_cmd_q_1_1,dpl
	mov	(_do_cmd_q_1_1 + 1),dph
	pop	ar5
	pop	ar4
;	cmon51.c:473: i=n&0xfff0;
	mov	a,#0xF0
	anl	a,_do_cmd_n_1_1
	mov	_do_cmd_i_1_1,a
	mov	(_do_cmd_i_1_1 + 1),(_do_cmd_n_1_1 + 1)
;	cmon51.c:474: j=(p+15)&0xfff0;
	mov	a,#0x0F
	add	a,r4
	mov	r6,a
	clr	a
	addc	a,r5
	mov	r7,a
	mov	a,#0xF0
	anl	a,r6
	mov	_do_cmd_j_1_1,a
	mov	(_do_cmd_j_1_1 + 1),r7
;	cmon51.c:475: c=n; // Sometimes for the first parameter we need an unsigned char
	mov	r6,_do_cmd_n_1_1
;	cmon51.c:477: cmd=nlist(cmdlst)&0x7f;
	mov	dptr,#_cmdlst
	mov	b,#0x80
	push	ar4
	push	ar5
	push	ar6
	lcall	_nlist
	mov	a,dpl
	pop	ar6
	pop	ar5
	pop	ar4
	anl	a,#0x7F
	mov	_do_cmd_cmd_1_1,a
;	cmon51.c:479: switch(cmd)
	mov	a,_do_cmd_cmd_1_1
	mov	r7,a
	add	a,#0xff - 0x24
	jnc	00282$
	ljmp	00155$
00282$:
	mov	a,r7
	add	a,#(00283$-3-.)
	movc	a,@a+pc
	push	acc
	mov	a,r7
	add	a,#(00284$-3-.)
	movc	a,@a+pc
	push	acc
	ret
00283$:
	.db	00105$
	.db	00106$
	.db	00107$
	.db	00108$
	.db	00109$
	.db	00110$
	.db	00111$
	.db	00112$
	.db	00113$
	.db	00114$
	.db	00115$
	.db	00121$
	.db	00122$
	.db	00123$
	.db	00124$
	.db	00125$
	.db	00129$
	.db	00117$
	.db	00133$
	.db	00134$
	.db	00135$
	.db	00136$
	.db	00137$
	.db	00138$
	.db	00139$
	.db	00140$
	.db	00116$
	.db	00120$
	.db	00152$
	.db	00144$
	.db	00145$
	.db	00146$
	.db	00147$
	.db	00151$
	.db	00153$
	.db	00154$
	.db	00104$
00284$:
	.db	00105$>>8
	.db	00106$>>8
	.db	00107$>>8
	.db	00108$>>8
	.db	00109$>>8
	.db	00110$>>8
	.db	00111$>>8
	.db	00112$>>8
	.db	00113$>>8
	.db	00114$>>8
	.db	00115$>>8
	.db	00121$>>8
	.db	00122$>>8
	.db	00123$>>8
	.db	00124$>>8
	.db	00125$>>8
	.db	00129$>>8
	.db	00117$>>8
	.db	00133$>>8
	.db	00134$>>8
	.db	00135$>>8
	.db	00136$>>8
	.db	00137$>>8
	.db	00138$>>8
	.db	00139$>>8
	.db	00140$>>8
	.db	00116$>>8
	.db	00120$>>8
	.db	00152$>>8
	.db	00144$>>8
	.db	00145$>>8
	.db	00146$>>8
	.db	00147$>>8
	.db	00151$>>8
	.db	00153$>>8
	.db	00154$>>8
	.db	00104$>>8
;	cmon51.c:481: case ID_nothing:
00104$:
;	cmon51.c:482: break;
	ljmp	00224$
;	cmon51.c:484: case ID_display_data:
00105$:
;	cmon51.c:485: dispmem(iram_save, 0, 'D');
	clr	a
	mov	_dispmem_PARM_2,a
	mov	(_dispmem_PARM_2 + 1),a
	mov	_dispmem_PARM_3,#0x44
	mov	dptr,#_iram_save
	mov	b,#0x00
	lcall	_dispmem
;	cmon51.c:486: break;
	ljmp	00224$
;	cmon51.c:488: case ID_modify_data:
00106$:
;	cmon51.c:489: modifymem(&iram_save[n&0x7f], 'D');
	mov	a,#0x7F
	anl	a,_do_cmd_n_1_1
	mov	r2,#0x00
	add	a,#_iram_save
	mov	r7,a
	mov	a,r2
	addc	a,#(_iram_save >> 8)
	mov	r2,a
	mov	r3,#0x00
	mov	_modifymem_PARM_2,#0x44
	mov	dpl,r7
	mov	dph,r2
	mov	b,r3
	lcall	_modifymem
;	cmon51.c:490: break;
	ljmp	00224$
;	cmon51.c:492: case ID_fill_data:
00107$:
;	cmon51.c:493: fillmem(&iram_save[n&0x7f], (p>0x80)?0x80:p, (unsigned char) q);
	mov	a,#0x7F
	anl	a,_do_cmd_n_1_1
	mov	r3,#0x00
	add	a,#_iram_save
	mov	r2,a
	mov	a,r3
	addc	a,#(_iram_save >> 8)
	mov	r3,a
	mov	r7,#0x00
	clr	c
	mov	a,#0x80
	subb	a,r4
	clr	a
	subb	a,r5
	jnc	00232$
	mov	_do_cmd_sloc0_1_0,#0x80
	clr	a
	mov	(_do_cmd_sloc0_1_0 + 1),a
	sjmp	00233$
00232$:
	mov	_do_cmd_sloc0_1_0,r4
	mov	(_do_cmd_sloc0_1_0 + 1),r5
00233$:
	mov	_fillmem_PARM_3,_do_cmd_q_1_1
	mov	_fillmem_PARM_2,_do_cmd_sloc0_1_0
	mov	(_fillmem_PARM_2 + 1),(_do_cmd_sloc0_1_0 + 1)
	mov	dpl,r2
	mov	dph,r3
	mov	b,r7
	lcall	_fillmem
;	cmon51.c:494: break;
	ljmp	00224$
;	cmon51.c:496: case ID_display_idata:
00108$:
;	cmon51.c:497: dispmem((unsigned char data *)(0x80), 0, 'I');
	mov	r2,#0x80
	mov	r3,#0x00
	mov	r7,#0x40
	clr	a
	mov	_dispmem_PARM_2,a
	mov	(_dispmem_PARM_2 + 1),a
	mov	_dispmem_PARM_3,#0x49
	mov	dpl,r2
	mov	dph,r3
	mov	b,r7
	lcall	_dispmem
;	cmon51.c:498: break;
	ljmp	00224$
;	cmon51.c:500: case ID_modify_idata:
00109$:
;	cmon51.c:501: modifymem((unsigned char data *)((n&0x7f)|0x80), 'I');
	mov	a,#0x7F
	anl	a,_do_cmd_n_1_1
	mov	r2,a
	orl	ar2,#0x80
	mov	r3,#0x00
	mov	r7,#0x40
	mov	_modifymem_PARM_2,#0x49
	mov	dpl,r2
	mov	dph,r3
	mov	b,r7
	lcall	_modifymem
;	cmon51.c:502: break;
	ljmp	00224$
;	cmon51.c:504: case ID_fill_idata:
00110$:
;	cmon51.c:505: fillmem((unsigned char data *)((n&0x7f)|0x80), p>0x80?0x80:p, (unsigned char) q);
	mov	a,#0x7F
	anl	a,_do_cmd_n_1_1
	mov	r2,a
	orl	ar2,#0x80
	mov	r3,#0x00
	mov	r7,#0x40
	clr	c
	mov	a,#0x80
	subb	a,r4
	clr	a
	subb	a,r5
	jnc	00234$
	mov	_do_cmd_sloc0_1_0,#0x80
	clr	a
	mov	(_do_cmd_sloc0_1_0 + 1),a
	sjmp	00235$
00234$:
	mov	_do_cmd_sloc0_1_0,r4
	mov	(_do_cmd_sloc0_1_0 + 1),r5
00235$:
	mov	_fillmem_PARM_3,_do_cmd_q_1_1
	mov	_fillmem_PARM_2,_do_cmd_sloc0_1_0
	mov	(_fillmem_PARM_2 + 1),(_do_cmd_sloc0_1_0 + 1)
	mov	dpl,r2
	mov	dph,r3
	mov	b,r7
	lcall	_fillmem
;	cmon51.c:506: break;
	ljmp	00224$
;	cmon51.c:508: case ID_display_xdata:
00111$:
;	cmon51.c:509: dispmem((unsigned char xdata *)i, j, 'X');
	mov	r2,_do_cmd_i_1_1
	mov	r3,(_do_cmd_i_1_1 + 1)
	mov	r7,#0x00
	mov	_dispmem_PARM_2,_do_cmd_j_1_1
	mov	(_dispmem_PARM_2 + 1),(_do_cmd_j_1_1 + 1)
	mov	_dispmem_PARM_3,#0x58
	mov	dpl,r2
	mov	dph,r3
	mov	b,r7
	lcall	_dispmem
;	cmon51.c:510: break;
	ljmp	00224$
;	cmon51.c:512: case ID_modify_xdata:
00112$:
;	cmon51.c:513: modifymem((unsigned char xdata *)n, 'X');
	mov	r2,_do_cmd_n_1_1
	mov	r3,(_do_cmd_n_1_1 + 1)
	mov	r7,#0x00
	mov	_modifymem_PARM_2,#0x58
	mov	dpl,r2
	mov	dph,r3
	mov	b,r7
	lcall	_modifymem
;	cmon51.c:514: break;
	ljmp	00224$
;	cmon51.c:516: case ID_fill_xdata:
00113$:
;	cmon51.c:517: fillmem((unsigned char xdata *)n, p, (unsigned char)q);
	mov	r2,_do_cmd_n_1_1
	mov	r3,(_do_cmd_n_1_1 + 1)
	mov	r7,#0x00
	mov	_fillmem_PARM_3,_do_cmd_q_1_1
	mov	_fillmem_PARM_2,r4
	mov	(_fillmem_PARM_2 + 1),r5
	mov	dpl,r2
	mov	dph,r3
	mov	b,r7
	lcall	_fillmem
;	cmon51.c:518: break;
	ljmp	00224$
;	cmon51.c:520: case ID_display_code:
00114$:
;	cmon51.c:521: dispmem((unsigned char code *)i, j, 'C');
	mov	r2,_do_cmd_i_1_1
	mov	r3,(_do_cmd_i_1_1 + 1)
	mov	r7,#0x80
	mov	_dispmem_PARM_2,_do_cmd_j_1_1
	mov	(_dispmem_PARM_2 + 1),(_do_cmd_j_1_1 + 1)
	mov	_dispmem_PARM_3,#0x43
	mov	dpl,r2
	mov	dph,r3
	mov	b,r7
	lcall	_dispmem
;	cmon51.c:522: break;
	ljmp	00224$
;	cmon51.c:524: case ID_unassemble:
00115$:
;	cmon51.c:525: discnt=p;
	mov	_discnt,r4
	mov	(_discnt + 1),r5
;	cmon51.c:526: unassemble(n);
	mov	dpl,_do_cmd_n_1_1
	mov	dph,(_do_cmd_n_1_1 + 1)
	lcall	_unassemble
;	cmon51.c:527: break;
	ljmp	00224$
;	cmon51.c:529: case ID_trace_reg:
00116$:
;	cmon51.c:530: trace_type++;
	mov	dptr,#_trace_type
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
;	cmon51.c:532: case ID_trace:
00117$:
;	cmon51.c:533: trace_type++;
	mov	dptr,#_trace_type
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
;	cmon51.c:534: if(n==0) break;
	mov	a,_do_cmd_n_1_1
	orl	a,(_do_cmd_n_1_1 + 1)
	jnz	00287$
	ljmp	00224$
00287$:
;	cmon51.c:535: break_address=n;
	mov	dptr,#_break_address
	mov	a,_do_cmd_n_1_1
	movx	@dptr,a
	inc	dptr
	mov	a,(_do_cmd_n_1_1 + 1)
	movx	@dptr,a
;	cmon51.c:536: n=0;
	clr	a
	mov	_do_cmd_n_1_1,a
	mov	(_do_cmd_n_1_1 + 1),a
;	cmon51.c:538: case ID_go_breaks:
00120$:
;	cmon51.c:539: trace_type++;
	mov	dptr,#_trace_type
	movx	a,@dptr
	add	a,#0x01
	movx	@dptr,a
;	cmon51.c:541: case ID_go:
00121$:
;	cmon51.c:542: case ID_step:
00122$:
;	cmon51.c:543: step_start=(n==0)?PC_save:n; //Next instruction to be executed
	mov	a,_do_cmd_n_1_1
	orl	a,(_do_cmd_n_1_1 + 1)
	cjne	a,#0x01,00288$
00288$:
	clr	a
	rlc	a
	mov	r2,a
	jz	00236$
	mov	dptr,#_PC_save
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	sjmp	00237$
00236$:
	mov	r2,_do_cmd_n_1_1
	mov	r3,(_do_cmd_n_1_1 + 1)
00237$:
	mov	dptr,#_step_start
	mov	a,r2
	movx	@dptr,a
	inc	dptr
	mov	a,r3
	movx	@dptr,a
;	cmon51.c:544: gotbreak=0; //If changes to 1, the single step function worked!
	mov	dptr,#_gotbreak
	clr	a
	movx	@dptr,a
;	cmon51.c:545: gostep=(cmd==ID_go)?1:0;
	mov	a,#0x0B
	cjne	a,_do_cmd_cmd_1_1,00238$
	mov	r2,#0x01
	sjmp	00239$
00238$:
	mov	r2,#0x00
00239$:
	mov	dptr,#_gostep
	mov	a,r2
	movx	@dptr,a
;	cmon51.c:546: dostep();
	lcall	_dostep
;	cmon51.c:547: break;
	ljmp	00224$
;	cmon51.c:549: case ID_registers:
00123$:
;	cmon51.c:550: disp_regs();
	lcall	_disp_regs
;	cmon51.c:551: break;
	ljmp	00224$
;	cmon51.c:553: case ID_load:
00124$:
;	cmon51.c:554: loadintelhex();
	lcall	_loadintelhex
;	cmon51.c:555: break;
	ljmp	00224$
;	cmon51.c:557: case ID_reg_dptr:
00125$:
;	cmon51.c:558: if(buff_haseq)
	jnb	_buff_haseq,00127$
;	cmon51.c:560: DPL_save=c;
	mov	dptr,#_DPL_save
	mov	a,r6
	movx	@dptr,a
	inc	dptr
	clr	a
	movx	@dptr,a
;	cmon51.c:561: DPH_save=highof(n);
	mov	r2,(_do_cmd_n_1_1 + 1)
	mov	r3,#0x00
	mov	dptr,#_DPH_save
	mov	a,r2
	movx	@dptr,a
	inc	dptr
	mov	a,r3
	movx	@dptr,a
	ljmp	00224$
00127$:
;	cmon51.c:563: else outwordnl((DPH_save*0x100)+DPL_save);
	mov	dptr,#_DPH_save
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	(_do_cmd_sloc0_1_0 + 1),r2
	mov	_do_cmd_sloc0_1_0,#0x00
	mov	dptr,#_DPL_save
	movx	a,@dptr
	mov	r7,a
	inc	dptr
	movx	a,@dptr
	mov	r2,a
	mov	a,r7
	add	a,_do_cmd_sloc0_1_0
	mov	dpl,a
	mov	a,r2
	addc	a,(_do_cmd_sloc0_1_0 + 1)
	mov	dph,a
	lcall	_outwordnl
;	cmon51.c:564: break;
	ljmp	00224$
;	cmon51.c:566: case ID_reg_pc:
00129$:
;	cmon51.c:567: if(buff_haseq) PC_save=n;
	jnb	_buff_haseq,00131$
	mov	dptr,#_PC_save
	mov	a,_do_cmd_n_1_1
	movx	@dptr,a
	inc	dptr
	mov	a,(_do_cmd_n_1_1 + 1)
	movx	@dptr,a
	ljmp	00224$
00131$:
;	cmon51.c:568: else outwordnl(PC_save);
	mov	dptr,#_PC_save
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	mov	dpl,r2
	mov	dph,r3
	lcall	_outwordnl
;	cmon51.c:569: break;
	ljmp	00224$
;	cmon51.c:571: case ID_reg_r0:
00133$:
;	cmon51.c:572: case ID_reg_r1:
00134$:
;	cmon51.c:573: case ID_reg_r2:
00135$:
;	cmon51.c:574: case ID_reg_r3:
00136$:
;	cmon51.c:575: case ID_reg_r4:
00137$:
;	cmon51.c:576: case ID_reg_r5:
00138$:
;	cmon51.c:577: case ID_reg_r6:
00139$:
;	cmon51.c:578: case ID_reg_r7:
00140$:
;	cmon51.c:579: d=(PSW_save&0x18)+buff[1]-'0';
	mov	dptr,#_PSW_save
	movx	a,@dptr
	mov	r2,a
	anl	ar2,#0x18
	mov	a,(_buff + 0x0001)
	add	a,r2
	add	a,#0xd0
	mov	r2,a
;	cmon51.c:580: if(buff_haseq) iram_save[d]=c;
	jnb	_buff_haseq,00142$
	mov	a,r2
	add	a,#_iram_save
	mov	dpl,a
	clr	a
	addc	a,#(_iram_save >> 8)
	mov	dph,a
	mov	a,r6
	movx	@dptr,a
	ljmp	00224$
00142$:
;	cmon51.c:581: else { outbyte (iram_save[d]); putnl(); };
	mov	a,r2
	add	a,#_iram_save
	mov	dpl,a
	clr	a
	addc	a,#(_iram_save >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	dpl,a
	lcall	_outbyte
	lcall	_putnl
;	cmon51.c:582: break;
	ljmp	00224$
;	cmon51.c:584: case ID_br0:
00144$:
;	cmon51.c:585: case ID_br1:
00145$:
;	cmon51.c:586: case ID_br2:
00146$:
;	cmon51.c:587: case ID_br3:
00147$:
;	cmon51.c:588: d=buff[2]-'0';
	mov	a,(_buff + 0x0002)
	add	a,#0xd0
	mov	r2,a
;	cmon51.c:589: if(buff_haseq) br[d]=n;
	jnb	_buff_haseq,00149$
	mov	a,r2
	add	a,r2
	mov	r3,a
	add	a,#_br
	mov	dpl,a
	clr	a
	addc	a,#(_br >> 8)
	mov	dph,a
	mov	a,_do_cmd_n_1_1
	movx	@dptr,a
	inc	dptr
	mov	a,(_do_cmd_n_1_1 + 1)
	movx	@dptr,a
	ljmp	00224$
00149$:
;	cmon51.c:590: else outwordnl(br[d]);
	mov	a,r2
	add	a,r2
	add	a,#_br
	mov	dpl,a
	clr	a
	addc	a,#(_br >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dpl,r3
	mov	dph,r7
	lcall	_outwordnl
;	cmon51.c:591: break;
	ljmp	00224$
;	cmon51.c:593: case ID_br:
00151$:
;	cmon51.c:594: for(d=0; d<4; d++) outwordnl(br[d]);
	mov	_do_cmd_d_1_1,#0x00
00226$:
	mov	a,#0x100 - 0x04
	add	a,_do_cmd_d_1_1
	jnc	00296$
	ljmp	00224$
00296$:
	mov	a,_do_cmd_d_1_1
	add	a,_do_cmd_d_1_1
	add	a,#_br
	mov	dpl,a
	clr	a
	addc	a,#(_br >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r7,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	mov	dpl,r7
	mov	dph,r3
	lcall	_outwordnl
	inc	_do_cmd_d_1_1
;	cmon51.c:597: case ID_rst:
	sjmp	00226$
00152$:
;	cmon51.c:598: fillmem((unsigned char data *)br, 8, 0);
	mov	r3,#_br
	mov	_do_cmd_sloc1_1_0,r3
	mov	(_do_cmd_sloc1_1_0 + 1),#0x00
	mov	(_do_cmd_sloc1_1_0 + 2),#0x40
	mov	_fillmem_PARM_2,#0x08
	clr	a
	mov	(_fillmem_PARM_2 + 1),a
	mov	_fillmem_PARM_3,#0x00
	mov	dpl,_do_cmd_sloc1_1_0
	mov	dph,(_do_cmd_sloc1_1_0 + 1)
	mov	b,(_do_cmd_sloc1_1_0 + 2)
	lcall	_fillmem
;	cmon51.c:628: __endasm;
	
	                    clr a
	                    mov ie, a
	                    mov tcon, a
	                    mov t2con, a
	                    mov scon, a
	                    mov b, a
	                    mov sp, a
	                    mov psw, a
	                    mov th0, a
	                    mov tl0, a
	                    mov th1, a
	                    mov tl1, a
	                    mov tmod, a
	                    mov rcap2h, a
	                    mov rcap2l, a
	                    mov tl2, a
	                    mov th2, a
	                    mov ip, a
	                    mov dptr,#0x0000
	                    cpl a
	                    mov p0, a
	                    mov p1, a
	                    mov p2, a
	                    mov p3, a
	                    anl ip, #0x0C
	                    anl pcon, #0x70
	                    clr a
	                    jmp @a+dptr
	                
;	cmon51.c:630: case ID_brc:
00153$:
;	cmon51.c:631: fillmem((unsigned char *)br, 8, 0);
	mov	_fillmem_PARM_2,#0x08
	clr	a
	mov	(_fillmem_PARM_2 + 1),a
	mov	_fillmem_PARM_3,#0x00
	mov	dptr,#_br
	mov	b,#0x00
	lcall	_fillmem
;	cmon51.c:632: break;
	ljmp	00224$
;	cmon51.c:634: case ID_pcr:  //Restore the PC
00154$:
;	cmon51.c:635: restorePC();
	lcall	_restorePC
;	cmon51.c:636: break;
	ljmp	00224$
;	cmon51.c:638: default:
00155$:
;	cmon51.c:640: y=nlist(bitn); //Search for bit names first
	mov	dptr,#_bitn
	mov	b,#0x80
	push	ar4
	push	ar5
	push	ar6
	lcall	_nlist
	mov	_do_cmd_y_1_1,dpl
	pop	ar6
	pop	ar5
	pop	ar4
;	cmon51.c:641: if (y!=0xff)
	mov	a,#0xFF
	cjne	a,_do_cmd_y_1_1,00297$
	sjmp	00159$
00297$:
;	cmon51.c:643: x=y&0xf8;
	mov	a,#0xF8
	anl	a,_do_cmd_y_1_1
	mov	r7,a
;	cmon51.c:644: y=maskbit[y&0x7];
	mov	a,#0x07
	anl	a,_do_cmd_y_1_1
	mov	dptr,#_maskbit
	movc	a,@a+dptr
	mov	_do_cmd_y_1_1,a
	sjmp	00160$
00159$:
;	cmon51.c:648: x=nlist(sfrn); //Is not a bit, try a sfr
	mov	dptr,#_sfrn
	mov	b,#0x80
	push	ar4
	push	ar5
	push	ar6
	lcall	_nlist
	mov	r7,dpl
	pop	ar6
	pop	ar5
	pop	ar4
;	cmon51.c:649: if(buff_hasdot)
	jnb	_buff_hasdot,00160$
;	cmon51.c:651: y=maskbit[c&0x7];
	mov	a,#0x07
	anl	a,r6
	mov	dptr,#_maskbit
	movc	a,@a+dptr
	mov	_do_cmd_y_1_1,a
;	cmon51.c:652: c=p;
	mov	ar6,r4
00160$:
;	cmon51.c:656: if(x!=0xff)
	cjne	r7,#0xFF,00299$
	ljmp	00220$
00299$:
;	cmon51.c:659: /**/ if (x==0xd0) d=PSW_save;
	clr	a
	cjne	r7,#0xD0,00300$
	inc	a
00300$:
	mov	r4,a
	jz	00180$
	mov	dptr,#_PSW_save
	movx	a,@dptr
	mov	r2,a
	sjmp	00181$
00180$:
;	cmon51.c:660: else if (x==0xe0) d=A_save;
	cjne	r7,#0xE0,00177$
	mov	dptr,#_A_save
	movx	a,@dptr
	mov	r2,a
	sjmp	00181$
00177$:
;	cmon51.c:661: else if (x==0xf0) d=B_save;
	cjne	r7,#0xF0,00174$
	mov	dptr,#_B_save
	movx	a,@dptr
	mov	r2,a
	sjmp	00181$
00174$:
;	cmon51.c:662: else if (x==0xa8) d=IE_save;
	cjne	r7,#0xA8,00171$
	mov	dptr,#_IE_save
	movx	a,@dptr
	mov	r2,a
	sjmp	00181$
00171$:
;	cmon51.c:663: else if (x==0x81) d=SP_save;
	cjne	r7,#0x81,00168$
	mov	dptr,#_SP_save
	movx	a,@dptr
	mov	r2,a
	sjmp	00181$
00168$:
;	cmon51.c:664: else if (x==0x82) d=DPL_save;
	cjne	r7,#0x82,00165$
	mov	dptr,#_DPL_save
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	mov	ar2,r5
	sjmp	00181$
00165$:
;	cmon51.c:665: else if (x==0x83) d=DPH_save;
	cjne	r7,#0x83,00162$
	mov	dptr,#_DPH_save
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	mov	ar2,r3
	sjmp	00181$
00162$:
;	cmon51.c:666: else d=read_sfr(x);
	mov	dpl,r7
	push	ar4
	push	ar6
	push	ar7
	lcall	_read_sfr
	mov	r2,dpl
	pop	ar7
	pop	ar6
	pop	ar4
00181$:
;	cmon51.c:669: if(y!=0xff)
	mov	a,#0xFF
	cjne	a,_do_cmd_y_1_1,00315$
	mov	a,#0x01
	sjmp	00316$
00315$:
	clr	a
00316$:
	mov	r3,a
	jnz	00186$
;	cmon51.c:671: if(c) c=d|y;
	mov	a,r6
	jz	00183$
	mov	a,_do_cmd_y_1_1
	orl	a,r2
	mov	r6,a
	sjmp	00186$
00183$:
;	cmon51.c:672: else c=d&(~y);
	mov	a,_do_cmd_y_1_1
	cpl	a
	mov	r5,a
	anl	a,r2
	mov	r6,a
00186$:
;	cmon51.c:676: if(x==0xB0) c=(P3&0x3)|(c&0xfc);
	cjne	r7,#0xB0,00188$
	mov	a,#0x03
	anl	a,_P3
	mov	r5,a
	mov	a,#0xFC
	anl	a,r6
	orl	a,r5
	mov	r6,a
00188$:
;	cmon51.c:679: if(buff_haseq)
	jnb	_buff_haseq,00217$
;	cmon51.c:681: /**/ if (x==0xd0) PSW_save=c;
	mov	a,r4
	jz	00208$
	mov	dptr,#_PSW_save
	mov	a,r6
	movx	@dptr,a
	ljmp	00224$
00208$:
;	cmon51.c:682: else if (x==0xe0) A_save=c;
	cjne	r7,#0xE0,00205$
	mov	dptr,#_A_save
	mov	a,r6
	movx	@dptr,a
	ljmp	00224$
00205$:
;	cmon51.c:683: else if (x==0xf0) B_save=c;
	cjne	r7,#0xF0,00202$
	mov	dptr,#_B_save
	mov	a,r6
	movx	@dptr,a
	ljmp	00224$
00202$:
;	cmon51.c:684: else if (x==0xa8) IE_save=c;
	cjne	r7,#0xA8,00199$
	mov	dptr,#_IE_save
	mov	a,r6
	movx	@dptr,a
	ljmp	00224$
00199$:
;	cmon51.c:685: else if (x==0x81) SP_save=c;
	cjne	r7,#0x81,00196$
	mov	dptr,#_SP_save
	mov	a,r6
	movx	@dptr,a
	ljmp	00224$
00196$:
;	cmon51.c:686: else if (x==0x82) DPL_save=c;
	cjne	r7,#0x82,00193$
	mov	dptr,#_DPL_save
	mov	a,r6
	movx	@dptr,a
	inc	dptr
	clr	a
	movx	@dptr,a
	ljmp	00224$
00193$:
;	cmon51.c:687: else if (x==0x83) DPH_save=c;
	cjne	r7,#0x83,00190$
	mov	dptr,#_DPH_save
	mov	a,r6
	movx	@dptr,a
	inc	dptr
	clr	a
	movx	@dptr,a
	ljmp	00224$
00190$:
;	cmon51.c:688: else write_sfr(c);
	mov	dpl,r6
	lcall	_write_sfr
	ljmp	00224$
00217$:
;	cmon51.c:692: if(y==0xff)
	mov	a,r3
	jz	00210$
;	cmon51.c:693: outbyte(d);
	mov	dpl,r2
	lcall	_outbyte
;	cmon51.c:695: putc((d&y)?'1':'0');
	sjmp	00215$
00210$:
	jbc	_TI,00336$
	sjmp	00210$
00336$:
	mov	a,_do_cmd_y_1_1
	anl	a,r2
	jz	00240$
	mov	r2,#0x31
	sjmp	00241$
00240$:
	mov	r2,#0x30
00241$:
	mov	_SBUF,r2
00215$:
;	cmon51.c:696: putnl();
	lcall	_putnl
	ljmp	00224$
00220$:
;	cmon51.c:699: else putsp("What?\n");
	mov	dptr,#__str_15
	mov	b,#0x80
	lcall	_putsp
;	cmon51.c:701: }
	ljmp	00224$
	.area CSEG    (CODE)
	.area CONST   (CODE)
_cmdlst:
	.db 0x80
	.ascii "D"
	.db 0x81
	.ascii "MD"
	.db 0x82
	.ascii "FD"
	.db 0x83
	.ascii "I"
	.db 0x84
	.ascii "MI"
	.db 0x85
	.ascii "FI"
	.db 0x86
	.ascii "X"
	.db 0x87
	.ascii "MX"
	.db 0x88
	.ascii "FX"
	.db 0x89
	.ascii "C"
	.db 0x8A
	.ascii "U"
	.db 0x8B
	.ascii "G"
	.db 0x8C
	.ascii "S"
	.db 0x8D
	.ascii "R"
	.db 0x8E
	.ascii "L"
	.db 0x8F
	.ascii "DPTR"
	.db 0x90
	.ascii "PC"
	.db 0x91
	.ascii "T"
	.db 0x92
	.ascii "R0"
	.db 0x93
	.ascii "R1"
	.db 0x94
	.ascii "R2"
	.db 0x95
	.ascii "R3"
	.db 0x96
	.ascii "R"
	.ascii "4"
	.db 0x97
	.ascii "R5"
	.db 0x98
	.ascii "R6"
	.db 0x99
	.ascii "R7"
	.db 0x9A
	.ascii "TR"
	.db 0x9B
	.ascii "GB"
	.db 0x9C
	.ascii "RST"
	.db 0x9D
	.ascii "BR0"
	.db 0x9E
	.ascii "BR1"
	.db 0x9F
	.ascii "BR2"
	.db 0xA0
	.ascii "BR3"
	.db 0xA1
	.ascii "BR"
	.db 0xA2
	.ascii "BRC"
	.db 0xA3
	.ascii "PCR"
	.db 0xA4
	.db 0xA5
	.db 0x00
	.db 0x00
_hexval:
	.ascii "0123456789ABCDEF"
	.db 0x00
_maskbit:
	.db #0x01
	.db #0x02
	.db #0x04
	.db #0x08
	.db #0x10
	.db #0x20
	.db #0x40
	.db #0x80
__str_0:
	.db 0x08
	.ascii " "
	.db 0x08
	.db 0x00
__str_1:
	.ascii "> "
	.db 0x00
__str_2:
	.ascii "<Space>=line <Enter>=page <ESC>=stop"
	.db 0x0D
	.db 0x00
__str_3:
	.ascii ":  "
	.db 0x00
__str_4:
	.ascii "   "
	.db 0x00
__str_5:
	.ascii "A "
	.db 0x00
__str_6:
	.ascii "B "
	.db 0x00
__str_7:
	.ascii "SP"
	.db 0x00
__str_8:
	.ascii "IE"
	.db 0x00
__str_9:
	.ascii "DPH"
	.db 0x00
__str_10:
	.ascii "DPL"
	.db 0x00
__str_11:
	.ascii "PSW"
	.db 0x00
__str_12:
	.ascii "PC="
	.db 0x00
__str_13:
	.ascii "BANK "
	.db 0x00
__str_14:
	.db 0x0A
	.db 0x0A
	.ascii "CMON51 V1.2"
	.db 0x0A
	.ascii "CopyRight (c) 2005, 2006 Jesus Calvino-Fraga"
	.db 0x0A
	.ascii "C"
	.ascii "hanged by Thiago Schimuneck in 2012"
	.db 0x0A
	.db 0x00
__str_15:
	.ascii "What?"
	.db 0x0A
	.db 0x00
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
