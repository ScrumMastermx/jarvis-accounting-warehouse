# SCRUB: el filtro de contenido

Este repositorio es público en GitHub. No debe contener credenciales, rutas personales ni datos reales
del negocio. `scripts/scrub.sh` lo revisa; el flujo de GitHub Actions `scrub` lo corre en cada push y pull request.

**Corre `bash scripts/scrub.sh` antes de cada push** (el comando `/guardar` lo hace solo).

## Patrones prohibidos

- Credenciales: `password:`/`password=`, `contraseña:`/`=`, llaves AWS (`AKIA…`), tokens GitHub (`ghp_`, `gho_`),
  llaves `sk-…`, bloques `-----BEGIN … PRIVATE KEY`.
- `co-authored-by` (sin firmas automáticas en commits ni archivos).
- Rutas personales: `/Users/`, `C:\Users\`.
- **RFC con forma real** (`ABC010101XYZ`, `ABCD010101XYZ`) en cualquier archivo **fuera de `ejemplos/`**.
  Los RFC genéricos del SAT (`XAXX010101000`, `XEXX010101000`) se permiten.

Cada coincidencia se imprime como `archivo:línea:texto` y el script termina con código 1. Limpio: `scrub: clean`.

## Falsos positivos

Un identificador que casualmente tenga la forma de RFC (3-4 letras + 6 dígitos + 3 caracteres) se marca.
Cámbiale el nombre o muévelo a `ejemplos/`; no debilites el patrón.

## Datos reales

Viven en `datos/`, que está en `.gitignore`. Nunca se agregan a git ni se pegan en un chat.
