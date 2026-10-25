---
name: evaluacion
description: |
  Convertir las notas de observación de la docente en registros de evaluación formativa (descriptivos, sin números),
  listas de cotejo o rúbricas por campo formativo, y reportes para familias con lenguaje respetuoso y concreto.
  Solo a partir de observaciones reales; nunca inventa avances de un niño.
  TRIGGERS: "/evaluacion", "evaluación formativa", "lista de cotejo", "rúbrica", "diario de trabajo", "reporte para papás",
  "informe a las familias", "portafolio de evidencias".
---

# Evaluación formativa (preescolar)

Antes de empezar, aplica `.claude/rules/preescolar.md`. En preescolar **no hay calificación numérica**.

## Regla dura
Trabaja **solo con observaciones reales que la docente entregue** (notas, diario de trabajo, descripciones de evidencias).
Si para un campo formativo no hay observaciones, escribe "sin observaciones en este periodo". **Nunca inventes un avance**,
ni lo "completes" con lo que sería normal para la edad.

## Dónde se guarda
- Documentos con **nombres de alumnos:** `programas/alumnos/` (ignorado por git; nunca se pega en chats externos).
- Plantillas **sin nombres:** `programas/plantillas/` (`lista-de-cotejo.md` ya existe).

## Pasos

1. **Preguntar:** qué quiere producir (registro descriptivo, lista de cotejo, rúbrica o reporte para familias), de qué niño o
   grupo, qué periodo (`AAAA-MM-DD` a `AAAA-MM-DD`) y qué campo(s) formativo(s). Pedir las notas de observación.
2. **Ordenar las notas** por campo formativo (Lenguajes · Saberes y pensamiento científico · Ética, naturaleza y sociedades ·
   De lo humano y lo comunitario). Cada nota conserva su fecha. Lo que no encaja en ningún campo se lista aparte.
3. **Producir según lo pedido:**
   - **Registro descriptivo:** por campo, qué hace la niña o el niño, en qué situación y con qué apoyo. Frases como "en el juego de
     la tienda contó cinco monedas con ayuda de la maestra". Sin adjetivos globales ("buen alumno").
   - **Lista de cotejo:** indicadores observables y escala descriptiva: *lo hace con apoyo / lo hace solo / aún no se observa*.
     Marca solo lo que las notas respaldan; el resto, "aún no se observa" con la nota "sin registro".
   - **Rúbrica:** niveles descritos con conductas observables, no con números. El PDA se toma del programa analítico:
     `[PDA: completar del programa analítico]` si no lo tienen.
   - **Reporte para familias:** saludo, 2 a 4 cosas que hace bien (concretas), 1 o 2 cosas en las que está avanzando y cómo
     apoyar en casa, cierre amable. Corto, sin tecnicismos.
4. **Lenguaje con familias:** respetuoso, sin diagnósticos clínicos ni etiquetas ni comparaciones con otros niños. Si las notas
   describen una preocupación de desarrollo, se redacta como observación y: "sugerimos consultar a un especialista". Nunca
   "tiene X".
5. **Guardar** en `programas/alumnos/AAAA-MM-DD-<tipo>-<grupo>.md`. Confirma con `git check-ignore` que queda ignorado.
6. **Resumen en chat sin nombres de niños:** qué se generó, dónde está y qué campos quedaron sin observaciones.

## Nunca
- Poner un número, letra o "excelente/malo" como evaluación.
- Inventar, inferir o redondear hacia arriba un avance.
- Pegar nombres, fotos o datos de salud de alumnos en un servicio externo.
