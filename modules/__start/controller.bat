@ECHO off

GOTO %1

:handle
IF %input% EQU 1 (
    CALL modules\environment\config\controller.bat startup
    GOTO reprint
)
IF %input% EQU 2 (
    GOTO reprint
)
IF %input% EQU 3 (
    GOTO reprint
)
IF %input% EQU 89 (
    GOTO showStatus
)
IF %input% EQU 96 (
    CALL modules\app\controller.bat createInstance
    GOTO reprint
)
IF %input% EQU 97 (
    CLS
    GOTO reprint
)
IF %input% EQU 98 (
    GOTO :EOF
)
IF %input% EQU 99 (
    EXIT
)
ECHO.
ECHO Your selection %input% is not supported.
ECHO.
GOTO reprint

:print
CALL modules\start\view.bat
GOTO handle

:reprint
CALL modules\start\view.bat printStep
REM CALL modules\start\view.bat printNoLogo
GOTO handle

:showStatus
CALL modules\start\view.bat showStatus
GOTO reprint

:startup
CALL modules\start\view.bat printWithLogo
GOTO handle
