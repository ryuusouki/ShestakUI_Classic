@echo off
rmdir /S /Q "C:\WowClassic\World of Warcraft\_classic_\Interface\AddOns\ShestakUI"
rmdir /S /Q "C:\WowClassic\World of Warcraft\_classic_\Interface\AddOns\ShestakUI_Config"
Xcopy /E /I "D:\WOW UI\SI\github\ShestakUI_Classic\ShestakUI" "C:\WowClassic\World of Warcraft\_classic_\Interface\AddOns\ShestakUI"
Xcopy /E /I "D:\WOW UI\SI\github\ShestakUI_Classic\ShestakUI_Config" "C:\WowClassic\World of Warcraft\_classic_\Interface\AddOns\ShestakUI_Config"
pause
