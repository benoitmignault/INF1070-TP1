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

La mission a été validée, ce qui a conclu cette mission.


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

La mission a été validée, ce qui a conclu cette mission.


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

La mission a été validée, ce qui a conclu cette mission.


## Solution de la mission 5

### État de la mission : résolue

### Démarche

J'ai utilisé la commande `cat` pour faire afficher sur la sortie standard le message secret.
Ensuite, j'ai envoyé la sortie vers l'entrée standard avec un pipe `|` vers la commande `tr`.
Le chiffrement est circulaire, donc après la lettre `zZ` vient la lettre `aA` avec un décalage de 13 position dans les deux sens.
Exemple, la lettre `p` devient la lettre `c`.

```bash
cat secret | tr '[N-ZA-Mn-za-m]' '[A-Za-z]'
```

Ensuite, en entrant

```sh
gash check
```

La question : `Quel est le message secret ?`
La réponse à fournir : `pas de pierre, pas de construction. pas de construction, pas de palais. pas de palais... pas de palais.` 

La mission a été validée, ce qui a conclu cette mission.


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
Résultat trouvé : `1070`

Ensuite, en entrant

```sh
gash check
```

La question : `Quel est le nombre de caractères affichés par le programme ?`
La réponse à fournir : `1070` 

En fournissant la réponses plus haut, la mission a été validée, ce qui a conclu cette mission.


## Solution de la mission 7

### État de la mission : résolue

### Démarche

La commande `dd` en utilisant l'option `if=` a été utilisé pour copier le contenu du fichier `urandom` du répertoire `/dev`.
La sortie standard a été rediriger avec un pipe `|` vers l'entrée standard de la commande `head` qui est utilisée pour faire afficher le début d'un fichier.
L'option `-c` est utilisé pour récupérer les X premiers octets. Ici, nous avons déterminé la valeur `8323072` pour les besoins de la cause.
L'information a été redirigé vers le fichier `size_me` qui a été créé ou écraser s'il y existait déjà.

```bash
dd if=/dev/urandom | head -c 8323072 > size_me
```

Ensuite, en entrant

```sh
gash check
```

La mission a été validée, ce qui a conclu cette mission.


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
Résultat trouvé : `DirtyBit`

Ensuite, en entrant

```sh
gash check
```

La question : `Quel est le mot de passe ?`
La réponse à fournir : `DirtyBit` 

En fournissant la réponses plus haut, la mission a été validée, ce qui a conclu cette mission.


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

Résultat trouvé : `91`

Ensuite, en entrant

```sh
gash check
```

La question : `Quel est nombre de mots qui ne sont pas des palindromes ?`
La réponse à fournir : `91` 

En fournissant la réponses plus haut, la mission a été validée, ce qui a conclu cette mission.


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

La mission a été validée, ce qui a conclu cette mission.


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

La mission a été validée, ce qui a conclu cette mission.


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

La mission a été validée, ce qui a conclu cette mission.


## Solution de la mission 13

### État de la mission : résolue

### Démarche

On va utiliser encore une fois la commande `find` pour trouver tous les fichiers dont le numéro inode était le même pour les trois fichiers suivant :
- archive/alpha/booth
- archive/alpha/ritchie
- archive/beta/knuth

On utilise ensuite l'option `-samefile` qui fait référence au même inode que le fichier recherché. 
Le résultat va retourner une liste que nous allons envoye rà la sortie standard. 
La commande `wc` avec l'option `-l` va simplement compte rle nombre d elignes et ça va être le résultat recherché.

#### Premier résultat du nombre 
```bash
find archive/ -samefile archive/alpha/booth | wc -l
```

#### Deuxième résultat du nombre 
```bash
find archive/ -samefile archive/alpha/ritchie | wc -l
```

#### Troisième résultat du nombre 
```bash
find archive/ -samefile archive/beta/knuth | wc -l
```

Ensuite, en entrant

```sh
gash check
```

La question : `Quel est le nombre de fichiers identiques à archive/alpha/booth ?`
La réponse à fournir : `278` 

La question : `Quel est le nombre de fichiers identiques à archive/alpha/ritchie ?`
La réponse à fournir : `1` 

La question : `Quel est le nombre de fichiers identiques à archive/beta/knuth ?`
La réponse à fournir : `79` 

En fournissant les réponses plus haut, la mission a été validée, ce qui a conclu cette mission.


## Solution de la mission 14

### État de la mission : résolue

### Démarche

L'explication sera divisée en quatre section, une par question.

Le début de la question commune : Dans le répertoire archive et tous ses sous-répertoires donnez le chemin...

#### Première question :  du fichier avec la plus ancienne date de modification

On utilise la commande `find`, à partir du répertoire `archive`, avec l'option `-type f` qui permet l'affichage de seulement des fichiers.
Ensuite, l'option `-printf` avec l'option `%T+` permet d'avoir la date de la dernière modification, 
l'option `%p\n` permet l'affichage du nom de fichier avec son chemin avec un retour à la ligne pour avoir chaque fichier, sur une ligne.

```bash
find archive/ -type f -printf '%T+ %p\n'
```

Pour arriver à la bonne réponse rapidement, vous devez faire un `sort -n -r` en dehors de la commande plus haut 
(car restriction à une commande oblige) ou rajouter la commande via un pipe `|` préalablement.
Mais la vraie réponse pour le fichier avec la date de modification la plus ancienne est plutôt : `archive/theta/gooey/ash/knuth` qui est plus vieux de 4 secondes.

#### Deuxième question :  du fichier turing avec la plus ancienne date de modification

Comme pour la première commande à la question 1, on va reprendre la même commande et les options.
Sauf que nous allons rajouter une option `-iname` qui ignore les majuscules & minuscules avec le nom du fichier.
On va passer le nom du fichier `turing` pour essayer de trouver toutes les occurances, de ce dernier dans les sous-répertoires du répertoire `archive`.

```bash
find archive/ -iname turing -type f -printf '%T+ %p\n'
```

Pour arriver à la bonne réponse rapidement, vous devez faire un `sort -n -r` en dehors de la commande plus haut avec les mêmes restrictions
ou rajouter la commande via un pipe `|` préalablement.

#### Troisième question :  du fichier knuth avec la plus récente date de modification

On va reprendre littéralement la même commande qu'à la deuxième question, 
sauf que la seule chose que nous allons changer, c'est le fichier, soit `knuth`.

```bash
find archive/ -iname knuth -type f -printf '%T+ %p\n'
```

Pour arriver à la bonne réponse rapidement, vous devez faire un `sort -n` en dehors de la commande plus haut avec les mêmes restrictions
ou rajouter la commande via un pipe `|` préalablement, mais il n'est pas nécessaire d'ajouter l'option `-r` qui faisait un inversement du triage. 

#### Quatrième question :  le nombre total de fichiers avec une date de modification plus ancienne que le fichier archive/gamma/tux/knuth

On va utiliser la commande `find` pour trouver les fichiers qui sont plus ancien que le fichier cible soit `archive/gamma/tux/knuth`.
On doit rechercher seulement les fichiers donc on utilise l'option `-type f`. 
On va utiliser l'option `-newer` mais avec la négation `-not` pour avoir les fichiers plus anciens que le fichier cible.
On envoi à la sortie standard, la liste des fichiers dans le pipe `|` pour ensuite utiliser la commande `wc` avec l'option `-l` pour compter le nombre de lignes.

```bash
find archive/ -type f -not -newer archive/gamma/tux/knuth | wc -l
```

Ensuite, en entrant

```sh
gash check
```

La question : `Quel est le fichier avec la plus ancienne date de modification ?`
La réponse à fournir : `archive/beta/beastie/ash/gosling` 

La question : `Quel est le fichier 'turing' avec la plus ancienne date de modification ?`
La réponse à fournir : `archive/beta/duke/csh/turing` 

La question : `Quel est le fichier 'knuth' avec la plus récente date de modification ?`
La réponse à fournir : `archive/beta/beastie/ksh/knuth` 

La question : `Quel est le nombre total de fichiers avec une date de modification plus ancienne que le fichier archive/gamma/tux/knuth ?`
La réponse à fournir : `2968` 

En fournissant les réponses plus haut, la mission a été validée, ce qui a conclu cette mission.


## Solution de la mission 15

### État de la mission : résolue

### Démarche

J'ai utilisé la commande `find` pour trouver les fichiers demandés dans le répertoire `data/`.
J'ai utilisé l'option `-perm` avec le mode suivant `/u+rwx` ce qui demande à la commande de rechercher les fichiers pour lequel, 
l'utilisateur (courant) possède des droits en lecture, écriture et exécution. 
Cependant, il fallait avoir la négation du résultat, car la mission demandait le contraite, 
soit les fichiers où utilisateur ne possède aucun droit. 
Une fois que nous avons trouvé la liste des fichiers, on utilise l'action `-delete` pour supprimer ces fichiers.

```bash
find data/ ! -perm /u+rwx -delete
```

Ensuite, en entrant

```sh
gash check
```

La mission a été validée, ce qui a conclu cette mission.

## Ça conclut aussi le TP1 !
