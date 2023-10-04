# Remise du travail pratique 1

## Identification

- Cours : Utilisation et administration des systèmes informatiques
- Sigle : INF1070
- Session : Automne 2023
- Groupe : `20`
- Enseignant : `Moussa Abdenbi`
- Auteur : `Benoît Mignault` (`MIGB09078205`)


## Solution de la mission 1 d'exemple

### État de la mission : résolue

### Démarche

J'ai utilisé la commande `echo` pour afficher les trois lignes.
J'ai utilisé l'option `-e` pour interpréter les caractères `\n` correctement.
J'ai redirigé le résultat dans le fichier `exemple.txt` :

```bash
echo -e 'alpha\nbeta\ngamma\n' > exemple.txt
```

Ensuite, en entrant

```sh
gash check
```

la mission a été validée, ce qui a conclu cette mission.


## Solution de la mission 2

### État de la mission : résolue

### Démarche

J'ai utilisé la commande `set` pour faire un traitemant de l'information qui venait du fichier `prenom` sans en altérer son contenu original.
J'ai fait une extraction des 200 prénoms demandés via l'interval `401,600p`. 
J'ai utilisé l'option `-n` pour supprimer l'affichage du contenu du fichier vers la sortie standard, 
mais grâce au `p` dans l'interval, ça permet d'afficher à la sortie standard l'interval voulu. 
Pour finir, j'ai redirigé le résultat dans le fichier nommé `milieu`.


```bash
sed -n '401,600p' prenoms > milieu
```

Ensuite, en entrant

```sh
gash check
```

la mission a été validée, ce qui a conclu cette mission.


## Solution de la mission 3

### État de la mission : résolue

### Démarche

J'ai utilise la commande `paste` qui sert à regrouper des lignes de plusieurs ficheirs vers la sortie standard ou vers un fichier qui est notre cas.
J'ai utilisé l'option `-d` pour délimité les colonnes par un `;` qui est le format le plus souvent utiliser dans un fichier de type `CSV`.
Pour finir, j'ai redirigé le résultat dans le fichier nommé `dataset.csv`.

```bash
paste -d ';' prenoms genres comptes > dataset.csv
```

Ensuite, en entrant

```sh
gash check
```

la mission a été validée, ce qui a conclu cette mission.


## Solution de la mission 4

### État de la mission : résolue

### Démarche

J'ai utilisé la commande `date` pour faire afficher la date demandée. 
Normalement, l'utilisation de la commande `date` du système Linux nous donne la date et l'heure, 
à laquelle nous avons exécuté la commande. Sauf qu'il est possible de faire afficher une autre date. 
Pour ce faire, j'ai utilisé l'option `-d` qui permet de faire afficher la date présentée dans `"31 Aug 1932 + 91 years 7 months 8 days" +"%d-%m-%Y"` 
au lieu de la date du système Linux. Nous commençons par 31 août 1932 pour ensuite ajouter «textuellement» 91 ans, 7 mois et 8 jours.
Cependant, il est important d'écrire tous les mots en anglais, car sinon ça va créer des messages d'erreurs. 
Pour finir, j'ai utilisé le format présenté plus haut pour faire afficher la date `JJ-MM-AAAA` 

```bash
date -d "31 Aug 1932 + 91 années 7 months 8 days" + "%d-%m-%Y"
```

Ensuite, en entrant

```sh
gash check
```

la mission a été validée, ce qui a conclu cette mission.


## Solution de la mission 5

### État de la mission : résolue

### Démarche

J'ai utilisé la commande `cat` pour faire afficher sur la sortie standard le message secret.
Ensuite, j'ai envoyé la sortie vers l'entrée standard avec un pipe `|` vers la commande `tr`.
Le chiffrement est circulaire, donc après la lettre `zZ` vient la lettre `aA` avec un décalage de 13 position dans les deux sens. Exemple, la lettre `p` devient la lettre `c`.


```bash
cat secret | tr '[N-ZA-Mn-za-m]' '[A-Za-z]'
```

Ensuite, en entrant

```sh
gash check
```

la mission a été validée, ce qui a conclu cette mission.


## Solution de la mission 6

### État de la mission : résolue

### Démarche

Le problème avec la commande suivante `./trop_long | wc -c` est que la sortie standard `stdout` seulement utilisé dans le calcul du nombre de caractères 
mais qu'une partie du message est envoyé vers la sortie d'erreur `stderr` sont envoyé vers des canaux différents. 
Il faut donc rammener les deux sorties vers la même sortie. 
Nous allons donc rajouter `2>&1` pour ensuite envoyer le tout via un pipe `|` vers l'entrée standart de la commande `wc`.
Toujours avec l'option `-c` qui permet de compter le nombre d'octet dans la sortie.

```bash
./trop_long 2>&1 | wc -c
```

Ensuite, en entrant

```sh
gash check
```

la mission a été validée, ce qui a conclu cette mission.


## Solution de la mission 7

### État de la mission : résolue, partiellement résolue, non résolue

### Démarche

À compléter




## Solution de la mission 8

### État de la mission : résolue, partiellement résolue, non résolue

### Démarche

À compléter




## Solution de la mission 9

### État de la mission : résolue, partiellement résolue, non résolue

### Démarche

À compléter




## Solution de la mission 10

### État de la mission : résolue, partiellement résolue, non résolue

### Démarche

À compléter




## Solution de la mission 11

### État de la mission : résolue, partiellement résolue, non résolue

### Démarche

À compléter




## Solution de la mission 12

### État de la mission : résolue, partiellement résolue, non résolue

### Démarche

À compléter




## Solution de la mission 13

### État de la mission : résolue, partiellement résolue, non résolue

### Démarche

À compléter




## Solution de la mission 14

### État de la mission : résolue, partiellement résolue, non résolue

### Démarche

À compléter




## Solution de la mission 15

### État de la mission : résolue, partiellement résolue, non résolue

### Démarche

À compléter

