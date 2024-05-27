#!/usr/bin/env bash

# Enable it for debug
#set -xe

base_dir=$PWD
target_dir=${base_dir}/target

function deploy {
  pkg=$1
  if [ -d "${target_dir}" ] && [ -e "${target_dir}/react-gtm-partytown.zip" ]; then
    echo "[kelisto-wp] Uploading package react-gtm-partytown.zip to repository."
    cd ${target_dir}
    curl -F package=@react-gtm-partytown.zip https://TeaSaNqqPSXrgpuHptXk@push.fury.io/kelisto/
    echo "Done."
    cd ${base_dir}
  else
    echo "[kelisto-wp] Package react-gtm-partytown.zip was not found."
  fi
}

deploy