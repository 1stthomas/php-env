@ECHO off

GOTO %1

:modules
ECHO  1) Development environment
ECHO  2) Open CMDs on specific folders
ECHO  3) Start Programms
ECHO  --
ECHO 89) Show status
ECHO 96) New Instance
ECHO 97) Clean CMD
ECHO 98) Go back
ECHO 99) Exit CMD
GOTO :EOF

:printNoLogo
CALL view\separators.bat printLineDouble
CALL modules\start\view.bat modules
CALL view\separators.bat printLine
CALL view\module_input.bat
CALL view\separators.bat printLineDouble
GOTO :EOF

:printStep
ECHO.
CALL modules\start\view.bat modules
CALL view\separators.bat printLine
CALL view\module_input.bat
CALL view\separators.bat printLineDouble
GOTO :EOF

:printWithLogo
ECHO.
CALL view\separators.bat printLineDouble
ECHO.
CALL view\logo.bat
CALL view\separators.bat printLine
CALL modules\start\view.bat printStep
GOTO :EOF

:showStatus
ECHO Hier kommt dann der Status der einzelnen Environments.
ECHO PHP vorher: 
CALL io\versions.bat readVersion php
ECHO Version danach: !versionTmp!
CALL io\versions.bat readVersion mysql
ECHO Version danach: %versionTmp%
CALL io\versions.bat readVersion apache
ECHO Version danach: %versionTmp%
ECHO ***
ECHO PHP nachher:  
ECHO ***
GOTO :EOF
