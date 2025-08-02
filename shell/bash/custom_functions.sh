#!/usr/bin/env bash

declare -A BIN_TO_REPO=(
  ["query"]="$EUREX"
  ["chameleon"]="$EUREX"
  ["atom_gen_data"]="$EUREX"
  ["all_market_data"]="$EUREX"
  ["quoter"]="$EWAP"
  ["racer"]="$VEGARACER"
)

declare -A BIN_ALIASES=(
  ["q"]="quoter"
  ["r"]="racer"
  ["c"]="chameleon"
  ["gd"]="atom_gen_data"
  ["gen_data"]="atom_gen_data"
  ["amd"]="all_market_data"
)

function c() {
  local orig_env=$(m info | grep '{active}' | awk '{print $3}')

  # change to base env
  m activate base

  # compile
  if [ $# -gt 3 ] || [ $# -eq 0 ]
  then
      echo "Usage: ${FUNCNAME} <bin-alias> <variant> <arch>"
      m activate $orig_env
      return
  fi
  local bin_name=${BIN_ALIASES[$1]:-$1}
  local bin_repo=${BIN_TO_REPO[$bin_name]}
  local variant=${2}
  local arch=${3:-"skl"}
  local cmd="normake release $bin_name -s$bin_repo"
  if [ -n "$variant" ]
  then
    if [[ $variant == "clang" ]]
    then
      export env_compiler=clang80
      cmd="$cmd -b $DEV/_build.clang"
    elif [[ $variant == "profiler" ]]
    then
      cmd="$cmd -p$variant -- -DTARGET_PMU_ARCH=$arch"
    else
      cmd="$cmd -p$variant"
    fi
  fi
  echo "Running: $cmd"
  export TMPDIR="/spare/tmp/"
  $cmd
  unset TMPDIR
  unset env_compiler
  rm -rf /spare/tmp/preamble* 2>/dev/null

  m activate $orig_env
}

function d() {
  # build debug
  if [ $# -ne 1 ]
  then
      echo "Usage: ${FUNCNAME} <bin-alias>"
      return
  fi
  c $1 debug
}

function s() {
  # ssh
  if [ $# -ne 1 ]
  then
      echo "Usage: ${FUNCNAME} <dest>"
      return
  fi
  ssh -t $1 'export SSH_USER="udit";/bin/bash'
}

function sn() {
  # ssh as norviewer
  if [ $# -ne 1 ]
  then
      echo "Usage: ${FUNCNAME} <dest>"
      return
  fi
  ssh -t norviewer@$1 'export SSH_USER="udit";/bin/bash'
}

function iq() {
  # install query
  if [ $# -ne 1 ]
  then
    echo "Usage: ${FUNCNAME} <dest>"
    return
  fi
  local query=$(basename $(readlink -e .))
  local machine=$1
  local cmd="InstallQuery.py $query --machine $machine --dir . --skip_mon_person_check"
  echo "$cmd"
  $cmd
}

function run_sim() {
  if [ $# -lt 3 ]
  then
    echo "Usage: ${FUNCNAME} <bin> <config> <date> <product default:ES>"
    return
  fi
  local query=$1
  local config=$2
  local date=$3
  local product=${4:-ES}
  local setup_cmd="update_options_config.py $config $date --local --option-expiries 2 --accounts DUMMY --exclude-agg-accounts --product $product --use-future-order-trackers"
  local run_cmd="RunQuery.py $query $config --date $date --log logs/log"
  echo "Running: ${setup_cmd}"
  $setup_cmd
  echo "Running: ${run_cmd}"
  $run_cmd
}
