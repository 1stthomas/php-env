@ECHO off

GOTO %1

:validate1ParameterExistence
SET err=""
IF [%2]==[] (
    SET err=The first parameter is undefined.
)
GOTO :EOF

:validate2ParameterExistence
SET err=""
IF [%2]==[] (
    IF [%3]==[] (
        SET err=The first and second parameters are undefined.
    ) ELSE (
        SET err=The first parameter is undefined.
    )
) ELSE (
    IF [%3]==[] (
        SET err=The second parameter is undefined.
    )
)
GOTO :EOF
