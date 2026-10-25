# PowerShell Installer for Antigravity Switcher on Windows
# Author: @0xposa (https://x.com/0xposa)
$ErrorActionPreference = "Stop"

Write-Host "========================================================" -ForegroundColor Blue
Write-Host "          Installing Antigravity Switcher (Windows)     " -ForegroundColor Green
Write-Host "       Author: @0xposa (https://x.com/0xposa)           " -ForegroundColor Cyan
Write-Host "========================================================" -ForegroundColor Blue

$userHome = [Environment]::GetFolderPath("UserProfile")
$binDir = Join-Path $userHome ".gemini\antigravity-cli\bin"
if (!(Test-Path $binDir)) {
    New-Item -ItemType Directory -Path $binDir -Force | Out-Null
}

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
if (-not (Test-Path (Join-Path $scriptDir "bin\agy-switcher"))) {
    $tempDir = Join-Path ([System.IO.Path]::GetTempPath()) ([System.Guid]::NewGuid().ToString())
    Write-Host "📥 Mengunduh repository antigravity-switcher..."
    git clone --depth=1 https://github.com/0xposa/antigravity-switcher.git $tempDir
    $scriptDir = $tempDir
    $cleanupTemp = $true
} else {
    $cleanupTemp = $false
}

Write-Host "📁 Installing binaries to: $binDir"
Copy-Item (Join-Path $scriptDir "bin\agy-switcher") (Join-Path $binDir "agy-switcher") -Force
Copy-Item (Join-Path $scriptDir "bin\agy-switcher.cmd") (Join-Path $binDir "agy-switcher.cmd") -Force
Copy-Item (Join-Path $scriptDir "bin\agy-rotation.cmd") (Join-Path $binDir "agy-rotation.cmd") -Force

# Skills directories
$skillsDirGlobal = Join-Path $userHome ".gemini\config\skills"
$skillsDirLocal  = Join-Path $userHome ".agents\skills"
$skillsDirCli    = Join-Path $userHome ".gemini\antigravity-cli\skills"

# Install Sound Assets
$soundSrc = Join-Path $scriptDir "assets\sounds"
if (Test-Path $soundSrc) {
    $soundDst = Join-Path $userHome ".gemini\antigravity-cli\sounds"
    New-Item -ItemType Directory -Path $soundDst -Force | Out-Null
    Copy-Item "$soundSrc\*" $soundDst -Recurse -Force
}

# Clean legacy skills
foreach ($old in @("account-switcher", "switch-account")) {
    Remove-Item (Join-Path $skillsDirGlobal $old) -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item (Join-Path $skillsDirLocal $old) -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item (Join-Path $skillsDirCli $old) -Recurse -Force -ErrorAction SilentlyContinue
}

# Install skills
foreach ($skill in @("antigravity-switcher", "switcher-account")) {
    $src = Join-Path $scriptDir "skills\$skill"
    if (Test-Path $src) {
        New-Item -ItemType Directory -Path (Join-Path $skillsDirGlobal $skill) -Force | Out-Null
        New-Item -ItemType Directory -Path (Join-Path $skillsDirLocal $skill) -Force | Out-Null
        New-Item -ItemType Directory -Path (Join-Path $skillsDirCli $skill) -Force | Out-Null
        Copy-Item "$src\*" (Join-Path $skillsDirGlobal $skill) -Recurse -Force
        Copy-Item "$src\*" (Join-Path $skillsDirLocal $skill) -Recurse -Force
        Copy-Item "$src\*" (Join-Path $skillsDirCli $skill) -Recurse -Force
    }
}

# Rules (AGENTS.md & GEMINI.md)
$agentsSrc = Join-Path $scriptDir "AGENTS.md"
if (Test-Path $agentsSrc) {
    Copy-Item $agentsSrc (Join-Path $userHome "AGENTS.md") -Force
    Copy-Item $agentsSrc (Join-Path $userHome "GEMINI.md") -Force
    $cliDir = Join-Path $userHome ".gemini\antigravity-cli"
    New-Item -ItemType Directory -Path $cliDir -Force | Out-Null
    Copy-Item $agentsSrc (Join-Path $cliDir "GEMINI.md") -Force
}

# Ensure binDir is in User PATH
$userPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($userPath -notlike "*$binDir*") {
    [Environment]::SetEnvironmentVariable("Path", "$userPath;$binDir", "User")
    Write-Host "✅ Menambahkan $binDir ke User PATH." -ForegroundColor Green
}

if ($cleanupTemp -and (Test-Path $tempDir)) {
    Remove-Item $tempDir -Recurse -Force -ErrorAction SilentlyContinue
}

# Play install sound with full volume
$installSound = Join-Path $userHome ".gemini\antigravity-cli\sounds\tidak-punya-uang.mp3"
if (Test-Path $installSound) {
    try {
        $w = New-Object -ComObject WScript.Shell
        1..50 | ForEach-Object { $w.SendKeys([char]175) }
        Add-Type -AssemblyName presentationCore
        $player = New-Object System.Windows.Media.MediaPlayer
        $player.Volume = 1.0
        $player.Open([System.Uri]$installSound)
        $player.Play()
    } catch {}
}

Write-Host "`n✅ Instalasi Berhasil!" -ForegroundColor Green
Write-Host "Di Terminal (PowerShell / CMD): jalankan agy-switcher untuk menu interaktif."
Write-Host "Di Antigravity:"
Write-Host "  - /switcher-account   : Ganti akun Google Antigravity secara interaktif"
Write-Host "  - /antigravity-switcher: Aktifkan / nonaktifkan auto-rotation pada HTTP 429"
Write-Host "Follow creator on X: https://x.com/0xposa`n" -ForegroundColor Cyan
