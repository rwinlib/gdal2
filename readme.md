GDAL Windows stack, July 2017. See attached `PKGBUILD` for `mingw-w64-gdal`.

Also rebuilt `mingw-w64-geos` and `mingw-w64-proj` with msys2 + rtools. Just source `rtools32.sh` or `rtools64.sh` before running `makepkg-mingw`.

Stack was built with versions below.

 - GDAL 2.2.0
 - GEOS 3.6.1
 - PROJ 4.9.3
 - CURL 7.54.1 (--with-openssl)
 - POSTGRESQL 9.6.3

To link use this stack:

```
  -lgdal -lsqlite3 -lspatialite -lproj -lgeos_c -lgeos  \
  -ljson-c -lnetcdf -lpq -lintl -lwebp -lcurl -lssh2 -lssl -lcrypto \
  -lhdf5_hl -lhdf5 -lexpat -lfreexl -lcfitsio \
  -lpng16 -ljpeg -ltiff -lgeotiff -lgif -lxml2 -llzma -lszip -lz \
  -lodbc32 -lodbccp32 -liconv -lpsapi -lws2_32 -lcrypt32 -lwldap32 -lsecur32 -lgdi32
```

Full config:

```
GDAL is now configured for x86_64-w64-mingw32

  Installation directory:    /mingw64
  C compiler:                c:/Rtools/mingw_64/bin/gcc -DCURL_STATICLIB -DLIBXML_STATIC -DHAVE_AVX_AT_COMPILE_TIME -DHAVE_SSSE3_AT_COMPILE_TIME -DHAVE_SSE_AT_COMPILE_TIME -march=x86-64 -mtune=generic -O2 -pipe -fno-strict-aliasing
  C++ compiler:              c:/Rtools/mingw_64/bin/g++ -std=gnu++11 -DCURL_STATICLIB -DLIBXML_STATIC -DHAVE_AVX_AT_COMPILE_TIME -DHAVE_SSSE3_AT_COMPILE_TIME -DHAVE_SSE_AT_COMPILE_TIME -march=x86-64 -mtune=generic -O2 -pipe
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
  HDF4 support:              no
  HDF5 support:              yes
  Kea support:               no
  NetCDF support:            yes
  Kakadu support:            no
  JasPer support:            no
  OpenJPEG support:          no
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
  MySQL support:             no
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