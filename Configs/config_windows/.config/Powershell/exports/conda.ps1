# c:\Users\Administrator\.config\Powershell\exports\conda.ps1

# cel 함수 정의
function cel {
    conda env list
}

# ca 함수 정의
function ca {
    param(
        [Parameter(Mandatory=$true, Position=0)]
        [string]$envName
    )
    conda activate $envName
}