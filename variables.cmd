:: https://steve-jansen.github.io/guides/windows-batch-scripting/part-2-variables.html
%ECHO OFF

SETLOCAL ENABLEEXTENSIONS
:: using %~n0: will show the name of the file
SET me=%~n0
SET parent=%~dp0


ECHO %me%: set the foo variable to bar

set foo=bar
ECHO %foo%



SET a=
SET b=Hello
if [%a%] == [] echo "String A is empty"
if [%b%] == [] echo "String B is empty"

SET a=Hello
SET b=World
SET c=%a% and %b%
echo %c%
