#!/bin/bash

check() {
	mission_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"
	if diff "$GASH_HOME/zero-width_space" "$mission_dir/spaced_solution" > /dev/null 2>&1 
	then
		return 0
	else
		echo "Le fichier n'a pas été correctement traité"
		return 1
	fi
}

if  check
then 
    true
else
    cd
    echo "Vous voila revenu au point de départ... Veuillez recommencer la mission."
    false
fi
