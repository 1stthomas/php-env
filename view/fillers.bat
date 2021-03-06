@ECHO off

GOTO %1

:getSpaces <goto> <count> <var> [char]
(
    SETLOCAL EnableDelayedExpansion

    IF "%4"=="" (
        SET "char= "
    ) ELSE (
        SET "char=%4"
    )

    IF %2 GTR 0 (
        (set^ tmpV2=!char!)
        
        FOR /L %%P IN (2,1,%2) DO (
            SET tmpV2=!tmpV2!!char!
        )
    )
)
(
    ENDLOCAL
    SET "%~3=%tmpV2%"
    GOTO :EOF
)

:getSpacesOld <goto> <count> <var> [char]
REM SETLOCAL
(
    SETLOCAL EnableDelayedExpansion
    
    ECHO ___ start strings: %1 - %2 - %3 - %4

    IF "%4"=="" (
        SET "char= "
    ) ELSE (
        SET "char=%4"
    )

    IF %2 GTR 0 (
        REM SET "tmpV="
        (set^ "tmpV=!char!")
        (set^ "tmpV2=!char!")
        FOR /L %%P IN (2,1,%2) DO (
            SET "tmpV=!%tmpV%%char%!"
            REM SET "tmpV=!tmpV!%char%"
            SET "tmpV2=!tmpV!%char%"
            ECHO no: %%P - %tmpV% - !tmpV! - __char: %char%_
            ECHO no: %%P - %tmpV2% - !tmpV2!
        )
        REM FOR /L %%P IN (1,1,%2) DO SET "tmpV=!%tmpV%%char%!"
        REM FOR /L %%P IN (1,1,5) DO "tmpV=!%tmpV%%char%!"
        ECHO result: %tmpV% - !tmpV! - v2: %tmpV2% - !tmpV2!
    )
)
(
    ENDLOCAL
    ECHO im getSpacer - %tmpV% - !tmpV!
    SET "%~3=%tmpV%"
    GOTO :EOF
)
