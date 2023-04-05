# Část 1
Nejprve si stáhneme [soubory](https://minhaskamal.github.io/DownGit/#/home?url=https://github.com/TomPribil/WPF_tutorial/tree/main/Checkpoint1/soubory)

Vytvoříme nový WPF projekt (aby fungoval import balíčků, je potřeba použít `WPF App (.NET Framework)`) a zkopírujeme do něj docker compose, poté zadáme do konzole docker compose up -d.
Otevřeme si phpmyadmin na [localhost:8080](http://localhost:8080/) a importujeme databázi pomocí skriptu pivovary.sql

## Stažení balíčků nuget
Dále do projektu zkopírujeme soubor packages.config a v nuget konzoli (v záložce nástroje -> nuget manžer -> nuget konzole) spustíme Update-Package -reinstall
