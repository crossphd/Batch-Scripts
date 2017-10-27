::Checking that a File or Folder Exists
IF EXIST "temp.txt" ECHO found

::Or the converse:
IF NOT EXIST "temp.txt" ECHO not found

:: if/else
IF EXIST "temp.txt" (
    ECHO found
) ELSE (
    ECHO not found
)

::Checking If A Variable Is Not Set
IF "%var%"=="" (SET var=default value)

::Or
IF NOT DEFINED var (SET var=default value)



::Checking If a Variable Matches a Text String

SET var=Hello, World!

IF "%var%"=="Hello, World!" (
    ECHO found
)



::Or with a case insensitive comparison

IF /I "%var%"=="hello, world!" (
    ECHO found
)


::Artimetic Comparisons

SET /A var=1

IF /I "%var%" EQU "1" ECHO equality with 1

IF /I "%var%" NEQ "0" ECHO inequality with 0

IF /I "%var%" GEQ "1" ECHO greater than or equal to 1

IF /I "%var%" LEQ "1" ECHO less than or equal to 1



::Checking a Return Code

IF /I "%ERRORLEVEL%" NEQ "0" (
    ECHO execution failed
)


:: FOR

::GOTCHA: The FOR command uses a special variable syntax of % followed by a single letter, like %I. This syntax is slightly different when FOR is used in a batch file, as it needs an extra percent symbol, or %%I. This is a very common source of errors when writing scripts. Should your for loop exit with invalid syntax, be sure to check that you have the %% style variables.

::Looping Through Files

FOR %I IN (%USERPROFILE%\*) DO @ECHO %I



::Looping Through Directories

FOR /D %I IN (%USERPROFILE%\*) DO @ECHO %I



::Recursively loop through files in all subfolders of the %TEMP% folder

FOR /R "%TEMP%" %I IN (*) DO @ECHO %I



::Recursively loop through all subfolders in the %TEMP% folder

FOR /R "%TEMP%" /D %I IN (*) DO @ECHO %I
