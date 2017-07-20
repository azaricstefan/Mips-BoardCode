_initUltrasonic:
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOVW	R1, #16384
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
MOVW	R1, #32768
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Input+0
L_end_initUltrasonic:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _initUltrasonic
_getDistance:
SUB	SP, SP, #8
STR	LR, [SP, #0]
MOVS	R0, #0
SXTB	R0, R0
MOVW	R1, #lo_addr(ODR14_GPIOB_ODR_bit+0)
MOVT	R1, #hi_addr(ODR14_GPIOB_ODR_bit+0)
STR	R0, [R1, #0]
MOVS	R0, #1
SXTB	R0, R0
STR	R0, [R1, #0]
MOVS	R0, #10
PUSH	(R0)
BL	_my_Delay_us+0
ADD	SP, SP, #4
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR14_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR14_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
MOVS	R0, #0
STR	R0, [SP, #4]
L_getDistance0:
MOVW	R1, #lo_addr(IDR15_GPIOB_IDR_bit+0)
MOVT	R1, #hi_addr(IDR15_GPIOB_IDR_bit+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_getDistance1
IT	AL
BAL	L_getDistance0
L_getDistance1:
L_getDistance2:
MOVW	R1, #lo_addr(IDR15_GPIOB_IDR_bit+0)
MOVT	R1, #hi_addr(IDR15_GPIOB_IDR_bit+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_getDistance3
LDR	R0, [SP, #4]
ADDS	R0, R0, #1
STR	R0, [SP, #4]
MOVS	R0, #1
PUSH	(R0)
BL	_my_Delay_us+0
ADD	SP, SP, #4
IT	AL
BAL	L_getDistance2
L_getDistance3:
VLDR	#1, S0, [SP, #4]
VCVT.F32	#1, S1, S0
MOVW	R0, #0
MOVT	R0, #17000
VMOV	S0, R0
VDIV.F32	S0, S1, S0
L_end_getDistance:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _getDistance
