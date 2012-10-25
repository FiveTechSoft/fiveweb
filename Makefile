# FiveWeb makefile

all : ./lib/fiveweb.lib

PRG_OBJS = obj/fiveweb.obj 

./lib/fiveweb.lib : $(PRG_OBJS)

obj/fiveweb.obj : obj/fiveweb.c
	gcc -c -I./../harbour/include -o$@ $<
	ar rc ./lib/libfiveweb.a $@

obj/fiveweb.c : ./source/function/fiveweb.prg
	./../harbour/bin/harbour $< -o./$@ -n -I./../harbour/include -I./include
