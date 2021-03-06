@ECHO off

SETLOCAL

Title ht7 development tools

REM Load all config values.
CALL config\versions.bat
CALL config\paths.bat
CALL config\names.bat
CALL config\printables.bat
CALL config\app.bat
REM CALL config.bat
CALL bootstrap.bat
REM CALL logger.bat


REM SET versionTmp=""
REM CALL modules\app\versions.bat readVersion php
REM CALL io\versions.bat
REM CALL io\versions.bat readVersion
CALL io\versions.bat readVersion php
REM mit % geht, mit ! nicht:
ECHO version php - aus start.bat: %versionTmp% - !versionTmp! - %~2 - %2
CALL modules\environment\version\controller.bat updateVersions
CALL modules\app\controller.bat startup
GOTO :EOF




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
IF %Input% EQU 99 (
    GOTO :EOF
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