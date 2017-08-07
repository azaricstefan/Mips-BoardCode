#ifndef _ULTRASONIC_H_
#define _ULTRASONIC_H_


#define   _ULTRASONIC_START_TIME       10
#define   _ULTRASONIC_COUNT_TIME       1

//TRIG PIN NEEDS TO BE CONNECTED ON PB14
//ECHO PIN NEEDS TO BE CONNECTED ON PB15

void initUltrasonic();
double getDistance();

#endif