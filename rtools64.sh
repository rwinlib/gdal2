#!/bin/sh
RCONFIG="/c/Progra~1/R/R-3.4.3/bin/x64/R CMD config"
CXX11="`$RCONFIG CXX11`"
CXX11STD="`$RCONFIG CXX11STD`"
export CXX="$CXX11 $CXX11STD -DCURL_STATICLIB -DLIBXML_STATIC -DOPJ_STATIC -DJAS_DLL=0"
export CXXCPP="`$RCONFIG CXXCPP`"
export CXXFLAGS="`$RCONFIG CXXFLAGS`"
export CC="`$RCONFIG CC` -DCURL_STATICLIB -DLIBXML_STATIC -DOPJ_STATIC -DJAS_DLL=0"
export CPP="`$RCONFIG CPP`"
export CFLAGS="`$RCONFIG CFLAGS`"

# Link against mingw64 libs
export CPPFLAGS="-I/mingw64/include -I/usr/local/include -DCURL_STATICLIB -DLIBXML_STATIC -DOPJ_STATIC"
export LDFLAGS="-L/mingw64/lib -L/usr/local/lib"
export LIBS="-L/mingw64/lib -L/usr/local/lib -lxdr"

# To use 'ar' and stuff from Rtools as well
#RBINPATH=`dirname $CC`
#RBINPATH=`cygpath $RBINPATH`
#export PATH="$RBINPATH:$PATH"
