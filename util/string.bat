@ECHO off

GOTO %1

:strlen <goto> <resultVar> <stringVar>
CALL :strlenT %~1 %~2 %~3
GOTO :EOF

:strlenT <goto> <resultVar> <stringVar>
REM ECHO 1: %~1 - 2: %~2 - 3: %~3
REM src: https://stackoverflow.com/questions/5837418/how-do-you-get-the-string-length-in-a-batch-file
(   
    SETLOCAL EnableDelayedExpansion
    (set^ tmpV=%~3)
    REM (set^ tmpV=!%~3!)
    
    IF defined tmpV (
        SET "len=1"
        FOR %%P IN (4096 2048 1024 512 256 128 64 32 16 8 4 2 1) DO (
            if "!tmpV:~%%P,1!" NEQ "" ( 
                SET /a "len+=%%P"
                SET "tmpV=!tmpV:~%%P!"
            )
        )
    ) ELSE (
        SET len=0
    )
)
(
    ENDLOCAL
    SET "%~2=%len%"
    REM SET "%~1=%len%"
    EXIT /b
    REM GOTO :EOF
)
