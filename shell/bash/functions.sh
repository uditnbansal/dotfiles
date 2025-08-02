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

function watchlogs() {
  log_file=${1:-"logs/log"}
  watch -n 1 "tail -n $(($(tput lines) - 3)) $log_file | cut -c -$(($(tput cols) - 1))"
}
