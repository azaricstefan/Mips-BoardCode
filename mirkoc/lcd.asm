_showTempLCD:
;lcd.c,19 :: 		void showTempLCD(float temp, float hum)
SUB	SP, SP, #36
STR	LR, [SP, #0]
; hum start address is: 4 (R1)
; temp start address is: 0 (R0)
VMOV.F32	S2, S1
; hum end address is: 4 (R1)
; temp end address is: 0 (R0)
; temp start address is: 0 (R0)
; hum start address is: 8 (R2)
;lcd.c,24 :: 		Lcd_Cmd(_LCD_CLEAR);
MOVS	R0, #1
BL	_Lcd_Cmd+0
;lcd.c,25 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
MOVS	R0, #12
BL	_Lcd_Cmd+0
;lcd.c,27 :: 		FloatToStr(temp,txtTemp);
ADD	R2, SP, #4
MOV	R0, R2
; temp end address is: 0 (R0)
BL	_FloatToStr+0
;lcd.c,28 :: 		FloatToStr(hum,txtHum);
ADD	R2, SP, #19
MOV	R0, R2
VMOV.F32	S0, S2
; hum end address is: 8 (R2)
BL	_FloatToStr+0
;lcd.c,29 :: 		Lcd_Out(1,1,"Temp:");
MOVW	R2, #lo_addr(?lstr1_lcd+0)
MOVT	R2, #hi_addr(?lstr1_lcd+0)
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;lcd.c,30 :: 		Lcd_Out(2,1,"Hum:");
MOVW	R2, #lo_addr(?lstr2_lcd+0)
MOVT	R2, #hi_addr(?lstr2_lcd+0)
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
;lcd.c,31 :: 		Lcd_Out(1,7,txtTemp);
ADD	R2, SP, #4
MOVS	R1, #7
MOVS	R0, #1
BL	_Lcd_Out+0
;lcd.c,32 :: 		Lcd_Out(2,7,txtHum);
ADD	R2, SP, #19
MOVS	R1, #7
MOVS	R0, #2
BL	_Lcd_Out+0
;lcd.c,33 :: 		}
L_end_showTempLCD:
LDR	LR, [SP, #0]
ADD	SP, SP, #36
BX	LR
; end of _showTempLCD
_initLCD:
;lcd.c,35 :: 		void initLCD()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;lcd.c,37 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_0  | _GPIO_PINMASK_1);
MOVS	R1, #3
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
;lcd.c,38 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_10 | _GPIO_PINMASK_11);
MOVW	R1, #3072
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;lcd.c,39 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_13);
MOVW	R1, #8192
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
;lcd.c,40 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;lcd.c,41 :: 		my_Delay_ms(DELAY_LCD);
MOVW	R0, #100
BL	_my_Delay_ms+0
;lcd.c,42 :: 		Lcd_Cmd(_LCD_CLEAR);
MOVS	R0, #1
BL	_Lcd_Cmd+0
;lcd.c,43 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
MOVS	R0, #12
BL	_Lcd_Cmd+0
;lcd.c,45 :: 		Lcd_Out(1,1,"App start");
MOVW	R0, #lo_addr(?lstr3_lcd+0)
MOVT	R0, #hi_addr(?lstr3_lcd+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;lcd.c,47 :: 		}
L_end_initLCD:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _initLCD
