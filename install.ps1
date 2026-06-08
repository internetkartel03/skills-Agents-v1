# Zouk Skills & Agents — Windows Installer
# Run from the extracted Zouk-Skills-Agents folder:
#   Right-click install.ps1 → Run with PowerShell
#   OR: powershell -ExecutionPolicy Bypass -File install.ps1

$ErrorActionPreference = "Stop"

Write-Host ""
Write-Host "  ╔══════════════════════════════════════╗" -ForegroundColor DarkRed
Write-Host "  ║   Zouk Skills & Agents  v1.0         ║" -ForegroundColor Red
Write-Host "  ║   Windows Installer                  ║" -ForegroundColor DarkRed
Write-Host "  ╚══════════════════════════════════════╝" -ForegroundColor DarkRed
Write-Host ""

$claudeDir   = Join-Path $env:USERPROFILE ".claude"
$agentsDir   = Join-Path $claudeDir "agents"
$skillsDir   = Join-Path $claudeDir "skills"
$scriptDir   = Split-Path -Parent $MyInvocation.MyCommand.Path

function Step($msg) { Write-Host "  → $msg" -ForegroundColor Cyan }
function OK($msg)   { Write-Host "  ✓ $msg" -ForegroundColor Green }
function Warn($msg) { Write-Host "  ! $msg" -ForegroundColor Yellow }

# 1. Create directories
Step "Creating ~/.claude/agents/ ..."
New-Item -ItemType Directory -Force -Path $agentsDir | Out-Null
OK "~/.claude/agents/ ready"

Step "Creating ~/.claude/skills/ ..."
New-Item -ItemType Directory -Force -Path $skillsDir | Out-Null
OK "~/.claude/skills/ ready"

# 2. Copy agents
$agentSrc = Join-Path $scriptDir "agents"
if (Test-Path $agentSrc) {
    Step "Installing agents..."
    $count = 0
    Get-ChildItem "$agentSrc\*.md" | ForEach-Object {
        Copy-Item $_.FullName -Destination $agentsDir -Force
        $count++
    }
    OK "$count agents installed to ~/.claude/agents/"
} else {
    Warn "agents/ folder not found — skipping"
}

# 3. Copy skills
$skillSrc = Join-Path $scriptDir "skills"
if (Test-Path $skillSrc) {
    Step "Installing skills..."
    $count = 0
    Get-ChildItem "$skillSrc" -Directory | ForEach-Object {
        $dest = Join-Path $skillsDir $_.Name
        Copy-Item $_.FullName -Destination $dest -Recurse -Force
        $count++
    }
    OK "$count skills installed to ~/.claude/skills/"
} else {
    Warn "skills/ folder not found — skipping"
}

# 4. Summary
Write-Host ""
Write-Host "  ══════════════════════════════════════" -ForegroundColor DarkGray
Write-Host "  Installation complete!" -ForegroundColor Green
Write-Host ""
Write-Host "  Next steps:" -ForegroundColor White
Write-Host "    1. Open Claude Code" -ForegroundColor Gray
Write-Host "    2. Agents are now active automatically" -ForegroundColor Gray
Write-Host "    3. Reference skills with /skill-name in chat" -ForegroundColor Gray
Write-Host "    4. See LOADOUTS.md for recommended combos" -ForegroundColor Gray
Write-Host ""
Write-Host "  Installed to: $claudeDir" -ForegroundColor DarkGray
Write-Host ""

Read-Host "  Press Enter to close"
