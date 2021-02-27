@ECHO off

GOTO %1

:readMysqlVersion
IF EXIST %dirDevConfigMysql% (
    REM Assign the first line of the file to the variable.
    SET /P mysqlVersion=<%dirDevConfigMysql%
) ELSE (
    CALL :writeMysqlVersion
)
GOTO :EOF

:readPhpVersion
IF EXIST %dirDevConfigPhp% (
    REM Assign the first line of the file to the variable.
    SET /P phpVersion=<%dirDevConfigPhp%
) ELSE (
    CALL :writePhpVersion
)
GOTO :EOF

:writeMysqlVersion
REM CD /D %dirDevConfig%
REM ECHO %mysqlVersion% > v_mysql.txt
ECHO %mysqlVersion%>%dirDevConfigMysql%
GOTO :EOF

:writePhpVersion
REM CD /D %dirDevConfig%
REM ECHO %phpVersion% > v_php.txt
ECHO %phpVersion%>%dirDevConfigPhp%
GOTO :EOF