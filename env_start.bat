@ECHO off

REM ==========================================
REM StartUp Routine
REM ==========================================

REM Directory Definitions
SET dirApache24=C:\dev\Apache24
SET dirMysql57=C:\dev\MySQL-5.7.24
SET dirMysql80=C:\dev\MySQL-8.0.13
SET dirPhpBase=C:\dev\PHP
SET dirDevConfig=C:\dev\Config
SET dirDevConfigApache=%dirDevConfig%\v_apache
SET dirDevConfigMysql=%dirDevConfig%\v_mysql
SET dirDevConfigPhp=%dirDevConfig%\v_php
SET dirWindows=%WINDIR%

REM PHP Versions
SET phpV5=5.6.38
SET phpV70=7.0.32
SET phpV72=7.2.11

REM MySQL Versions
SET mysqlV57=5.7.24
SET mysqlV80=8.0.13

REM Service Names
SET nameServiceApache24=Apache2.4
SET nameServiceMysql57=MySQL5.7
SET nameServiceMysql80=MySQL8.0

SET isInstalledApache=false
SET isInstalledMysql=false

SET phpVersionOld=false
SET mysqlVersionOld=false

SET phpVersion=%phpV72%
CALL :readPhpVersion
CALL :AdjustPhpConfigs

SET mysqlVersion=%mysqlV57%
CALL :readMysqlVersion
CALL :setMysqlVariables
CALL :AdjustMysqlConfigs




:StartUp
CALL :IsInstalledServiceApache
CALL :IsInstalledServiceMysql

SET phpVersionOld=%phpVersion%
SET mysqlVersionOld=%mysqlVersion%

SET installedStr=""
SET installedNotStr=""
SET servicesRunningStr=""
SET servicesRunningNotStr=""
ECHO.
ECHO ====================================================================
ECHO Active Versions of the PHP Environment:
ECHO Apache:   %nameServiceApache24%
ECHO MySQL:    %mysqlVersion%
ECHO PHP:      %phpVersion%
ECHO.
CALL :setInstalledString
IF %installedStr% NEQ "" (
    ECHO %installedStr:"=%
)
IF %installedNotStr% NEQ "" (
    ECHO %installedNotStr:"=%
)
CALL :setServicesRunningString
IF %servicesRunningStr% NEQ "" (
    ECHO %servicesRunningStr:"=%
)
IF %servicesRunningNotStr% NEQ "" (
    ECHO %servicesRunningNotStr:"=%
)
ECHO ====================================================================
ECHO.
ECHO.
ECHO Please select one of the following tasks:
ECHO.

ECHO ********************************************************************
ECHO Development Environment Tasks
ECHO ********************************************************************
ECHO.
ECHO  1) Start the PHP Environment
ECHO  5) Stop the PHP Environment
ECHO 11) Restart the Apache Service
ECHO 12) Restart the MySQL Service
ECHO 21) Start the Environment Configuration
ECHO 22) Start the folder tasks
ECHO 81) Open a CMD on the Apache htdocs Folder
ECHO 82) Open a CMD on the MySQL bin Folder
ECHO 98) Clear the Console Screen
ECHO 99) Exit this programm
ECHO.
SET /P Input=Please Enter your Selection: 
ECHO.
ECHO --------------------------------------------------------------------
ECHO Your Input: %Input%
ECHO --------------------------------------------------------------------
ECHO.


IF %Input% EQU 1 (
    GOTO :RunPhpServices
)
IF %Input% EQU 5 (
    GOTO :StopPhpServices
)
IF %Input% EQU 11 (
    GOTO :RestartApacheService
)
IF %Input% EQU 12 (
    GOTO :RestartMysqlService
)
IF %Input% EQU 21 (
    GOTO :StartSetup
)
IF %Input% EQU 22 (
    GOTO :StartFolders
)
IF %Input% EQU 81 (
	START CMD /K "CD /D C:\dev\Apache24\htdocs\"
	GOTO :StartUp
)
IF %Input% EQU 82 (
	START CMD /K "CD /D C:\dev\MySQL-8.0.13\bin\"
	GOTO :StartUp
)
IF %Input% EQU 98 (
    CLS
	GOTO :StartUp
)
IF %Input% EQU 99 (
    GOTO :ExitApp
)
ECHO.
ECHO Your selection does not exist. Please choose another one.
ECHO.
GOTO :StartUp



:StartSetup

ECHO.
ECHO Please select one of the following tasks:
ECHO.

ECHO ********************************************************************
ECHO Configuration
ECHO ********************************************************************
ECHO.
ECHO  1) Activate PHP 5.6
ECHO  2) Activate PHP 7.0
ECHO  3) Activate PHP 7.2
ECHO 11) Activate MySQL 5.7
ECHO 12) Activate MySQL 8.0
ECHO 98) Go Back to the Environment Tasks
ECHO 99) Exit this programm
ECHO.
SET /P Input=Please Enter your Selection: 
ECHO.
ECHO --------------------------------------------------------------------
ECHO Your Input: %Input%
ECHO --------------------------------------------------------------------
ECHO.


REM =======================================
REM PHP Adjustments
REM =======================================
IF %Input% EQU 1 (
    SET phpVersion=%phpV5%
)
IF %Input% EQU 2 (
    SET phpVersion=%phpV70%
)
IF %Input% EQU 3 (
    SET phpVersion=%phpV72%
)
IF %Input% GEQ 1 IF %Input% LEQ 3 (
    CALL :writePhpVersion
    IF %phpVersionOld% NEQ %phpVersion% (
	    CALL :AdjustPhpConfigs
	)
    GOTO :StartSetup
)
REM =======================================
REM MySQL Adjustments
REM =======================================
IF %Input% EQU 11 (
    SET mysqlVersion=%mysqlV57%
)
IF %Input% EQU 12 (
    SET mysqlVersion=%mysqlV80%
)
IF %Input% GEQ 11 IF %Input% LEQ 12 (
    CALL :writeMysqlVersion
	CALL :setMysqlVariables
    GOTO :StartSetup
)
REM =======================================
REM Other Tasks
REM =======================================
IF %Input% EQU 98 (
    REM Go back to the Environment Tasks
    GOTO :StartUp
)
IF %Input% EQU 99 (
    REM Close this CMD
    GOTO :ExitApp
)
ECHO.
ECHO Your selection does not exist. Please choose another one.
ECHO.
GOTO :StartSetup



:StartFolders

ECHO.
ECHO Please select one of the following tasks:
ECHO.

ECHO ********************************************************************
ECHO Open a CMD at a specific folder
ECHO ********************************************************************
ECHO.
ECHO  1) Open a CMD on the Apache htdocs Folder
ECHO  2) Open a CMD on the MySQL bin Folder
ECHO 11) PHP Concrete5
ECHO 12) PHP Concrete5 - c5 Core
ECHO 13) PHP Concrete5 - c56 Hostings
ECHO 14) PHP Concrete5 - c57 Hostings
ECHO 15) PHP Concrete5 - c58 Hostings
ECHO 16) PHP Concrete5 - c58 Packages
ECHO 17) PHP Concrete5 - c5 Tests
ECHO 18) PHP Concrete5 - ht7 Packages
ECHO 21) PHP Misc
ECHO 98) Go Back to the Environment Tasks
ECHO 99) Exit this programm
ECHO.
SET /P Input=Please Enter your Selection: 
ECHO.
ECHO --------------------------------------------------------------------
ECHO Your Input: %Input%
ECHO --------------------------------------------------------------------
ECHO.


IF %Input% EQU 1 (
    START CMD cd C:\data\edv\php\misc
    GOTO :StartFolders
)
IF %Input% EQU 11 (
    START /D C:\data\edv\php\concrete5 DIR
    GOTO :StartFolders
)
IF %Input% EQU 12 (
    START /D C:\data\edv\php\concrete5\c5_core DIR
    GOTO :StartFolders
)
IF %Input% EQU 13 (
    START /D C:\data\edv\php\concrete5\c56_hostings DIR
    GOTO :StartFolders
)
IF %Input% EQU 14 (
    START /D C:\data\edv\php\concrete5\c57_hostings DIR
    GOTO :StartFolders
)
IF %Input% EQU 15 (
    START /D C:\data\edv\php\concrete5\c58_hostings DIR
    GOTO :StartFolders
)
IF %Input% EQU 16 (
    START /D C:\data\edv\php\concrete5\c58_packages DIR
    GOTO :StartFolders
)
IF %Input% EQU 17 (
    START /D C:\data\edv\php\concrete5\c5_tests DIR
    GOTO :StartFolders
)
IF %Input% EQU 18 (
    START /D C:\data\edv\php\concrete5\ht7_packages DIR
    GOTO :StartFolders
)
IF %Input% EQU 21 (
    START /D C:\data\edv\php\misc DIR
    GOTO :StartFolders
)
REM =======================================
REM Other Tasks
REM =======================================
IF %Input% EQU 98 (
    REM Go back to the Environment Tasks
    GOTO :StartUp
)
IF %Input% EQU 99 (
    REM Close this CMD
    GOTO :ExitApp
)
ECHO.
ECHO Your selection does not exist. Please choose another one.
ECHO.
GOTO :StartFolders




:RunPhpServices
CALL :InstallServicesIfNeeded
ECHO Start of the PHP environment services
CALL :StartServiceMysql
CALL :StartServiceApache24
ECHO.
ECHO.
GOTO :StartUp


:RestartApacheService
ECHO Restart of the %nameServiceApache24% service
CALL :StopServiceApache24
CALL :StartServiceApache24
ECHO.
GOTO :StartUp


:RestartMysqlService
ECHO Restart of the %nameServiceMysql% service
CALL :StopServiceMysql
CALL :StartServiceMysql
ECHO.
GOTO :StartUp


:StopPhpServices
ECHO Stop the PHP environment services
ECHO.
CALL :StopServiceMysql
CALL :StopServiceApache24
CALL :DeinstallServiceMysql
CALL :DeinstallServiceApache24
GOTO :StartUp


REM Environment Checks
:IsInstalledServiceApache
SC QUERY %nameServiceApache24% > NUL
IF %ERRORLEVEL% EQU 1060 (
    SET isInstalledApache=false
) ELSE (
    SET isInstalledApache=true
)
GOTO :EOF


:IsInstalledServiceMysql
SC QUERY %nameServiceMysql% > NUL
IF %ERRORLEVEL% EQU 1060 (
    SET isInstalledMysql=false
) ELSE (
    SET isInstalledMysql=true
)
GOTO :EOF


REM Service Installations
:InstallServiceApache24
CD /D %dirApache24%\bin
ECHO Install the Apache service
httpd.exe -k install -n %nameServiceApache24%
ECHO.
GOTO :EOF


:InstallServiceMysql
ECHO Change directory to %dirMysql%\bin
CD /D %dirMysql%\bin
ECHO Install the MySQL service
mysqld --install %nameServiceMysql%
SC DESCRIPTION %nameServiceMysql% "Mysql %mysqlVersion%" > nul
ECHO.
GOTO :EOF


:InstallServicesIfNeeded
CALL :IsInstalledServiceApache
IF %isInstalledApache% EQU false (
    CALL :InstallServiceApache24
)
CALL :IsInstalledServiceMysql
IF %isInstalledMysql% EQU false (
    CALL :InstallServiceMysql
)
GOTO :EOF


:DeinstallServiceApache24
ECHO Change directory to %dirApache24%\bin
CD /D "%dirApache24%\bin"
httpd.exe -k uninstall -n %nameServiceApache24%
ECHO.
GOTO :EOF


:DeinstallServiceMysql
REM SC DELETE %nameServiceMysql80%
ECHO Change directory to %dirMysql%\bin
CD /D "%dirMysql%\bin"
mysqld --remove %nameServiceMysql%
ECHO.
GOTO :EOF


:StartServiceApache24
NET START %nameServiceApache24%
REM httpd.exe -k start -n %nameServiceApache24%
ECHO Change directory to "%dirApache24%\bin"
IF %errorlevel% EQU 2 (
    ECHO.
	ECHO The %nameServiceApache24% - Service could not be started.
	ECHO.
	GOTO :StartUp
)

CD /D "%dirApache24%\bin"
ECHO Following the current Apache version:
httpd -v
ECHO.
GOTO :EOF


:StartServiceMysql
START CMD /C "NET START %nameServiceMysql%"
IF %errorlevel% EQU 2 (
    ECHO.
	ECHO The %nameServiceMysql% - Service could not be started.
	ECHO.
	GOTO :StartUp
)
ECHO Following the current MySQL version:
CD /D %dirMysql%"\bin"
mysql --version
ECHO.
GOTO :EOF


:StopServiceApache24
NET STOP %nameServiceApache24%
GOTO :EOF


:StopServiceMysql
NET STOP %nameServiceMysql%
GOTO :EOF


:AdjustMysqlConfigs
CD /D C:\dev\config
IF %mysqlVersion% EQU %mysqlV57% (
	COPY my_57.ini my.ini
) ELSE (
    COPY my_80.ini my.ini
)
GOTO :EOF

:setMysqlVariables
IF %mysqlVersion% EQU %mysqlV57% (
	SET dirMysql=%dirMysql57%
	SET nameServiceMysql=%nameServiceMysql57%
    IF %mysqlVersionOld% NEQ %mysqlV57% (
	    CALL :AdjustMysqlConfigs
	)
) ELSE (
    SET dirMysql=%dirMysql80%
	SET nameServiceMysql=%nameServiceMysql80%
    IF %mysqlVersionOld% NEQ %mysqlV80% (
	    CALL :AdjustMysqlConfigs
	)
)
GOTO :EOF



:AdjustPhpConfigs
CD /D %dirApache24%\conf
DEL "httpd.conf"
IF %phpVersion% EQU %phpV5% (
    SET phpVersionOld=%phpV5%
	ECHO Copy httpd php5 config
    COPY /Y "%cd%\tom\httpd_php5.conf" "%cd%\httpd.conf" >Nul
)
IF %phpVersion% EQU %phpV70% (
    SET phpVersionOld=%phpV70%
    ECHO Copy httpd php7.0 config
    COPY /Y "%cd%\tom\httpd_php70.conf" "%cd%\httpd.conf" >Nul
)
IF %phpVersion% EQU %phpV72% (
    SET phpVersionOld=%phpV72%
    ECHO Copy httpd php7.2 config
    COPY /Y "%cd%\tom\httpd_php72.conf" "%cd%\httpd.conf" >Nul
)
CD /D %dirPhpBase%
ECHO Delete of the current PHP folder
DEL /F /Q %cd%\current\*
ECHO Copy of the PHP-%phpVersion% folder
IF %phpVersion% EQU %phpV5% (
    XCOPY "%cd%\php%phpV5%" "%cd%\current" /E /H /C /R /Q /Y
)
IF %phpVersion% EQU %phpV70% (
    XCOPY "%cd%\php%phpV70%" "%cd%\current" /E /H /C /R /Q /Y
)
IF %phpVersion% EQU %phpV72% (
	ECHO Copy php folder php7.2
    XCOPY "%cd%\php%phpV72%" "%cd%\current" /E /H /C /R /Q /Y
)
ECHO.
GOTO :EOF




:setInstalledString
IF %isInstalledApache% EQU true (
    SET installedStr="Apache"
) ELSE (
    SET installedNotStr="Apache"
)
IF %isInstalledMysql% EQU true (
    IF %installedStr% EQU "" (
	    SET installedStr="The MySQL Service is installed"
	    SET installedNotStr="The Apache Service is not installed"
	) ELSE (
	    SET installedStr="The Apache and the MySQL Services are installed"
	)
) ELSE (
    IF %installedNotStr% EQU "" (
	    SET installedStr="The Apache Service is installed"
	    SET installedNotStr="The MySQL Service is not installed"
	) ELSE (
	    SET installedNotStr="The Apache and the MySQL Services are not installed"
	)
)
GOTO :EOF


:setServicesRunningString
REM Check if the Apache Service is running
SC query %nameServiceApache24% | find "RUNNING" >Nul
IF "%ERRORLEVEL%"=="0" (
    SET servicesRunningStr="Apache"
) ELSE (
    SET servicesRunningNotStr="Apache"
)
REM Check if the MySQL Service is running
SET mysqlRunning=false
SC query %nameServiceMysql% | find "RUNNING" >Nul
IF "%ERRORLEVEL%"=="0" (
    IF %servicesRunningStr% EQU "" (
        SET servicesRunningStr="The MySQL Service is running"
        SET servicesRunningNotStr="The Apache Service is not running"
    ) ELSE (
        SET servicesRunningStr="The Apache and the MySQL Services are running"
	)
) ELSE (
    IF %servicesRunningNotStr% EQU "" (
        SET servicesRunningStr="The Apache Service is running"
        SET servicesRunningNotStr="The MySQL Service is not running"
    ) ELSE (
        SET servicesRunningNotStr="The Apache and the MySQL Services are not running"
	)
)
GOTO :EOF


:readMysqlVersion
IF EXIST %dirDevConfigMysql% (
    SET /P mysqlVersion=< %dirDevConfigMysql%
) ELSE (
    CALL :writeMysqlVersion
)
GOTO :EOF

:readPhpVersion
IF EXIST %dirDevConfigMysql% (
    SET /P phpVersion=< %dirDevConfigPhp%
) ELSE (
    CALL :writePhpVersion
)
GOTO :EOF

:writeMysqlVersion
REM CD /D %dirDevConfig%
REM ECHO %mysqlVersion% > v_mysql.txt
ECHO %mysqlVersion% > %dirDevConfigMysql%
GOTO :EOF

:writePhpVersion
REM CD /D %dirDevConfig%
REM ECHO %phpVersion% > v_php.txt
ECHO %phpVersion% > %dirDevConfigPhp%
GOTO :EOF




:ExitApp
Exit


