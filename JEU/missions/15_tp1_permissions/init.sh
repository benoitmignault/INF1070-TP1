#!/bin/bash
# fichier lu par le shell à chaque démarrage de la mission
cd "$GASH_HOME" && find . -not -name 'solutions-tp1.md' -delete

mission_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"
mkdir "$GASH_HOME/data"
i=1
for p in $(cat "$mission_dir/perm") 
do
    touch "$GASH_HOME/data/fichier_$i"
    chmod $p "$GASH_HOME/data/fichier_$i"
    (( i=i+1 ))
done
