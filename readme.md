
# New GDAL stack

**NOTE** For building `rgdal` from CRAN you need [rwinlib/rgdal](https://github.com/rwinlib/gdal) stack. 


This is a completely new gdal windows stack which has many more features enabled than the old one](https://github.com/rwinlib/gdal). It enables: 

 - geos 3.5.0
 - proj 4.9.3
 - sqlite3
 - spatialite
 - netcdf
 - hdf5
 - cfitsio
 - lzma
 - odbc
 - xml2
 - expat
 - png
 - jpeg
 - gif
 - tiff
 - gif
 - geotiff
 
Example of your `Makevars.win` file:

```
CXX_STD=CXX11
COMPILED_BY ?= gcc-4.6.3
RWINLIB = lib${subst gcc,,${COMPILED_BY}}${R_ARCH}

PKG_CPPFLAGS =\
	-I../windows/gdal-2.1.1/include/gdal \
	-I../windows/gdal-2.1.1/include/geos

PKG_LIBS = \
	-L../windows/gdal-2.1.1/${RWINLIB} \
	-lgdal -lsqlite3 -lspatialite -lproj -lgeos_c -lgeos  \
	-lhdf5 -lexpat -lfreexl -lcfitsio \
	-lpng16 -ljpeg -ltiff -lgeotiff -lgif -lxml2 -llzma -lszip \
	-lodbc32 -lodbccp32 -liconv -lz -lws2_32
```

The build scripts are included. Debug symbols were stripped of using `strip -g *.a` to reduce sizes.