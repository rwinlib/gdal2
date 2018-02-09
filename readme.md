# GDAL for R

## NEWS

 - RWINLIB GDAL v2.2.3: Added drivers for MYSQL, HDF4, KEALIB, OPENJPEG2000, JASPER

## Stack Details

GDAL Windows stack, lasted updated February 2018. Contains:

 - GDAL 2.2.3
 - GEOS 3.6.1
 - PROJ 4.9.3

Recently updated drivers (library only):

 - NETCDF 4.5.0
 - HDF5 1.8.20
 - HDF4 4.2.13
 - KEALIB 1.4.7
 - CURL 7.54.1 (--with-winssl)
 - LIBMARIADBCLIENT 2.3.4
 - POSTGRESQL 9.6.3 (--with-openssl)

Due to changes in `mingw-w64` we rebuild most dependencies from source using msys2 + rtools. Just source `rtools32.sh` or `rtools64.sh` before running `makepkg-mingw`.


## How to use

To link the stack use the following flags in your package `Makevars.win`. 

```
VERSION = 2.2.3
COMPILED_BY ?= gcc-4.6.3
RWINLIB = ../windows/gdal2-$(VERSION)
TARGET = lib$(subst gcc,,$(COMPILED_BY))$(R_ARCH)

PKG_CPPFLAGS =\
  -I$(RWINLIB)/include/gdal \
  -I$(RWINLIB)/include/geos \
  -I$(RWINLIB)/include/proj

PKG_LIBS = \
  -L$(RWINLIB)/$(TARGET) \
  -lgdal -lsqlite3 -lspatialite -lproj -lgeos_c -lgeos  \
  -ljson-c -lnetcdf -lmariadbclient -lpq -lintl -lwebp -lcurl -lssh2 -lssl -lcrypto \
  -lkea -lhdf5_cpp -lhdf5_hl -lhdf5 -lexpat -lfreexl -lcfitsio \
  -lmfhdf -ldf -lxdr \
  -lopenjp2 -ljasper -lpng16 -ljpeg -ltiff -lgeotiff -lgif -lxml2 -llzma -lszip -lz \
  -lodbc32 -lodbccp32 -liconv -lpsapi -lws2_32 -lcrypt32 -lwldap32 -lsecur32 -lgdi32
```

See the `sf` package [Makevars.win](https://github.com/r-spatial/sf/blob/master/src/Makevars.win) for a working example.

## Build config

Define the following macros to statically link against curl, xml2, openjpeg and jasper:

```
-DCURL_STATICLIB -DLIBXML_STATIC -DOPJ_STATIC -DJAS_DLL=0 
```

The PKGBUILD has a fix for autoconf to detect HDF4:

```
sed -i 's/-lsz /-lszip -lxdr -lm/g' configure.ac
```

See attached [`PKGBUILD`](PKGBUILD) for `mingw-w64-gdal`. Example i686 configure output (same drivers as x64):

```
GDAL is now configured for i686-w64-mingw32

  Installation directory:    /usr/local
  C compiler:                c:/Rtools/mingw_32/bin/gcc -DCURL_STATICLIB -DLIBXML_STATIC -DOPJ_STATIC -DJAS_DLL=0 -DHAVE_AVX_AT_COMPILE_TIME -DHAVE_SSSE3_AT_COMPILE_TIME -DHAVE_SSE_AT_COMPILE_TIME -march=i686 -mtune=generic -O2 -pipe -fno-strict-aliasing
  C++ compiler:              c:/Rtools/mingw_32/bin/g++ -std=gnu++11 -DCURL_STATICLIB -DLIBXML_STATIC -DOPJ_STATIC -DJAS_DLL=0 -DHAVE_AVX_AT_COMPILE_TIME -DHAVE_SSSE3_AT_COMPILE_TIME -DHAVE_SSE_AT_COMPILE_TIME -march=i686 -mtune=generic -O2 -pipe
  C++11 support:             yes

  LIBTOOL support:           yes

  LIBZ support:              external
  LIBLZMA support:           yes
  cryptopp support:          no
  GRASS support:             no
  CFITSIO support:           external
  PCRaster support:          internal
  LIBPNG support:            external
  DDS support:               no
  GTA support:               no
  LIBTIFF support:           external (BigTIFF=yes)
  LIBGEOTIFF support:        external
  LIBJPEG support:           external
  12 bit JPEG:               no
  12 bit JPEG-in-TIFF:       no
  LIBGIF support:            external
  OGDI support:              no
  HDF4 support:              yes
  HDF5 support:              yes
  Kea support:               yes
  NetCDF support:            yes
  Kakadu support:            no
  JasPer support:            yes (GeoJP2=no)
  OpenJPEG support:          yes
  ECW support:               no
  MrSID support:             no
  MrSID/MG4 Lidar support:   no
  JP2Lura support:           no
  MSG support:               no
  GRIB support:              yes
  EPSILON support:           no
  WebP support:              yes
  cURL support (wms/wcs/...):yes
  PostgreSQL support:        yes
  MRF support:               yes
  MySQL support:             yes
  Ingres support:            no
  Xerces-C support:          no
  NAS support:               no
  Expat support:             yes
  libxml2 support:           yes
  Google libkml support:     no
  ODBC support:              yes
  PGeo support:              yes
  FGDB support:              no
  MDB support:               no
  PCIDSK support:            internal
  OCI support:               no
  GEORASTER support:         no
  SDE support:               no
  Rasdaman support:          no
  DODS support:              no
  SQLite support:            yes
  PCRE support:              no
  SpatiaLite support:        yes
  RasterLite2 support:       no
  Teigha (DWG and DGNv8):    no
  INFORMIX DataBlade support:no
  GEOS support:              yes
  SFCGAL support:            no
  QHull support:             internal
  Poppler support:           no
  Podofo support:            no
  PDFium support:            no
  OpenCL support:            no
  Armadillo support:         no
  FreeXL support:            yes
  SOSI support:              no
  MongoDB support:           no


  SWIG Bindings:             no

  Statically link PROJ.4:    yes
  enable GNM building:       yes
  enable pthread support:    no
  enable POSIX iconv support:yes
  hide internal symbols:     no
```