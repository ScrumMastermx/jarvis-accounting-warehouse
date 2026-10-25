# Cómo crece este repositorio

Empieza general a propósito. Cuando sepamos qué hace José Manuel cada semana, agregamos piezas.

## Agregar un comando (skill)

1. Crea `.claude/skills/<nombre>/SKILL.md` con frontmatter `name` y `description` (incluye `TRIGGERS:` con las
   frases que lo activan) y pasos numerados en español.
2. Si necesita cálculo, crea `scripts/<nombre>.py` con `entrada` y `salida` como argumentos y pruébalo con un
   archivo de `ejemplos/`.
3. Agrega una fila a la tabla de comandos en `README.md`.
4. `/guardar`.

## Agregar una regla

`.claude/rules/<tema>.md`: reglas cortas, en imperativo, con el por qué cuando no sea obvio. Se cargan siempre.
Si una regla aplica a un solo comando, va en el SKILL.md de ese comando, no en `rules/`.

## Agregar un script

Python 3 + `openpyxl` (ya instalado en `.venv`). Si hace falta otra librería, agrégala a `requirements.txt`
con versión fija y vuelve a correr `bash scripts/setup.sh`. Agrega una línea de prueba a
`.github/workflows/scrub.yml` para que corra en CI con un archivo de `ejemplos/`.

## Ideas candidatas (por descubrir con José Manuel)

- Exportes CSV de su sistema contable o ERP → lectura directa en `/reporte` y `/conciliar`.
- Catálogo de productos (SKU, descripción, unidad, costo) como base para `/inventario`.
- Kardex por producto (entradas, salidas, saldo, costo promedio).
- Cuentas por cobrar / por pagar: antigüedad de saldos (0-30, 31-60, 61-90, +90 días).
- Lectura de DIOT y contabilidad electrónica (solo lectura y verificación, nunca envío).
- Plantillas: caja chica, requisiciones de almacén, orden de compra.
- Preescolar: expediente digital por alumno (checklist de documentos, solo local en `datos/escuela/`).
- Preescolar: comunicación con familias (avisos, recordatorios de reuniones y de pago, en borrador para que José Manuel los envíe).
- Preescolar: informe para el Consejo Técnico Escolar a partir de las notas de observación (sin nombres).
- Preescolar: control de asistencia por grupo y resumen mensual.
- Recordatorios de vencimientos (facturas PPD sin complemento de pago, pagos a proveedores).
