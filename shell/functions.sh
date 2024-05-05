function csv {
  if [ $# -eq 1  ]
  then
    cat $1 | sed "s/,/\'\^\'/g" | column -s\^ -t | less -#.8 -N -S
  else
    if [ $# -eq 0 ]
    then
      less <& 0 | sed "s/,/\'\^\'/g" | column -s\^ -t | less -#.8 -N -S
    else
      echo "Usage: csv <csv-file>"
    fi
  fi
}

function assembly() {
  objdump -S -d -M intel -C $1 | less
}

function r2c(){
  gawk -F, '{
  for(f=1; f<=NF; f++)
    r2c[f","NR] = $f
  } END {
  for(f=1; f<=NF; f++) {
    for(row=1; row<=NR; row++)
      printf("%s,", r2c[f","row])
      print ""
    }
  }' $1
}

function get_load
{
  load=`uptime | sed 's/,//g' | awk '{print $(NF-2)}'`
  echo "($load)"
}

function spwd
{
  output=$( echo $PWD | sed s#$HOME#\~#g | sed -r 's#^/apps/norfs1/([^/]+)(/?.*)#~\1\2#' | sed -r 's#([^/]*)/(.)[^/]*/(.)[^/]*/(.)[^/]*/(.)[^/]*(/.*)#\1/\2/\3/\4/\5\6#' | sed -r 's#([^/]*)/(.)[^/]*/(.)[^/]*/(.)[^/]*/(.)[^/]*/(.)[^/]*/(.)[^/]*/(.)[^/]*(/.*)#\1/\2/\3/\4/\5/\6/\7/\8\9#' )
  echo $output
}

function set_ps1
{
  local        BLUE="\[\033[0;34m\]"
  local        CYAN="\[\033[0;36m\]"
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local       GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local       WHITE="\[\033[1;37m\]"
  local  LIGHT_GRAY="\[\033[0;37m\]"
  local       BLACK="\[\033[0;30m\]"
  local   DARK_CYAN="\[\033[0;94m\]"
  local       CLEAR="\[\033[0m\]"

  PS1="$CLEAR[ $RED\$(spwd) $GREEN\$(cmd_line_git_branch)$CLEAR]\$ "
  PS2='> '
  PS4='+ '
}

function rebaseall() {
  local init_branch=$(gbc)
  git checkout master
  git branch | grep -v master | while read branch
  do
    git checkout $branch
    if ! git rebase master
    then
      break
    fi
  done
  git checkout ${init_branch}
}

function gentags() {
  local repo="${1:-${VSCODE}}"
  ctags -f $repo/tags ${CTAGS_EXCLUDE} ${CTAGS_LANG} -R $repo
}

function trash() {
  if [ $# -eq 0 ]
  then
    echo "Usage: ${FUNCNAME} <file(s)>"
  else
    for file in $(readlink -e $@)
    do
      echo $file moved to the Trash
      mv $file $HOME/.Trash
    done
  fi
}

function z() {
  # navigation
  if [ $# -ne 1 ]
  then
    echo "Usage: ${FUNCNAME} <alias>"
    return
  fi
  cd ${NAV_ALIASES[$1]:-$1}
}

function custom() {
  ${EDITOR:-vim} $DOTFILES/shell/custom.sh
}
