# FiveWeb makefile

all : ./lib/fiveweb.lib

PRG_OBJS = obj/fiveweb.obj \
	obj/button.obj \
	obj/checkbox.obj \
	obj/datepick.obj \
	obj/dialog.obj \
	obj/folder.obj

./lib/fiveweb.lib : $(PRG_OBJS)

obj/%.obj : obj/%.c
	gcc -c -I./../harbour/include -o$@ $<
	ar rc ./lib/libfiveweb.a $@

obj/%.c : ./source/function/%.prg
	./../harbour/bin/harbour $< -o./$@ -n -I./../harbour/include -I./include

obj/%.c : ./source/classes/%.prg
	./../harbour/bin/harbour $< -o./$@ -n -I./../harbour/include -I./include
