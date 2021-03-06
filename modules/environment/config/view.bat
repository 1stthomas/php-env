@ECHO off

GOTO %1

:modules
ECHO  1) Configuration
ECHO  2) Start/Stop
ECHO  3) Open configuration files
ECHO  --
CALL modules\app\view.bat modulesBase
REM ECHO 89) Show status
REM ECHO 96) New Instance
REM ECHO 97) Clean CMD
REM ECHO 98) Go back
REM ECHO 99) Exit CMD

REM ECHO  1) Activate PHP 5.6
REM ECHO  2) Activate PHP 7.0
REM ECHO  3) Activate PHP 7.1
REM ECHO  4) Activate PHP 7.2
REM ECHO 11) Activate MySQL 5.7
REM ECHO 12) Activate MySQL 8.0
REM ECHO 97) Clean CMD
REM ECHO 98) Go back
REM ECHO 99) Exit CMD
GOTO :EOF

:printNoLogo
ECHO %lineDouble%
CALL modules\environment\config\view.bat modules
ECHO %lineSingle%
CALL view\module_input.bat
ECHO %lineDouble%
GOTO :EOF

:printStep
ECHO.
CALL modules\environment\config\view.bat modules
ECHO %lineSingle%
CALL view\module_input.bat
ECHO %lineDouble%
GOTO :EOF

:printWithLogo
ECHO %lineDouble%
ECHO.
CALL view\logo.bat
ECHO %lineSingle%
CALL modules\environment\config\view.bat printStep
GOTO :EOF
