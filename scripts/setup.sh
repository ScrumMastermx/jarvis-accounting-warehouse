#!/usr/bin/env bash
# setup.sh - instalación (re-ejecutable) para Jarvis Contabilidad y Almacén.
# Funciona en macOS, Linux y Git Bash en Windows. Uso: bash scripts/setup.sh [--check]
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
CHECK=0; [ "${1:-}" = "--check" ] && CHECK=1

say()  { printf '%s\n' "$*"; }
warn() { printf 'AVISO: %s\n' "$*" >&2; }
die()  { printf 'ERROR: %s\n' "$*" >&2; exit 1; }

case "$(uname -s)" in
  Darwin) OS=mac ;;
  Linux)  OS=linux ;;
  MINGW*|MSYS*|CYGWIN*) OS=windows ;;
  *) die "Sistema no soportado ($(uname -s)). Usa macOS, Linux o Git Bash en Windows." ;;
esac

# En Windows, "python3" puede ser el acceso directo de la Microsoft Store (está en el PATH pero no corre).
# Se prueba ejecutándolo, no con command -v.
PY=""
for c in python3 python; do
  if "$c" -c 'import sys; sys.exit(0 if sys.version_info >= (3, 9) else 1)' >/dev/null 2>&1; then PY="$c"; break; fi
done

say "== 1/4 Herramientas"
missing=0
if command -v git >/dev/null 2>&1; then say "  ok      git ($(git --version | awk '{print $3}'))"; else say "  FALTA   git"; missing=1; fi
if [ -n "$PY" ]; then say "  ok      python ($("$PY" -c 'import sys; print(sys.version.split()[0])'))"; else say "  FALTA   python 3.9+"; missing=1; fi
if command -v claude >/dev/null 2>&1 || command -v claude.cmd >/dev/null 2>&1; then
  say "  ok      claude"
else
  warn "No encuentro Claude Code. Instálalo desde https://claude.ai/code y vuelve a abrir Git Bash."
fi
if [ "$missing" = 1 ]; then
  case "$OS" in
    windows) say "Instala lo que falta desde PowerShell como administrador:"
             say "  winget install Git.Git Python.Python.3.12"
             say "Después cierra y vuelve a abrir Git Bash. Si 'python3' abre la Microsoft Store, desactiva su alias en:"
             say "  Configuración > Aplicaciones > Configuración avanzada de aplicaciones > Alias de ejecución de aplicaciones" ;;
    mac)     say "Instala con Homebrew (https://brew.sh):  brew install git python" ;;
    *)       say "Instala con apt:  sudo apt update && sudo apt install git python3 python3-venv" ;;
  esac
  die "Instala lo que falta y vuelve a correr: bash scripts/setup.sh"
fi

say "== 2/4 Configuración de git"
if [ "$CHECK" = 0 ]; then
  git -C "$ROOT" config core.autocrlf false
  git -C "$ROOT" config pull.rebase true
  say "  core.autocrlf=false, pull.rebase=true (en este repositorio)"
  for k in user.name user.email; do
    if [ -z "$(git config --global --get "$k" || true)" ] && [ -z "$(git -C "$ROOT" config --get "$k" || true)" ]; then
      if [ -t 0 ]; then
        printf '  Escribe tu %s para git: ' "$k"; read -r v || v=""
        [ -n "$v" ] && git config --global "$k" "$v"
      else
        warn "Falta git $k. Configúralo con: git config --global $k \"...\""
      fi
    fi
  done
else
  say "  (solo revisión: no se cambia nada)"
fi

say "== 3/4 Entorno de Python (.venv)"
VENV="$ROOT/.venv"
if [ "$OS" = windows ]; then VPY="$VENV/Scripts/python.exe"; ACT="source .venv/Scripts/activate"; else VPY="$VENV/bin/python"; ACT="source .venv/bin/activate"; fi
if [ "$CHECK" = 1 ]; then
  if [ -x "$VPY" ] && "$VPY" -c 'import openpyxl' >/dev/null 2>&1; then say "  ok      .venv con openpyxl"; else say "  FALTA   .venv (corre: bash scripts/setup.sh)"; fi
else
  [ -x "$VPY" ] || "$PY" -m venv "$VENV"
  "$VPY" -m pip install --quiet --disable-pip-version-check -r "$ROOT/requirements.txt"
  "$VPY" -c 'import openpyxl' || die "openpyxl no se instaló. ¿Hay internet?"
  say "  ok      .venv listo (activar: $ACT)"
fi

say "== 4/4 Listo"
say "Siguientes pasos:"
say "  1. En esta ventana escribe:  claude"
say "  2. Prueba:  /facturas ejemplos/cfdi"
say "  3. Pon tus archivos reales en datos/ (nunca se suben a internet)."
