;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Feb  3 2010) (UNIX)
; This file was generated Wed Jul 10 23:43:18 2013
;--------------------------------------------------------
	.module step
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _dostep
	.globl _step_and_break
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (DATA)
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (DATA)
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	.area OSEG    (OVR,DATA)
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
;Allocation info for local variables in function 'step_and_break'
;------------------------------------------------------------
;------------------------------------------------------------
;	step.c:39: void step_and_break (void) _naked
;	-----------------------------------------
;	 function step_and_break
;	-----------------------------------------
_step_and_break:
;	naked function: no prologue.
;	step.c:122: _endasm;
	
	  clr ET1 ; Disable timer 1 interrupt (just in case!)
	
     ; Save the IE register and disable interrupts ASAP since the user code
     ; may have interrupts running which may modify the internal RAM
	        push IE
	  clr EA
	        clr ES
	
        ; Save the user DPTR on the stack so it can be used to address XRAM.
	        push DPH
	        push DPL
	
        ; Save user program registers
	        mov DPTR,#_A_save
	        movx @DPTR,A
	
	        mov DPTR,#_PSW_save
	        mov A,PSW
	        movx @DPTR,A
	
	        mov DPTR,#_B_save
	        mov A,B
	        movx @DPTR,A
	
	        mov DPTR,#_DPL_save
	        pop ACC
	        movx @DPTR,A
	        mov DPTR,#_DPH_save
	        pop ACC
	        movx @DPTR,A
	
	        mov DPTR,#_IE_save
	        pop ACC
	        movx @DPTR,A
	
        ;The address of the next instrurtion is in the stack
	        mov DPTR,#_PC_save+1
	        pop ACC
	        movx @DPTR,A
	        mov DPTR,#_PC_save
	        pop ACC
	        movx @DPTR,A
	
        ;NOW we can save the user stack pointer
	        mov DPTR,#_SP_save
	        mov A,SP
	        movx @DPTR,A
	
        ; Save the user internal ram.
	        mov DPTR,#_iram_save
	        mov PSW,#0 ; Select register bank 0.
	        mov A,R0 ; Save R0.
	        movx @DPTR,A
	        mov R0,#1
	sab_l:
	        inc DPTR
	        mov A,@R0
	        movx @DPTR,A
	        inc R0
	        cjne R0,#128,sab_l
	
        ;Tell the monitor that the code got here
	        mov DPTR,#_gotbreak
	        mov A,#1
	        movx @DPTR,A
	
        ; Now the tricky part... going back to the monitor
	
        ; Initialize the monitor stack
	        mov sp,#__start__stack - 1
	
        ; Call the monitor hardware initialization
	        lcall __sdcc_external_startup
	
        ; Notice that crt0 initialization is skiped, otherwise the expanded RAM
        ; variables holding important variables will be clear.
	
        ; Go directly to the main routine
	        ljmp __sdcc_program_startup
	
	    
;	naked function: no epilogue.
;------------------------------------------------------------
;Allocation info for local variables in function 'dostep'
;------------------------------------------------------------
;------------------------------------------------------------
;	step.c:126: void dostep (void) _naked
;	-----------------------------------------
;	 function dostep
;	-----------------------------------------
_dostep:
;	naked function: no prologue.
;	step.c:210: _endasm;
	
        ; Restore the user internal ram.
	        mov R0,#127
	        mov DPTR,#(_iram_save+127)
	ds_l:
	        movx A,@DPTR
	        mov @R0,A
	        dec DPL
	        djnz R0,ds_l
	        movx A,@DPTR
	        mov @R0,A
	
        ; Restore user registers
	        mov DPTR,#_IE_save
	        movx A,@DPTR
	        mov IE, A
	
	        mov DPTR,#_B_save
	        movx A,@DPTR
	        mov B,A
	
	        mov DPTR,#_PSW_save
	        movx A,@DPTR
	        mov PSW,A
	
	        mov DPTR,#_SP_save
	        movx A,@DPTR
	        mov SP,A
	
  ;Put the user code start in the stack. The reti or ret at the end will get us there.
	        mov DPTR,#_step_start
	        movx A,@DPTR
	        push ACC
	        inc DPTR
	        movx A,@DPTR
	        push ACC
	
	        mov DPTR,#_DPL_save
	        movx A,@DPTR
	        push ACC
	        mov DPTR,#_DPH_save
	        movx A,@DPTR
	        push ACC
	
        ; Here use the accumulator to check if it is a go or a step
	        mov DPTR,#_gostep ; 1 is "go" 0 is step
	        movx A,@DPTR
	        jz ds_2
	
	        setb EA
	        setb ES
	
        ; go - restore the user accumulator.
	        mov DPTR,#_A_save
	        movx A,@DPTR
	
        ; and pop the user DPTR from the stack.
	        pop DPH
	        pop DPL
	
	        reti
	
	ds_2:
        ; step - restore the user accumulator.
	        mov DPTR,#_A_save
	        movx A,@DPTR
	
        ; pop the user DPTR from the user stack.
	        pop DPH
	        pop DPL
	
        ; Set up the timer 1 interrupt.
	
        ;Timer 1 must have the highest priority, otherwise in step by step
        ;execution instructions may look as if they are skept when interrupts
        ;of a higher priority are served. Since this is microcontroller dependent
        ;have it at the microcotnroller file (8052.c for example)
	        lcall _set_timer1_priority
	        setb EA ; enable interrupts
	        setb IT1 ; force timer 1 interrupt
	        setb ET1 ; Enable timer 1 interrupt
	        reti ; 'Return' to the user.
;	naked function: no epilogue.
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
