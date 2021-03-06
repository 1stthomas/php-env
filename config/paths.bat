@ECHO off


REM Directory Definitions
SET dirApache24=C:\dev\Apache24
SET dirLogFile=%~dp0info.log
SET dirMysql57=C:\dev\MySQL-5.7.24
REM SET dirMysql80=C:\dev\MySQL-8.0.13
SET dirMysql80=C:\dev\mysql\mysql-8.0.23-winx64
SET dirPhpBase=C:\dev\PHP
SET dirConfig=C:\dev\Config
REM SET dirDevConfig=C:\dev\Config
SET dirData=C:\dev\data
SET dirVersions=%dirData%\versions
REM SET dirDevConfigApache=%dirDevConfig%\v_apache
REM SET dirDevConfigMysql=%dirDevConfig%\v_mysql
REM SET dirDevConfigPhp=%dirDevConfig%\v_php
SET dirWindows=%WINDIR%

:: File paths
SET fpTableMatrix=%dirData%\table_matrix.d4a
SET fpTableStatus=%dirData%\table_status.d4a
