---
name: aprender
description: |
  Guardar una corrección o preferencia de José Manuel en notas/aprendizajes.md (regla → por qué → cuándo aplica)
  para que no se repita el error. Propone una línea para CLAUDE.md si la regla es permanente.
  TRIGGERS: "/aprender", "recuerda que", "siempre haz", "nunca hagas", "así no", "apréndete esto".
---

# Aprender

1. **Resumir la regla en una línea**, en sus palabras, y confirmarla: "¿Quedaría así: …?"
2. **Anotar** en `notas/aprendizajes.md` con este formato:
   ```
   ## AAAA-MM-DD — <regla en una línea>
   - Por qué: <qué salió mal o qué prefiere>
   - Cuándo aplica: <comando o situación>
   ```
3. **Si es permanente** (aplica a todo, no a un archivo), propón la línea exacta para `CLAUDE.md` o para la regla
   correspondiente en `.claude/rules/` y espera un "sí" antes de editarla.
4. **Revisar duplicados**: si ya existe una nota parecida, actualízala en vez de repetirla.
5. Confirmar en una línea qué quedó guardado.

(`CLAUDE.md` ya indica leer `notas/aprendizajes.md` al inicio de cada sesión.)
