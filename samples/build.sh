# ./build.sh

clear

if [ $# = 0 ]; then
   echo syntax: ./build.sh file [options...]
   exit
fi

echo compiling...
./../../harbour/bin/harbour $1 -n -I./../include -I./../../harbour/include $2

echo compiling C module...
gcc $1.c -c -I./../include -I./../../harbour/include

echo linking...
gcc $1.o -o$1 -L./../lib -L./../../harbour/lib -Wl,--start-group -lfiveweb -lhbcommon -lhbvm -lhbrtl -lhbrdd -lhbmacro -lhblang -lhbcpage -lhbpp -lhbcplr -lrddntx -lrddcdx -lrddfpt -lhbsix -lhbusrrdd -lhbct -lgttrm -lhbdebug -lm -lgpm -lncurses -Wl,--end-group

rm $1.c
rm $1.o

echo done!
./$1
