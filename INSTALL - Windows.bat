@echo off
title Zouk Skills ^& Agents — Installer
color 0C
echo.
echo   ==========================================
echo     Zouk Skills ^& Agents  v1.0
echo     Windows Installer
echo   ==========================================
echo.

set CLAUDE=%USERPROFILE%\.claude
set AGENTS=%CLAUDE%\agents
set SKILLS=%CLAUDE%\skills
set HERE=%~dp0

echo   Creating folders...
if not exist "%AGENTS%" mkdir "%AGENTS%"
if not exist "%SKILLS%" mkdir "%SKILLS%"

echo   Installing agents...
set AGENT_COUNT=0
for %%f in ("%HERE%agents\*.md") do (
    copy /Y "%%f" "%AGENTS%\" >nul
    set /a AGENT_COUNT+=1
)
echo   Done: agents installed.

echo   Installing skills...
set SKILL_COUNT=0
for /D %%d in ("%HERE%skills\*") do (
    xcopy /E /I /Y "%%d" "%SKILLS%\%%~nd\" >nul
    set /a SKILL_COUNT+=1
)
echo   Done: skills installed.

echo.
echo   ==========================================
echo   Installation complete!
echo.
echo   Next steps:
echo     1. Open Claude Code
echo     2. Agents are active immediately
echo     3. See LOADOUTS.md to pick a skill bundle
echo   ==========================================
echo.
pause
