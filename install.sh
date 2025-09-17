#!/bin/bash
set -euo pipefail

# ===============================
# Carpetas base (tu estructura)
# ===============================
labs=/opt/labs
recon=/opt/recon
exploting=/opt/exploting
wordlists=/usr/share/wordlists
AD=/opt/AD
apis=/opt/apis
wlopt=/opt/wordlists
notes=~/Documents/notes
THM=~/Documents/THM
HTB=~/Documents/HTB

sudo chown -R "$USER:$USER" /opt || true
mkdir -pv "$labs" "$recon" "$exploting" "$wordlists" "$AD" "$apis" "$wlopt" "$notes" "$THM" "$HTB"
# wordlists suele ser del sistema; no cambiamos propietario.

# ===============================
# Helpers
# ===============================
msg() { printf "\033[1;34m[+] %s\033[0m\n" "$*"; }
warn() { printf "\033[1;33m[!] %s\033[0m\n" "$*"; }
err() { printf "\033[1;31m[-] %s\033[0m\n" "$*" >&2; }
have() { command -v "$1" >/dev/null 2>&1; }


usage() {
  cat <<EOF
Uso: $(basename "$0") <comando>

Comandos:
  install       Actualiza e instala paquetes base (Kali)
  rust          Instala Rust y utilidades cargo
  go            Instala herramientas Go
  gf            Descarga patrones GF (~/.gf)
  nuclei        Descarga plantillas Nuclei
  repos         Clona repos (APIs, Labs, Recon, Exploiting, AD)
  wordlists     Descarga wordlists (sudo en /usr/share/wordlists)
  notes         Descarga colecciones de notas
  all           Ejecuta todo lo anterior

Ejemplos:
  ./install_toolkit.sh all
  ./install_toolkit.sh repos
  ./install_toolkit.sh wordlists
EOF
}

# ===============================
# Entrada
# ===============================
cmd="${1:-all}"
case "$cmd" in
  install)   install ;;
  rust)      rust ;;
  go)        go_tools ;;
  gf)        gf_patterns ;;
  nuclei)    nuclei_templates ;;
  repos)     repos ;;
  wordlists) wordlists ;;
  notes)     notes ;;
  all)       install_all ;;
  *)         usage ;;
esac
