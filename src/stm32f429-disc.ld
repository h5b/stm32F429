/*
 * RAM and ROM (FLASH) available on the STM32F4-Discovery must be defined here
 * everything else is provided by the included LD script of libopencm3
 */
MEMORY
{
	ram (rwx)	: ORIGIN = 0x20000000, LENGTH = 128K
	rom (rx)	: ORIGIN = 0x08000000, LENGTH = 1024K
}

INCLUDE ../libopencm3/lib/stm32/f4/libopencm3_stm32f4.ld
