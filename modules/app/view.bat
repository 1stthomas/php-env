@ECHO off

GOTO %1

:modules
ECHO  1) Development environment
ECHO  2) Open CMDs on specific folders
ECHO  3) Start Programms
ECHO  --
GOTO :EOF

:modulesBase
ECHO 89) Show status
ECHO 96) New Instance
ECHO 97) Clean CMD
ECHO 98) Go back
ECHO 99) Exit CMD
GOTO :EOF

:printNoLogo
ECHO %lineDouble%
CALL modules\app\view.bat printStep %2 %3
GOTO :EOF

:printStep
ECHO.
IF [%~2]==[] (
    CALL modules\app\view.bat modules
) ELSE (
    IF [%~3]==[] (
        CALL %2 modules
    ) ELSE (
        CALL %2 %3
    )
)
CALL modules\app\view.bat modulesBase
ECHO %lineSingle%
CALL view\module_input.bat
ECHO %lineDouble%
GOTO :EOF

:printWithLogo
ECHO.
ECHO %lineDouble%
ECHO.
CALL view\logo.bat
ECHO %lineSingle%
CALL modules\app\view.bat printStep %2 %3
GOTO :EOF

:showStatus
REM @todo the above line has to be removed!!!
CALL modules\environment\version\controller.bat updateVersions

CALL view\tables.bat printTable "%fpTableStatus%" 4 20 12
GOTO :EOF
