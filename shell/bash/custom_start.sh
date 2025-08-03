export DEPLOYRC_PATH=/apps/northmoorefs1/norviewer/.deployrc

# repos
export DEV="$HOME/dev"
export VEGARACER="${DEV}/vegaracer"
export RACER="${VEGARACER}"
export EWAP="${DEV}/ewap"
export NOR="${DEV}/nor-code"
export CLIENT="${DEV}/gti_client"
export TXE="${DEV}/txe"
export ATOM="${DEV}/atom"
export ATOM_US="${DEV}/atom_us"
export NPR="${DEV}/npr"
export NSC="${DEV}/nor-scripts"
export EUREX="${DEV}/hyp2-eurex"

# build dirs
export BDIR="${DEV}/_build"
export DBDIR="${DEV}/_build.debug"
export RDIR="${HOME}/bin/release"
export DDIR="${HOME}/bin/debug"
export SECM="/apps/securityMaster/data_config"

# misc locations
export BIN=${HOME}/bin
export SCRATCH="${HOME}/scratch"
export SCRIPTS="${HOME}/scripts"
export PROJECTS="${HOME}/projects"
export LOCAL="/n/local2/udit"
export INFRA_BIN=/apps/infra/bin
export ACTIVATE="./env/bin/activate"
export CLANGD_INDEX_STORAGE_PATH="/spare/local/udit/clangd"

# tower essentials
export NPR_ROOT="${NPR}"
export NSC_ROOT="${NSC}"
export CONDA_ACTIVATE=1
export TRC_INFRA_PROMMPT=no
export GIT_IGNORE_FORMATTING=1
export BASE_GIT_DIR="${DEV}"
export GitReport=1
export GIT_AUTO_FORMAT=false
export TMPDIR=/spare/tmp/
export RELEASE_DIR=$HOME
export BIN_DIR=${HOME}/.local/bin

# aliases
alias li="/opt/trc/trading-platform/bin/listen.atom"
alias listen.atom="/opt/trc/trading-platform/bin/listen.atom"
alias ng="ngit"
alias sc="export ENV_TO_USE=base; source ~/.bashrc"
alias sm="export ENV_TO_USE=main; source ~/.bashrc"
alias sup="sup -f ~/scripts/Supfile.yml"
