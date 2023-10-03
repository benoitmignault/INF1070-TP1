#!/bin/bash

check() {
    # Lire le code
    echo "Quel est le message secret ?"

    echo -n "Réponse : "
    read r

    # Hashé et vérifier la réponse
    code=$(echo $r | sed 's/^[[:space:]]*//;s/[[:space:]]*$//' | sha1sum)
    
    if [ "$code" != "9a91447dbe83daccf549903382a7680cd3c0f6f5  -" ]
    then
        echo "Ce n'est pas le bon message !"
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
