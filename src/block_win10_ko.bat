@echo off
chcp 949
:_main
cls
echo.┌───────────────────────────────┐
echo.│윈도우10 업그레이드 막기(win10 block)				│
echo.│https://github.com/minwook-shin/win10block			│
echo.│만든이 : minwook-shin / 라이센스 : GPL3			│
echo.│								│
echo │         1. 윈도우8 전용					│
echo.│								│
echo │         2. 윈도우7 전용					│
echo.│								│
echo │         3. 윈도우vista 전용					│
echo.│								│
echo │         4. 종료						│
echo.│								│
echo │         5. 종료 후 재부팅(권장사항)				│
echo.└───────────────────────────────┘
echo.
echo.
set /p menu=번호를 입력해주세요 :
if "%menu%"=="1" goto _8
if "%menu%"=="2" goto _7
if "%menu%"=="3" goto _vista
if "%menu%"=="4" goto _end
if "%menu%"=="5" goto _shutdown
goto _main

:_8
echo GWX(윈도우10 업데이트 알림)을 종료하는중입니다...
TASKKILL /IM GWX.exe /T /F
echo KB3035583(윈도우8.1과 윈도우7에 윈도10을 받을수 있는 GWX 업데이트)를 제거하는중입니다...
wusa.exe /uninstall /kb:3035583 /quiet /norestart
echo KB2976978(윈도우8,윈도우8.1 업그레이드 호환성 업데이트)를 제거하는중입니다...
wusa.exe /uninstall /kb:2976978 /quiet /norestart
echo 제거한 업데이트를 비활성화하는중입니다...
start "title" /b /wait cscript.exe "%~dp0HideWindowsUpdates.vbs" 2976978 3035583
echo 윈도우10 업데이트를 성공적으로 막았습니다.
SET /P P=enter를 누르면 메인으로 이동합니다.
goto _main

:_7
echo GWX(윈도우10 업데이트 알림)을 종료하는중입니다...
TASKKILL /IM GWX.exe /T /F
echo KB3035583(윈도우8.1과 윈도우7에 윈도10을 받을수 있는 GWX 업데이트)를 제거하는중입니다...
wusa.exe /uninstall /kb:3035583 /quiet /norestart
echo KB2952664(윈도우7 업그레이드 호환성 업데이트)를 제거하는중입니다...
wusa.exe /uninstall /kb:2952664 /quiet /norestart
echo KB3021917(Technical Preview 업데이트 관련)을 제거하는중입니다...
wusa.exe /uninstall /kb:3021917 /quiet /norestart
echo 제거된 업데이트를 비활성화하는중입니다...
start "title" /b /wait cscript.exe "%~dp0HideWindowsUpdates.vbs" 3021917 3035583 2952664
echo 윈도우10 업데이트를 성공적으로 막았습니다.
SET /P P=enter를 누르면 메인으로 이동합니다.
goto _main

:_vista
echo 윈도우 vista는 해당 사항없습니다.
SET /P P=enter를 누르면 메인으로 이동합니다.
goto _main

:_end
echo 프로그램이 닫힙니다
SET /P P=enter를 누르면 종료합니다.
exit

:_shutdown
echo 설정을 마무리하고 윈도우를 재부팅합니다.
SET /P P=enter를 누르면 프로그램이 닫힌후 재부팅합니다.
shutdown -r