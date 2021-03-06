@ECHO off

REM GOTO %1

REM SETLOCAL EnableDelayedExpansion
CALL util\validation.bat validate2ParameterExistence %1 %2
REM ENDLOCAL

SET check=""
IF "%err%"=="%check%" (
    GOTO %1
)

REM add quotes to transfer the string as a single variable.
CALL modules\app\prints.bat printErr "%err%"
GOTO :EOF

:readVersion <dummy> <environment-app>
REM Read the value of the first line of the file at %dirVersions%\%2.
SET "versionTmp="
IF "%2" NEQ "" (
    IF EXIST %dirVersions%\%2% (
        FOR /F "tokens=*" %%a in (%dirVersions%\%2%) do (
            REM The value of the versionTmp variable will not be accessable before the end of the if clause.
            SET versionTmp=%%a
        )
    ) ELSE (
        SET "versionTmp=N/A"
    )
)
REM CALL io\versions.bat writeVersion %2 %versionTmp%
GOTO :EOF

:writeVersion <dummy> <environment-app> <version>
REM Write the value of the 3rd parameter into the file at %dirVersions%\%2.
ECHO %3>%dirVersions%\%2
GOTO :EOF

:test
REM for /f "tokens=* usebackq" %%f in (`dir /b /o:d`) do (set "file=%%f" & goto :next)
for /f "tokens=* usebackq" %%f in (%dirVersions%\%2%) do (set "vTmp=%%f" & goto :EOF)
REM FOR /F "tokens=*" %%a in (%dirVersions%\%2%) do (
    REM SET vTmp=%%a
REM )
GOTO :EOF
