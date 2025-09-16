#!/bin/bash

usage() {
    cat <<EOF
Uso: $(basename "$0") <comando>

Comandos:
    install Actualiza e instala paquetes base (Kali)
    rust    Instala rust y utilidades cargo
    go  Instala herramientas go
    gf  Descarga patrones GF (~/.gf)
    nuclei  Descarga plantillas nuclei
    repos   Clona repos (APIS,LABS,RECON,EXPLOTING,ETC)
    wordlists   Descarga worlists (sudo en /usr/share/wordlists)
    notes   Descarga colecciones de notas
    all Ejecuta todo lo anterios

Ejemplos:
    ./install.sh all
    ./install.sh repos
    ./install.sh wordlists
EOF
}
