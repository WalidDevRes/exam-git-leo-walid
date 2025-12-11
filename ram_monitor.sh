#!/bin/bash
# Script pour surveiller l'utilisation de la RAM
# Usage: ./ram_monitor.sh [--help|--ram|--percent|--all]

function show_help() {
    echo "Usage: $0 [OPTION]"
    echo "Surveille l'utilisation de la RAM."
    echo ""
    echo "Options:"
    echo "  --help       Affiche cette aide"
    echo "  --ram        Affiche l'utilisation RAM (par défaut)"
    echo "  --percent    Affiche le pourcentage exact d'utilisation"
    echo "  --all        Affiche RAM + pourcentage"
    echo ""
    echo "Exemples:"
    echo "  $0 --ram"
    echo "  $0 --percent"
    echo "  $0 --all"
}

function show_ram() {
    echo "=== Utilisation RAM ==="
    free -h | awk '/Mem/{print "Utilisé: " $3 " / Total: " $2}'
}

function show_percent() {
    echo "=== Pourcentage RAM ==="
    free | awk '/Mem/{printf("Utilisation: %.2f%%\n", $3/$2 * 100)}'
}

case "$1" in
    --help)
        show_help
        exit 0
        ;;
    --ram)
        show_ram
        ;;
    --percent)
        show_percent
        ;;
    --all)
        show_ram
        echo ""
        show_percent
        ;;
    *)
        if [ -z "$1" ]; then
            show_ram
        else
            echo "Option inconnue: $1"
            echo "Utilisez '$0 --help' pour voir les options disponibles."
            exit 1
        fi
        ;;
esac
