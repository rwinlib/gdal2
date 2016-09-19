# Link against dependency C libs from msys2
#export CC="/mingw/bin/gcc -O3"
#export CXX="/mingw/bin/g++ -O3"
#export PATH="/usr/local/bin:/mingw/bin/:/c/msys2-i686/mingw32/bin:$PATH"
#export PKG_CONFIG="/c/msys2-i686/mingw32/bin/pkg-config"
#export PKG_CONFIG_PATH="/c/msys2-i686/mingw32/lib/pkgconfig"
#export CPPFLAGS="-m32 -I/c/msys2-i686/mingw32/include -I/c/msys2-i686/mingw32/include/libxml2"
export CPPFLAGS="-I/local/include"
export CFLAGS="-m64 -DNDEBUG -O2 -DLIBXML_STATIC"
export CXXFLAGS="-m64 -DNDEBUG -O2 -DLIBXML_STATIC"
export LDFLAGS="-L/local/lib -m64"
./configure \
    --enable-static \
    --disable-shared \
    --disable-debug \
    --with-libjson-c=internal \
    --with-geos=yes \
    --with-static-proj4=yes \
    --with-expat=yes \
    --with-sqlite3=yes \
    --with-odbc="/c/msys2-x64/mingw64" \
    --with-threads=no \
    --with-jasper=no \
    --with-pcraster=internal \
    --with-pcidsk=internal \
    --with-bsb \
    --with-grib \
    --with-pam \
    --with-xml2="/c/msys2-x64/mingw64" \
    --with-cfitsio="/c/msys2-x64/mingw64" \
    --with-libz="/c/msys2-x64/mingw64" \
    --with-liblzma="/c/msys2-x64/mingw64" \
    --with-netcdf="/c/msys2-x64/mingw64" \
    --with-png="/c/msys2-x64/mingw64" \
    --with-jpeg="/c/msys2-x64/mingw64" \
    --with-gif="/c/msys2-x64/mingw64" \
    --with-libtiff="/c/msys2-x64/mingw64" \
    --with-geotiff="/c/msys2-x64/mingw64" \
    --with-spatialite="/c/msys2-x64/mingw64" \

