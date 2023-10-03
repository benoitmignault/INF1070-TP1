#!/bin/bash

check() {
    # Le plus vieux fichier
    echo "Quel est le nombre de fichiers identiques à archive/alpha/booth ?"

    echo -n "Réponse : "
    read r
    # Hashé et vérifier la taille
    fich=$(echo $r | sed 's/^[[:space:]]*//;s/[[:space:]]*$//' | sha1sum)

    if [ "$fich" != "cc66ebd3a60adf963f75d3a0e30c50c4e4200dc9  -" ]
    then
        echo "Ce n'est pas le bon nombre !"
        return 1
    fi
    

    # Le plus vieux fichier turing
    echo "Quel est le nombre de fichiers identiques à archive/alpha/ritchie ?"

    echo -n "Réponse : "
    read r

    # Hashé et vérifier la taille
    fich=$(echo $r | sed 's/^[[:space:]]*//;s/[[:space:]]*$//' | sha1sum)

    if [ "$fich" != "e5fa44f2b31c1fb553b6021e7360d07d5d91ff5e  -" ]
    then
        echo "Ce n'est pas le bon nombre !"
        return 1
    fi


    # Le plus récent fichier knuth
    echo "Quel est le nombre de fichiers identiques à archive/beta/knuth ?"

    echo -n "Réponse : "
    read r

    # Hashé et vérifier la taille
    fich=$(echo $r | sed 's/^[[:space:]]*//;s/[[:space:]]*$//' | sha1sum)

    if [ "$fich" != "8cf7705693a877ec438b3ddbbe7d4e71a10c985a  -" ]
    then
        echo "Ce n'est pas le bon nombre !"
        return 1
    fi

    return 0
}

if  check
then 
    true
else
    cd
    echo "Vous voila revenu au point de départ... Veuillez recommencer la mission."
    false
fi
