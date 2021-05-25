@echo off
set PROJECT_DIR=%CD%
set PROJECT_DRIVE=%CD:~0,2%

call "C:\Qt\Qt5.3.2\5.3\msvc2010_opengl\bin\qtenv2.bat"
call "C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\vcvarsall.bat"

%PROJECT_DRIVE%
cd %PROJECT_DIR%

echo ==================================================
echo Create install bundle Lampmedia Player for windows
echo ==================================================

cd Installer
rmdir /S /Q bin 2> nul
mkdir bin
cd bin

echo ==================================================
echo -----BEGIN BUILD ------
echo ==================================================
echo %CD%
qmake ..\..\src\lampbox.pro -r -spec win32-msvc2010 "CONFIG+=release"
nmake /S /NOLOGO
echo ==================================================
echo -----END BUILD-----
echo ==================================================

rmdir /S /Q ..\package 2> nul
mkdir ..\package

copy release\lampbox.exe ..\package
cd ..\package
windeployqt .

echo ==================================================
echo Start to create -Installer-
echo ==================================================
cd ..
makensis.exe /DVERSION=%VERSION% installer.nsi
echo ==================================================
echo End of installation create
echo ==================================================
cd ..

pause