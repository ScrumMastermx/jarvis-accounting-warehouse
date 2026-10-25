# Instalación en Windows (guía para la sesión)

Tiempo estimado: 20 minutos. Copia y pega cada bloque.

## 1. Herramientas (PowerShell como administrador)

Clic derecho en el botón de inicio → "Terminal (Administrador)" o "Windows PowerShell (Administrador)".

```
winget install Git.Git Python.Python.3.12
```

Cuando termine, cierra esa ventana.

## 2. Claude Code

Entra a https://claude.ai/code, instala Claude Code e inicia sesión con tu cuenta.
Si prefieres la versión de línea de comandos, en PowerShell (normal):

```
irm https://claude.ai/install.ps1 | iex
```

## 3. Clonar el repositorio (Git Bash)

Busca "Git Bash" en el menú de inicio y ábrelo. Pega:

```
mkdir -p ~/trabajo && cd ~/trabajo
git clone https://github.com/ScrumMastermx/jarvis-accounting-warehouse.git
cd jarvis-accounting-warehouse
bash scripts/setup.sh
```

`setup.sh` revisa Git y Python, crea el entorno de Python y, si hace falta, te pide tu nombre y correo para git.
Debe terminar con "== 4/4 Listo".

## 4. Primera sesión

En la misma ventana:

```
claude
```

Cuando Claude responda, prueba:

```
/pregunta ¿qué puedes hacer en este repositorio?
/facturas ejemplos/cfdi
```

Debe generar un Excel en `reportes/` con 2 facturas de ejemplo.

## 5. Tus archivos

Copia tus Excel, CSV y XML a la carpeta `datos/` (por ejemplo `datos/facturas/2026-10/`).
Nunca se suben a internet.

## Problemas comunes

- **`python3` abre la Microsoft Store.** Configuración → Aplicaciones → Configuración avanzada de aplicaciones →
  Alias de ejecución de aplicaciones → apaga los de "python" y "python3". Cierra y abre Git Bash.
- **`claude: command not found`** después de instalar: cierra y vuelve a abrir Git Bash (el PATH se actualiza al abrir).
- **Archivos con `^M` o saltos de línea raros (CRLF).** `setup.sh` fija `core.autocrlf false` en este repositorio.
  Si editas con el Bloc de notas, usa mejor Notepad++ o VS Code.
- **Las variables o alias de `~/.bashrc` no cargan.** Git Bash abre sesiones de "login" que leen `~/.bash_profile`.
  Agrega esta línea a `~/.bash_profile`: `[ -f ~/.bashrc ] && . ~/.bashrc`
- **`pip install` falla.** ¿Hay internet? ¿Antivirus bloqueando? Reintenta `bash scripts/setup.sh`.
- **Excel dice que el archivo está en uso.** Cierra el archivo en Excel antes de volver a generarlo; los
  archivos `~$nombre.xlsx` son candados temporales de Excel y se ignoran.
