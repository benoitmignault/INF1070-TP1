#!/bin/bash

# fichier lu par le shell à chaque démarrage de la mission
cd "$GASH_HOME" && find . -not -name 'solutions-tp1.md' -delete
