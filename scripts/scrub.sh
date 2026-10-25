#!/usr/bin/env bash
# scrub.sh - falla si algún archivo del repositorio contiene credenciales, rutas personales o datos reales.
# Uso: bash scripts/scrub.sh [archivo ...]   (sin argumentos = archivos rastreados + nuevos no ignorados)
# Funciona con GNU grep (CI) y BSD grep (macOS): sin \b, sin \s. Ver SCRUB.md.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

PATTERNS=(
  'password[[:space:]]*[:=]'
  'contrase(ñ|n)a[[:space:]]*[:=]'
  'AKIA[0-9A-Z]{16}'
  'ghp_[A-Za-z0-9]{20,}'
  'gho_[A-Za-z0-9]{20,}'
  'sk-[A-Za-z0-9_-]{20,}'
  '-----BEGIN [A-Z ]*PRIVATE KEY'
  'co-authored-by'
  '/Users/'
  'C:\\Users\\'
)
# RFC con forma real (persona o empresa), solo fuera de ejemplos/. Los genéricos del SAT se permiten.
RFC_PATTERN='[A-Z&Ñ]{3,4}[0-9]{6}[A-Z0-9]{3}'
RFC_ALLOW='XAXX010101000|XEXX010101000'

candidates=()
if [ "$#" -gt 0 ]; then candidates=("$@"); else
  while IFS= read -r -d '' f; do candidates+=("$f"); done < <(git ls-files -z --cached --others --exclude-standard)
fi

scan=(); scan_rfc=()
for f in ${candidates[@]+"${candidates[@]}"}; do
  case "$f" in scripts/scrub.sh|SCRUB.md) continue ;; esac
  [ -f "$f" ] || continue
  scan+=("$f")
  case "$f" in ejemplos/*) ;; *) scan_rfc+=("$f") ;; esac
done

hits=0
if [ "${#scan[@]}" -gt 0 ]; then
  for p in "${PATTERNS[@]}"; do
    rc=0
    out="$(grep -nEIHi -e "$p" -- "${scan[@]}")" || rc=$?
    if [ "$rc" -gt 1 ]; then echo "scrub: error de grep en el patrón: $p" >&2; exit 2; fi
    if [ -n "$out" ]; then printf '%s\n' "$out"; hits=1; fi
  done
fi
if [ "${#scan_rfc[@]}" -gt 0 ]; then
  out="$(grep -nEIHo -e "$RFC_PATTERN" -- "${scan_rfc[@]}" | grep -Ev -- "$RFC_ALLOW" || true)"
  if [ -n "$out" ]; then printf '%s\n' "$out"; echo "scrub: posible RFC real fuera de ejemplos/" >&2; hits=1; fi
fi

if [ "$hits" -ne 0 ]; then
  echo "scrub: FALLÓ - se encontró contenido prohibido (ver SCRUB.md)" >&2
  exit 1
fi
echo "scrub: clean"
