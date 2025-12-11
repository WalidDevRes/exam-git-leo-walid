# Feature : CPU Monitoring

Cette branche **feature/cpu** contient un script Bash permettant de surveiller l'utilisation du CPU, ainsi que d'autres ressources système (RAM et disque).

---

## 📌 Description du script

Le script `monitor.sh` permet d'afficher :

- 🖥️ **L'utilisation du CPU** (option par défaut)  
- 💾 **L'utilisation de la RAM**  
- 📂 **L'utilisation du disque**  
- 📊 **Toutes les informations combinées**

Il inclut également une aide intégrée pour comprendre les options disponibles.

---

## 🛠️ Prérequis

- Un terminal Linux/Mac ou Git Bash Windows  
- Bash installé  
- Donner les droits d’exécution au script :
chmod +x monitor.sh


🚀 Utilisation
▶️ Afficher l'utilisation du CPU (par défaut)

./monitor.sh

ou

./monitor.sh --cpu

💾 Afficher l'utilisation de la RAM

./monitor.sh --ram

📂 Afficher l'utilisation du disque

./monitor.sh --disk

📊 Afficher toutes les ressources (CPU + RAM + disque)

./monitor.sh --all

❓ Afficher l'aide

./monitor.sh --help

📜 Exemple de sortie

=== Utilisation CPU ===
Utilisation: 15%

=== Utilisation RAM ===
Utilisé: 2,8G / Total: 7,7G

=== Utilisation Disque ===
Utilisé: 18G / Total: 100G (18%)
