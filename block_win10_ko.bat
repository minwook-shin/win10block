@echo off
:_main
cls
echo.������������������������������������������������������������������
echo.��������10 ���׷��̵� ����(win10 block)				��
echo.��https://github.com/minwook-shin/win10block			��
echo.�������� : minwook-shin / ���̼��� : GPL3			��
echo.��								��
echo ��         1. ������8 ����					��
echo.��								��
echo ��         2. ������7 ����					��
echo.��								��
echo ��         3. ������vista ����					��
echo.��								��
echo ��         4. ����						��
echo.��								��
echo ��         5. ���� �� �����(�������)				��
echo.������������������������������������������������������������������
echo.
echo.
set /p menu=��ȣ�� �Է����ּ��� :
if "%menu%"=="1" goto _8
if "%menu%"=="2" goto _7
if "%menu%"=="3" goto _vista
if "%menu%"=="4" goto _end
if "%menu%"=="5" goto _shutdown
goto _main

:_8
echo GWX(������10 ������Ʈ �˸�)�� �����մϴ�...
TASKKILL /IM GWX.exe /T /F
echo KB3035583(������8.1�� ������7�� ����10�� ������ �ִ� GWX ������Ʈ)�� �����մϴ�...
wusa.exe /uninstall /kb:3035583 /quiet /norestart
echo KB2976978(������8,������8.1 ���׷��̵� ȣȯ�� ������Ʈ)�� �����մϴ�...
wusa.exe /uninstall /kb:2976978 /quiet /norestart
echo ������ ������Ʈ�� ��Ȱ��ȭ�մϴ�...
start "title" /b /wait cscript.exe "%~dp0HideWindowsUpdates-ko.vbs" 2976978 3035583
SET /P P=enter�� ������ �������� �̵��մϴ�.
goto _main

:_7
echo GWX(������10 ������Ʈ �˸�)�� �����մϴ�...
TASKKILL /IM GWX.exe /T /F
echo KB3035583(������8.1�� ������7�� ����10�� ������ �ִ� GWX ������Ʈ)�� �����մϴ�...
wusa.exe /uninstall /kb:3035583 /quiet /norestart
echo KB2952664(������7 ���׷��̵� ȣȯ�� ������Ʈ)�� �����մϴ�...
wusa.exe /uninstall /kb:2952664 /quiet /norestart
echo KB3021917(Technical Preview ������Ʈ ����)�� �����մϴ�...
wusa.exe /uninstall /kb:3021917 /quiet /norestart
echo ���ŵ� ������Ʈ�� ��Ȱ��ȭ�մϴ�...
start "title" /b /wait cscript.exe "%~dp0HideWindowsUpdates-ko.vbs" 3021917 3035583 2952664
SET /P P=enter�� ������ �������� �̵��մϴ�.
goto _main

:_vista
echo ������ vista�� �ش� ���׾����ϴ�.
SET /P P=enter�� ������ �������� �̵��մϴ�.
goto _main

:_end
echo ���α׷��� �����ϴ�
SET /P P=enter�� ������ �����մϴ�.
exit

:_shutdown
echo ������ �������ϰ� �����츦 ������մϴ�.
SET /P P=enter�� ������ ���α׷��� ������ ������մϴ�.
shutdown -r