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

set "backupFile=%cd%\backups\backup_%datetime%.zip"

echo Creating backup...

powershell -NoProfile -Command ^
"Compress-Archive -Path (Get-ChildItem -Path '%cd%' -Recurse -File ^| Where-Object { $_.Name -ne 'launch.bat' -and $_.Name -ne 'update.bat' }) -DestinationPath '%backupFile%' -Force"

echo Backup created.
echo.

:: -------------------------------
:: Download GitHub Repo ZIP
:: -------------------------------
echo Downloading latest files...

set "ZIP_URL=https://github.com/SmartSparkCoding/jacob-s-game-centre/archive/refs/heads/main.zip"
set "TEMP_ZIP=%TEMP%\gc_update.zip"
set "TEMP_EXTRACT=%TEMP%\gc_update"

powershell -NoProfile -Command "Invoke-WebRequest '%ZIP_URL%' -OutFile '%TEMP_ZIP%'"

echo Extracting...

powershell -NoProfile -Command "Expand-Archive '%TEMP_ZIP%' -DestinationPath '%TEMP_EXTRACT%' -Force"

:: -------------------------------
:: Detect actual extracted folder
:: -------------------------------
for /f "delims=" %%i in ('powershell -NoProfile -Command "(Get-ChildItem -Directory \"%TEMP_EXTRACT%\" | Select-Object -First 1).FullName"') do set "EXTRACTED_DIR=%%i"

echo Updating game files...

robocopy "%EXTRACTED_DIR%\Current Version" "%cd%" /E /XO /NFL /NDL /NJH /NJS

:: -------------------------------
:: Cleanup
:: -------------------------------
del "%TEMP_ZIP%" >nul 2>&1
rmdir /S /Q "%TEMP_EXTRACT%" >nul 2>&1

echo.
echo =====================================
echo Update Complete!
echo ===========
