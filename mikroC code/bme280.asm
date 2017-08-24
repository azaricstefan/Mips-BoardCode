_BME_Write:
;bme280.c,25 :: 		void BME_Write( int len) {
; len start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
SXTH	R5, R0
; len end address is: 0 (R0)
; len start address is: 20 (R5)
;bme280.c,26 :: 		I2C3_Start();
BL	_I2C3_Start+0
;bme280.c,27 :: 		I2C3_Write(BME280_ADDRESS, data_, len, END_MODE_STOP);
MOVW	R3, #1
SXTH	R2, R5
; len end address is: 20 (R5)
MOVW	R1, #lo_addr(_data_+0)
MOVT	R1, #hi_addr(_data_+0)
MOVS	R0, #118
BL	_I2C3_Write+0
;bme280.c,28 :: 		}
L_end_BME_Write:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _BME_Write
_BME_Read:
;bme280.c,30 :: 		void BME_Read( uint32_t len, uint32_t readlen) {
; readlen start address is: 4 (R1)
; len start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
MOV	R5, R0
MOV	R10, R1
; readlen end address is: 4 (R1)
; len end address is: 0 (R0)
; len start address is: 20 (R5)
; readlen start address is: 40 (R10)
;bme280.c,31 :: 		LD11=1; LD22=0;
MOVS	R3, #1
SXTB	R3, R3
MOVW	R2, #lo_addr(ODR12_GPIOE_ODR_bit+0)
MOVT	R2, #hi_addr(ODR12_GPIOE_ODR_bit+0)
STR	R3, [R2, #0]
MOVS	R3, #0
SXTB	R3, R3
MOVW	R2, #lo_addr(ODR15_GPIOE_ODR_bit+0)
MOVT	R2, #hi_addr(ODR15_GPIOE_ODR_bit+0)
STR	R2, [SP, #4]
STR	R3, [R2, #0]
;bme280.c,32 :: 		I2C3_Start();
BL	_I2C3_Start+0
;bme280.c,33 :: 		LD11=1; LD22=1;
MOVS	R3, #1
SXTB	R3, R3
MOVW	R2, #lo_addr(ODR12_GPIOE_ODR_bit+0)
MOVT	R2, #hi_addr(ODR12_GPIOE_ODR_bit+0)
STR	R3, [R2, #0]
LDR	R2, [SP, #4]
STR	R3, [R2, #0]
;bme280.c,34 :: 		I2C3_Write(BME280_ADDRESS, data_, len, END_MODE_RESTART);
MOVW	R3, #0
MOV	R2, R5
; len end address is: 20 (R5)
MOVW	R1, #lo_addr(_data_+0)
MOVT	R1, #hi_addr(_data_+0)
MOVS	R0, #118
BL	_I2C3_Write+0
;bme280.c,35 :: 		LD11=0; LD22=1;
MOVS	R3, #0
SXTB	R3, R3
MOVW	R2, #lo_addr(ODR12_GPIOE_ODR_bit+0)
MOVT	R2, #hi_addr(ODR12_GPIOE_ODR_bit+0)
STR	R3, [R2, #0]
MOVS	R3, #1
SXTB	R3, R3
LDR	R2, [SP, #4]
STR	R3, [R2, #0]
;bme280.c,36 :: 		I2C3_Read(BME280_ADDRESS, output, readlen, END_MODE_STOP);
MOVW	R3, #1
MOV	R2, R10
; readlen end address is: 40 (R10)
MOVW	R1, #lo_addr(_output+0)
MOVT	R1, #hi_addr(_output+0)
MOVS	R0, #118
BL	_I2C3_Read+0
;bme280.c,37 :: 		}
L_end_BME_Read:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _BME_Read
_BME_Read_DigS:
;bme280.c,39 :: 		int16_t BME_Read_DigS(uint8_t reg) {
; reg start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; reg end address is: 0 (R0)
; reg start address is: 0 (R0)
;bme280.c,41 :: 		data_[0] = reg;
MOVW	R1, #lo_addr(_data_+0)
MOVT	R1, #hi_addr(_data_+0)
STRB	R0, [R1, #0]
; reg end address is: 0 (R0)
;bme280.c,42 :: 		I2C3_Start();
BL	_I2C3_Start+0
;bme280.c,43 :: 		I2C3_Write(BME280_ADDRESS, data_, 1, END_MODE_RESTART);
MOVW	R3, #0
MOVS	R2, #1
MOVW	R1, #lo_addr(_data_+0)
MOVT	R1, #hi_addr(_data_+0)
MOVS	R0, #118
BL	_I2C3_Write+0
;bme280.c,44 :: 		I2C3_Read(BME280_ADDRESS, output, 2, END_MODE_STOP);
MOVW	R3, #1
MOVS	R2, #2
MOVW	R1, #lo_addr(_output+0)
MOVT	R1, #hi_addr(_output+0)
MOVS	R0, #118
BL	_I2C3_Read+0
;bme280.c,45 :: 		result = output[1];
MOVW	R1, #lo_addr(_output+1)
MOVT	R1, #hi_addr(_output+1)
; result start address is: 0 (R0)
LDRB	R0, [R1, #0]
;bme280.c,46 :: 		result <<= 8;
LSLS	R2, R0, #8
SXTH	R2, R2
; result end address is: 0 (R0)
;bme280.c,47 :: 		result |= output[0];
MOVW	R1, #lo_addr(_output+0)
MOVT	R1, #hi_addr(_output+0)
LDRB	R1, [R1, #0]
ORR	R1, R2, R1, LSL #0
;bme280.c,48 :: 		return result;
SXTH	R0, R1
;bme280.c,49 :: 		}
L_end_BME_Read_DigS:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _BME_Read_DigS
_BME_Read_DigU:
;bme280.c,51 :: 		uint16_t BME_Read_DigU(uint8_t reg) {
; reg start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; reg end address is: 0 (R0)
; reg start address is: 0 (R0)
;bme280.c,53 :: 		data_[0] = reg;
MOVW	R1, #lo_addr(_data_+0)
MOVT	R1, #hi_addr(_data_+0)
STRB	R0, [R1, #0]
; reg end address is: 0 (R0)
;bme280.c,54 :: 		I2C3_Start();
BL	_I2C3_Start+0
;bme280.c,55 :: 		I2C3_Write(BME280_ADDRESS, data_, 1, END_MODE_RESTART);
MOVW	R3, #0
MOVS	R2, #1
MOVW	R1, #lo_addr(_data_+0)
MOVT	R1, #hi_addr(_data_+0)
MOVS	R0, #118
BL	_I2C3_Write+0
;bme280.c,56 :: 		I2C3_Read(BME280_ADDRESS, output, 2, END_MODE_STOP);
MOVW	R3, #1
MOVS	R2, #2
MOVW	R1, #lo_addr(_output+0)
MOVT	R1, #hi_addr(_output+0)
MOVS	R0, #118
BL	_I2C3_Read+0
;bme280.c,57 :: 		result = output[1];
MOVW	R1, #lo_addr(_output+1)
MOVT	R1, #hi_addr(_output+1)
; result start address is: 0 (R0)
LDRB	R0, [R1, #0]
;bme280.c,58 :: 		result <<= 8;
LSLS	R2, R0, #8
UXTH	R2, R2
; result end address is: 0 (R0)
;bme280.c,59 :: 		result |= output[0];
MOVW	R1, #lo_addr(_output+0)
MOVT	R1, #hi_addr(_output+0)
LDRB	R1, [R1, #0]
ORR	R1, R2, R1, LSL #0
;bme280.c,60 :: 		return result;
UXTH	R0, R1
;bme280.c,61 :: 		}
L_end_BME_Read_DigU:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _BME_Read_DigU
_BME280_Init:
;bme280.c,65 :: 		void BME280_Init() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;bme280.c,67 :: 		I2C3_Init_Advanced(100000, &_GPIO_MODULE_I2C3_PA8_PC9);
MOVW	R1, #lo_addr(__GPIO_MODULE_I2C3_PA8_PC9+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_I2C3_PA8_PC9+0)
MOVW	R0, #34464
MOVT	R0, #1
BL	_I2C3_Init_Advanced+0
;bme280.c,68 :: 		NVIC_SetIntPriority(IVT_INT_I2C3_EV, _NVIC_INT_PRIORITY_LVL0);
MOVS	R1, #0
MOVS	R0, #88
BL	_NVIC_SetIntPriority+0
;bme280.c,69 :: 		NVIC_SetIntPriority(IVT_INT_I2C3_ER, _NVIC_INT_PRIORITY_LVL0);
MOVS	R1, #0
MOVS	R0, #89
BL	_NVIC_SetIntPriority+0
;bme280.c,73 :: 		dig_T1 = BME_Read_DigU(BME280_REG_DIG_T1);
MOVS	R0, #136
BL	_BME_Read_DigU+0
MOVW	R1, #lo_addr(_dig_T1+0)
MOVT	R1, #hi_addr(_dig_T1+0)
STRH	R0, [R1, #0]
;bme280.c,74 :: 		dig_T2 = BME_Read_DigS(BME280_REG_DIG_T2);
MOVS	R0, #138
BL	_BME_Read_DigS+0
MOVW	R1, #lo_addr(_dig_T2+0)
MOVT	R1, #hi_addr(_dig_T2+0)
STRH	R0, [R1, #0]
;bme280.c,75 :: 		dig_T3 = BME_Read_DigS(BME280_REG_DIG_T3);
MOVS	R0, #140
BL	_BME_Read_DigS+0
MOVW	R1, #lo_addr(_dig_T3+0)
MOVT	R1, #hi_addr(_dig_T3+0)
STRH	R0, [R1, #0]
;bme280.c,77 :: 		dig_P1 = BME_Read_DigU(BME280_REG_DIG_P1);
MOVS	R0, #142
BL	_BME_Read_DigU+0
MOVW	R1, #lo_addr(_dig_P1+0)
MOVT	R1, #hi_addr(_dig_P1+0)
STRH	R0, [R1, #0]
;bme280.c,78 :: 		dig_P2 = BME_Read_DigS(BME280_REG_DIG_P2);
MOVS	R0, #144
BL	_BME_Read_DigS+0
MOVW	R1, #lo_addr(_dig_P2+0)
MOVT	R1, #hi_addr(_dig_P2+0)
STRH	R0, [R1, #0]
;bme280.c,79 :: 		dig_P3 = BME_Read_DigS(BME280_REG_DIG_P3);
MOVS	R0, #146
BL	_BME_Read_DigS+0
MOVW	R1, #lo_addr(_dig_P3+0)
MOVT	R1, #hi_addr(_dig_P3+0)
STRH	R0, [R1, #0]
;bme280.c,80 :: 		dig_P4 = BME_Read_DigS(BME280_REG_DIG_P4);
MOVS	R0, #148
BL	_BME_Read_DigS+0
MOVW	R1, #lo_addr(_dig_P4+0)
MOVT	R1, #hi_addr(_dig_P4+0)
STRH	R0, [R1, #0]
;bme280.c,81 :: 		dig_P5 = BME_Read_DigS(BME280_REG_DIG_P5);
MOVS	R0, #150
BL	_BME_Read_DigS+0
MOVW	R1, #lo_addr(_dig_P5+0)
MOVT	R1, #hi_addr(_dig_P5+0)
STRH	R0, [R1, #0]
;bme280.c,82 :: 		dig_P6 = BME_Read_DigS(BME280_REG_DIG_P6);
MOVS	R0, #152
BL	_BME_Read_DigS+0
MOVW	R1, #lo_addr(_dig_P6+0)
MOVT	R1, #hi_addr(_dig_P6+0)
STRH	R0, [R1, #0]
;bme280.c,83 :: 		dig_P7 = BME_Read_DigS(BME280_REG_DIG_P7);
MOVS	R0, #154
BL	_BME_Read_DigS+0
MOVW	R1, #lo_addr(_dig_P7+0)
MOVT	R1, #hi_addr(_dig_P7+0)
STRH	R0, [R1, #0]
;bme280.c,84 :: 		dig_P8 = BME_Read_DigS(BME280_REG_DIG_P8);
MOVS	R0, #156
BL	_BME_Read_DigS+0
MOVW	R1, #lo_addr(_dig_P8+0)
MOVT	R1, #hi_addr(_dig_P8+0)
STRH	R0, [R1, #0]
;bme280.c,85 :: 		dig_P9 = BME_Read_DigS(BME280_REG_DIG_P9);
MOVS	R0, #158
BL	_BME_Read_DigS+0
MOVW	R1, #lo_addr(_dig_P9+0)
MOVT	R1, #hi_addr(_dig_P9+0)
STRH	R0, [R1, #0]
;bme280.c,87 :: 		data_[0] = BME280_REG_CONTROL;
MOVS	R1, #244
MOVW	R0, #lo_addr(_data_+0)
MOVT	R0, #hi_addr(_data_+0)
STRB	R1, [R0, #0]
;bme280.c,88 :: 		data_[1] = BME280_REG_PRESSIRE_CONFIG_DATA;
MOVS	R1, #183
MOVW	R0, #lo_addr(_data_+1)
MOVT	R0, #hi_addr(_data_+1)
STRB	R1, [R0, #0]
;bme280.c,89 :: 		BME_Write(2);
MOVS	R0, #2
SXTH	R0, R0
BL	_BME_Write+0
;bme280.c,90 :: 		}
L_end_BME280_Init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _BME280_Init
_BME280_compensate_T_int32:
;bme280.c,92 :: 		int32_t BME280_compensate_T_int32(int32_t adc_T) {
; adc_T start address is: 0 (R0)
; adc_T end address is: 0 (R0)
; adc_T start address is: 0 (R0)
;bme280.c,95 :: 		adc_T >>= 4;
ASRS	R3, R0, #4
; adc_T end address is: 0 (R0)
;bme280.c,96 :: 		var1 = ((((adc_T>>3) - ((int32_t)dig_T1<<1))) * ((int32_t)dig_T2)) >> 11;
ASRS	R2, R3, #3
MOVW	R5, #lo_addr(_dig_T1+0)
MOVT	R5, #hi_addr(_dig_T1+0)
LDRH	R1, [R5, #0]
LSLS	R1, R1, #1
SUB	R2, R2, R1
MOVW	R1, #lo_addr(_dig_T2+0)
MOVT	R1, #hi_addr(_dig_T2+0)
LDRSH	R1, [R1, #0]
MULS	R1, R2, R1
ASRS	R4, R1, #11
;bme280.c,97 :: 		var2 = (((((adc_T>>4) - ((int32_t)dig_T1)) * ((adc_T>>4) - ((int32_t)dig_T1))) >> 12) *
ASRS	R3, R3, #4
MOV	R1, R5
LDRH	R1, [R1, #0]
SUB	R2, R3, R1
MOV	R1, R5
LDRH	R1, [R1, #0]
SUB	R1, R3, R1
MULS	R1, R2, R1
ASRS	R2, R1, #12
;bme280.c,98 :: 		((int32_t)dig_T3)) >> 14;
MOVW	R1, #lo_addr(_dig_T3+0)
MOVT	R1, #hi_addr(_dig_T3+0)
LDRSH	R1, [R1, #0]
MULS	R1, R2, R1
ASRS	R1, R1, #14
;bme280.c,99 :: 		t_fine = var1 + var2;
ADDS	R2, R4, R1
MOVW	R1, #lo_addr(_t_fine+0)
MOVT	R1, #hi_addr(_t_fine+0)
STR	R2, [R1, #0]
;bme280.c,100 :: 		T = (t_fine * 5 + 128) >> 8;
MOVS	R1, #5
MULS	R1, R2, R1
ADDS	R1, #128
ASRS	R1, R1, #8
;bme280.c,101 :: 		return T;
MOV	R0, R1
;bme280.c,102 :: 		}
L_end_BME280_compensate_T_int32:
BX	LR
; end of _BME280_compensate_T_int32
_getTemperature:
;bme280.c,104 :: 		double getTemperature() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;bme280.c,108 :: 		data_[0] = BME280_REG_TEMPDATA;
MOVS	R1, #250
MOVW	R0, #lo_addr(_data_+0)
MOVT	R0, #hi_addr(_data_+0)
STRB	R1, [R0, #0]
;bme280.c,110 :: 		BME_Read( 1,3);
MOVS	R1, #3
MOVS	R0, #1
BL	_BME_Read+0
;bme280.c,112 :: 		result = output[0];
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
; result start address is: 0 (R0)
LDRB	R0, [R0, #0]
;bme280.c,113 :: 		result <<= 8;
LSLS	R1, R0, #8
; result end address is: 0 (R0)
;bme280.c,114 :: 		result |= output[1];
MOVW	R0, #lo_addr(_output+1)
MOVT	R0, #hi_addr(_output+1)
LDRB	R0, [R0, #0]
ORR	R0, R1, R0, LSL #0
;bme280.c,115 :: 		result <<= 8;
LSLS	R1, R0, #8
;bme280.c,116 :: 		result |= output[2];
MOVW	R0, #lo_addr(_output+2)
MOVT	R0, #hi_addr(_output+2)
LDRB	R0, [R0, #0]
ORR	R0, R1, R0, LSL #0
;bme280.c,117 :: 		return BME280_compensate_T_int32(result)/100.0;
BL	_BME280_compensate_T_int32+0
VMOV	S1, R0
VCVT.F32	#1, S1, S1
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S0, R0
VDIV.F32	S0, S1, S0
;bme280.c,118 :: 		}
L_end_getTemperature:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _getTemperature
_BME280_Forced_Mode:
;bme280.c,120 :: 		void BME280_Forced_Mode() {
SUB	SP, SP, #8
STR	LR, [SP, #0]
;bme280.c,122 :: 		uint8_t dataReady = 1;
; dataReady start address is: 8 (R2)
MOVS	R2, #1
;bme280.c,123 :: 		data_[0] = BME280_REG_CONTROL;
MOVS	R1, #244
MOVW	R0, #lo_addr(_data_+0)
MOVT	R0, #hi_addr(_data_+0)
STRB	R1, [R0, #0]
;bme280.c,124 :: 		data_[1] = BME280_REG_FORCED_MODE;
MOVS	R1, #181
MOVW	R0, #lo_addr(_data_+1)
MOVT	R0, #hi_addr(_data_+1)
STRB	R1, [R0, #0]
;bme280.c,126 :: 		BME_Write(2);
STRB	R2, [SP, #4]
MOVS	R0, #2
SXTH	R0, R0
BL	_BME_Write+0
; dataReady end address is: 8 (R2)
LDRB	R2, [SP, #4]
UXTB	R0, R2
;bme280.c,129 :: 		while(dataReady != 0) {
L_BME280_Forced_Mode0:
; dataReady start address is: 0 (R0)
CMP	R0, #0
IT	EQ
BEQ	L_BME280_Forced_Mode1
; dataReady end address is: 0 (R0)
;bme280.c,130 :: 		data_[0] = BME280_REG_STATUS;
MOVS	R1, #243
MOVW	R0, #lo_addr(_data_+0)
MOVT	R0, #hi_addr(_data_+0)
STRB	R1, [R0, #0]
;bme280.c,131 :: 		BME_Read( 1, 1);
MOVS	R1, #1
MOVS	R0, #1
BL	_BME_Read+0
;bme280.c,132 :: 		dataReady = output[0] & BME280_REG_STATUS_MEASURING_DATA_BIT;
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
LDRB	R0, [R0, #0]
AND	R0, R0, #8
UXTB	R0, R0
; dataReady start address is: 0 (R0)
;bme280.c,133 :: 		}
IT	AL
BAL	L_BME280_Forced_Mode0
L_BME280_Forced_Mode1:
;bme280.c,136 :: 		while (dataReady == 0) {
L_BME280_Forced_Mode2:
; dataReady end address is: 0 (R0)
; dataReady start address is: 0 (R0)
CMP	R0, #0
IT	NE
BNE	L_BME280_Forced_Mode3
; dataReady end address is: 0 (R0)
;bme280.c,137 :: 		data_[0] = BME280_REG_STATUS;
MOVS	R1, #243
MOVW	R0, #lo_addr(_data_+0)
MOVT	R0, #hi_addr(_data_+0)
STRB	R1, [R0, #0]
;bme280.c,138 :: 		BME_Read(1,1);
MOVS	R1, #1
MOVS	R0, #1
BL	_BME_Read+0
;bme280.c,139 :: 		dataReady = output[0] & BME280_REG_STATUS_MEASURING_DATA_BIT;
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
LDRB	R0, [R0, #0]
AND	R0, R0, #8
; dataReady start address is: 0 (R0)
;bme280.c,140 :: 		}
; dataReady end address is: 0 (R0)
IT	AL
BAL	L_BME280_Forced_Mode2
L_BME280_Forced_Mode3:
;bme280.c,141 :: 		}
L_end_BME280_Forced_Mode:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _BME280_Forced_Mode
_BME280_compensate_P_int32:
;bme280.c,143 :: 		uint32_t BME280_compensate_P_int32(int32_t adc_P)
; adc_P start address is: 0 (R0)
; adc_P end address is: 0 (R0)
; adc_P start address is: 0 (R0)
;bme280.c,147 :: 		adc_P >>= 4;
ASRS	R0, R0, #4
;bme280.c,148 :: 		var1 = (((int32_t)t_fine)>>1) - (int32_t)64000;
MOVW	R1, #lo_addr(_t_fine+0)
MOVT	R1, #hi_addr(_t_fine+0)
LDR	R1, [R1, #0]
ASRS	R1, R1, #1
SUB	R4, R1, #64000
;bme280.c,149 :: 		var2 = (((var1>>2) * (var1>>2)) >> 11 ) * ((int32_t)dig_P6);
ASRS	R1, R4, #2
MUL	R3, R1, R1
ASRS	R2, R3, #11
MOVW	R1, #lo_addr(_dig_P6+0)
MOVT	R1, #hi_addr(_dig_P6+0)
LDRSH	R1, [R1, #0]
MULS	R2, R1, R2
;bme280.c,150 :: 		var2 = var2 + ((var1*((int32_t)dig_P5))<<1);
MOVW	R1, #lo_addr(_dig_P5+0)
MOVT	R1, #hi_addr(_dig_P5+0)
LDRSH	R1, [R1, #0]
MULS	R1, R4, R1
LSLS	R1, R1, #1
ADDS	R1, R2, R1
;bme280.c,151 :: 		var2 = (var2>>2)+(((int32_t)dig_P4)<<16);
ASRS	R2, R1, #2
MOVW	R1, #lo_addr(_dig_P4+0)
MOVT	R1, #hi_addr(_dig_P4+0)
LDRSH	R1, [R1, #0]
LSLS	R1, R1, #16
ADDS	R1, R2, R1
; var2 start address is: 20 (R5)
MOV	R5, R1
;bme280.c,152 :: 		var1 = (((dig_P3 * (((var1>>2) * (var1>>2)) >> 13 )) >> 3) + ((((int32_t)dig_P2) * var1)>>1))>>18;
ASRS	R2, R3, #13
MOVW	R1, #lo_addr(_dig_P3+0)
MOVT	R1, #hi_addr(_dig_P3+0)
LDRSH	R1, [R1, #0]
MULS	R1, R2, R1
ASRS	R2, R1, #3
MOVW	R1, #lo_addr(_dig_P2+0)
MOVT	R1, #hi_addr(_dig_P2+0)
LDRSH	R1, [R1, #0]
MULS	R1, R4, R1
ASRS	R1, R1, #1
ADDS	R1, R2, R1
ASRS	R1, R1, #18
;bme280.c,153 :: 		var1 =((((32768+var1))*((int32_t)dig_P1))>>15);
ADD	R2, R1, #32768
MOVW	R1, #lo_addr(_dig_P1+0)
MOVT	R1, #hi_addr(_dig_P1+0)
LDRH	R1, [R1, #0]
MULS	R1, R2, R1
ASRS	R1, R1, #15
; var1 start address is: 12 (R3)
MOV	R3, R1
;bme280.c,154 :: 		if (var1 == 0) {
CMP	R1, #0
IT	NE
BNE	L_BME280_compensate_P_int324
; adc_P end address is: 0 (R0)
; var2 end address is: 20 (R5)
; var1 end address is: 12 (R3)
;bme280.c,155 :: 		return 0; // avoid exception caused by division by zero
MOVS	R0, #0
IT	AL
BAL	L_end_BME280_compensate_P_int32
;bme280.c,156 :: 		}
L_BME280_compensate_P_int324:
;bme280.c,157 :: 		p = (((uint32_t)(((int32_t)1048576)-adc_P)-(var2>>12)))*3125;
; var1 start address is: 12 (R3)
; var2 start address is: 20 (R5)
; adc_P start address is: 0 (R0)
RSB	R2, R0, #1048576
; adc_P end address is: 0 (R0)
ASRS	R1, R5, #12
; var2 end address is: 20 (R5)
SUB	R2, R2, R1
MOVW	R1, #3125
MULS	R1, R2, R1
; p start address is: 0 (R0)
MOV	R0, R1
;bme280.c,158 :: 		if (p < 0x80000000) {
CMP	R1, #-2147483648
IT	CS
BCS	L_BME280_compensate_P_int325
;bme280.c,159 :: 		p = (p << 1) / ((uint32_t)var1);
LSLS	R0, R0, #1
; p end address is: 0 (R0)
UDIV	R0, R0, R3
; var1 end address is: 12 (R3)
; p start address is: 0 (R0)
;bme280.c,160 :: 		}
IT	AL
BAL	L_BME280_compensate_P_int326
L_BME280_compensate_P_int325:
;bme280.c,162 :: 		p = (p / (uint32_t)var1) * 2;
; var1 start address is: 12 (R3)
UDIV	R0, R0, R3
; var1 end address is: 12 (R3)
; p end address is: 0 (R0)
LSLS	R0, R0, #1
; p start address is: 0 (R0)
; p end address is: 0 (R0)
;bme280.c,163 :: 		}
L_BME280_compensate_P_int326:
;bme280.c,164 :: 		var1 = (((int32_t)dig_P9) * ((int32_t)(((p>>3) * (p>>3))>>13)))>>12;
; p start address is: 0 (R0)
MOVW	R1, #lo_addr(_dig_P9+0)
MOVT	R1, #hi_addr(_dig_P9+0)
LDRSH	R2, [R1, #0]
LSRS	R1, R0, #3
MULS	R1, R1, R1
LSRS	R1, R1, #13
MULS	R1, R2, R1
ASRS	R3, R1, #12
;bme280.c,165 :: 		var2 = (((int32_t)(p>>2)) * ((int32_t)dig_P8))>>13;
LSRS	R2, R0, #2
MOVW	R1, #lo_addr(_dig_P8+0)
MOVT	R1, #hi_addr(_dig_P8+0)
LDRSH	R1, [R1, #0]
MULS	R1, R2, R1
ASRS	R1, R1, #13
;bme280.c,166 :: 		p = (uint32_t)((int32_t)p + ((var1 + var2 + dig_P7) >> 4));
ADDS	R2, R3, R1
MOVW	R1, #lo_addr(_dig_P7+0)
MOVT	R1, #hi_addr(_dig_P7+0)
LDRSH	R1, [R1, #0]
ADDS	R1, R2, R1
ASRS	R1, R1, #4
ADDS	R1, R0, R1
; p end address is: 0 (R0)
;bme280.c,167 :: 		return p;
MOV	R0, R1
;bme280.c,168 :: 		}
L_end_BME280_compensate_P_int32:
BX	LR
; end of _BME280_compensate_P_int32
_getPressure:
;bme280.c,171 :: 		double getPressure() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;bme280.c,176 :: 		getTemperature();
BL	_getTemperature+0
;bme280.c,178 :: 		data_[0] = BME280_REG_PRESSUREDATA;
MOVS	R1, #247
MOVW	R0, #lo_addr(_data_+0)
MOVT	R0, #hi_addr(_data_+0)
STRB	R1, [R0, #0]
;bme280.c,179 :: 		BME_Read( 1, 3);
MOVS	R1, #3
MOVS	R0, #1
BL	_BME_Read+0
;bme280.c,180 :: 		result = output[0];
MOVW	R0, #lo_addr(_output+0)
MOVT	R0, #hi_addr(_output+0)
; result start address is: 0 (R0)
LDRB	R0, [R0, #0]
;bme280.c,181 :: 		result <<= 8;
LSLS	R1, R0, #8
; result end address is: 0 (R0)
;bme280.c,182 :: 		result |= output[1];
MOVW	R0, #lo_addr(_output+1)
MOVT	R0, #hi_addr(_output+1)
LDRB	R0, [R0, #0]
ORR	R0, R1, R0, LSL #0
;bme280.c,183 :: 		result <<= 8;
LSLS	R1, R0, #8
;bme280.c,184 :: 		result |= output[2];
MOVW	R0, #lo_addr(_output+2)
MOVT	R0, #hi_addr(_output+2)
LDRB	R0, [R0, #0]
ORR	R0, R1, R0, LSL #0
;bme280.c,185 :: 		return BME280_compensate_P_int32(result)/100.0;
BL	_BME280_compensate_P_int32+0
VMOV	S1, R0
VCVT.F32	#0, S1, S1
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S0, R0
VDIV.F32	S0, S1, S0
;bme280.c,186 :: 		}
L_end_getPressure:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _getPressure
