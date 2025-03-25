#PS
# This script works only with the new scripting system that you enable through Settings-Advanced
# the first line indicated to run it with PowerShell
# All scripts should be saved as 'UTF-8 BOM encoding to ensure unicode characters are interpreted properly by PowerShell

# OC sends list of selected files as SELECTED_FILES environment variable and here we load it into $files variable that PowerShell can iterate over. $files are separated with NewLine \r\n

$files = if ([string]::IsNullOrEmpty($env:SELECTED_FILES)) {
    @()  # Create an empty array if the environment variable is null or empty, otherwise if we just do the -split PowerShell still thinks that there is one element in it. If you know a better way, please share on Discord or GGroup
} else {
    $env:SELECTED_FILES -split '\r?\n'  # Split non-empty strings into an array
}

#OC sends current folder as CURRENT_DIR environment variable which you can use to construct final path
$outputPath = Join-Path -Path $env:CURRENT_DIR -ChildPath 'TestOutput.txt'

if ($files.Count -eq 0) {
    Write-Host "No files to process."
} else {
    foreach ($file in $files) {
        if (Test-Path $file) {
            $size = (Get-Item $file).length
            $output = '{0} size: {1} bytes' -f $file, $size
            Add-Content -Path $outputPath -Value $output
            Write-Host $output
        } else {
            Write-Host "File not found: " + $file
        }
    }
	Write-Host 'Output was be written to: ' $outputPath
}