#!/bin/bash

# fichier lu par le shell à chaque démarrage de la mission
cd "$GASH_HOME" && find . -not -name 'solutions-tp1.md' -delete

mission_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"
cp -pr "$mission_dir/archive" "$GASH_HOME"
