@ECHO off

REM SETLOCAL
REM SETLOCAL EnableDelayedExpansion

GOTO %~1

:printTable <goto> <filepath> <count> [first] [others]
REM cell count per row
SET count=%~3
REM SET count=4
REM size of the first cell of a row in char count
SET charCountFirst=%~4
REM size of the other cells of a row in char count
SET charCountOthers=%~5
REM calculate the size of a row for the vertical borders of the table
SET /A "rowLength=(%count%-1)*%charCountOthers%+%charCountFirst%+%count%+1"
REM the vertical border of the table is stored in the %rowSeparator% variable
CALL view\fillers.bat getSpaces %rowLength% rowSeparator -

SETLOCAL EnableDelayedExpansion

REM Iterate through the rows of the status file.
FOR /F "tokens=1-%count% delims=," %%a in (%~2) DO (
    ECHO !rowSeparator!
    SET name=%%a

    CALL :getFirstItem
    REM To build these items the goto must be called over the related file.
    REM Otherwise the values would be empty.
    CALL view\tables.bat getOtherItem %%b
    CALL view\tables.bat getOtherItem %%c
    CALL view\tables.bat getOtherItem %%d

    REM before printing the double quotes have to be removed again
    ECHO !str:"=!
)
ECHO %rowSeparator%

GOTO :EOF

:getFirstItem
CALL util\string.bat strlenT length %name%
SET /A fillerLen=%charCountFirst%-!length!-1
CALL view\fillers.bat getSpaces !fillerLen! filler

REM add the filler chars and the table borders
SET "str=| !name!!filler!|"
REM sanitze the string
SET str=!str:"=!

GOTO :EOF

:getOtherItem <value>
REM ECHO others: %~1 - %~2
CALL util\string.bat strlenT length %~2
SET /A fillerLen=%charCountOthers%-%length%-1
CALL view\fillers.bat getSpaces !fillerLen! filler

ENDLOCAL

REM sanitze the original string, add the filler chars and the table borders
REM and make sure the string is accessable outside of the local block
SET str="!str:"=! %~2!filler!^^^|"

GOTO :EOF
