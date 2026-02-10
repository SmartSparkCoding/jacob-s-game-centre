@echo off
title Game Centre Updater
cd /d "%~dp0"

echo =====================================
echo      Game Centre Updating...
echo =====================================
echo.

:: -------------------------------
:: Create backup folder if missing
:: -------------------------------
if not exist "backups" mkdir "backups"

:: -------------------------------
:: Generate Date & Time
:: -------------------------------
for /f %%i in ('powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd_HH-mm"') do set datetime=%%i

set "backupFile=backups\backup_%datetime%.zip"

echo Creating backup...

powershell -NoProfile -Command ^
"Compress-Archive -Path (Get-ChildItem -Path '.' -Recurse -File ^| Where-Object { $_.Name -ne 'launch.bat' -and $_.Name -ne 'update.bat' }) -DestinationPath '%backupFile%' -Force"

echo Backup created.
echo.

:: -------------------------------
:: Download GitHub Repo ZIP
:: -------------------------------
echo Downloading latest files...

set "ZIP_URL=https://github.com/SmartSparkCoding/jacob-s-game-centre/archive/refs/heads/main.zip"
set "TEMP_ZIP=%TEMP%\gc_update.zip"
set "TEMP_EXTRACT=%TEMP%\gc_update"

powershell -NoProfile -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest '%ZIP_URL%' -OutFile '%TEMP_ZIP%'"

if not exist "%TEMP_ZIP%" (
    echo Download failed. ZIP file not found.
    goto :end
)

echo Extracting...

powershell -NoProfile -Command "Expand-Archive '%TEMP_ZIP%' -DestinationPath '%TEMP_EXTRACT%' -Force" || (
    echo Extract failed. ZIP may be corrupt.
    goto :end
)

:: -------------------------------
:: Detect actual extracted folder
:: -------------------------------
for /f "delims=" %%i in ('powershell -NoProfile -Command "(Get-ChildItem -Directory \"%TEMP_EXTRACT%\" | Select-Object -First 1).FullName"') do set "EXTRACTED_DIR=%%i"

if not defined EXTRACTED_DIR (
    echo No extracted folder found in "%TEMP_EXTRACT%".
    goto :end
)

echo Updating game files...

robocopy "%EXTRACTED_DIR%\Current Version" "%cd%" /E /NFL /NDL /NJH /NJS

:: -------------------------------
:: Cleanup
:: -------------------------------
:end
del "%TEMP_ZIP%" >nul 2>&1
rmdir /S /Q "%TEMP_EXTRACT%" >nul 2>&1

echo.
echo =====================================
echo Update Complete!
echo =====================================
pause

start msedge --app="%cd%\index.html"
exit
