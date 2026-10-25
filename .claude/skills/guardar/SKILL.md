---
name: guardar
description: |
  Guardar en git el trabajo del repositorio (notas, reportes, scripts): pull, scrub, commit de una línea, push.
  Nunca incluye datos/.
  TRIGGERS: "/guardar", "guarda", "guardar cambios", "sube los cambios", "respalda".
---

# Guardar

1. **Repositorio correcto**: `git rev-parse --show-toplevel` debe terminar en `jarvis-accounting-warehouse`.
2. **Traer cambios**: `git pull --rebase --autostash`. Si hay conflicto: detente, muestra los archivos, pregunta.
3. **Revisar contenido**: `bash scripts/scrub.sh`. Si marca algo, corrige la línea antes de seguir.
4. **Ver qué cambió**: `git status --short`. Nunca agregues nada de `datos/`, archivos `.env`, ni archivos de más de 5 MB.
   Si cambió `CLAUDE.md`, `.claude/` o `scripts/`, lista esos archivos y pregunta una vez antes de incluirlos.
5. **Commit**: `git add <archivos>` y `git commit -m "<una línea en español>"`, p. ej. `Conciliación octubre y reporte mensual`.
   Sin firmas, sin "generado por", sin enlaces de sesión. Verifica con `git log -1 --format=%B`.
6. **Push**: `git pull --rebase --autostash && git push`. Si falla dos veces, detente y explica.
7. **Confirmar** en una línea: `Guardado: N archivos, <hash corto>.`

Si no hay cambios: "Nada que guardar."
