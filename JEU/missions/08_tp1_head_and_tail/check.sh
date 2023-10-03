#!/bin/bash

check() {
    # Lire le code
    echo "Quel est le mot de passe ?"

    echo -n "Réponse : "
    read r

    # Hashé et vérifier la réponse
    code=$(echo $r | sed 's/^[[:space:]]*//;s/[[:space:]]*$//' | sha1sum)
    
    if [ "$code" != "8364d75962800b5a24145d5998ea731f64f0b4be  -" ]
    then
        echo "Le mot de passe est inccorect !"
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
