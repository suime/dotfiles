@echo off
REM Save bat files with UTF-8 encoding
REM The following line is required in all .bat files to ensure that Unicode characters are properly read by CMD
chcp 65001

setlocal enabledelayedexpansion

REM Create or empty the output file
set OUTPUT_FILE=SelectedFilesDetails.txt
echo. > %OUTPUT_FILE%

REM Save the content of SELECTED_FILES to a temporary file
echo %SELECTED_FILES% > temp_files.txt

REM Loop through each line in the temporary file and use the dir command to get details
for /f "usebackq delims=" %%f in (temp_files.txt) do (
    dir "%%f" >> %OUTPUT_FILE%
)

REM Clean up the temporary file
del temp_files.txt

echo File details have been saved to %OUTPUT_FILE%.