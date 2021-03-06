@ECHO off

GOTO %1

:checkVersions
GOTO :EOF


:printVersions
CALL modules\environment\version\controller.bat updateVersions

CALL view\tables.bat printTable "%fpTableStatus%" 15 10
GOTO :EOF

:updateVersions
SET "header=Service,"
SET "versions=Versions,"

CALL io\versions.bat readVersion apache
SET "header=%header%apache,"
REM IF "%versionTmp%"=="" (
    REM SET "versionTmp=N/A"
REM )
SET "versions=%versions%%versionTmp%,"

CALL io\versions.bat readVersion php
SET "header=%header%php,"
REM IF "%versionTmp%"=="" (
    REM SET "versionTmp=N/A"
REM )
SET "versions=%versions%%versionTmp%,"

CALL io\versions.bat readVersion mysql
SET "header=%header%mysql"
REM IF "%versionTmp%"=="" (
    REM SET "versionTmp=N/A"
REM )
SET "versions=%versions%%versionTmp%

ECHO %header%>%fpTableStatus%
ECHO %versions%>>%fpTableStatus%
