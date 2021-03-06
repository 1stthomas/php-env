@ECHO off

SETLOCAL EnableDelayedExpansion
CALL util\validation.bat validate2ParameterExistence %1 %2

SET check=""
IF "%err%"=="%check%" (
    GOTO %1
)

REM add quotes to transfer the string as a single variable.
CALL modules\app\prints.bat printErr "%err%"
GOTO :EOF

:readVersion
ECHO hier...123
SET versionTmp=""

CALL io\versions.bat readVersion php

ECHO _____version1: %versionTmp% - !versionTmp!

REM CALL io\versions.bat readVersion2 php

REM ECHO _____version2: %versionTmp% - !versionTmp!

GOTO :EOF
