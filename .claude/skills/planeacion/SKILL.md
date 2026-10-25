---
name: planeacion
description: |
  Armar la planeación didáctica (semanal o por proyecto) de un grupo de preescolar (3 a 5 años, Fase 2 del plan 2022 de la SEP):
  datos generales, propósito, momentos, actividades por día, materiales, ajustes razonables, participación de familias,
  evaluación formativa y evidencias. Usa el contenido y el PDA que la docente ya eligió del programa analítico; nunca los inventa.
  TRIGGERS: "/planeacion", "planeación semanal", "planear la semana", "plano didáctico", "proyecto para 2º de preescolar",
  "situación didáctica", "actividades para los niños".
---

# Planeación didáctica (preescolar)

Antes de empezar, aplica `.claude/rules/preescolar.md`.

## Pasos

1. **Preguntar** (de a pocas, no todo junto). Si falta algo, pregunta; no supongas:
   - Grado: 1°, 2° o 3°. Grupo.
   - Periodo: una semana o un proyecto (fechas de inicio y fin, `AAAA-MM-DD`).
   - Campo(s) formativo(s) y eje articulador.
   - **Contenido y PDA** que la docente ya eligió del programa analítico.
   - Metodología: proyecto comunitario, STEAM, problemas, aprendizaje servicio o situación didáctica.
   - Contexto del grupo: intereses, necesidades, lo que se observó antes (sin nombres de niños).
2. **Contenido y PDA: nunca inventarlos.** Si no los tiene, pídelos (que los copie del programa analítico, de `programas/programa-analitico/`
   o del documento SEP). Si no puede, deja `[PDA: completar del programa analítico]` y dilo en el resumen final.
3. **Redactar** la planeación con estas secciones (la estructura vacía está en `programas/plantillas/planeacion-semanal.md`):
   datos generales · propósito · campo formativo, eje, contenido y PDA · metodología · momentos (inicio, desarrollo, cierre,
   o las fases del proyecto) · actividades por día · materiales · ajustes razonables e inclusión · participación de las familias ·
   evaluación formativa (qué observar e instrumento) · evidencias.
4. **Actividades apropiadas para 3 a 5 años:** juego, movimiento, lenguaje oral, canto, exploración con objetos, arte.
   Cortas (10 a 20 minutos cada una), concretas, con materiales sencillos. Di qué hace la docente y qué hacen los niños.
   Lenguaje sencillo. Nada de planas ni fichas como actividad principal.
5. **Evaluación formativa:** qué se va a observar (conductas que se pueden ver, no "aprendió") y con qué instrumento
   (diario de trabajo, lista de cotejo, rúbrica, portafolio). Sin calificación numérica.
6. **Guardar** en `programas/planeaciones/AAAA-MM-DD-<grado>-<slug>.md` (ejemplo: `2026-11-02-2o-los-animales-de-mi-barrio.md`;
   `<slug>` en minúsculas, sin acentos, con guiones). Sin nombres de alumnos.
7. **Resumen en chat:** ruta del archivo, qué quedó completo y qué placeholders faltan (PDA, contenido, fechas).

## Nunca
- Inventar texto de PDA, contenidos o normativa. Si no está, placeholder.
- Escribir nombres, fotos o datos de salud de niños en la planeación.
- Dar por oficial una fecha del calendario: se toma del calendario SEP vigente que la docente indique.
