---
name: facturas
description: |
  Convertir una carpeta de facturas electrónicas XML (CFDI 4.0, SAT México) en una tabla de Excel: UUID, fecha,
  emisor, receptor, subtotal, IVA, total, forma y método de pago, uso CFDI; totales por mes y por emisor;
  detecta duplicados y XML mal formados. Usa scripts/cfdi_a_tabla.py.
  TRIGGERS: "/facturas", "CFDI", "XML del SAT", "facturas de octubre", "cuánto facturó", "cuánto nos facturaron",
  "pasar las facturas a Excel".
---

# Facturas (CFDI 4.0)

## Pasos

1. **Carpeta.** Si no la indican, lista `datos/` y pregunta cuál carpeta tiene los XML. Pregunta si son facturas
   **recibidas** (gastos/compras) o **emitidas** (ventas): cambia la lectura del reporte, no el script.
2. **Correr** (con `.venv` activo):
   `python scripts/cfdi_a_tabla.py <carpeta> reportes/facturas-AAAA-MM-DD.xlsx`
   El script lee cada `.xml`, ignora los que no son CFDI 4.0 válidos y los reporta al final sin detenerse.
3. **Revisar** la salida: hoja `Facturas` (una fila por XML), hoja `Resumen` (por mes y por emisor, con fila
   de total `=SUM`), hoja `Fuente`. Si el script marcó **UUID duplicados**, menciónalos primero: son la causa más
   común de totales inflados.
4. **Contar y cruzar**: número de XML en la carpeta = filas en `Facturas` + XML inválidos + duplicados. Si no cuadra,
   averigua por qué antes de entregar.
5. **Resumen en chat**: total de facturas, suma de totales, IVA, los 5 emisores más grandes, XML con problema.
   Cada cifra con su origen (hoja y celda).

## Notas
- Complemento de pago (REP) y notas de crédito (tipo `E`) se listan con su `TipoDeComprobante`; no los sumes
  junto con ingresos (`I`) sin decirlo.
- Si preguntan "¿esto es deducible?": regla general + "confírmalo con tu contador".
