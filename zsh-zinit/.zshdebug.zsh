function ondebug () {
  rm -f ~/zsh_profile.* &>/dev/null
  touch "${MYZSH}"/.lock/debug.flag
}

function nodebug () {
  if [[ -e "${MYZSH}"/.lock/debug.flag ]]; then
    rm "${MYZSH}"/.lock/debug.flag
  fi
  rm -f ~/zsh_profile.* &>/dev/null
}

function showdebug () {
  if [[ -z "$1" ]]; then
    local flag=0
    if [[ -e "${MYZSH}"/.lock/debug.flag ]]; then
      rm "${MYZSH}"/.lock/debug.flag
      flag=1
    fi
    if [[ $(hyperfine &>/dev/null; echo $?) != 127 ]]; then
      hyperfine "zsh -i -c 'exit'"
    else
      time zsh -i -c 'exit'
    fi
    if [[ $flag == 1 ]]; then
      touch "${MYZSH}"/.lock/debug.flag
    fi
  else
    if [[ -f "$1" ]]; then
      # This will list all of the commands that were executed in the course of running your zshrc, longest-running first.
      _sort_timings $1 | head
    else
      echo ""${NOTICE}": Error, $1 is not a file, or not exists."
    fi
  fi
}

# ==============================================================

function _sort_timings () {
  typeset -a lines
  typeset -i prev_time=0
  typeset prev_command

  while read line; do
    if [[ $line =~ '^.*\+([0-9]{10})\.([0-9]{6})[0-9]* (.+)' ]]; then
      integer this_time=$match[1]$match[2]

      if [[ $prev_time -gt 0 ]]; then
        time_difference=$(( $this_time - $prev_time ))
        lines+="$time_difference $prev_command"
      fi

      prev_time=$this_time

      local this_command=$match[3]
      if [[ ${#this_command} -le 80 ]]; then
        prev_command=$this_command
      else
        prev_command="${this_command:0:77}..."
      fi
    fi
  done < ${1:-/dev/stdin}

  print -l ${(@On)lines}
}

# For debug mode
# function `ondebug` `nodebug` to control this
function _start_debug () {
  if [[ -e "${MYZSH}"/.lock/debug.flag ]]; then
    # Another zsh debug helper
    zmodload zsh/zprof
  fi
}


function _stop_debug () {
  if [[ -e "${MYZSH}"/.lock/debug.flag ]]; then
    # Another zsh debug helper
    zprof
  fi
}



# For debug mode
# function `ondebug` `nodebug` to control this
# function _start_debug () {
#   if [[ -e "${MYZSH}"/.lock/debug.flag ]]; then
#     zmodload zsh/datetime
#     setopt PROMPT_SUBST
#     PS4='+$EPOCHREALTIME %N:%i> '
#
#     logfile=$(mktemp zsh_profile.XXXXXXXX)
#     echo "Logging to $logfile"
#     exec 3>&2 2>$logfile
#
#     setopt XTRACE
#     # Another zsh debug helper
#     # zmodload zsh/zprof
#   fi
# }
#
#
# function _stop_debug () {
#   if [[ -e "${MYZSH}"/.lock/debug.flag ]]; then
#     # Another zsh debug helper
#     # zprof
#     unsetopt XTRACE
#     exec 2>&3 3>&-
#   fi
# }

