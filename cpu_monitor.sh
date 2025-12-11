
#!/bin/bash

# Script pour surveiller l'utilisation du CPU (et optionnellement RAM/disque)
# Usage: ./monitor.sh [--help|--cpu|--ram|--disk|--all]

function show_help() {
    echo "Usage: $0 [OPTION]"
    echo "Surveille l'utilisation système."
    echo ""
    echo "Options:"
    echo "  --help     Affiche cette aide"
    echo "  --cpu      Affiche l'utilisation du CPU (par défaut)"
    echo "  --ram      Affiche l'utilisation de la RAM"
    echo "  --disk     Affiche l'utilisation du disque"
    echo "  --all      Affiche CPU, RAM et disque"
    echo ""
    echo "Exemples:"
    echo "  $0 --cpu"
    echo "  $0 --all"
}xxxxxxxxxxxx

function show_cpu() {
    echo "=== Utilisation CPU ==="
    top -b -n1 | grep "Cpu(s)" | awk '{print "Utilisation: " $2 + $4 "%"}'
}

function show_ram() {
    echo "=== Utilisation RAM ==="
    free -h | awk '/Mem/{print "Utilisé: " $3 " / Total: " $2}'
}

function show_disk() {
    echo "=== Utilisation Disque ==="
    df -h / | awk 'NR==2{print "Utilisé: " $3 " / Total: " $2 " (" $5 ")"}'
}

# Gestion des arguments
case "$1" in
    --help)
        show_help
        exit 0
        ;;
    --cpu)
        show_cpu
        ;;
    --ram)
        show_ram
        ;;
    --disk)
        show_disk
        ;;
    --all)
        show_cpu
        echo ""
        show_ram
        echo ""
        show_disk
        ;;
    *)
        if [ -z "$1" ]; then
            show_cpu
        else
            echo "Option inconnue: $1"
            echo "Utilisez '$0 --help' pour voir les options disponibles."
            exit 1
        fi
        ;;
esac
