#!/bin/bash

check() {
    # Lire le code
    echo "Quel est le nombre de caractères affichés par le programme ?"

    echo -n "Réponse : "
    read r

    # Hashé et vérifier la réponse
    code=$(echo $r | sed 's/^[[:space:]]*//;s/[[:space:]]*$//' | sha1sum)
    
    if [ "$code" != "85b5577ba7d7f77d0866d06709e5b830f7668c3a  -" ]
    then
        echo "Ce n'est pas le bon compte !"
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
