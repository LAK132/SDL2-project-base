set BINDIR=bin
set OBJDIR=obj

set INCDIRS=include include\SDL
set LIBDIR=lib
set LIBS=SDL2main.lib SDL2.lib

set SOURCE=src\compile.cpp
set BINARY=app.exe

set CXX=cl /nologo /std:c++17 /D_CRT_SECURE_NO_WARNINGS /DNOMINMAX /MT /EHsc /Zc:rvalueCast /Zc:wchar_t /Zc:ternary

if "%mode%"=="debug" goto debug
if "%mode%"=="release" goto release
if "%mode%"=="nolog" goto nolog
goto :eof

:debug
set COMPFLAGS=/Zi /bigobj /O2
set LINKFLAGS=/SUBSYSTEM:CONSOLE /DEBUG
goto :eof

:release
set COMPFLAGS=/DNDEBUG /bigobj /O2
set LINKFLAGS=/SUBSYSTEM:CONSOLE
goto :eof

:nolog
set COMPFLAGS=/DNOLOG /DNDEBUG /bigobj /O2
set LINKFLAGS=/SUBSYSTEM:CONSOLE
