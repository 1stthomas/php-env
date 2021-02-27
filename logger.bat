@ECHO off
SETLOCAL

IF %logActivated% == 1 (
    GOTO logMessage
)
GOTO :EOF

:logMessage
ECHO %date%-%time% >> %dirLogFile%
ECHO %~1 >> %dirLogFile%
ECHO %logSeparator% >> %dirLogFile%
GOTO :EOF