Objectif
========

Le programme `trop_long` affiche une longue chaîne de caractères quand on 
l'exécute ainsi,
    ./trop_long
On voulait savoir le nombre de caractères qui sont affichés (incluant les
espaces) on a donc utilisé la commande `wc` avec l'otpion `-c` pour compter
les octets (avec la correspondance 1 octet = 1 caractère), on a exécuté la 
conduite suivante,
    ./trop_long | wc -c
et on a eu le résultat
    27
Ce qui loin du compte !
(vous pouvez l'essayer vous-même)

Expliquez ce qui s'est passé. 
Corrigez la conduite de commandes plus haut pour avoir le bon compte.

Contraintes
===========
- Vous devez garder la conduite de commandes `./trop_long | wc -c`, à 
laquelle vous ajouterez ce qu'il faut pour que ça marche.
