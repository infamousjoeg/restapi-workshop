$Script:base_url = 'https://cyberark.joegarcia.dev'
$Script:headers = New-Object "System.Collections.Generic.Dictionary[[String]],[[String]]"
$Script:headers.Add("Content-Type", "application/json")

function cyberarkLogon ($type) {
    $username = Read-Host "Username"
    $pwd = Read-Host "Password" -AsSecureString -Force
    $body = '{"Username":'+$username+',"Password":'+$([System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pwd)))+'}'
    Remove-Variable pwd
    $response = Invoke-RestMethod $Script:base_url+"/PasswordVault/api/auth/"+$type.ToLower+"/logon" -Method 'POST' -Headers $Script:headers -Body $body
    if ($response) {
        $Script:headers.Add("Authorization", $response)
        return $true
    } else {
        return $false
    }
}

function cyberarkGetAccounts ($search=$null, $sort=$null, $filter=$null) {
    $urlParams = @{}
    if ($search) { $urlParams.Add("search", $search) }
    if ($sort) { $urlParams.Add("sort", $sort) }
    if ($filter) { $urlParams.Add("filter", $filter) }
    if ($search -or $sort -or $filter) {
        $combinedURLParams = "?"
        $firstFlag = $true
        foreach ($param in $urlParams.GetEnumerator()) {
            if ($firstFlag) {
                $combinedURLParams += "${param.Name}=${param.Value}"
                $firstFlag = $false
            } else {
                $combinedURLParams += "&${param.Name}=${param.Value}"
            }
        }
    }
    $response = Invoke-RestMethod $Script:base_url+"/PasswordVault/api/Accounts"+$combinedURLParams -Method "GET" -Headers $Script:headers
    return $response | ConvertTo-Json
}

function cyberarkLogoff () {
    $body = "{}"
    $response = Invoke-RestMethod $Script:base_url+"/PasswordVault/api/auth/logoff" -Method 'POST' -Headers $Script:headers -Body $body
    if ($response) {
        return $true
    } else {
        return $false
    }
}

if (!(cyberarkLogon -Type radius)) {
    Write-Error "Unable to logon to CyberArk PAS Web Services"
    Exit
}

$getAccounts = cyberarkGetAccounts -search Administrator -sort Address -filter "safe eq D-Win-Local-Admin"

Write-Output $getAccounts

if (!(cyberarkLogoff)) {
    Write-Error "Unable to logoff CyberArk PAS Web Services. User will be kicked in 20 minutes."
    Exit
}