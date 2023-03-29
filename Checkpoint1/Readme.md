# Část 1

Vytvoříme nový WPF projekt a zkopírujeme do něj docker compose, poté zadáme do konzole docker compose up -d.
Otevřeme si phpmyadmin na [localhost:8080](http://localhost:8080/) a importujeme databáze pomocí skriptu pivovary.sql

## Stažení balíčků nuget
Dále do projektu zkopírujeme soubor packages.config a v nuget konzoli (v záložce nástroje -> nuget manžer -> nuget konzole) spustíme Update-Package -reinstall
