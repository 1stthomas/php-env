@ECHO off

SETLOCAL enableDelayedExpansion
SET "spcs= "
FOR /l %%n IN (1 1 12) DO SET "spcs=!spcs!!spcs!"
findstr /n "^" "%~1" >"%~1.tmp"
SETLOCAL disableDelayedExpansion
(
  FOR /f "usebackq delims=" %%L IN ("%~1.tmp") DO (
    SET "ln=%%L"
    SETLOCAL enableDelayedExpansion
    SET "ln=!ln:*:=!"
    SET /a "n=4096"
    FOR /l %%i IN (1 1 13) DO (
      IF DEFINED ln FOR %%n IN (!n!) DO (
        if "!ln:~-%%n!"=="!spcs:~-%%n!" SET "ln=!ln:~0,-%%n!"
        SET /a "n/=2"
      )
    )
    echo(!ln!
    ENDLOCAL
  )
) >"%~1"
DEL "%~1.tmp" 2>nul