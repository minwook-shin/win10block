@echo off
:_main
cls
echo.������������������������������������������������������������������
echo.��win10 upgrade block						��
echo.��https://github.com/minwook-shin/win10block			��
echo.��made by : minwook-shin / license : GPL3			��
echo.��								��
echo ��         1. windows 8 only					��
echo.��								��
echo ��         2. windows 7 only					��
echo.��								��
echo ��         3. windows vista only				��
echo.��								��
echo ��         4. end						��
echo.��								��
echo ��         5. reboot(recommend)					��
echo.������������������������������������������������������������������
echo.
echo.
set /p menu=press number :
if "%menu%"=="1" goto _8
if "%menu%"=="2" goto _7
if "%menu%"=="3" goto _vista
if "%menu%"=="4" goto _end
if "%menu%"=="5" goto _shutdown
goto _main

:_8
echo kill GWX(windows10 upgrade program)...
TASKKILL /IM GWX.exe /T /F
echo uninstall KB3035583(GWX Update installs Get Windows 10 app in Windows 8.1 and Windows 7 SP1)...
wusa.exe /uninstall /kb:3035583 /quiet /norestart
echo uninstall KB2976978(Compatibility update for Windows 8.1 and Windows 8)...
wusa.exe /uninstall /kb:2976978 /quiet /norestart
echo disable the Removed update ...
start "title" /b /wait cscript.exe "%~dp0HideWindowsUpdates.vbs" 2976978 3035583
SET /P P=Press enter to go to the main.
goto _main

:_7
echo kill GWX(windows10 upgrade program)...
TASKKILL /IM GWX.exe /T /F
echo uninstall KB3035583(GWX Update installs Get Windows 10 app in Windows 8.1 and Windows 7 SP1)...
wusa.exe /uninstall /kb:3035583 /quiet /norestart
echo uninstall KB2952664(Compatibility update for upgrading Windows 7)...
wusa.exe /uninstall /kb:2952664 /quiet /norestart
echo uninstall KB3021917(Technical Preview update)...
wusa.exe /uninstall /kb:3021917 /quiet /norestart
echo disable the Removed update ...
start "title" /b /wait cscript.exe "%~dp0HideWindowsUpdates.vbs" 3021917 3035583 2952664
SET /P P=Press enter to go to the main.
goto _main

:_vista
echo Windows vista is not applicable.
SET /P P=Press enter to go to the main.
goto _main

:_end
echo The program closes.
SET /P P=Press enter to end.
exit

:_shutdown
echo Finish the settings and reboot Windows.
SET /P P=Press enter to reboot after the program closed.
shutdown -r