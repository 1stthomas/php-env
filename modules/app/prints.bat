@ECHO off

SETLOCAL EnableDelayedExpansion
CALL util\validation.bat validate2ParameterExistence %1 %2

SET check=""
IF "%err%"=="%check%" (
    GOTO %1
)

REM add quotes to transfer the string as a single variable.
CALL modules\app\prints.bat printErr "%err%" prints.bat
REM CALL :printErr "%err%" prints.bat
GOTO :EOF

:printErr
REM the input variable can not be used to strip the first and last char.
SET err=%2
REM output the error without the first and last char.
SET err=%err:~1,-1%

ECHO.
powershell write-host -fore Red %lineDouble%
powershell write-host -fore Red %2
IF [%3] NEQ [] (
    SET src=Source: %~dp0%2
    powershell write-host -fore Red !src!
)
powershell write-host -fore Red %lineDouble%
ECHO.
GOTO :EOF

:println
IF "%2" EQU "newInstance" (
    ECHO A new instance has been created.
)
IF "%2" EQU "unsupportedInput" (
    SET "msg=Your selection %input% is not supported."
    powershell write-host -fore Red !msg!
)
GOTO :EOF
