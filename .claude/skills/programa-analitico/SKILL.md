---
name: programa-analitico
description: |
  Ayudar al colectivo docente a construir o revisar el programa analítico del plantel (preescolar) en sus tres planos:
  lectura de la realidad del contexto, contextualización de contenidos y PDA del programa sintético, y codiseño.
  Ordena lo que el colectivo escribe (diagnóstico, notas de CTE), señala huecos y propone preguntas. Nunca inventa el diagnóstico.
  TRIGGERS: "/programa-analitico", "programa analítico", "lectura de la realidad", "diagnóstico del contexto",
  "contextualizar contenidos", "codiseño", "notas del CTE".
---

# Programa analítico del plantel

Antes de empezar, aplica `.claude/rules/preescolar.md`.

El programa analítico lo construye la escuela con su colectivo docente a partir del programa sintético de la SEP. Tú **no
decides** qué pasa en la escuela: ordenas, revisas y preguntas.

## Pasos

1. **Material de partida.** Pregunta qué hay: diagnóstico del colectivo, notas del Consejo Técnico Escolar, observaciones de
   la comunidad, un borrador anterior. Pídele que lo pegue o indique el archivo. Si no hay nada, no escribas un diagnóstico:
   ofrece las preguntas guía del paso 3 para que el colectivo las conteste.
2. **Ciclo escolar.** Pregunta cuál (por ejemplo `2026-2027`). Si hay un programa anterior en `programas/programa-analitico/`, léelo.
3. **Los tres planos.** Organiza lo que el colectivo escribió así, y marca huecos con `[FALTA: …]`:
   - **Lectura de la realidad:** cómo es la comunidad y las familias, qué necesita y qué fortalezas tiene, cómo está el
     plantel (espacios, materiales), qué se observa en los grupos. Preguntas guía: ¿qué problemas de la comunidad se ven en la
     escuela?, ¿qué saben hacer las familias?, ¿qué lenguas y costumbres hay?, ¿qué espacios del barrio sirven para aprender?
   - **Contextualización:** qué contenidos y PDA del programa sintético se priorizan o se relacionan con esa realidad, y qué
     ejes articuladores se refuerzan. El texto de los contenidos y PDA lo pone el colectivo desde el programa sintético:
     si no está, `[Contenido/PDA: completar del programa sintético SEP vigente]`.
   - **Codiseño:** qué ajustes se hacen al programa para esta escuela (proyectos, momentos del ciclo, situaciones didácticas), y
     qué acuerdos tomó el colectivo.
4. **Revisión.** Lista aparte: huecos, contradicciones entre planos (un problema detectado sin contenido relacionado, un
   contenido sin razón de contexto) y preguntas para la próxima sesión del CTE.
5. **Guardar** en `programas/programa-analitico/<ciclo>.md` (ejemplo `2026-2027.md`). Sin nombres de niños ni datos de salud ni
   datos de familias; usa descripciones generales ("varias familias trabajan en comercio").
6. **Resumen en chat:** ruta, qué plano está más completo, qué huecos faltan.

## Nunca
- Inventar el diagnóstico, estadísticas de la comunidad o acuerdos del colectivo.
- Citar de memoria PDA, contenidos o normativa: documento SEP vigente o placeholder.
- Presentar un borrador tuyo como decisión del colectivo: marca lo que es propuesta ("propuesta, el colectivo decide").
