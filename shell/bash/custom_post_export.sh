#!/usr/bin/env bash

[ -f ${DEPLOYRC_PATH} ] && source ${DEPLOYRC_PATH}

#################### MICROMAMBA ####################

# m activate ${ENV_TO_USE:-main}
if [[ ${ENV_TO_USE} != "main" ]]
then
  source conda-activate
fi

#################### PATH ####################

# last element is going to be the first one in the PATH
PREPEND_PATHS=($INFRA_BIN $BIN_DIR $BIN)

# last element is going to be the last one in the PATH
APPEND_PATHS=("${VEGARACER}/scripts" $SCRIPTS)

for i_path in ${PREPEND_PATHS[@]}
do
  PATH="${i_path}${PATH:+:${PATH}}"
done

for i_path in ${APPEND_PATHS[@]}
do
  PATH="${PATH:+${PATH}:}${i_path}"
done


#################### PYTHONPATH ####################

# last element is going to be the first one in the PYTHONPATH
PREPEND_PYTHONPATHS=()

# last element is going to be the last one in the PYTHONPATH
APPEND_PYTHONPATHS=($SCRIPTS)

for i_path in ${PREPEND_PYTHONPATHS[@]}
do
  PYTHONPATH="${i_path}${PYTHONPATH:+:${PYTHONPATH}}"
done

for i_path in ${APPEND_PYTHONPATHS[@]}
do
  PYTHONPATH="${PYTHONPATH:+${PYTHONPATH}:}${i_path}"
done
