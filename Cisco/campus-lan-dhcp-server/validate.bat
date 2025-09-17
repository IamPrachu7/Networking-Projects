@echo off
echo ===============================================
echo Campus LAN Project - File Validation
echo ===============================================
echo.

set "project_dir=%~dp0"
set "error_count=0"

echo Checking required files...
echo.

REM Check for main project file
if exist "%project_dir%Campus_LAN_with_DHCP_&_Server.pkt" (
    echo [OK] Campus_LAN_with_DHCP_^&_Server.pkt
) else (
    echo [ERROR] Campus_LAN_with_DHCP_^&_Server.pkt - MISSING
    set /a error_count+=1
)

REM Check for documentation files
if exist "%project_dir%README_EN.md" (
    echo [OK] README_EN.md
) else (
    echo [ERROR] README_EN.md - MISSING
    set /a error_count+=1
)

if exist "%project_dir%README_BN.md" (
    echo [OK] README_BN.md
) else (
    echo [ERROR] README_BN.md - MISSING
    set /a error_count+=1
)

REM Check for configuration files
if exist "%project_dir%Router_Config_CLI.txt" (
    echo [OK] Router_Config_CLI.txt
) else (
    echo [ERROR] Router_Config_CLI.txt - MISSING
    set /a error_count+=1
)

REM Check for diagram
if exist "%project_dir%Components.png" (
    echo [OK] Components.png
) else (
    echo [WARNING] Components.png - MISSING (Optional)
)

REM Check for project structure documentation
if exist "%project_dir%PROJECT_STRUCTURE.md" (
    echo [OK] PROJECT_STRUCTURE.md
) else (
    echo [WARNING] PROJECT_STRUCTURE.md - MISSING (Optional)
)

echo.
echo ===============================================
if %error_count% equ 0 (
    echo [SUCCESS] All required files are present!
    echo Project is ready for use.
) else (
    echo [ERROR] %error_count% required file(s) missing!
    echo Please ensure all required files are present.
)
echo ===============================================
echo.

pause
