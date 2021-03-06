@ECHO off

REM SETLOCAL

GOTO %1

:printVersionLine <app> <version>
REM CALL util\string.bat strlen result %2
SET "len=%2"
CALL util\string.bat strlen result len
REM CALL util\string.bat strlen result %2
ECHO strlen: %result% - %strlen% - !strlen! - %len%
CALL view\fillers.bat getSpaces 1 spacer
ECHO ---filler: _%spacer%_ - _!spacer!_
ECHO %2: %3
GOTO :EOF
