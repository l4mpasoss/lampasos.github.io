@echo off
setlocal

REM ====== НАСТРОЙКИ ======
set SERVER_IP=127.0.0.1
set SERVER_PORT=7777

REM ====== ПУТИ ======
set BASEDIR=%~dp0
set CRMPPATH=%BASEDIR%multiplayer_c\multiplayer_browser_cr.exe

echo [Launcher] Starting...

REM 1) Проверка MTA в папке client\mta
if exist "%MTAPATH%" (
  echo [Launcher] Found MTA in: %MTAPATH%
  start "" "%CRMPPATH%"
) else (
  echo [Launcher] MTA not found in client\mta
  echo [Launcher] Install MTA or put it into: %BASEDIR%crmp\
  pause
  exit /b 1
)

REM 2) Пауза, чтобы MTA успел подняться
timeout /t 2 >nul

REM 3) Автоконнект (через протокол mtasa://)
start "" "crmp://%SERVER_IP%:%SERVER_PORT%"

exit /b 0
