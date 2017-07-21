_BME_Write:
SUB	SP, SP, #4
STR	LR, [SP, #0]
BL	_I2C2_Start+0
MOVW	R3, #1
LDRSH	R2, [SP, #8]
LDR	R1, [SP, #4]
MOVS	R0, #118
BL	_I2C2_Write+0
L_end_BME_Write:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _BME_Write
_BME_Read:
SUB	SP, SP, #24
STR	LR, [SP, #0]
BL	_I2C2_Start+0
MOVW	R3, #0
LDRSH	R2, [SP, #28]
LDR	R1, [SP, #24]
MOVS	R0, #118
BL	_I2C2_Write+0
ADD	R4, SP, #4
MOVW	R3, #1
LDRSH	R2, [SP, #32]
MOV	R1, R4
MOVS	R0, #118
BL	_I2C2_Read+0
ADD	R0, SP, #4
L_end_BME_Read:
LDR	LR, [SP, #0]
ADD	SP, SP, #24
BX	LR
; end of _BME_Read
_BME_Read_DigS:
SUB	SP, SP, #20
STR	LR, [SP, #0]
ADD	R1, SP, #6
LDRB	R0, [SP, #20]
STRB	R0, [R1, #0]
BL	_I2C2_Start+0
ADD	R4, SP, #6
MOVW	R3, #0
MOVS	R2, #1
MOV	R1, R4
MOVS	R0, #118
BL	_I2C2_Write+0
ADD	R4, SP, #4
MOVW	R3, #1
MOVS	R2, #2
MOV	R1, R4
MOVS	R0, #118
BL	_I2C2_Read+0
ADD	R2, SP, #4
ADDS	R0, R2, #1
LDRB	R0, [R0, #0]
STRH	R0, [SP, #16]
LDRSH	R0, [SP, #16]
LSLS	R1, R0, #8
SXTH	R1, R1
STRH	R1, [SP, #16]
LDRB	R0, [R2, #0]
ORR	R0, R1, R0, LSL #0
STRH	R0, [SP, #16]
L_end_BME_Read_DigS:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _BME_Read_DigS
_BME_Read_DigU:
SUB	SP, SP, #20
STR	LR, [SP, #0]
ADD	R1, SP, #6
LDRB	R0, [SP, #20]
STRB	R0, [R1, #0]
BL	_I2C2_Start+0
ADD	R4, SP, #6
MOVW	R3, #0
MOVS	R2, #1
MOV	R1, R4
MOVS	R0, #118
BL	_I2C2_Write+0
ADD	R4, SP, #4
MOVW	R3, #1
MOVS	R2, #2
MOV	R1, R4
MOVS	R0, #118
BL	_I2C2_Read+0
ADD	R2, SP, #4
ADDS	R0, R2, #1
LDRB	R0, [R0, #0]
STRH	R0, [SP, #16]
LDRH	R0, [SP, #16]
LSLS	R1, R0, #8
UXTH	R1, R1
STRH	R1, [SP, #16]
LDRB	R0, [R2, #0]
ORR	R0, R1, R0, LSL #0
STRH	R0, [SP, #16]
L_end_BME_Read_DigU:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _BME_Read_DigU
_BME280_Init:
SUB	SP, SP, #16
STR	LR, [SP, #0]
MOVW	R1, #lo_addr(__GPIO_MODULE_I2C2_PB10_11+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_I2C2_PB10_11+0)
MOVW	R0, #34464
MOVT	R0, #1
BL	_I2C2_Init_Advanced+0
MOVS	R1, #0
MOVS	R0, #49
BL	_NVIC_SetIntPriority+0
MOVS	R1, #0
MOVS	R0, #50
BL	_NVIC_SetIntPriority+0
MOVW	R2, #lo_addr(_I2C1_Write+0)
MOVT	R2, #hi_addr(_I2C1_Write+0)
MOVW	R1, #lo_addr(_I2C1_Read+0)
MOVT	R1, #hi_addr(_I2C1_Read+0)
MOVW	R0, #lo_addr(_I2C_Start+0)
MOVT	R0, #hi_addr(_I2C_Start+0)
BL	_I2C_Set_Active+0
MOVS	R0, #136
PUSH	(R0)
BL	_BME_Read_DigU+0
ADD	SP, SP, #4
MOVW	R1, #lo_addr(_dig_T1+0)
MOVT	R1, #hi_addr(_dig_T1+0)
STRH	R0, [R1, #0]
MOVS	R0, #138
PUSH	(R0)
BL	_BME_Read_DigS+0
ADD	SP, SP, #4
MOVW	R1, #lo_addr(_dig_T2+0)
MOVT	R1, #hi_addr(_dig_T2+0)
STRH	R0, [R1, #0]
MOVS	R0, #140
PUSH	(R0)
BL	_BME_Read_DigS+0
ADD	SP, SP, #4
MOVW	R1, #lo_addr(_dig_T3+0)
MOVT	R1, #hi_addr(_dig_T3+0)
STRH	R0, [R1, #0]
MOVS	R0, #142
PUSH	(R0)
BL	_BME_Read_DigU+0
ADD	SP, SP, #4
MOVW	R1, #lo_addr(_dig_P1+0)
MOVT	R1, #hi_addr(_dig_P1+0)
STRH	R0, [R1, #0]
MOVS	R0, #144
PUSH	(R0)
BL	_BME_Read_DigS+0
ADD	SP, SP, #4
MOVW	R1, #lo_addr(_dig_P2+0)
MOVT	R1, #hi_addr(_dig_P2+0)
STRH	R0, [R1, #0]
MOVS	R0, #146
PUSH	(R0)
BL	_BME_Read_DigS+0
ADD	SP, SP, #4
MOVW	R1, #lo_addr(_dig_P3+0)
MOVT	R1, #hi_addr(_dig_P3+0)
STRH	R0, [R1, #0]
MOVS	R0, #148
PUSH	(R0)
BL	_BME_Read_DigS+0
ADD	SP, SP, #4
MOVW	R1, #lo_addr(_dig_P4+0)
MOVT	R1, #hi_addr(_dig_P4+0)
STRH	R0, [R1, #0]
MOVS	R0, #150
PUSH	(R0)
BL	_BME_Read_DigS+0
ADD	SP, SP, #4
MOVW	R1, #lo_addr(_dig_P5+0)
MOVT	R1, #hi_addr(_dig_P5+0)
STRH	R0, [R1, #0]
MOVS	R0, #152
PUSH	(R0)
BL	_BME_Read_DigS+0
ADD	SP, SP, #4
MOVW	R1, #lo_addr(_dig_P6+0)
MOVT	R1, #hi_addr(_dig_P6+0)
STRH	R0, [R1, #0]
MOVS	R0, #154
PUSH	(R0)
BL	_BME_Read_DigS+0
ADD	SP, SP, #4
MOVW	R1, #lo_addr(_dig_P7+0)
MOVT	R1, #hi_addr(_dig_P7+0)
STRH	R0, [R1, #0]
MOVS	R0, #156
PUSH	(R0)
BL	_BME_Read_DigS+0
ADD	SP, SP, #4
MOVW	R1, #lo_addr(_dig_P8+0)
MOVT	R1, #hi_addr(_dig_P8+0)
STRH	R0, [R1, #0]
MOVS	R0, #158
PUSH	(R0)
BL	_BME_Read_DigS+0
ADD	SP, SP, #4
MOVW	R1, #lo_addr(_dig_P9+0)
MOVT	R1, #hi_addr(_dig_P9+0)
STRH	R0, [R1, #0]
ADD	R2, SP, #4
MOVS	R0, #244
STRB	R0, [R2, #0]
ADDS	R1, R2, #1
MOVS	R0, #183
STRB	R0, [R1, #0]
MOVS	R0, #2
SXTH	R0, R0
PUSH	(R0)
PUSH	(R2)
BL	_BME_Write+0
ADD	SP, SP, #8
L_end_BME280_Init:
LDR	LR, [SP, #0]
ADD	SP, SP, #16
BX	LR
; end of _BME280_Init
_BME280_compensate_T_int32:
LDR	R0, [SP, #0]
ASRS	R2, R0, #4
STR	R2, [SP, #0]
ASRS	R1, R2, #3
MOVW	R4, #lo_addr(_dig_T1+0)
MOVT	R4, #hi_addr(_dig_T1+0)
LDRH	R0, [R4, #0]
LSLS	R0, R0, #1
SUB	R1, R1, R0
MOVW	R0, #lo_addr(_dig_T2+0)
MOVT	R0, #hi_addr(_dig_T2+0)
LDRSH	R0, [R0, #0]
MULS	R0, R1, R0
ASRS	R3, R0, #11
ASRS	R2, R2, #4
MOV	R0, R4
LDRH	R0, [R0, #0]
SUB	R1, R2, R0
MOV	R0, R4
LDRH	R0, [R0, #0]
SUB	R0, R2, R0
MULS	R0, R1, R0
ASRS	R1, R0, #12
MOVW	R0, #lo_addr(_dig_T3+0)
MOVT	R0, #hi_addr(_dig_T3+0)
LDRSH	R0, [R0, #0]
MULS	R0, R1, R0
ASRS	R0, R0, #14
ADDS	R1, R3, R0
MOVW	R0, #lo_addr(_t_fine+0)
MOVT	R0, #hi_addr(_t_fine+0)
STR	R1, [R0, #0]
MOVS	R0, #5
MULS	R0, R1, R0
ADDS	R0, #128
ASRS	R0, R0, #8
L_end_BME280_compensate_T_int32:
BX	LR
; end of _BME280_compensate_T_int32
_getTemperature:
SUB	SP, SP, #20
STR	LR, [SP, #0]
ADD	R1, SP, #4
MOVS	R0, #250
STRB	R0, [R1, #0]
MOVS	R0, #3
SXTH	R0, R0
PUSH	(R0)
MOVS	R0, #1
SXTH	R0, R0
PUSH	(R0)
PUSH	(R1)
BL	_BME_Read+0
ADD	SP, SP, #12
LDRB	R1, [R0, #0]
STR	R1, [SP, #16]
LDR	R1, [SP, #16]
LSLS	R2, R1, #8
STR	R2, [SP, #16]
ADDS	R1, R0, #1
LDRB	R1, [R1, #0]
ORR	R1, R2, R1, LSL #0
STR	R1, [SP, #16]
LSLS	R1, R1, #8
STR	R1, [SP, #16]
ADDS	R0, R0, #2
LDRB	R0, [R0, #0]
ORR	R0, R1, R0, LSL #0
STR	R0, [SP, #16]
PUSH	(R0)
BL	_BME280_compensate_T_int32+0
ADD	SP, SP, #4
VMOV	S1, R0
VCVT.F32	#1, S1, S1
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S0, R0
VDIV.F32	S0, S1, S0
L_end_getTemperature:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _getTemperature
_BME280_compensate_P_int32:
SUB	SP, SP, #12
LDR	R0, [SP, #12]
ASRS	R0, R0, #4
STR	R0, [SP, #12]
MOVW	R0, #lo_addr(_t_fine+0)
MOVT	R0, #hi_addr(_t_fine+0)
LDR	R0, [R0, #0]
ASRS	R0, R0, #1
SUB	R3, R0, #64000
STR	R3, [SP, #0]
ASRS	R0, R3, #2
MUL	R2, R0, R0
ASRS	R1, R2, #11
MOVW	R0, #lo_addr(_dig_P6+0)
MOVT	R0, #hi_addr(_dig_P6+0)
LDRSH	R0, [R0, #0]
MULS	R1, R0, R1
STR	R1, [SP, #4]
MOVW	R0, #lo_addr(_dig_P5+0)
MOVT	R0, #hi_addr(_dig_P5+0)
LDRSH	R0, [R0, #0]
MULS	R0, R3, R0
LSLS	R0, R0, #1
ADDS	R0, R1, R0
STR	R0, [SP, #4]
ASRS	R1, R0, #2
MOVW	R0, #lo_addr(_dig_P4+0)
MOVT	R0, #hi_addr(_dig_P4+0)
LDRSH	R0, [R0, #0]
LSLS	R0, R0, #16
ADDS	R0, R1, R0
STR	R0, [SP, #4]
ASRS	R1, R2, #13
MOVW	R0, #lo_addr(_dig_P3+0)
MOVT	R0, #hi_addr(_dig_P3+0)
LDRSH	R0, [R0, #0]
MULS	R0, R1, R0
ASRS	R1, R0, #3
MOVW	R0, #lo_addr(_dig_P2+0)
MOVT	R0, #hi_addr(_dig_P2+0)
LDRSH	R0, [R0, #0]
MULS	R0, R3, R0
ASRS	R0, R0, #1
ADDS	R0, R1, R0
ASRS	R0, R0, #18
STR	R0, [SP, #0]
ADD	R1, R0, #32768
MOVW	R0, #lo_addr(_dig_P1+0)
MOVT	R0, #hi_addr(_dig_P1+0)
LDRH	R0, [R0, #0]
MULS	R0, R1, R0
ASRS	R0, R0, #15
STR	R0, [SP, #0]
CMP	R0, #0
IT	NE
BNE	L_BME280_compensate_P_int320
MOVS	R0, #0
IT	AL
BAL	L_end_BME280_compensate_P_int32
L_BME280_compensate_P_int320:
LDR	R0, [SP, #12]
RSB	R1, R0, #1048576
LDR	R0, [SP, #4]
ASRS	R0, R0, #12
SUB	R1, R1, R0
MOVW	R0, #3125
MULS	R0, R1, R0
STR	R0, [SP, #8]
CMP	R0, #-2147483648
IT	CS
BCS	L_BME280_compensate_P_int321
LDR	R0, [SP, #8]
LSLS	R1, R0, #1
LDR	R0, [SP, #0]
UDIV	R0, R1, R0
STR	R0, [SP, #8]
IT	AL
BAL	L_BME280_compensate_P_int322
L_BME280_compensate_P_int321:
LDR	R1, [SP, #0]
LDR	R0, [SP, #8]
UDIV	R0, R0, R1
LSLS	R0, R0, #1
STR	R0, [SP, #8]
L_BME280_compensate_P_int322:
MOVW	R0, #lo_addr(_dig_P9+0)
MOVT	R0, #hi_addr(_dig_P9+0)
LDRSH	R1, [R0, #0]
LDR	R0, [SP, #8]
LSRS	R0, R0, #3
MULS	R0, R0, R0
LSRS	R0, R0, #13
MULS	R0, R1, R0
ASRS	R2, R0, #12
STR	R2, [SP, #0]
LDR	R0, [SP, #8]
LSRS	R1, R0, #2
MOVW	R0, #lo_addr(_dig_P8+0)
MOVT	R0, #hi_addr(_dig_P8+0)
LDRSH	R0, [R0, #0]
MULS	R0, R1, R0
ASRS	R0, R0, #13
STR	R0, [SP, #4]
ADDS	R1, R2, R0
MOVW	R0, #lo_addr(_dig_P7+0)
MOVT	R0, #hi_addr(_dig_P7+0)
LDRSH	R0, [R0, #0]
ADDS	R0, R1, R0
ASRS	R1, R0, #4
LDR	R0, [SP, #8]
ADDS	R0, R0, R1
STR	R0, [SP, #8]
MOV	R0, R0
L_end_BME280_compensate_P_int32:
ADD	SP, SP, #12
BX	LR
; end of _BME280_compensate_P_int32
_getPressure:
SUB	SP, SP, #20
STR	LR, [SP, #0]
BL	_getTemperature+0
ADD	R1, SP, #4
MOVS	R0, #247
STRB	R0, [R1, #0]
MOVS	R0, #3
SXTH	R0, R0
PUSH	(R0)
MOVS	R0, #1
SXTH	R0, R0
PUSH	(R0)
PUSH	(R1)
BL	_BME_Read+0
ADD	SP, SP, #12
LDRB	R1, [R0, #0]
STR	R1, [SP, #16]
LDR	R1, [SP, #16]
LSLS	R2, R1, #8
STR	R2, [SP, #16]
ADDS	R1, R0, #1
LDRB	R1, [R1, #0]
ORR	R1, R2, R1, LSL #0
STR	R1, [SP, #16]
LSLS	R1, R1, #8
STR	R1, [SP, #16]
ADDS	R0, R0, #2
LDRB	R0, [R0, #0]
ORR	R0, R1, R0, LSL #0
STR	R0, [SP, #16]
PUSH	(R0)
BL	_BME280_compensate_P_int32+0
ADD	SP, SP, #4
VMOV	S1, R0
VCVT.F32	#0, S1, S1
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S0, R0
VDIV.F32	S0, S1, S0
L_end_getPressure:
LDR	LR, [SP, #0]
ADD	SP, SP, #20
BX	LR
; end of _getPressure
