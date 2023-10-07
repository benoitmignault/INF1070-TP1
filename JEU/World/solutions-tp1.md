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

J'ai utilisé la commande `sed` pour faire un traitemant de l'information qui venait du fichier `prenom` sans en altérer son contenu original.
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

J'ai utilise la commande `paste` qui sert à regrouper des lignes de plusieurs fichiers vers la sortie standard ou vers un fichier qui est notre cas.
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

Le problème avec la commande suivante `./trop_long | wc -c` est que c'est la sortie standard `stdout` qui est utilisé seulement dans le calcul du nombre de caractères 
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

### État de la mission : résolue

### Démarche

La commande `dd` en utilisant l'option `if=` a été utilisé pour copier le contenu du fichier `urandom` du répertoire `/dev`.
La sortie standard a été rediriger avec un pipe `|` vers l'entrée standard de la commande `head` qui est utilisée pour faire afficher le début d'un fichier.
L'option `-c` est utilisé pour récupérer les X premiers octets. Ici, nous avons déterminé la valeur `8323072` pour les besoins de la cause.
L'information a été redirigé vers le fichier `size_m` qui a été créé ou écraser s'il y existait déjà.

```bash
dd if=/dev/urandom | head -c 8323072 > size_m
```

Ensuite, en entrant

```sh
gash check
```

la mission a été validée, ce qui a conclu cette mission.


## Solution de la mission 8

### État de la mission : résolue

### Démarche

Après plusieurs réflexions sur le sujet, j'ai finalement décidé d'y aller par la fin vue que les `&&` était interdi.
La commande `tail` avec l'option `-c 3` va aller chercher les 3 derniers fichier. Parmi les 3 caractères, 
il y a les 2 dernières lettres qui nous serons utile pour le password et le 3e caractère est simplment le caractère de fin de fichier.
On envoi tout ça dans la sortie standard pour être reprit par la prochaine commande. 
La commande `head` avec l'option `-c et 57` récupère les 57 premiers caractères du fichier `mdp` et ensuite avec `-` 
substitura l'information venu de l'entrée standard dans la sortie standard. Ensuite, le pipe va envoyer le tout vers la commande `tail` avec encore l'option `-c 5` 
qui récupèrera les derniers caractères de l'entrée standard (ici, on parle du milieu et de la fin du fichier `mdp`). 
Pour finir, un dernier transafert avec le pipe avec la commande `head` avec l'option `-c 4` 
qui récupère les 4 premiers caractères du fichier et avec l'entrée standard finira le password tant recherché. 
Concernant, l'option `-q` de la commande `head` est utilisé à deux reprises pour retirer les entêtes de fichier/sortie standard, 
car sinon l'option `-c` avec le nombre de caractères à garder risque de corrompte l'affichage du résultat.


```bash
tail -c 3 mdp | head -q -c 57 mdp - | tail -c 5 | head -q -c 4 mdp -
```

Ensuite, en entrant

```sh
gash check
```

la mission a été validée, ce qui a conclu cette mission.


## Solution de la mission 9

### État de la mission : résolue

### Démarche

J'ai commencé par inverser chaque mot du fichier `words` avec la commande `rev` que j'ai envoyé à la sortie standard. 
Ensuite, j'ai procédé à une comparaison entre deux fichiers avec la commande `diff` soit l'original `words` et 
celui que j'ai répris de l'entrée standard qui venait des mots inversés. Si un mot était pareil entre les deux fichiers, 
il était tout simplement retirer de la comparaison. Les mots restants commençait par soit `<` qui était associé au fichier orifinal ou par `>` 
qui était associé au fichier inversé venant de l'entrée standard.
La commande `grep` a été utilisé pour garder uniquement tous les mots du premiers fichiers avec le modif `<` et 
de sortir uniquement le nombre de lignes via la commande `wc` avec l'option qui s'occupe d'afficher seulement le nombre de lignes `l`.

```bash
rev words | diff words "-" | grep '^<' | wc -l
```

Ensuite, en entrant

```sh
gash check
```

la mission a été validée, ce qui a conclu cette mission.


## Solution de la mission 10

### État de la mission : résolue

### Démarche

Ici, on parle évidament de la notion de `espace sans chasse`, on peut y retrouver sa définision et ses utilisation via le lien web : [Espace insécable](https://fr.wikipedia.org/wiki/Espace_ins%C3%A9cable)
Voici la technique que j'ai utilisé pour arriver aux 3 octets hexadécimal qui identifait `espace sans chasse`. 
J'ai été sur un site web de conversion string en Hexa. [Site de conversion](http://www.unit-conversion.info/texttools/hexadecimal/). 
J'ai déterminé un espace valide dans cet extrait de mots collés `espace​sans` sois entre le `e` et `s` et ça ma donner les trois octets `e2 80 8b`. J'ai utilisé la commande `sed` qui permet de faire un traitement sur un flux de texte, via le fichier `zero-width_space`. 
L'option `-i` permet de modifier directement le fichier en créant un fichier temporaire en «background» pour finir par écraser le fichier avec les nouvelles informations. L'utilisation de `s/` permet d'enclancer la recherche du motif `xe2\x80\x8b` pour le remplacer par ` ` un espace et pour finir `/g` qui va remplacer toutes les ocurances.

```bash
sed -i 's/\xe2\x80\x8b/ /g' zero-width_space
```

Ensuite, en entrant

```sh
gash check
```

la mission a été validée, ce qui a conclu cette mission.


## Solution de la mission 11

### État de la mission : résolue

### Démarche

On commence par trouver les fichiers avec la commande `find` dans le répertoire `./windows` qui contient des espaces via l'option `-iname "* *"`.
Petit fait à noter, j'ai utilisé `i` dans l'option précédant pour ignorer les majuscules. 
Ensuite, j'ai utlisé l'option `-print` deux fois plutôt qu'une, on y reviendra plus tard. 
On envoit le résultat vers la sortie standard via le pipe `|` qui sera reprie par les prochaines commandes.
Maintenant, avec l'information qui se trouve dans l'entrée standard, on va pouvoir modifier le nom du fichier qui est représenté ici par le 2e `-print` de la commande `find`.
Avec la commande `sed`, on va remplacer ` ` par `_` via l'option de regexp `s/ /_/` mais seulement sur le deuxième nom de fichier, 
grâce à `n` devant le regexp qui permet de sauter le premier nom de fichier qui fait référence au premier `-print` de la commande `find`. 
On remplace pour chaque paire d'information sur le deuxième fichier et ce, jusqu'au dernier fichier avec l'option `g` à la fin du regexp. 
Ensuite, on fera appel à la commande `xargs` qui permettra exécuter une commande avec les informations venu de l'entrée standard. 
L'option `-r` évite de faire exécuter la commande `mv` si aucune paire de ligne n'est trouvée, en d'autres termes, 
si aucun fichier contenant des espaces n'ayant été trouvé dans le dossier recherché. 
La prochaine option `-d` avec `\n` permet de séparer les lignes par des sauts de lignes pour éviter de briser les noms de fichiers. 
La dernière option `-n2` indique à la commande `xargs` d'envoyer deux lignes à la fois à la commande `mv` 
qui va rpcéder au renommage du fichier et ce jusqu'à la dernière paire de lignes.

```bash
find ./windows -type f -iname "* *" -print -print | sed 'n;s/ /_/g' | xargs -r -d '\n' -n2 mv
```

Ensuite, en entrant

```sh
gash check
```

la mission a été validée, ce qui a conclu cette mission.


## Solution de la mission 12

### État de la mission : résolue

### Démarche

Pour la mission 12, il nous est demandé de créer 2 liens symboliques.
La création des deux liens se feront avec la même logique. 
On utilise la commande `ln` qui permet de créer des liens, avec les options `-s` qui permet de configurer le lien, comme un lien symbolique. 
Ensuite avec l'option `-r` qui permet de créer le lien symbolique sans le briser, 
étant donner que la source et la destination ne figure pas dans le même dossier. 
Le chemin de gauche est le fichier ou le dossier que nous voulons créer un lien et le chemin de droit est le lien en soit.

#### Premier lien à créer 
```bash
ln -sr app/opt/tomcat/bin/restart.sh app/home/moi/tomrstart
```

#### Deuxième lien à créer 
```bash
ln -sr app/opt/tomcat/webapps/ app/home/moi/webapps
```

Ensuite, en entrant

```sh
gash check
```

la mission a été validée, ce qui a conclu cette mission.


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

