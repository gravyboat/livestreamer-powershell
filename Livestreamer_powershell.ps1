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

$site = Read-Host "What Streaming site? [twitch.tv, youtube.com] (default is $defaultSite)"

if ($site -eq "youtube.com")
{
    $site = "youtube.com/watch?v="
    $youtube = $TRUE
}

$stream = Read-Host "What user or video? [twitch: totalbiscuit, youtube: njCDZWTI-xg ] (default is $defaultStream)"
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
    if ($youtube)
    {
        & $fullExecutablePath "$site$stream" "$quality"
    }
    else
    {
        & $fullExecutablePath "$site/$stream" "$quality"
    }
}
catch
{
    Write-Warning $_.Exception.Message
}