function ntree {
    param(
        [string]$Path = ".",
        [int]$Depth = 2
    )

    function Get-Tree {
        param(
            [string]$FolderPath,
            [string]$Indent = "",
            [int]$CurrentDepth = 1
        )

        if ($CurrentDepth -gt $Depth) { return }

        $Folders = Get-ChildItem -Path $FolderPath -Directory | Sort-Object Name
        foreach ($Folder in $Folders) {
            $FileCount = (Get-ChildItem -Path $Folder.FullName -File).Count
            
			if ($FileCount -gt 0) {
                Write-Output "$Indent📂 $($Folder.Name) [$FileCount]"
            } else {
                Write-Output "$Indent📂 $($Folder.Name)"
            }

            Get-Tree -FolderPath $Folder.FullName -Indent "$Indent│  " -CurrentDepth ($CurrentDepth + 1)
        }
    }

    Write-Output "📂 $Path"
    Get-Tree -FolderPath $Path -Indent "│  " -CurrentDepth 1
}