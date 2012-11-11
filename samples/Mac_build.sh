# ./build.sh

clear

if [ $# = 0 ]; then
   echo syntax: ./macbuild.sh file [options...]
   exit
fi

echo compiling...
./../../harbour/bin/harbour $1 -n -I./../include -I./../../harbour/include $2

echo compiling C module...

SDKPATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.7.sdk
HEADERS=$SDKPATH/usr/include
BINPATH=/Applications/Xcode.app/Contents/Developer/usr/bin

$BINPATH/gcc $1.c -c -I./../include -I./../../harbour/include -I$HEADERS

echo linking...

CRTLIB=$SDKPATH/usr/lib
HRBLIBS='-lhbcommon -lhbvm -lhbrtl -lhbrdd -lhbmacro -lhblang -lhbcpage -lhbpp -lhbcplr -lrddntx -lrddcdx -lrddfpt -lhbsix -lhbusrrdd -lhbct -lgtstd -lhbdebug -lm -lncurses'

$BINPATH/gcc $1.o -o $1 -lfiveweb -L./../lib -L./../../harbour/lib -L$CRTLIB $HRBLIBS

rm $1.c
rm $1.o

echo done!

chmod +x ./$1

echo executable done!

