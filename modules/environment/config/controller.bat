@ECHO off

GOTO %1

:handle
IF %input% EQU 1 (
    GOTO Run1
)
IF %input% EQU 2 (
    GOTO Run2
)
IF %input% EQU 3 (
    GOTO Run2
)
CALL modules\app\controller.bat handleBase
GOTO :EOF

REM IF %input% EQU 97 (
    REM CLS
    REM GOTO reprint
REM )
REM IF %input% EQU 98 (
    REM GOTO :EOF
REM )
REM IF %input% EQU 99 (
    REM EXIT
REM )
REM ECHO.
REM ECHO Your selection %input% is not supported!.!
REM ECHO.
REM GOTO :reprint

:print
CALL modules\environment\config\view.bat
GOTO handle

:reprint
CALL modules\environment\config\view.bat printNoLogo
GOTO handle

:startup
CALL modules\environment\config\view.bat printStep
REM CALL modules\environment\config\view.bat printWithLogo
GOTO handle
