#!/bin/bash

check() {
   # Vérification des liens symboliques
   tomrstart="app/home/moi/tomrstart"
   webapps="app/home/moi/webapps"

   if [ ! -L "$GASH_HOME/$tomrstart" ]; then
      echo "Le lien symbolique '$tomrstart' n'existe pas !"
      return 1
   fi

   target=$(readlink "$GASH_HOME/$tomrstart")
   if [ "$target" != "../../opt/tomcat/bin/restart.sh" ]; then
      echo "Le lien symbolique 'tomrstart' n'est pas correct !"
      return 1
   fi
   
   if [ ! -L "$GASH_HOME/$webapps" ]; then
      echo"Le lien symbolique '$webapps' n'existe pas !"
      return 1
   fi

   target=$(readlink "$GASH_HOME/$webapps")
   if [ "$target" != "../../opt/tomcat/webapps" ]; then
      echo "Le lien symbolique 'webapps' n'est pas correct !"
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
