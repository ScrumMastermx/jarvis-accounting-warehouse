# Privacidad

- `datos/` contiene información real de clientes, proveedores y bancos. **Nunca se sube a git** (está en
  `.gitignore`) y **nunca se pega** en un chat, correo o servicio externo.
- Antes de cualquier `git add`, confirma que no se incluye nada de `datos/`. `scripts/scrub.sh` lo revisa.
- Los archivos de `ejemplos/` son ficticios: nombres inventados ("Proveedor Ejemplo S.A. de C.V.") y RFC
  genéricos (`XAXX010101000`, `XEXX010101000`). Al crear un ejemplo nuevo, anonimiza siempre.
- Si José Manuel pide compartir un reporte, genera una versión en `reportes/` y recuérdale revisar que no
  lleve datos sensibles de más.
