---
name: pregunta
description: |
  Responder una pregunta sobre los archivos en datos/ (cuánto, cuántos, cuál, desde cuándo) citando filas y celdas,
  o explicar un concepto contable o de almacén en lenguaje simple.
  TRIGGERS: "/pregunta", "cuánto", "cuántos", "qué es", "cómo se calcula", "cuál proveedor", "desde cuándo".
---

# Pregunta

## Si es sobre datos
1. Identifica qué archivo(s) de `datos/` responden la pregunta. Si hay varios candidatos, pregunta cuál.
2. Lee lo necesario (no todo el archivo si basta con una columna). Explica qué vas a leer.
3. Responde en la primera línea. Debajo, `Origen:` con 1 a 5 citas `archivo!Hoja!Celda` o `archivo:fila`.
4. Si falta un dato: "falta el dato" + qué archivo o columna lo tendría.
5. Si la pregunta implica un cálculo, muestra la fórmula con los números sustituidos.

## Si es un concepto
1. Explicación en 3 a 6 líneas, con un ejemplo con números pequeños.
2. Si es fiscal (SAT, IVA, ISR, deducibilidad, CFDI, DIOT): termina con "Confírmalo con tu contador; las reglas
   cambian y dependen del régimen."
3. Si hay un comando de este repositorio que lo resuelve, menciónalo (`/conciliar`, `/facturas`, …).

## Nunca
- Responder un número sin origen.
- Inventar una regla fiscal específica (porcentajes, plazos, montos) de la que no estés seguro: di "no estoy seguro".
