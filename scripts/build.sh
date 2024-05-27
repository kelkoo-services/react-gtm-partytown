#!/usr/bin/env bash

# Enable it for debug
#set -xe

base_dir=$PWD
target_dir=${base_dir}/target

function build {
  if [ ! -d "${target_dir}" ]; then
      mkdir ${target_dir}
  fi
  
  if [ -e "${base_dir}/package.json" ]; then
    echo "Compiling package."
    npm run build

    echo "Compressing package."
    cp -a ${base_dir}/dist/. ${base_dir}/dist/react-gtm-partytown
    cd ${base_dir}/dist/
    zip -r ${target_dir}/react-gtm-partytown.zip react-gtm-partytown
    cd ${base_dir}

  else
    echo "Package.json not found."
  fi
}

build
