#!/bin/bash

check() {
    # Lire la taille
    echo "Quel est nombre de mots qui ne sont pas des palindromes ?"

    echo -n "Réponse : "
    read r

    # Hashé et vérifier la taille
    rep=$(echo $r | sed 's/^[[:space:]]*//;s/[[:space:]]*$//' | sha1sum)
    
    if [ "$rep" != "40a0a6e5ff86f75e6723e0008ddae29b1ed384c8  -" ]
    then
        echo -e "Ce n'est pas le bon nombre !"
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

