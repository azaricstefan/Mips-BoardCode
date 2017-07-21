_crc8:
SUB	SP, SP, #4
MOVS	R0, #0
STRB	R0, [SP, #0]
MOVS	R0, #0
STRB	R0, [SP, #3]
L_crc80:
LDRB	R0, [SP, #3]
CMP	R0, #8
IT	CS
BCS	L_crc81
LDRB	R1, [SP, #3]
MOVW	R0, #lo_addr(_scratchpad+0)
MOVT	R0, #hi_addr(_scratchpad+0)
ADDS	R0, R0, R1
LDRB	R0, [R0, #0]
STRB	R0, [SP, #2]
MOVS	R0, #0
STRB	R0, [SP, #1]
L_crc83:
LDRB	R0, [SP, #1]
CMP	R0, #8
IT	CS
BCS	L_crc84
LDRB	R1, [SP, #2]
LDRB	R0, [SP, #0]
EOR	R1, R0, R1, LSL #0
UXTB	R1, R1
LDRB	R0, [SP, #0]
LSRS	R0, R0, #1
STRB	R0, [SP, #0]
AND	R0, R1, #1
UXTB	R0, R0
CMP	R0, #0
IT	EQ
BEQ	L_crc86
LDRB	R0, [SP, #0]
EOR	R0, R0, #140
STRB	R0, [SP, #0]
L_crc86:
LDRB	R0, [SP, #2]
LSRS	R0, R0, #1
STRB	R0, [SP, #2]
LDRB	R0, [SP, #1]
ADDS	R0, R0, #1
STRB	R0, [SP, #1]
IT	AL
BAL	L_crc83
L_crc84:
LDRB	R0, [SP, #3]
ADDS	R0, R0, #1
STRB	R0, [SP, #3]
IT	AL
BAL	L_crc80
L_crc81:
LDRB	R0, [SP, #0]
L_end_crc8:
ADD	SP, SP, #4
BX	LR
; end of _crc8
_oneWireReset:
SUB	SP, SP, #8
STR	LR, [SP, #0]
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
MOVS	R0, #1
SXTB	R0, R0
MOVW	R1, #lo_addr(ODR1_GPIOB_ODR_bit+0)
MOVT	R1, #hi_addr(ODR1_GPIOB_ODR_bit+0)
STR	R0, [R1, #0]
MOVS	R0, #0
SXTB	R0, R0
STR	R0, [R1, #0]
MOVW	R0, #480
PUSH	(R0)
BL	_my_Delay_us+0
ADD	SP, SP, #4
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR1_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR1_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Input+0
MOVS	R0, #70
PUSH	(R0)
BL	_my_Delay_us+0
ADD	SP, SP, #4
MOVW	R1, #lo_addr(IDR1_GPIOB_IDR_bit+0)
MOVT	R1, #hi_addr(IDR1_GPIOB_IDR_bit+0)
LDR	R0, [R1, #0]
STRB	R0, [SP, #4]
LDRB	R0, [SP, #4]
CMP	R0, #0
IT	NE
BNE	L_oneWireReset7
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR1_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR1_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
L_oneWireReset7:
MOVS	R0, #250
PUSH	(R0)
BL	_my_Delay_us+0
ADD	SP, SP, #4
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR1_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR1_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
LDRB	R0, [SP, #4]
L_end_oneWireReset:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _oneWireReset
_oneWireWriteBit:
SUB	SP, SP, #4
STR	LR, [SP, #0]
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
MOVS	R0, #1
SXTB	R0, R0
MOVW	R1, #lo_addr(ODR1_GPIOB_ODR_bit+0)
MOVT	R1, #hi_addr(ODR1_GPIOB_ODR_bit+0)
STR	R0, [R1, #0]
MOVS	R0, #0
SXTB	R0, R0
STR	R0, [R1, #0]
LDRB	R0, [SP, #4]
CMP	R0, #0
IT	EQ
BEQ	L_oneWireWriteBit8
MOVS	R0, #15
PUSH	(R0)
BL	_my_Delay_us+0
ADD	SP, SP, #4
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR1_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR1_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
MOVS	R0, #50
PUSH	(R0)
BL	_my_Delay_us+0
ADD	SP, SP, #4
IT	AL
BAL	L_oneWireWriteBit9
L_oneWireWriteBit8:
MOVS	R0, #65
PUSH	(R0)
BL	_my_Delay_us+0
ADD	SP, SP, #4
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR1_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR1_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
L_oneWireWriteBit9:
L_end_oneWireWriteBit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _oneWireWriteBit
_oneWireReadBit:
SUB	SP, SP, #8
STR	LR, [SP, #0]
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
MOVS	R0, #1
SXTB	R0, R0
MOVW	R1, #lo_addr(ODR1_GPIOB_ODR_bit+0)
MOVT	R1, #hi_addr(ODR1_GPIOB_ODR_bit+0)
STR	R0, [R1, #0]
MOVS	R0, #0
SXTB	R0, R0
STR	R0, [R1, #0]
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Input+0
MOVS	R0, #5
PUSH	(R0)
BL	_my_Delay_us+0
ADD	SP, SP, #4
MOVW	R1, #lo_addr(IDR1_GPIOB_IDR_bit+0)
MOVT	R1, #hi_addr(IDR1_GPIOB_IDR_bit+0)
LDR	R0, [R1, #0]
STRB	R0, [SP, #4]
MOVS	R0, #55
PUSH	(R0)
BL	_my_Delay_us+0
ADD	SP, SP, #4
MOVW	R1, #2
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(ODR1_GPIOB_ODR_bit+0)
MOVT	R0, #hi_addr(ODR1_GPIOB_ODR_bit+0)
STR	R1, [R0, #0]
LDRB	R0, [SP, #4]
L_end_oneWireReadBit:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _oneWireReadBit
_oneWireWrite:
SUB	SP, SP, #8
STR	LR, [SP, #0]
MOVS	R0, #0
STRB	R0, [SP, #4]
L_oneWireWrite10:
LDRB	R0, [SP, #4]
CMP	R0, #8
IT	CS
BCS	L_oneWireWrite11
LDRB	R0, [SP, #8]
AND	R0, R0, #1
UXTB	R0, R0
PUSH	(R0)
BL	_oneWireWriteBit+0
ADD	SP, SP, #4
LDRB	R0, [SP, #8]
LSRS	R0, R0, #1
STRB	R0, [SP, #8]
LDRB	R0, [SP, #4]
ADDS	R0, R0, #1
STRB	R0, [SP, #4]
IT	AL
BAL	L_oneWireWrite10
L_oneWireWrite11:
L_end_oneWireWrite:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _oneWireWrite
_oneWireRead:
SUB	SP, SP, #8
STR	LR, [SP, #0]
MOVS	R0, #0
STRB	R0, [SP, #4]
MOVS	R0, #0
STRB	R0, [SP, #5]
L_oneWireRead13:
LDRB	R0, [SP, #5]
CMP	R0, #8
IT	CS
BCS	L_oneWireRead14
BL	_oneWireReadBit+0
LDRB	R1, [SP, #5]
UXTB	R0, R0
LSLS	R0, R1
UXTB	R1, R0
LDRB	R0, [SP, #4]
ORRS	R0, R1
STRB	R0, [SP, #4]
LDRB	R0, [SP, #5]
ADDS	R0, R0, #1
STRB	R0, [SP, #5]
IT	AL
BAL	L_oneWireRead13
L_oneWireRead14:
LDRB	R0, [SP, #4]
L_end_oneWireRead:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _oneWireRead
_calcTemp:
SUB	SP, SP, #16
STR	LR, [SP, #0]
MOVS	R0, #0
STR	R0, [SP, #4]
BL	_oneWireReset+0
MOVS	R0, #204
PUSH	(R0)
BL	_oneWireWrite+0
ADD	SP, SP, #4
MOVS	R0, #68
PUSH	(R0)
BL	_oneWireWrite+0
ADD	SP, SP, #4
MOVW	R0, #750
PUSH	(R0)
BL	_my_Delay_ms+0
ADD	SP, SP, #4
BL	_oneWireReset+0
MOVS	R0, #204
PUSH	(R0)
BL	_oneWireWrite+0
ADD	SP, SP, #4
MOVS	R0, #190
PUSH	(R0)
BL	_oneWireWrite+0
ADD	SP, SP, #4
MOVS	R0, #0
STRB	R0, [SP, #8]
L_calcTemp16:
LDRB	R0, [SP, #8]
CMP	R0, #9
IT	CS
BCS	L_calcTemp17
LDRB	R1, [SP, #8]
MOVW	R0, #lo_addr(_scratchpad+0)
MOVT	R0, #hi_addr(_scratchpad+0)
ADDS	R0, R0, R1
STR	R0, [SP, #12]
BL	_oneWireRead+0
LDR	R1, [SP, #12]
STRB	R0, [R1, #0]
LDRB	R0, [SP, #8]
ADDS	R0, R0, #1
STRB	R0, [SP, #8]
IT	AL
BAL	L_calcTemp16
L_calcTemp17:
MOVW	R0, #lo_addr(_scratchpad+0)
MOVT	R0, #hi_addr(_scratchpad+0)
LDRB	R0, [R0, #0]
STR	R0, [SP, #4]
MOVW	R0, #lo_addr(_scratchpad+1)
MOVT	R0, #hi_addr(_scratchpad+1)
LDRB	R0, [R0, #0]
LSLS	R1, R0, #8
UXTH	R1, R1
LDR	R0, [SP, #4]
ADDS	R0, R0, R1
STR	R0, [SP, #4]
BL	_crc8+0
MOVW	R1, #lo_addr(_scratchpad+8)
MOVT	R1, #hi_addr(_scratchpad+8)
LDRB	R1, [R1, #0]
CMP	R0, R1
IT	EQ
BEQ	L_calcTemp19
MOVW	R0, #0
MOVT	R0, #49864
VMOV	S0, R0
IT	AL
BAL	L_end_calcTemp
L_calcTemp19:
LDR	R0, [SP, #4]
AND	R0, R0, #61440
CMP	R0, #0
IT	EQ
BEQ	L_calcTemp20
LDR	R0, [SP, #4]
MVN	R1, R0
MOVW	R0, #65535
AND	R0, R1, R0, LSL #0
STR	R0, [SP, #4]
ADDS	R0, R0, #1
STR	R0, [SP, #4]
RSBS	R0, R0, #0
STR	R0, [SP, #4]
L_calcTemp20:
VLDR	#1, S0, [SP, #4]
VCVT.F32	#1, S1, S0
VMOV.F32	S0, #16
VDIV.F32	S0, S1, S0
VMOV.F32	S0, S0
L_end_calcTemp:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _calcTemp
