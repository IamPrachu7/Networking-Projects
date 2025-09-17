@echo off
echo ===============================================
echo Campus LAN with DHCP & Server - Setup Script
echo ===============================================
echo.

echo Checking for Cisco Packet Tracer...
where pt 2>nul >nul
if %errorlevel% neq 0 (
    echo WARNING: Cisco Packet Tracer not found in PATH
    echo Please ensure Packet Tracer is installed and accessible
    echo.
) else (
    echo Cisco Packet Tracer found!
    echo.
)

echo Project files:
echo - Campus_LAN_with_DHCP_&_Server.pkt (Main project file)
echo - Components.png (Network topology diagram)
echo - README_EN.md (English documentation)
echo - README_BN.md (Bengali documentation)
echo - Router_Config_CLI.txt (Router configuration)
echo - PROJECT_STRUCTURE.md (Project structure guide)
echo.

echo Setup complete! 
echo.
echo Next steps:
echo 1. Open Campus_LAN_with_DHCP_&_Server.pkt in Cisco Packet Tracer
echo 2. Read README_EN.md or README_BN.md for instructions
echo 3. Follow the step-by-step setup guide
echo.

pause
