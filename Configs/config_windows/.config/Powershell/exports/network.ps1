function Convert-SubnetMaskToPrefix {
    param ([string]$SubnetMask)
    $binaryMask = ($SubnetMask -split '\.') | ForEach-Object { [convert]::ToString([int]$_, 2).PadLeft(8, '0') }
    return ($binaryMask -join '').ToCharArray() | Where-Object { $_ -eq '1' } | Measure-Object | Select-Object -ExpandProperty Count
}

function Set-NetworkAdapterConfig {
    param (
        [string]$AdapterName,   # 네트워크 어댑터 이름
        [bool]$DynamicIP = $false,       # 동적 IP(DHCP) 여부
        [string]$IPAddress,     # 설정할 IP 주소 (정적 IP 모드에서만 사용)
        [string]$SubnetMask,    # 서브넷 마스크 (정적 IP 모드에서만 사용)
        [string]$Gateway,       # 기본 게이트웨이 (정적 IP 모드에서만 사용)
        [string[]]$DNSServers   # DNS 서버 목록 (배열)
    )

    # 네트워크 어댑터 정보 확인
    $Adapter = Get-NetAdapter | Where-Object { $_.Name -eq $AdapterName }
    if (-not $Adapter) {
        Write-Host "네트워크 어댑터 '$AdapterName'을 찾을 수 없습니다." -ForegroundColor Red
        return
    }

    if ($DynamicIP) {
        # DHCP 활성화
        Write-Host "DHCP를 활성화합니다..."
        netsh interface ip set address name="$AdapterName" source=dhcp

        # DNS 설정도 DHCP로 변경
        netsh interface ip set dns name="$AdapterName" source=dhcp
    } else {
        # 기존 기본 게이트웨이 제거
        $ExistingGateway = Get-NetRoute -InterfaceAlias $AdapterName -DestinationPrefix "0.0.0.0/0" -ErrorAction SilentlyContinue
        if ($ExistingGateway) {
            Write-Host "기존 기본 게이트웨이 제거 중..."
            Remove-NetRoute -InterfaceAlias $AdapterName -DestinationPrefix "0.0.0.0/0" -Confirm:$false
        }

        # 기존 IP 구성 제거
        Write-Host "기존 IP 주소 제거 중..."
        Remove-NetIPAddress -InterfaceAlias $AdapterName -Confirm:$false -ErrorAction SilentlyContinue

        # 서브넷 마스크 변환
        $PrefixLength = Convert-SubnetMaskToPrefix -SubnetMask $SubnetMask
        if (-not $PrefixLength) {
            Write-Host "서브넷 마스크 변환 실패: $SubnetMask" -ForegroundColor Red
            return
        }

        # 새 IP 및 서브넷 마스크 설정
        Write-Host "IP 주소 설정: $IPAddress / $SubnetMask (Prefix: $PrefixLength)"
        New-NetIPAddress -InterfaceAlias $AdapterName -IPAddress $IPAddress -PrefixLength $PrefixLength -DefaultGateway $Gateway -ErrorAction Stop
    }

    # DNS 서버 설정 (정적 모드이거나 동적 IP 사용하더라도 별도 설정 시)
    if ($DNSServers) {
        Write-Host "DNS 서버 설정: $($DNSServers -join ', ')"
        Set-DnsClientServerAddress -InterfaceAlias $AdapterName -ServerAddresses $DNSServers
    }

    Write-Host "네트워크 설정이 완료되었습니다." -ForegroundColor Green
}


function nn {
	Set-NetworkAdapterConfig -AdapterName "이더넷" -IPAddress "10.99.6.87" -SubnetMask "255.255.255.0" -Gateway "10.99.6.200" -DNSServers @("172.10.10.45", "1.1.1.1")
}
function nw {
	Set-NetworkAdapterConfig -AdapterName "이더넷" -DynamicIP $true 
}