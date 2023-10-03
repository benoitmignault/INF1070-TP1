#!/bin/bash

check() {
    # Vérifier que le fichier milieu a bien été créé
    if [ ! -f "$GASH_HOME/milieu" ]
    then
        echo -e "Vous n'avez pas créé le fichier milieu !"
        return 1
    fi
    
    # Comparer avec la solution
    mission_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"
    if ! diff "$GASH_HOME/milieu" "$mission_dir/solution" > /dev/null 2>&1
    then
        echo "Le contenu du fichier milieu n'est pas bon !"
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
