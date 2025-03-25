# Save all PowerShell scripts with "UTF-8 BOM" encoding or PowerShell won't work with unicode characters
# $env:CURRENT_DIR is environtment variable provided by OneCommander
# Get selected files from OC as PS variable: $files = $env:SELECTED_FILES -split '\r\n'
# learn more https://groups.google.com/g/onecommander/c/QhDFJGIGt_c/m/dF3BQ0JUAwAJ

$folderName = (Get-Date).ToString('dd-MM-yyyy_hh-mm-ss') 
New-Item -ItemType Directory -Path $env:CURRENT_DIR -Name $folderName