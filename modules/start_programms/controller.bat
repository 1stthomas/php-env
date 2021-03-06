@ECHO off

GOTO %1

:handle
:: Entry point after a user input.
IF %input% EQU 1 (
    ECHO --Missing Implementation--
    GOTO startup
)
IF %input% EQU 2 (
    ECHO --Missing Implementation--
    GOTO startup
)
IF %input% EQU 3 (
    ECHO --Missing Implementation--
    GOTO startup
)
CALL modules\app\controller.bat handleBase modules\start_programms\controller.bat
GOTO :EOF

:startup
:: Entry point after choosing this module.
CALL modules\app\view.bat printStep modules\start_programms\view.bat modules

:: The "Go Back" (%input%==98) input needs to be handled separate.
IF "%input%"=="98" (
    GOTO :EOF
) ELSE (
    GOTO handle
)
