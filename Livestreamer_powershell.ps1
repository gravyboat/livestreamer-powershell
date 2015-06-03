<# Livestreamer powershell script #>

[CmdletBinding()]
param ()

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.path

$executable = "\livestreamer.exe"

$fullExecutablePath = $scriptDir + $executable

write-OutPut "$fullExecutablePath"

[xml]$ConfigFile = Get-Content "$scriptDir\powershell_settings.xml"

$defaultSite = $ConfigFile.Settings.DefaultSite
$defaultStream = $ConfigFile.Settings.DefaultStream
$defaultQuality = $ConfigFile.Settings.DefaultQuality

$site = Read-Host "What Streaming site? (default is $defaultSite)"
$stream = Read-Host "What user on the site? (default is $defaultStream)"
$quality = Read-Host "What quality? (default is $defaultQuality)"

if (-Not $site)
{
    $site = $defaultSite
}

if (-Not $stream)
{
    $stream = $defaultStream
}

if (-Not $quality)
{
    $quality  = $defaultQuality
}

try
{

    & $fullExecutablePath "$site/$stream" "$quality"
}
catch
{
    Write-Warning $_.Exception.Message
}
