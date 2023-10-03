#!/bin/bash

check() {
    # Vérifier que le fichier dataset.csv a bien été créé
    if [ ! -f "$GASH_HOME/dataset.csv" ]
    then
        echo -e "Vous n'avez pas créé le fichier dataset.csv !"
        return 1
    fi
    
    # Comparer avec la solution
    mission_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"
    if ! diff "$GASH_HOME/dataset.csv" "$mission_dir/solution.csv" > /dev/null 2>&1
    then
        echo "Le contenu du fichier dataset.csv n'est pas bon !"
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
