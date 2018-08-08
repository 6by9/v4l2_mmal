CROSS_COMPILE ?=

CC	:= $(CROSS_COMPILE)gcc
CFLAGS ?= -Iinclude -I/opt/vc/include -pipe -W -Wall -Wextra -g -O0
LDFLAGS	?=
LIBS	:= -L/opt/vc/lib -lrt -lbcm_host -lvcos -lvchiq_arm -pthread -lmmal_core -lmmal_util -lmmal_vc_client -lvcsm

%.o : %.c
	$(CC) $(CFLAGS) -c -o $@ $<

all: v4l2_mmal

v4l2_mmal: v4l2_mmal.o
	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)

clean:
	-rm -f *.o
	-rm -f v4l2_mmal

