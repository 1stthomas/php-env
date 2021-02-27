@ECHO off
SETLOCAL

REM Get the needed values.
CALL versions.bat
CALL config.bat
CALL bootstrap.bat
REM CALL logger.bat

ECHO phpv: %phpV72%
ECHO dir apache: %dirApache24%

:StartUp
SET /P Input=Please Enter your Selection: 
ECHO.
ECHO --------------------------------------------------------------------
ECHO Your Input: %Input%
ECHO --------------------------------------------------------------------


IF %Input% EQU 1 (
    GOTO Run1
)
IF %Input% EQU 2 (
    GOTO Run2
)
ECHO.
ECHO Your selection does not exist. Please choose another one.
ECHO.
GOTO :StartUp

:Run1
ECHO logge was..
CALL io\versions.bat readPhpVersion
CALL logger.bat "Dies und jenes..."
GOTO :StartUp

:Run2
ECHO logge was..
CALL logger.bat "Dies und jenes aus m 2..."
GOTO :StartUp