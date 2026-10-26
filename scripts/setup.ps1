# setup.ps1 - instalacion (re-ejecutable) para Jarvis Contabilidad y Almacen, en PowerShell.
# Uso: .\scripts\setup.ps1 [-Check]
# NOTA: este archivo es UTF-8 SIN BOM y solo usa caracteres ASCII (sin acentos),
# porque Windows PowerShell 5.1 lee un UTF-8 sin BOM como ANSI y rompe los acentos.
[CmdletBinding()]
param([switch]$Check)

$ErrorActionPreference = 'Stop'
$Root = Split-Path -Parent $PSScriptRoot

function Say($m)  { Write-Host $m }
function Warn($m) { Write-Host "AVISO: $m" -ForegroundColor Yellow }
function Die($m)  { Write-Host "ERROR: $m" -ForegroundColor Red; exit 1 }

# Busca un Python real. El "python" de WindowsApps es el acceso directo de la Microsoft Store: nunca se ejecuta.
function Find-Python {
    $intentos = @(
        @{ Nombre = 'py';      Args = @('-3') },
        @{ Nombre = 'python';  Args = @() },
        @{ Nombre = 'python3'; Args = @() }
    )
    foreach ($i in $intentos) {
        $cmd = Get-Command $i.Nombre -CommandType Application -ErrorAction SilentlyContinue | Select-Object -First 1
        if ($null -eq $cmd) { continue }
        if ($cmd.Source -like '*WindowsApps*') { continue }
        try {
            $ver = & $cmd.Source @($i.Args) -c "import sys; print(sys.version)" 2>$null
            if ($LASTEXITCODE -eq 0 -and $ver) {
                return @{ Exe = $cmd.Source; Args = $i.Args; Version = (($ver | Select-Object -First 1) -split ' ')[0] }
            }
        } catch { continue }
    }
    return $null
}

Say "== 1/4 Herramientas"
$falta = $false
$gitCmd = Get-Command git -ErrorAction SilentlyContinue
if ($gitCmd) { Say ("  ok      git (" + ((& git --version) -replace 'git version ', '') + ")") } else { Say "  FALTA   git"; $falta = $true }
$py = Find-Python
if ($py) { Say ("  ok      python (" + $py.Version + ")") } else { Say "  FALTA   python 3.9+"; $falta = $true }
if ((Get-Command claude -ErrorAction SilentlyContinue) -or (Get-Command claude.exe -ErrorAction SilentlyContinue)) {
    Say "  ok      claude"
} else {
    Warn "No encuentro Claude Code (es obligatorio). Instalalo con:  irm https://claude.ai/install.ps1 | iex   y abre un PowerShell nuevo."
}
if ($falta) {
    Say "Instala lo que falta desde PowerShell como administrador:"
    Say "  winget install Git.Git Python.Python.3.12"
    Say "Despues de instalar, cierra y abre un PowerShell nuevo (el PATH solo se actualiza en ventanas nuevas)."
    Say "Para revisar el PATH:  where.exe python"
    Say "Si 'python' abre la Microsoft Store, desactiva su alias en:"
    Say "  Configuracion > Aplicaciones > Configuracion avanzada de aplicaciones > Alias de ejecucion de aplicaciones"
    exit 1
}

Say "== 2/4 Entorno de Python (.venv)"
# Windows: .venv\Scripts\python.exe. macOS/Linux (pwsh): .venv/bin/python.
function Get-VenvPython { $w = Join-Path $Root '.venv\Scripts\python.exe'; $u = Join-Path $Root '.venv/bin/python'; if (Test-Path $w) { return $w } elseif (Test-Path $u) { return $u } else { return $w } }
$venvPy = Get-VenvPython
if ($Check) {
    if (Test-Path $venvPy) { Say "  ok      .venv existe" } else { Say "  FALTA   .venv (corre: .\scripts\setup.ps1)" }
} else {
    if (-not (Test-Path $venvPy)) {
        & $py.Exe @($py.Args) -m venv (Join-Path $Root '.venv')
        if ($LASTEXITCODE -ne 0) { Die "No se pudo crear el .venv." }
        $venvPy = Get-VenvPython
    }
    & $venvPy -m pip install -q --disable-pip-version-check -r (Join-Path $Root 'requirements.txt')
    if ($LASTEXITCODE -ne 0) { Die "pip no pudo instalar los requisitos. Hay internet?" }
    $v = & $venvPy -c "import openpyxl; print(openpyxl.__version__)"
    if ($LASTEXITCODE -ne 0) { Die "openpyxl no se instalo. Hay internet?" }
    Say "  ok      .venv listo (openpyxl $v)"
}

Say "== 3/4 Configuracion de git"
$defaults = [ordered]@{ 'core.autocrlf' = 'false'; 'pull.rebase' = 'true'; 'init.defaultBranch' = 'main' }
foreach ($k in $defaults.Keys) {
    $actual = (& git config --global --get $k 2>$null)
    if ($actual) { Say "  ok      $k=$actual"; continue }
    if ($Check) { Say "  se fijaria $k=$($defaults[$k])" }
    else { & git config --global $k $defaults[$k]; Say "  fijado  $k=$($defaults[$k])" }
}

Say "== 4/4 Listo"
foreach ($k in @('user.name', 'user.email')) {
    $actual = (& git config --global --get $k 2>$null)
    if ($actual) { continue }
    $etiqueta = if ($k -eq 'user.name') { 'nombre' } else { 'correo' }
    if ((-not $Check) -and (-not [Console]::IsInputRedirected)) {
        $valor = Read-Host "  Escribe tu $etiqueta para git"
        if ($valor) { & git config --global $k $valor }
    } else {
        Warn "Falta git $k. Configuralo con:  git config --global $k `"...`""
    }
}
Say "Siguientes pasos:"
Say "  1. En esta ventana escribe:  claude"
Say "  2. Prueba:  /pregunta que puedes hacer en este repositorio"
Say "  3. Prueba:  /facturas ejemplos/cfdi"
Say "  4. Pon tus archivos reales en datos\ (nunca se suben a internet)."
exit 0
