#!/bin/bash
# Script pour surveiller l'utilisation du disque
# Usage: ./disk_monitor.sh [--help|--disk|--percent|--all]

function show_help() {
    echo "Usage: $0 [OPTION]"
    echo "Surveille l'utilisation du disque principal (/)."
    echo ""
    echo "Options:"
    echo "  --help       Affiche cette aide"
    echo "  --disk       Affiche l'utilisation du disque (par défaut)"
    echo "  --percent    Affiche uniquement le pourcentage utilisé"
    echo "  --all        Affiche toutes les informations"
    echo ""
    echo "Exemples:"
    echo "  $0 --disk"
    echo "  $0 --percent"
    echo "  $0 --all"
}

function show_disk() {
    echo "=== Utilisation du Disque ==="
    df -h / | awk 'NR==2{print "Utilisé: " $3 " / Total: " $2 " (" $5 ")"}'
}

function show_percent() {
    echo "=== Pourcentage Disque ==="
    df / | awk 'NR==2{print "Utilisation: " $5}'
}

case "$1" in
    --help)
        show_help
        exit 0
        ;;
    --disk)
        show_disk
        ;;
    --percent)
        show_percent
        ;;
    --all)
        show_disk
        echo ""
        show_percent
        ;;
    *)
        if [ -z "$1" ]; then
            show_disk
        else
            echo "Option inconnue: $1"
            echo "Utilisez '$0 --help' pour voir les options disponibles."
            exit 1
        fi
        ;;
esac
