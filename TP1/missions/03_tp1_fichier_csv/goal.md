Objectif
========

Les trois fichiers `prenoms`, `genres` et `comptes` contiennent, respectivement,
les prénoms, les genres (M ou F) et le nombre de nouveaux nés portant le prénom
au cours de différentes périodes aux États-Unis, le Royaume Uni, le Canada et 
l'Australie. 
Ci-bas les 5 premières lignes de chaque fichier.

    `prenoms`     | `genres`      | `comptes`
    James         | M             | 5304407
    John          | M             | 5260831
    Robert        | M             | 4970386
    Michael       | M             | 4579950
    William       | M             | 4226608
    ...           | ...           | ...

Pour un certain numéro de ligne, le fichier `prenoms` contient un prénom, au 
même numéro de ligne dans le fichier `genres` on a le genre correspondant et au
même numéro de ligne dans le fichier `comptes` on a le nombre de nouveaux nés
potant ce prénoms.

On aimerait créer un nouveau fichier nommée `dataset.csv` dont chaque ligne
contiendra un prénom, suivi d'un point-virgule (`;`) suivi du genre 
correspondant, suivi d'un autre point-virgule (`;`) et se termine par le
compte correspondant.
Les premières lignes du fichier `dataset.csv` devront être,

    James;M;5304407
    John;M;5260831
    Robert;M;4970386
    Michael;M;4579950
    William;M;4226608
    ...

Créez ce fichier.


Contraintes
===========
- Vous avez droit à **une seule commande**.

Indices
=======
- Trouvez la commande `coller` en anglais.
