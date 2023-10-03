#!/bin/bash

check() {
    # Le plus vieux fichier
    echo "Quel est le fichier avec la plus ancienne date de modification ?"

    echo -n "Réponse : "
    read r
    # Hashé et vérifier la taille
    fich=$(echo $r | sed 's/^[[:space:]]*//;s/[[:space:]]*$//' | sha1sum)

    if [ "$fich" != "a24dac36edbe6de6f01022d546a45701afc9852d  -" ]
    then
        echo "Ce n'est pas le bon fichier !"
        return 1
    fi
    

    # Le plus vieux fichier turing
    echo "Quel est le fichier 'turing' avec la plus ancienne date de modification ?"

    echo -n "Réponse : "
    read r

    # Hashé et vérifier la taille
    fich=$(echo $r | sed 's/^[[:space:]]*//;s/[[:space:]]*$//' | sha1sum)

    if [ "$fich" != "61ad983f2e67de15200dcc1d2b27a3993e06e194  -" ]
    then
        echo "Ce n'est pas le bon fichier !"
        return 1
    fi


    # Le plus récent fichier knuth
    echo "Quel est le fichier 'knuth' avec la plus récente date de modification ?"

    echo -n "Réponse : "
    read r

    # Hashé et vérifier la taille
    fich=$(echo $r | sed 's/^[[:space:]]*//;s/[[:space:]]*$//' | sha1sum)

    if [ "$fich" != "6f958710ce725e348d1054b05e6402ce0953f62b  -" ]
    then
        echo "Ce n'est pas le bon fichier !"
        return 1
    fi


    # Le nombre total de fichiers plus anciens que le fichier `archive/gamma/tux/knuth`
    echo "Quel est le nombre total de fichiers avec une date de modification plus ancienne que le fichier archive/gamma/tux/knuth ?"

    echo -n "Réponse : "
    read r

    # Hashé et vérifier la taille
    fich=$(echo $r | sed 's/^[[:space:]]*//;s/[[:space:]]*$//' | sha1sum)

    if [ "$fich" != "2dec4a19eb51beb640585bf04921b4a8a53ebc63  -" ]
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
