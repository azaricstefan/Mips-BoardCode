_showTempLCD:
;lcd.c,12 :: 		void showTempLCD(float temp, float hum)
SUB	SP, SP, #44
STR	LR, [SP, #0]
VSTR	#1, S0, [SP, #36]
VSTR	#1, S1, [SP, #40]
;lcd.c,16 :: 		Lcd_Init();
BL	_Lcd_Init+0
;lcd.c,17 :: 		My_Delay_ms(DELAY_LCD);
MOVS	R0, #100
BL	_my_Delay_ms+0
;lcd.c,18 :: 		Lcd_Cmd(_LCD_CLEAR);
MOVS	R0, #1
BL	_Lcd_Cmd+0
;lcd.c,19 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
MOVS	R0, #12
BL	_Lcd_Cmd+0
;lcd.c,21 :: 		FloatToStr(temp,txtTemp);
ADD	R2, SP, #4
MOV	R0, R2
VLDR	#1, S0, [SP, #36]
BL	_FloatToStr+0
;lcd.c,22 :: 		FloatToStr(hum,txtHum);
ADD	R2, SP, #19
MOV	R0, R2
VLDR	#1, S0, [SP, #40]
BL	_FloatToStr+0
;lcd.c,23 :: 		Lcd_Out(1,1,"Temp:");
MOVW	R2, #lo_addr(?lstr1_lcd+0)
MOVT	R2, #hi_addr(?lstr1_lcd+0)
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;lcd.c,24 :: 		Lcd_Out(2,1,"Hum:");
MOVW	R2, #lo_addr(?lstr2_lcd+0)
MOVT	R2, #hi_addr(?lstr2_lcd+0)
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
;lcd.c,25 :: 		Lcd_Out(1,7,txtTemp);
ADD	R2, SP, #4
MOVS	R1, #7
MOVS	R0, #1
BL	_Lcd_Out+0
;lcd.c,26 :: 		Lcd_Out(2,7,txtHum);
ADD	R2, SP, #19
MOVS	R1, #7
MOVS	R0, #2
BL	_Lcd_Out+0
;lcd.c,27 :: 		}
L_end_showTempLCD:
LDR	LR, [SP, #0]
ADD	SP, SP, #44
BX	LR
; end of _showTempLCD
_showText:
;lcd.c,28 :: 		void showText(uint8_t* text)
SUB	SP, SP, #8
STR	LR, [SP, #0]
STR	R0, [SP, #4]
;lcd.c,30 :: 		Lcd_Init();
BL	_Lcd_Init+0
;lcd.c,31 :: 		My_Delay_ms(DELAY_LCD);
MOVS	R0, #100
BL	_my_Delay_ms+0
;lcd.c,32 :: 		Lcd_Cmd(_LCD_CLEAR);
MOVS	R0, #1
BL	_Lcd_Cmd+0
;lcd.c,33 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
MOVS	R0, #12
BL	_Lcd_Cmd+0
;lcd.c,35 :: 		Lcd_Out(1,1,text);
LDR	R2, [SP, #4]
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;lcd.c,36 :: 		}
L_end_showText:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _showText
_initLCD:
;lcd.c,38 :: 		void initLCD()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;lcd.c,40 :: 		GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_0  | _GPIO_PINMASK_1);
MOVS	R1, #3
MOVW	R0, #lo_addr(GPIOA_BASE+0)
MOVT	R0, #hi_addr(GPIOA_BASE+0)
BL	_GPIO_Digital_Output+0
;lcd.c,41 :: 		GPIO_Digital_Output(&GPIOB_BASE, _GPIO_PINMASK_10 | _GPIO_PINMASK_11);
MOVW	R1, #3072
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Output+0
;lcd.c,42 :: 		GPIO_Digital_Output(&GPIOC_BASE, _GPIO_PINMASK_13);
MOVW	R1, #8192
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
;lcd.c,43 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_7);
MOVW	R1, #128
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;lcd.c,44 :: 		}
L_end_initLCD:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _initLCD
