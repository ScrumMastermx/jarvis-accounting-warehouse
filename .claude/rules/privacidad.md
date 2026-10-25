# Privacidad

- `datos/` contiene información real de clientes, proveedores y bancos. **Nunca se sube a git** (está en
  `.gitignore`) y **nunca se pega** en un chat, correo o servicio externo.
- `reportes/` también es solo local (ignorado por git): los Excel generados llevan RFC, nombres y cifras reales dentro, y el scrub no puede revisar archivos binarios.
- `notas/` sí se sube a git: nunca escribas ahí nombres, RFC, cifras ni archivos de clientes; solo reglas y preferencias de trabajo.
- Los scripts escriben en el Excel solo el nombre del archivo o carpeta, nunca la ruta completa.
- Antes de cualquier `git add`, confirma que no se incluye nada de `datos/`. `scripts/scrub.sh` lo revisa.
- Los archivos de `ejemplos/` son ficticios: nombres inventados ("Proveedor Ejemplo S.A. de C.V.") y RFC
  genéricos (`XAXX010101000`, `XEXX010101000`). Al crear un ejemplo nuevo, anonimiza siempre.
- Si José Manuel pide compartir un reporte, genera una versión en `reportes/` (se queda en tu computadora; compártela tú por el canal que elijas) y recuérdale revisar que no
  lleve datos sensibles de más.
- **Menores de edad (preescolar).** Nombres, fotos, CURP, datos de salud y datos de las familias de los alumnos viven solo en
  `programas/alumnos/` y `datos/escuela/`, ambas ignoradas por git. Nunca se pegan en un chat, correo o servicio externo.
  Las plantillas y planeaciones **sin nombres de alumnos** (`programas/plantillas/`, `programas/planeaciones/`) sí pueden subirse.
