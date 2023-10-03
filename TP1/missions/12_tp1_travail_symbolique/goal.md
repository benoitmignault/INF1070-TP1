Objectif
========

Votre serveur Tomcat est installé dans le répertoire `app/opt/tomcat/`. 
Le script de redémarrage `restart.sh` se trouve dans `app/opt/tomcat/bin/`. 
Vos applications Web se trouvent dans le répertoire `app/opt/tomcat/webapps/`.
Ci-bas une vue arborescente du contenu du répertoire `app`
    app
    ├── home
    │   └── moi
    └── opt
        └── tomcat
            ├── bin
            │   └── restart.sh
            └── webapps
                ├── webapp1
                ├── webapp2
                └── webapp3

Comme vous travaillez, la plupart du temps, dans votre répertoire `app/home/moi` 
et que vous devez souvent redémarrer le serveur, vous voulez créer le lien 
symbolique `tomrstart` dans ce répertoire, qui pointe vers le fichier 
`app/opt/tomcat/bin/restart.sh`.

De plus, pour pouvoir accéder à vos applications Web rapidement, vous voulez 
créer un autre lien symbolique `webapps` dans ce même répertoire, mais qui pointe 
cette fois vers le répertoire `app/opt/tomcat/webapps`.

Contraintes
===========
- **Vous n'avez pas le droit de vous déplacer** dans les répertoires pour créer ces liens. 
Autrement dit, l'utilisation de la commande `cd` est interdite !
- Vous devez créer **les plus courts liens symboliques possibles**.
