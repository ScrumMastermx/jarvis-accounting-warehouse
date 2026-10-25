# Jarvis Contabilidad y Almacén

Un asistente de trabajo para contabilidad y manejo de almacén, construido sobre
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
| `/aprender` | Guardar una corrección o preferencia para que no se repita el error |
| `/guardar` | Guardar tus notas y scripts en el repositorio (nunca `datos/` ni `reportes/`) |

## Dónde van tus archivos

```
datos/      TUS archivos reales (Excel, CSV, XML). Privados: nunca se suben a internet.
ejemplos/   Archivos ficticios para probar los comandos.
reportes/   Lo que Claude genera (Excel y resúmenes). Solo en tu computadora: no se sube a git, como datos/.
notas/      Aprendizajes, decisiones, pendientes.
scripts/    Herramientas (Python) que usan los comandos.
```

## Cómo crece

Este repositorio empieza general a propósito. Cuando sepamos qué haces cada semana,
agregamos comandos (ver [`docs/CRECER.md`](docs/CRECER.md) y [`ROADMAP.md`](ROADMAP.md)).

## Licencia

MIT. Ver [`LICENSE`](LICENSE).
