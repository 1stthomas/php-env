@ECHO off

GOTO %1

:handle
IF %input% EQU 1 (
    CALL modules\environment\config\controller.bat startup
    GOTO reprint
)
IF %input% EQU 2 (
    CALL modules\open_cmd\controller.bat startup
    GOTO reprint
)
IF %input% EQU 3 (
    CALL modules\start_programms\controller.bat startup
    GOTO reprint
)
GOTO handleBase

:handleBase
IF %input% EQU 89 (
    GOTO showStatus
)
IF %input% EQU 96 (
    GOTO createInstance
    REM CALL modules\app\controller.bat createInstance
    REM GOTO reprint
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
CALL modules\app\prints.bat println unsupportedInput
ECHO.
GOTO reprint

:createInstance
START CMD /K start.bat
CALL modules\app\prints.bat println newInstance
GOTO reprint

:print
CALL modules\app\view.bat
GOTO handle

:reprint
IF [%~2]==[] (
    CALL modules\app\view.bat printStep
) ELSE (
    IF [%~3]==[] (
        CALL %2 startup
    ) ELSE (
        CALL %2 %3
    )
)
GOTO handle

:showStatus
CALL modules\app\view.bat showStatus
GOTO reprint

:startup
CALL modules\app\view.bat printWithLogo
GOTO handle
