CC = $(CROSS_COMPILE)gcc
AR = $(CROSS_COMPILE)ar
CFLAGS += -Wall -O2

WARM_A = libwarm.a
WARM_SO = libwarm.so
OBJS = warm.o sys_cacheflush.o

all: $(WARM_A) $(WARM_SO) test

$(WARM_A): $(OBJS)
	$(AR) rc $@ $^

$(WARM_SO): $(OBJS)
	$(CC) $(CFLAGS) $^ -o $@ -shared

test: test.o
	$(CC) $(CFLAGS) $^ -o $@ libwarm.a

clean:
	$(RM) $(WARM_A) $(WARM_SO) $(OBJS) test test.o
