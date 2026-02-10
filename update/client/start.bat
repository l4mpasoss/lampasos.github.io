@echo off
setlocal

REM ====== НАСТРОЙКИ ======
set SERVER_IP=127.0.0.1
set SERVER_PORT=22003

REM ====== ПУТИ ======
set BASEDIR=%~dp0
set MTAPATH=%BASEDIR%MTA San Andreas 1.6\Multi Theft Auto.exe

echo [Launcher] Starting...

REM 1) Проверка MTA в папке client\mta
if exist "%MTAPATH%" (
  echo [Launcher] Found MTA in: %MTAPATH%
  start "" "%MTAPATH%"
) else (
  echo [Launcher] MTA not found in client\mta
  echo [Launcher] Install MTA or put it into: %BASEDIR%mtasa\
  pause
  exit /b 1
)

REM 2) Пауза, чтобы MTA успел подняться
timeout /t 2 >nul

REM 3) Автоконнект (через протокол mtasa://)
start "" "mtasa://%SERVER_IP%:%SERVER_PORT%"

exit /b 0
