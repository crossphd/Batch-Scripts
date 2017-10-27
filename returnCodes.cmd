%ECHO OFF

:: checks for any errors
IF %ERRORLEVEL% NEQ 0 (
  REM do something here to address the error
)

:: checks for specific errors
SomeFile.exe
IF %ERRORLEVEL% EQU 9009 (
  ECHO error - SomeFile.exe not found in your PATH
)

::To execute a follow-on command after sucess, we use the && operator
SomeCommand.exe && ECHO SomeCommand.exe succeeded!

:: To execute a follow-on command after failure, we use the || operator
SomeCommand.exe || ECHO SomeCommand.exe failed with return code %ERRORLEVEL%


