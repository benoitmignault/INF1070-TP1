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

### État de la mission : résolue, partiellement résolue, non résolue

### Démarche

À compléter




## Solution de la mission 4

### État de la mission : résolue, partiellement résolue, non résolue

### Démarche

À compléter




## Solution de la mission 5

### État de la mission : résolue, partiellement résolue, non résolue

### Démarche

À compléter




## Solution de la mission 6

### État de la mission : résolue, partiellement résolue, non résolue

### Démarche

À compléter




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

