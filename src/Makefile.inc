CONFIG	?= arm-none-eabi

MCPU	= cortex-m4

CC	= $(CONFIG)-gcc
LD	= $(CONFIG)-ld
OBJCOPY = $(CONFIG)-objcopy
OBJDUMP = $(CONFIG)-objdump
SIZE	= $(CONFIG)-size

OPT	= s

# Common Include Paths
TOP := $(dir $(lastword $(MAKEFILE_LIST)))
TOP := $(patsubst %/, %, $(TOP))

CFLAGS += -O$(OPT) -g
CFLAGS += -mthumb -mcpu=$(MCPU)
CFLAGS += -Werror -Wextra
CFLAGS += -Wall -Wcast-align -Wimplicit
CFLAGS += -Wpointer-arith -Wswitch
CFLAGS += -Wredundant-decls -Wreturn-type -Wshadow -Wunused
CFLAGS += -I$(TOP)/../libopencm3/include
CFLAGS += -lc -lrdimon
