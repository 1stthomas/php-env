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
    GOTO reprint
)