#define F_CPU 16000000L
#include <util/delay.h>  
#define DDRB (*(volatile unsigned char * )0x0024)
#define PORTB (*(volatile unsigned char * )0x0025)

int main(void){
	//DDRB = 0b00000101;
	DDRB |= 1<<5;


	while(1)
	{/*
		PORTB = 0b00000101;
		_delay_ms(1000);
		PORTB = 0b00000000;
		_delay_ms(1000);
		*/
		PORTB |= 1<<5;
		_delay_ms(1000);
		PORTB &= ~1<<5;
		_delay_ms(1000);
		
	}
    return 0;
}
