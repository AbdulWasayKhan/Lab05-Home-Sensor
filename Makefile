CC=gcc
CFLAGS=-lWarn -pedantic

House-Alarm:	House-Alarm.o libmyifttt.a
	cc House-Alarm.o -L. -lwiringPi -lmyifttt -lcurl -o House-Alarm

tester:	tester.o libmyifttt.a
	cc tester.o -L. -lmyifttt -lcurl -o tester

irtester:	irtester.o 
	cc irtester.o -lwiringPi -o irtester

blink:	blink.o 
	cc blink.o -lwiringPi -o blink

button:	button.o 
	cc button.o -lwiringPi -o button

libmyifttt.a:	ifttt.o
	ar -rcs libmyifttt.a ifttt.o

ifttt.o:	ifttt.c ifttt.h
	$(CC) $(CFLAGS) -c -ansi $<

tester.o:	tester.c ifttt.h
	$(CC) $(CFLAGS) -c -ansi $<


irtester.o:	irtester.c ifttt.h
	$(CC) $(CFLAGS) -c -ansi $<

House-Alarm.o:	House-Alarm.c ifttt.h
	$(CC) $(CFLAGS) -c -ansi $<

all:	tester irtester blink button House-Alarm
