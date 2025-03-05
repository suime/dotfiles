function sym {
    New-Item -ItemType SymbolicLink -Path $path -Target $target
}
