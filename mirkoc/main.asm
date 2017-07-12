_initProg:
;main.c,11 :: 		void initProg()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;main.c,13 :: 		InitTimerUs();
BL	_InitTimerUs+0
;main.c,14 :: 		InitTimerMs();
BL	_InitTimerMs+0
;main.c,15 :: 		initLCD();
BL	_initLCD+0
;main.c,17 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_15|_GPIO_PINMASK_12);
MOVW	R1, #36864
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;main.c,18 :: 		}
L_end_initProg:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _initProg
_main:
;main.c,20 :: 		void main() {
SUB	SP, SP, #4
;main.c,21 :: 		initProg();
BL	_initProg+0
;main.c,22 :: 		USART2_Init();
BL	_USART2_Init+0
;main.c,23 :: 		while(1)
L_main0:
;main.c,25 :: 		temp=calcTemp();
BL	_calcTemp+0
MOVW	R0, #lo_addr(_temp+0)
MOVT	R0, #hi_addr(_temp+0)
STR	R0, [SP, #0]
VSTR	#1, S0, [R0, #0]
;main.c,26 :: 		hum=calcHumTemp(1);
MOVS	R0, #1
BL	_calcHumTemp+0
MOVW	R0, #lo_addr(_hum+0)
MOVT	R0, #hi_addr(_hum+0)
VSTR	#1, S0, [R0, #0]
;main.c,27 :: 		showTempLCD(temp, hum);
VMOV.F32	S1, S0
LDR	R0, [SP, #0]
VLDR	#1, S0, [R0, #0]
BL	_showTempLCD+0
;main.c,30 :: 		LD2=1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR15_GPIOE_ODR_bit+0)
MOVT	R0, #hi_addr(ODR15_GPIOE_ODR_bit+0)
STR	R1, [R0, #0]
;main.c,31 :: 		my_Delay_ms(3000);
MOVW	R0, #3000
BL	_my_Delay_ms+0
;main.c,32 :: 		LD2=0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR15_GPIOE_ODR_bit+0)
MOVT	R0, #hi_addr(ODR15_GPIOE_ODR_bit+0)
STR	R1, [R0, #0]
;main.c,33 :: 		}
IT	AL
BAL	L_main0
;main.c,35 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
