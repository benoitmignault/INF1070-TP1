#!/bin/bash

check() {
    # Lire la date
    echo "Quelle est la date de la prochaine éclipse ?"

    echo -n "Réponse : "
    read r
    # Hashé et vérifier la date
    d=$(echo $r | sed 's/^[[:space:]]*//;s/[[:space:]]*$//' | sha1sum)

    if [ "$d" != "5cdbc151050c0037cf889afd1bae9b806a0322b5  -" ]
    then
        echo "Ce n'est pas la bonne date ou le bon format !"
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
