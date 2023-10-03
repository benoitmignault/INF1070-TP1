Objectif
========

Le répertoire `archive` contient plusieurs sous-répertoires et fichiers.
Une mauvaise manipulation de la commande `ln` a créé plusieurs duplicats de 
certains fichiers un peu partout dans l'arborescence du répertoire `archive`. 
En effet, si on se base sur les inodes, plusieurs de ces fichiers sont 
identiques !  

Pour évaluer l'étendue des duplications, on aimerait compter le nombre de 
duplicats de certains fichiers.

Dans le répertoire `archive` et tous ses sous-répertoires donnez le nombre,
  - de fichiers identiques à `archive/alpha/booth`
  - de fichiers identiques à `archive/alpha/ritchie`
  - de fichiers identiques à `archive/beta/knuth`

Dans vos réponses au `gash check` comptez le fichier original et ses duplicats
dans le total.

Contraintes
===========
- Vous avez droit à **une seule conduites de commandes** pour chacune des questions.
