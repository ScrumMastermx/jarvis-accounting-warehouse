# Jarvis Contabilidad y Almacén

*contabilidad, almacén y preescolar*

Un asistente de trabajo para contabilidad, manejo de almacén y el preescolar del negocio, construido sobre
[Claude Code](https://claude.ai/code). Lee tus archivos (Excel, CSV, facturas XML),
concilia, arma reportes y explica conceptos. Tú decides; él prepara.

**Lo que NUNCA hace:** pagar, transferir, mover dinero, timbrar o enviar nada al SAT.
Prepara, calcula, concilia y redacta. Toda cifra que muestra viene de una fila o celda
que puedes revisar.

## Instalación en Windows (una sola vez, ~20 minutos)

1. **Herramientas.** Abre PowerShell como administrador y ejecuta:
   ```
   winget install Git.Git Python.Python.3.12
   ```
   Cierra PowerShell al terminar.
2. **Claude Code.** Instálalo desde https://claude.ai/code e inicia sesión con tu cuenta.
3. **Clonar este repositorio.** Abre **Git Bash** (viene con Git) y escribe:
   ```
   mkdir -p ~/trabajo && cd ~/trabajo
   git clone https://github.com/ScrumMastermx/jarvis-accounting-warehouse.git
   cd jarvis-accounting-warehouse
   bash scripts/setup.sh
   ```
   `setup.sh` revisa que todo esté instalado, crea el entorno de Python y te dice qué sigue.
4. **Abrir Claude.** En la misma ventana de Git Bash escribe `claude` y presiona Enter.
   Prueba con `/facturas ejemplos/cfdi`.

Guía paso a paso con problemas comunes: [`docs/INSTALACION-WINDOWS.md`](docs/INSTALACION-WINDOWS.md).

## Comandos

| Escribe | Para |
|---|---|
| `/pregunta ¿cuánto le debemos a Proveedor X?` | Responder con base en tus archivos, citando fila y celda |
| `/facturas datos/facturas-octubre` | Convertir una carpeta de XML (CFDI 4.0) en una tabla de Excel con totales |
| `/conciliar` | Conciliación bancaria: estado de cuenta vs libro/auxiliar |
| `/inventario` | Existencias, rotación, punto de reorden, productos sin movimiento |
| `/reporte` | Reporte mensual (ventas, compras, gastos, inventario) |
| `/excel` | Crear, limpiar o arreglar una hoja de cálculo |
| `/planeacion` | Planeación didáctica semanal o por proyecto para un grupo de preescolar |
| `/programa-analitico` | Construir o revisar el programa analítico del plantel (lo que escribe el colectivo, ordenado) |
| `/evaluacion` | Pasar tus notas de observación a registros, listas de cotejo, rúbricas y reportes para familias |
| `/control-escolar` | Listas de grupo, inscripciones, expedientes, calendario y colegiaturas |
| `/aprender` | Guardar una corrección o preferencia para que no se repita el error |
| `/guardar` | Guardar tus notas y scripts en el repositorio (nunca `datos/` ni `reportes/`) |

## Dónde van tus archivos

```
datos/      TUS archivos reales (Excel, CSV, XML). Privados: nunca se suben a internet.
ejemplos/   Archivos ficticios para probar los comandos.
reportes/   Lo que Claude genera (Excel y resúmenes). Solo en tu computadora: no se sube a git, como datos/.
programas/   Preescolar: planeaciones, programa analítico y plantillas (sin nombres de niños). `programas/alumnos/` es privada: no se sube.
notas/      Aprendizajes, decisiones, pendientes.
scripts/    Herramientas (Python) que usan los comandos.
```

## Preescolar

Para el preescolar (3 a 5 años) el asistente sigue la Nueva Escuela Mexicana, Plan de Estudio 2022 de la SEP:
4 campos formativos, 7 ejes articuladores y evaluación formativa sin calificación numérica.

- **No inventa** contenidos, PDA ni normativa: si no los tienes a la mano, deja un espacio marcado para completar con el documento SEP vigente.
- **Cuida a los niños:** nombres, fotos, CURP y datos de salud solo viven en `programas/alumnos/` y `datos/escuela/`, que nunca se suben.
- Las planeaciones y plantillas **sin nombres** sí se guardan en el repositorio.
- Empieza con `/planeacion`; los formatos vacíos están en `programas/plantillas/`. Detalle en [`programas/README.md`](programas/README.md).

## Cómo crece

Este repositorio empieza general a propósito. Cuando sepamos qué haces cada semana,
agregamos comandos (ver [`docs/CRECER.md`](docs/CRECER.md) y [`ROADMAP.md`](ROADMAP.md)).

## Licencia

MIT. Ver [`LICENSE`](LICENSE).
