@ECHO off


REM Directory Definitions
SET dirApache24=C:\dev\Apache24
SET dirLogFile=%~dp0info.log
SET dirMysql57=C:\dev\MySQL-5.7.24
REM SET dirMysql80=C:\dev\MySQL-8.0.13
SET dirMysql80=C:\dev\mysql\mysql-8.0.23-winx64
SET dirPhpBase=C:\dev\PHP
SET dirDevConfig=C:\dev\Config
SET dirVersions=C:\dev\data\versions
SET dirDevConfigApache=%dirDevConfig%\v_apache
SET dirDevConfigMysql=%dirDevConfig%\v_mysql
SET dirDevConfigPhp=%dirDevConfig%\v_php
SET dirWindows=%WINDIR%

REM Service Names
SET nameServiceApache24=Apache2.4
SET nameServiceMysql57=MySQL5.7
SET nameServiceMysql80=MySQL8.0

REM Misc Variables
SET logActivated=1
SET logSeparator=--------------------------------------------------------------------------------------------------