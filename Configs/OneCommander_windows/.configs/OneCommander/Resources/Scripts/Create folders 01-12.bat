@echo off
REM .bat files are run with cmd.exe
REM Creates folder structure with numbers 01-12 for months
REM %CURRENT_DIR% is environment variable that retrieves current folder from OC
REM %CURRENT_DIR_INACTIVE% is folder from inactive pane in dual-pane mode
REM It can create multiple levels: %CURRENT_DIR%\2024\12

REM the following line is required in all .bat files to ensure that unicode characters are propertly read by CMD; Save file with UTF-8 encoding without BOM
chcp 65001
mkdir "%CURRENT_DIR%\01"
mkdir "%CURRENT_DIR%\02"
mkdir "%CURRENT_DIR%\03"
mkdir "%CURRENT_DIR%\04"
mkdir "%CURRENT_DIR%\05"
mkdir "%CURRENT_DIR%\06"
mkdir "%CURRENT_DIR%\07"
mkdir "%CURRENT_DIR%\08"
mkdir "%CURRENT_DIR%\09"
mkdir "%CURRENT_DIR%\10"
mkdir "%CURRENT_DIR%\11"
mkdir "%CURRENT_DIR%\12"
echo "Finished creating month folders"