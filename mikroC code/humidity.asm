_calcHumTemp:
SUB	SP, SP, #24
STR	LR, [SP, #0]
ADD	R11, SP, #12
ADD	R10, R11, #12
MOVW	R12, #lo_addr(?ICScalcHumTemp_i_L0+0)
MOVT	R12, #hi_addr(?ICScalcHumTemp_i_L0+0)
BL	___CC2DW+0
L_calcHumTemp0:
LDR	R0, [SP, #12]
CMP	R0, #5
IT	CS
BCS	L_calcHumTemp1
ADD	R1, SP, #4
LDR	R0, [SP, #12]
ADDS	R1, R1, R0
MOVS	R0, #0
STRB	R0, [R1, #0]
LDR	R0, [SP, #12]
ADDS	R0, R0, #1
STR	R0, [SP, #12]
IT	AL
BAL	L_calcHumTemp0
L_calcHumTemp1:
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
MOVS	R0, #1
SXTB	R0, R0
MOVW	R1, #lo_addr(ODR1_GPIOC_ODR_bit+0)
MOVT	R1, #hi_addr(ODR1_GPIOC_ODR_bit+0)
STR	R0, [R1, #0]
MOVS	R0, #0
SXTB	R0, R0
STR	R0, [R1, #0]
MOVS	R0, #18
PUSH	(R0)
BL	_my_Delay_ms+0
ADD	SP, SP, #4
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Input+0
MOVS	R0, #70
PUSH	(R0)
BL	_my_Delay_us+0
ADD	SP, SP, #4
VLDR	#1, S1, [SP, #20]
VMOV.F32	S0, #1
VCMPE.F32	S1, S0
VMRS	#60, FPSCR
IT	NE
BNE	L_calcHumTemp3
MOVW	R0, #0
MOVT	R0, #49864
VMOV	S0, R0
IT	AL
BAL	L_end_calcHumTemp
L_calcHumTemp3:
MOVS	R0, #130
PUSH	(R0)
BL	_my_Delay_us+0
ADD	SP, SP, #4
MOVS	R0, #0
STR	R0, [SP, #12]
L_calcHumTemp4:
LDR	R0, [SP, #12]
CMP	R0, #40
IT	CS
BCS	L_calcHumTemp5
L_calcHumTemp7:
MOVW	R1, #lo_addr(IDR1_GPIOC_IDR_bit+0)
MOVT	R1, #hi_addr(IDR1_GPIOC_IDR_bit+0)
LDR	R0, [R1, #0]
CMP	R0, #0
IT	NE
BNE	L_calcHumTemp8
IT	AL
BAL	L_calcHumTemp7
L_calcHumTemp8:
MOVS	R0, #50
PUSH	(R0)
BL	_my_Delay_us+0
ADD	SP, SP, #4
LDR	R0, [SP, #12]
LSRS	R1, R0, #3
ADD	R0, SP, #4
ADDS	R3, R0, R1
LDR	R0, [SP, #12]
AND	R0, R0, #7
RSB	R1, R0, #7
MOVW	R2, #lo_addr(IDR1_GPIOC_IDR_bit+0)
MOVT	R2, #hi_addr(IDR1_GPIOC_IDR_bit+0)
LDR	R0, [R2, #0]
LSL	R1, R0, R1
UXTH	R1, R1
LDRB	R0, [R3, #0]
ORRS	R0, R1
STRB	R0, [R3, #0]
MOV	R1, R2
LDR	R0, [R1, #0]
CMP	R0, #0
IT	EQ
BEQ	L_calcHumTemp9
MOVS	R0, #50
PUSH	(R0)
BL	_my_Delay_us+0
ADD	SP, SP, #4
L_calcHumTemp9:
LDR	R0, [SP, #12]
ADDS	R0, R0, #1
STR	R0, [SP, #12]
IT	AL
BAL	L_calcHumTemp4
L_calcHumTemp5:
MOVS	R0, #0
STR	R0, [SP, #12]
L_calcHumTemp10:
LDR	R0, [SP, #12]
CMP	R0, #4
IT	CS
BCS	L_calcHumTemp11
ADD	R1, SP, #4
LDR	R0, [SP, #12]
ADDS	R0, R1, R0
LDRB	R1, [R0, #0]
LDR	R0, [SP, #16]
ADDS	R0, R0, R1
STR	R0, [SP, #16]
LDR	R0, [SP, #12]
ADDS	R0, R0, #1
STR	R0, [SP, #12]
IT	AL
BAL	L_calcHumTemp10
L_calcHumTemp11:
LDR	R0, [SP, #16]
AND	R1, R0, #255
ADD	R0, SP, #4
ADDS	R0, R0, #4
LDRB	R0, [R0, #0]
CMP	R1, R0
IT	EQ
BEQ	L_calcHumTemp13
MOVW	R0, #0
MOVT	R0, #49864
VMOV	S0, R0
IT	AL
BAL	L_end_calcHumTemp
L_calcHumTemp13:
LDRB	R0, [SP, #24]
CMP	R0, #0
IT	NE
BNE	L_calcHumTemp14
ADD	R2, SP, #4
ADDS	R1, R2, #2
LDRB	R0, [R1, #0]
AND	R0, R0, #127
UXTB	R0, R0
VMOV	S1, R0
VCVT.F32	#0, S1, S1
VSTR	#1, S1, [SP, #20]
MOVW	R0, #52429
MOVT	R0, #16844
VMOV	S0, R0
VMUL.F32	S2, S1, S0
ADDS	R0, R2, #3
LDRB	R0, [R0, #0]
VMOV	S1, R0
VCVT.F32	#0, S1, S1
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VADD.F32	S0, S2, S0
VSTR	#1, S0, [SP, #20]
LDRB	R0, [R1, #0]
AND	R0, R0, #128
UXTB	R0, R0
CMP	R0, #0
IT	EQ
BEQ	L_calcHumTemp15
VLDR	#1, S0, [SP, #20]
VNEG.F32	S0, S0
VSTR	#1, S0, [SP, #20]
L_calcHumTemp15:
IT	AL
BAL	L_calcHumTemp16
L_calcHumTemp14:
ADD	R1, SP, #4
LDRB	R0, [R1, #0]
AND	R0, R0, #127
UXTB	R0, R0
VMOV	S1, R0
VCVT.F32	#0, S1, S1
VSTR	#1, S1, [SP, #20]
MOVW	R0, #52429
MOVT	R0, #16844
VMOV	S0, R0
VMUL.F32	S2, S1, S0
ADDS	R0, R1, #1
LDRB	R0, [R0, #0]
VMOV	S1, R0
VCVT.F32	#0, S1, S1
MOVW	R0, #52429
MOVT	R0, #15820
VMOV	S0, R0
VMUL.F32	S0, S1, S0
VADD.F32	S0, S2, S0
VSTR	#1, S0, [SP, #20]
LDRB	R0, [R1, #0]
AND	R0, R0, #128
UXTB	R0, R0
CMP	R0, #0
IT	EQ
BEQ	L_calcHumTemp17
VLDR	#1, S0, [SP, #20]
VNEG.F32	S0, S0
VSTR	#1, S0, [SP, #20]
L_calcHumTemp17:
L_calcHumTemp16:
VLDR	#1, S0, [SP, #20]
L_end_calcHumTemp:
LDR	LR, [SP, #0]
ADD	SP, SP, #24
BX	LR
; end of _calcHumTemp
