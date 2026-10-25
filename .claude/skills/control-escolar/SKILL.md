---
name: control-escolar
description: |
  Control escolar del preescolar: listas de grupo, inscripciones y reinscripciones, lista de verificación del expediente,
  calendario del ciclo (a partir del calendario SEP vigente que se pegue) y colegiaturas: cuentas por cobrar por alumno y mes,
  antigüedad de saldos y recibos. Se conecta con /conciliar y /reporte (ingresos por colegiaturas).
  TRIGGERS: "/control-escolar", "lista de grupo", "inscripción", "reinscripción", "expediente", "colegiaturas", "quién debe",
  "recibo de colegiatura", "calendario escolar".
---

# Control escolar

Antes de empezar, aplica `.claude/rules/preescolar.md` y `.claude/rules/privacidad.md`.
Datos de alumnos y familias en `datos/escuela/` (ignorado por git). Salidas en `reportes/` (solo local).

## Qué puede hacer

1. **Listas de grupo.** Lee `datos/escuela/` y arma la lista por grado y grupo (Excel con las reglas de `.claude/rules/excel.md`).
   Revisa duplicados (mismo nombre y fecha de nacimiento) y celdas vacías; repórtalos, no los rellenes.
2. **Inscripción / reinscripción.** Lista de seguimiento por familia: qué entregó, qué falta, fecha. No cobres ni envíes nada.
3. **Expediente: lista de verificación.** Documentos típicos que la escuela suele pedir (acta de nacimiento, CURP, comprobante
   de domicilio, cartilla de vacunación, fotografías, datos de contacto y de personas autorizadas para recoger). **Eso es una
   lista de trabajo, no un requisito oficial:** los documentos exigidos por la SEP o por la incorporación del plantel se
   marcan `[Confirmar con supervisión de zona]`. No inventes requisitos oficiales.
4. **Calendario del ciclo.** Pide que peguen el calendario escolar SEP vigente y organiza fechas (inicio, fin, suspensiones, CTE).
   No completes fechas de memoria: sin calendario pegado, "falta el dato".
5. **Colegiaturas.**
   - Cuentas por cobrar por alumno y mes: cuota pactada, pagado, saldo. **La cuota la da José Manuel**; nunca supongas montos.
   - Antigüedad de saldos: 0-30, 31-60, 61-90 y más de 90 días, con total reconciliado (alumno → grupo → total).
   - Recibos: borrador con folio, fecha, concepto y monto, para que José Manuel lo emita. No timbres ni envíes.
   - Cruce con el banco: `/conciliar` para ligar depósitos con colegiaturas pagadas.
   - Ingresos del mes por colegiaturas para `/reporte`: totales sin nombres de alumnos.
6. **Guardar** en `reportes/` con fecha (`colegiaturas-AAAA-MM-DD.xlsx`). Cada cifra cita su origen (`archivo!Hoja!Celda`).

## Nunca
- Inventar requisitos oficiales, cuotas, fechas o folios.
- Cobrar, enviar recordatorios o facturar: José Manuel lo hace.
- Mostrar nombres de alumnos o datos de familias fuera de `reportes/` o `datos/escuela/`, ni pegarlos en servicios externos.
- Dar asesoría fiscal sobre colegiaturas (deducibilidad, CFDI de servicios educativos): regla general y "confírmalo con tu contador".
