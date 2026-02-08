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
if not exist backups mkdir backups

:: -------------------------------
:: Generate Date & Time
:: -------------------------------
for /f %%i in ('powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd_HH-mm"') do set datetime=%%i

set backupFile=backups\backup_%datetime%.zip

echo Creating backup...

powershell -NoProfile -Command ^
"Compress-Archive -Path (Get-ChildItem -Path '.' -Recurse -File ^| Where-Object { $_.Name -ne 'launch.bat' -and $_.Name -ne 'update.bat' }) -DestinationPath '%backupFile%' -Force"

echo Backup created.
echo.

:: -------------------------------
:: Download GitHub Repo ZIP
:: -------------------------------
echo Downloading latest files...

set ZIP_URL=https://github.com/SmartSparkCoding/jacob-s-game-centre/archive/refs/heads/main.zip
set TEMP_ZIP=%TEMP%\gc_update.zip
set TEMP_EXTRACT=%TEMP%\gc_update

powershell -NoProfile -Command "Invoke-WebRequest '%ZIP_URL%' -OutFile '%TEMP_ZIP%'"

echo Extracting...

powershell -NoProfile -Command "Expand-Archive '%TEMP_ZIP%' -DestinationPath '%TEMP_EXTRACT%' -Force"

:: -------------------------------
:: Copy ONLY 'Current Version' contents
:: -------------------------------
echo Updating game files...

robocopy ^
"%TEMP_EXTRACT%\jacob-s-game-centre-main\Current Version" ^
"%~dp0" /E /XO

:: -------------------------------
:: Cleanup
:: -------------------------------
echo Cleaning up...

del "%TEMP_ZIP%"
rmdir /S /Q "%TEMP_EXTRACT%"

echo.
echo =====================================
echo Update Complete!
echo =====================================
pause

start msedge --app="C:\Users\NavaratneJ\OneDrive - Ashford School\Documents\Pre - Made Folders\Desktop\Game Centre Test\^\index.html"

exit