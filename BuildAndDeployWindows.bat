@echo off
setlocal enabledelayedexpansion

echo Building latest project files...
call npm run build

if %errorlevel% neq 0 (
    echo Build failed. Please check the error logs.
    pause
    exit /b %errorlevel%
)

echo Cleaning public directory...
if exist ".\public" (
    del /s /q ".\public\*.*"
    for /d %%p in (".\public\*.*") do rmdir "%%p" /s /q
) else (
    mkdir ".\public"
)

echo Copying files from ./build to ./public...

:: Copy files from build to public
xcopy ".\build\*" ".\public\" /E /Y /Q

if %errorlevel% neq 0 (
    echo Error occurred during file copy. Exiting.
    pause
    exit /b %errorlevel%
)

echo Files copied successfully.

echo Handing off to ^"firebase deploy^"...
firebase deploy