#!/bin/bash

# fichier lu par le shell à chaque démarrage de la mission
cd "$GASH_HOME" && find . -not -name 'solutions-tp1.md' -delete

mission_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"
cp -r "$mission_dir/archive" "$GASH_HOME"
find $GASH_HOME/archive/ -type d -exec ln $GASH_HOME/archive/alpha/booth {}/turing \;
find $GASH_HOME/archive/epsilon/ -type d -exec ln $GASH_HOME/archive/beta/knuth {}/wozniak \;
