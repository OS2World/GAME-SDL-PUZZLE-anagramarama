@echo off
set EMXOMFLD_TYPE=WLINK
set EMXOMFLD_LINKER=wl.exe
set EMXOMFLD_PRELINK=0
cd src
make -f Makefile.os2 > compile-anagramarama.log 2>&1
cd ..
