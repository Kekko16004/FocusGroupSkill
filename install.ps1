# Focusgroup Skill Installer
# Compatible with Windows PowerShell 5.1+ and PowerShell 7+
[CmdletBinding()]
param(
    [switch]$All,
    [switch]$Claude,
    [switch]$Antigravity,
    [switch]$Kilo,
    [switch]$Agents,
    [switch]$Uninstall,
    [ValidateSet("link", "copy")]
    [string]$Mode = "link"
)

$ErrorActionPreference = "Stop"
$SkillName = "focusgroup"
$SourceDir = $PSScriptRoot
$User = $env:USERPROFILE
$CmdSource = Join-Path $SourceDir "commands\focusgroup.md"
$SkillFile = Join-Path $SourceDir "SKILL.md"

if (-not (Test-Path -LiteralPath $SkillFile)) {
    Write-Error "SKILL.md non trovato in $SourceDir"
    exit 1
}

$Targets = [ordered]@{
    claude = @{
        Label = "Claude Code"
        Skills = @("$User\.claude\skills\$SkillName")
        Commands = @("$User\.claude\commands\$SkillName.md")
    }
    antigravity = @{
        Label = "Antigravity IDE"
        Skills = @("$User\.gemini\config\skills\$SkillName")
        Commands = @("$User\.gemini\config\global_workflows\$SkillName.md")
    }
    kilo = @{
        Label = "Kilo / Kilocode"
        Skills = @(
            "$User\.kilo\skills\$SkillName",
            "$User\.config\kilo\skills\$SkillName",
            "$User\.kilocode\skills\$SkillName"
        )
        Commands = @(
            "$User\.kilo\commands\$SkillName.md",
            "$User\.kilo\command\$SkillName.md",
            "$User\.config\kilo\commands\$SkillName.md",
            "$User\.config\kilo\command\$SkillName.md",
            "$User\.kilocode\commands\$SkillName.md",
            "$User\.kilocode\command\$SkillName.md"
        )
    }
    agents = @{
        Label = "Agents Hub"
        Skills = @("$User\.agents\skills\$SkillName")
        Commands = @()
    }
}

function Remove-ExistingPath([string]$Path) {
    if (Test-Path -LiteralPath $Path) {
        $item = Get-Item -LiteralPath $Path -Force
        if ($item.Attributes -band [System.IO.FileAttributes]::ReparsePoint) {
            [System.IO.Directory]::Delete($Path, $false)
        } else {
            Remove-Item -LiteralPath $Path -Recurse -Force
        }
    }
}

function Install-Target([string]$Key) {
    $conf = $Targets[$Key]
    Write-Host "[+] Configurazione: $($conf.Label)"

    foreach ($skillPath in $conf.Skills) {
        $parent = Split-Path -Path $skillPath -Parent
        if (-not (Test-Path -LiteralPath $parent)) {
            New-Item -ItemType Directory -Path $parent -Force | Out-Null
        }
        Remove-ExistingPath $skillPath
        if ($Mode -eq "link") {
            try {
                New-Item -ItemType Junction -Path $skillPath -Target $SourceDir | Out-Null
                Write-Host "    Link: $skillPath -> $SourceDir"
            } catch {
                Write-Host "    Fallback su copia per: $skillPath"
                Copy-Item -Path $SourceDir -Destination $skillPath -Recurse -Force
            }
        } else {
            Copy-Item -Path $SourceDir -Destination $skillPath -Recurse -Force
            Write-Host "    Copia: $skillPath"
        }
    }

    if (Test-Path -LiteralPath $CmdSource) {
        foreach ($cmdPath in $conf.Commands) {
            $parent = Split-Path -Path $cmdPath -Parent
            if (-not (Test-Path -LiteralPath $parent)) {
                New-Item -ItemType Directory -Path $parent -Force | Out-Null
            }
            Copy-Item -Path $CmdSource -Destination $cmdPath -Force
            Write-Host "    Comando: $cmdPath"
        }
    }
}

function Uninstall-Target([string]$Key) {
    $conf = $Targets[$Key]
    Write-Host "[-] Rimozione da: $($conf.Label)"
    foreach ($skillPath in $conf.Skills) {
        if (Test-Path -LiteralPath $skillPath) {
            Remove-ExistingPath $skillPath
            Write-Host "    Rimosso skill: $skillPath"
        }
    }
    foreach ($cmdPath in $conf.Commands) {
        if (Test-Path -LiteralPath $cmdPath) {
            Remove-Item -LiteralPath $cmdPath -Force
            Write-Host "    Rimosso comando: $cmdPath"
        }
    }
}

if ($Uninstall) {
    foreach ($key in $Targets.Keys) {
        Uninstall-Target $key
    }
    Write-Host "`nDisinstallazione completata."
    exit 0
}

$selected = @()
if ($All) {
    $selected = @("claude", "antigravity", "kilo", "agents")
} else {
    if ($Claude) { $selected += "claude" }
    if ($Antigravity) { $selected += "antigravity" }
    if ($Kilo) { $selected += "kilo" }
    if ($Agents) { $selected += "agents" }
}

if ($selected.Count -eq 0) {
    Clear-Host
    Write-Host "============================================================"
    Write-Host "Focusgroup Skill Installer"
    Write-Host "============================================================"
    Write-Host "Seleziona gli ambienti di destinazione:`n"
    Write-Host "  [1] Claude Code       (~/.claude)"
    Write-Host "  [2] Antigravity IDE   (~/.gemini/config)"
    Write-Host "  [3] Kilo / Kilocode   (~/.kilo, ~/.config/kilo, ~/.kilocode)"
    Write-Host "  [4] Agents Hub        (~/.agents)"
    Write-Host "  [5] Tutti gli ambienti (Consigliato)"
    Write-Host "  [6] Disinstalla da tutti gli ambienti"
    Write-Host "  [0] Esci"
    Write-Host "============================================================"
    $choice = Read-Host "Scelta [0-6]"

    switch ($choice) {
        "1" { $selected = @("claude") }
        "2" { $selected = @("antigravity") }
        "3" { $selected = @("kilo") }
        "4" { $selected = @("agents") }
        "5" { $selected = @("claude", "antigravity", "kilo", "agents") }
        "6" {
            foreach ($k in $Targets.Keys) { Uninstall-Target $k }
            Write-Host "`nDisinstallazione completata."
            exit 0
        }
        "0" {
            Write-Host "Operazione annullata."
            exit 0
        }
        default {
            Write-Host "Scelta non valida."
            exit 1
        }
    }
}

Write-Host "`nAvvio installazione...`n"
foreach ($key in $selected) {
    Install-Target $key
}

Write-Host "`nInstallazione completata con successo."
Write-Host "Comando disponibile: /focusgroup"
