#!/bin/bash

check() {
    # Variables couleurs
    # Vérifier la création du fichier
    if [ ! -f "$GASH_HOME/size_me" ]
    then
        echo -e "Vous n'avez pas créé le fichier size_me"
        return 1
    fi
    # Vérifier la taille fichier
    taille="$(find . -name size_me -printf "%s")"
    if [ "$taille" != "8323072" ]
    then
        echo -e "La taille du fichier size_me n'est pas bonne!"
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
