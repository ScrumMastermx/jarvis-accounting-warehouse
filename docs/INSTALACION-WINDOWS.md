# Instalación en Windows (guía para la sesión)

Tiempo estimado: 20 minutos. Copia y pega cada bloque en PowerShell.

## 1. Herramientas (PowerShell como administrador)

Clic derecho en el botón de inicio → "Terminal (Administrador)" o "Windows PowerShell (Administrador)".

```
winget install Git.Git Python.Python.3.12
```

Cuando termine, **cierra esa ventana**: Windows solo actualiza el PATH al abrir una ventana nueva.
Después de cualquier `winget install`, cierra y abre un PowerShell nuevo antes de continuar.

## 2. Claude Code

Es obligatorio instalar la versión de línea de comandos (`claude`). En un PowerShell normal (no administrador):

```
irm https://claude.ai/install.ps1 | iex
```

Cierra la ventana, abre un PowerShell nuevo y confirma:

```
claude --version
```

Para iniciar sesión necesitas un plan de Claude que incluya Claude Code (por ejemplo Pro o Max).
La sesión se inicia la primera vez que escribas `claude` (paso 4): se abre el navegador para confirmar tu cuenta.

## 3. Clonar el repositorio (PowerShell)

```
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned -Force
mkdir ~\trabajo -Force | Out-Null; cd ~\trabajo
git clone https://github.com/ScrumMastermx/jarvis-accounting-warehouse.git
cd jarvis-accounting-warehouse
.\scripts\setup.ps1
```

`setup.ps1` revisa Git y Python, crea el entorno de Python y, si hace falta, te pide tu nombre y correo para git.
Debe terminar con "== 4/4 Listo". Para solo revisar sin cambiar nada: `.\scripts\setup.ps1 -Check`.

## 4. Primera sesión

En PowerShell:

```
cd ~\trabajo\jarvis-accounting-warehouse
claude
```

La primera vez te pedirá iniciar sesión en el navegador. Cuando Claude responda, prueba:

```
/pregunta ¿qué puedes hacer en este repositorio?
/facturas ejemplos/cfdi
```

Debe generar un Excel en `reportes/` con 2 facturas de ejemplo.

## 5. Tus archivos

Copia tus Excel, CSV y XML a la carpeta `datos/` (por ejemplo `datos/facturas/2026-10/`).
Nunca se suben a internet. Para abrir la carpeta en el Explorador: `explorer datos`.

## Problemas comunes

- **"la ejecución de scripts está deshabilitada en este sistema".** Corre
  `Set-ExecutionPolicy -Scope CurrentUser RemoteSigned -Force`, o ejecuta una sola vez:
  `powershell -ExecutionPolicy Bypass -File .\scripts\setup.ps1`
- **"el término 'python' (o 'claude', 'git') no se reconoce"** después de instalar: cierra y abre un PowerShell nuevo
  (el PATH se actualiza al abrir). Para revisarlo: `where.exe python` (o `where.exe claude`); debe mostrar una ruta.
- **`python` abre la Microsoft Store.** Configuración → Aplicaciones → Configuración avanzada de aplicaciones →
  Alias de ejecución de aplicaciones → apaga los de "python" y "python3". Abre un PowerShell nuevo.
  `setup.ps1` ya ignora ese acceso directo, pero necesita un Python instalado con winget.
- **Archivos con `^M` o saltos de línea raros (CRLF).** `setup.ps1` fija `core.autocrlf false`.
  Si editas con el Bloc de notas, usa mejor Notepad++ o VS Code.
- **`pip install` falla.** ¿Hay internet? ¿Antivirus bloqueando? Reintenta `.\scripts\setup.ps1`.
- **Excel dice que el archivo está en uso.** Cierra el archivo en Excel antes de volver a generarlo; los
  archivos `~$nombre.xlsx` son candados temporales de Excel y se ignoran.
- **¿Prefieres Git Bash?** Funciona igual: `bash scripts/setup.sh`.
