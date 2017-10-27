@ECHO off

rem ------------------------------
rem Christopher Ross
rem cross25
rem CSC 368 – Project 1 (batch)
rem September 29, 2017
rem ------------------------------

rem The parameters to pass include
rem   1. image folder name in the current directory
rem   2. image type (e.g., jpg, png)
rem   3. [OPTIONAL] width to resize images to

rem checks to see if the width was passsed as the 3rd parameter
rem and sets width either to the third parameter or to the defaul 640
set width=640
if "%~3" NEQ "" (
  set width=%3
  )

rem change the directory to the supplied images folder
cd %1

rem Checks if web-img folder already exists and removes all
rem files in it if it does, otherwise it creates the folder
rem found info on silently deleting files in a directory at:
rem   https://stackoverflow.com/questions/17702040/how-to-delete-all-files-in-a-directory-using-batch
if exist web-img (
  echo The web-img directory already exists.
  echo Deleting any current files in the directory.
  del "web-img\*.*?"
  ) else (
  echo The web-img directory doesn't exist.
  echo Creating the web-img directory.
  mkdir web-img
  )

rem For loop iterates through all files with the extension
rem parameter passed (%2) and moves it to the web-img folder
for %%p in (*.%2) do (
    magick %%p -resize %width%x "web-%%p"
    move  "web-%%p" web-img\
  )

rem changes directory back to where you started before running batch file
cd ..

echo All %2 images in the "%1" folder have been copied to 
echo the "%1\web-image" folder, and resized to a width of %width% pixels
