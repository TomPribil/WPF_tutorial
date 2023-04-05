# Část 1
Nejprve si stáhneme [soubory](https://minhaskamal.github.io/DownGit/#/home?url=https://github.com/TomPribil/WPF_tutorial/tree/main/Checkpoint1/soubory)

Vytvoříme nový WPF projekt (aby fungoval import balíčků, je potřeba použít `WPF App (.NET Framework)`), do kterého zkopírujeme docker compose soubor, poté zadáme do konzole docker compose up -d.
Otevřeme si phpmyadmin na [localhost:8080](http://localhost:8080/) a importujeme databázi pomocí skriptu pivovary.sql

## Stažení balíčků nuget
Dále do projektu zkopírujeme soubor packages.config a v nuget konzoli (v záložce nástroje -> nuget manžer -> nuget konzole) spustíme Update-Package -reinstall
