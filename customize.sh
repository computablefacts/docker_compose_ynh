#!/bin/bash

function show_help {
  pwd
  printf "Used to customize the YunoHost app installation.\n \
          \t-h|--help: this help menu\n\
          \t-a|--app-id: change app id in manifest.toml\n"
}

function log {
  echo "==================== $1 ===================="
}

function change_app_id {
  local app_id=$1
  log "Change app ID to [${app_id}]"

  pwd
  
  sed -ri 's/^(id = "docker_compose"$)/id = \"'"${app_id}"'\"/' ./manifest.toml
}

# Validate number of arguments
if [ $# -eq 0 ]
  then
    show_help
    exit 0
fi

# Parse arguments
while [[ $# -gt 0 ]]
do
  key="$1"
  case $key in
      -h|--help)
      show_help
      ;;
      -a|--app-id)
      shift
      change_app_id $1
      ;;
      *)
      show_help
      ;;
  esac
  shift
done

