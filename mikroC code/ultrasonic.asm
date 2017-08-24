_initUltrasonic:
;ultrasonic.c,7 :: 		void initUltrasonic() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ultrasonic.c,8 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_14);
MOVW	R1, #16384
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;ultrasonic.c,9 :: 		GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_15);
MOVW	R1, #32768
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Input+0
;ultrasonic.c,10 :: 		}
L_end_initUltrasonic:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _initUltrasonic
_getDistance:
;ultrasonic.c,12 :: 		double getDistance() {
SUB	SP, SP, #8
STR	LR, [SP, #0]
;ultrasonic.c,17 :: 		TRIG = 0;
MOVS	R0, #0
SXTB	R0, R0
MOVW	R1, #lo_addr(ODR14_GPIOB_ODR_bit+0)
MOVT	R1, #hi_addr(ODR14_GPIOB_ODR_bit+0)
STR	R0, [R1, #0]
;ultrasonic.c,18 :: 		TRIG = 1;
MOVS	R0, #1
SXTB	R0, R0
STR	R0, [R1, #0]
;ultrasonic.c,19 :: 		my_Delay_us(_ULTRASONIC_START_TIME);
MOVS	R0, #10
BL	_my_Delay_us+0
;ultrasonic.c,20 :: 		TRIG = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR14_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR14_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
;ultrasonic.c,23 :: 		cnt = 0;
; cnt start address is: 8 (R2)
MOVS	R2, #0
; cnt end address is: 8 (R2)
;ultrasonic.c,24 :: 		while (ECHO == 0);
L_getDistance0:
; cnt start address is: 8 (R2)
MOVW	R1, #lo_addr(IDR15_GPIOB_IDR_bit+0)
MOVT	R1, #hi_addr(IDR15_GPIOB_IDR_bit+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_getDistance1
IT	AL
BAL	L_getDistance0
L_getDistance1:
;ultrasonic.c,25 :: 		while (ECHO == 1) {
L_getDistance2:
; cnt end address is: 8 (R2)
; cnt start address is: 8 (R2)
MOVW	R1, #lo_addr(IDR15_GPIOB_IDR_bit+0)
MOVT	R1, #hi_addr(IDR15_GPIOB_IDR_bit+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_getDistance3
;ultrasonic.c,26 :: 		cnt++;
ADDS	R0, R2, #1
; cnt end address is: 8 (R2)
; cnt start address is: 0 (R0)
;ultrasonic.c,27 :: 		my_Delay_us(_ULTRASONIC_COUNT_TIME);
STR	R0, [SP, #4]
MOVS	R0, #1
BL	_my_Delay_us+0
LDR	R0, [SP, #4]
;ultrasonic.c,28 :: 		}
MOV	R2, R0
; cnt end address is: 0 (R0)
IT	AL
BAL	L_getDistance2
L_getDistance3:
;ultrasonic.c,31 :: 		distance = cnt / 58.0;
; cnt start address is: 8 (R2)
VMOV	S1, R2
VCVT.F32	#1, S1, S1
; cnt end address is: 8 (R2)
MOVW	R0, #0
MOVT	R0, #17000
VMOV	S0, R0
VDIV.F32	S0, S1, S0
;ultrasonic.c,32 :: 		return distance;
;ultrasonic.c,33 :: 		}
L_end_getDistance:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _getDistance
