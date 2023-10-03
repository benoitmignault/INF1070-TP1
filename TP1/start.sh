#!/bin/bash

export GASH_BASE=$(readlink -f "$(dirname "$0")"/)
cd "$GASH_BASE"

source lib/utils.sh


display_help() {
cat <<EOH
options :
  -h      ce message
  -n      mode noir et blanc : n'utilise pas les séquences ANSI pour la couleur
  -m <n>  démarrer à partir de la mission <n>
EOH
}


export GASH_COLOR="OK"
export GASH_MISSION=""
MODE='LOCAL'
while getopts ":hncm:" opt
do
  case $opt in
    h)
      display_help
      exit 0
      ;;
    n)
      GASH_COLOR=""
      ;;
    c)
      GASH_COLOR="OK"
      ;;
    m)
      MODE="TP"
      GASH_MISSION=$OPTARG
      ;;
    *)
      echo "option invalide : -$OPTARG" >&2
      exit 1
      ;;
  esac
done

init_gash() {
  # dossiers d'installation

  # ces répertoires ne doivent pas être modifiés (statiques)
  export GASH_LIB="$GASH_BASE/lib"
  export GASH_MISSIONS="$GASH_BASE/missions"
  export GASH_BIN="$GASH_BASE/bin"
  export GASH_HOME="$GASH_BASE/World"
  export GASH_SOLUTIONS_VIDE="$GASH_BASE/enonce/solutions-tp1.md"

  # le fichier de solution doit être conservé
  export GASH_SOLUTIONS="$GASH_HOME/solutions-tp1.md"

  # ces répertoires doivent être effacés en cas de réinitialisation du jeu
  export GASH_DATA="$GASH_BASE/.session_data"
  export GASH_TMP="$GASH_BASE/.tmp"
  export GASH_CONFIG="$GASH_BASE/.config"
  export GASH_LOCAL_BIN="$GASH_BASE/.bin"

  if [ -e "$GASH_DATA" ]
  then
    cat <<EOH | perl -pe 'chomp if eof'
Ce n'est pas la premiere fois que vous jouez. Voulez-vous
(p)oursuivre votre ancienne partie ou recommencer? [p/r]
EOH
    echo -n ' '
    read x
    [ "$x" = "p"  -o  "$x" = "P" ] && return 1
  fi

  mkdir -p "$GASH_HOME"

  if [ ! -f "$GASH_SOLUTIONS" ]
  then
      cp "$GASH_SOLUTIONS_VIDE" "$GASH_SOLUTIONS"
  fi

  cd $GASH_HOME && chmod 777 -R * && find . -not -name 'solutions-tp1.md' -delete
  rm -rf "$GASH_DATA"
  rm -rf "$GASH_TMP"
  rm -rf "$GASH_CONFIG"
  rm -rf "$GASH_LOCAL_BIN"

  mkdir -p "$GASH_DATA"
  echo "# mission action date checksum" >> "$GASH_DATA/missions.log"

  mkdir -p "$GASH_CONFIG"
  cp "$GASH_LIB/bashrc" "$GASH_CONFIG"

  mkdir -p "$GASH_LOCAL_BIN"

  mkdir -p "$GASH_TMP"

  # Installation des missions.
  for MISSION in $GASH_BASE/missions/[0-9]*; do
    if [ -f "$MISSION/static.sh" ]
    then
      source "$MISSION/static.sh"
    fi
    if [ -d "$MISSION/bin" ]
    then
      cp "$MISSION/bin/"* "$GASH_LOCAL_BIN"
    fi
  done
}

start_gash() {

  # Lancement du jeu.
  cd "$GASH_HOME"

  bash --rcfile "$GASH_LIB/bashrc"

}


#######################################################################
init_gash
start_gash

# vim: shiftwidth=2 tabstop=2 softtabstop=2
