@echo off 
set cnt=0
:loop
if "%1" neq "" (
  set /a cnt+=1&shift /1&goto :loop
)
set curdate=%date:~6,4%%date:~0,2%%date:~3,2%
set curtime=%time:~0,2%%time:~3,2%%time:~6,2%
rem echo %cnt%
if %cnt% equ 1 (
  set logfile=%curtime%.log
) else (
  set logfile=temp.log
)
rem echo %logfile%
rem set curdir=C:\\Users\\wenbinw\\work\\%curdate%
rem set curdir=C:\\Users\\wenbinw\\work\\log
rem if not exist %curdir% (
rem   md %curdir%
rem )
rem cd %curdir%
adb logcat -c
@echo on
adb logcat -v threadtime > %logfile%
