export MYZSH="${HOME}"/.config/zsh

export MYLOCK=~/.cache/zsh/lock
mkdir -p "${MYLOCK}"

export MYNOTICE="NOTICE"

# Ref:
# - https://blog.csdn.net/whatday/article/details/105466009
# - https://unix.stackexchange.com/a/282433
function addTo () {
    [[ -z "${(P)1}" ]] && eval "$1='$2'"
    case ":${(P)1}:" in
      *":$2:"*) :;;
      *) eval "$1='$2:${(P)1}'";;
    esac
}
export MYBIN=~/.Local/bin
mkdir -p "${MYBIN}"
addTo PATH "${MYBIN}"


# ==============================================================

source "${MYZSH}"/zshdebug.zsh

# For debug mode
# function `ondebug` `nodebug` to control this
if [[ -e "${MYLOCK}"/debug.flag ]]; then
  zmodload zsh/datetime
  setopt PROMPT_SUBST
  PS4='+$EPOCHREALTIME %N:%i> '

  logfile=$(mktemp zsh_profile.XXXXXXXX)
  echo ""${NOTICE}": Logging to $logfile"
  echo ""${NOTICE}": You can run `nodebug` to turn off debug mode."
  exec 3>&2 2>$logfile

  setopt XTRACE
  # Another zsh debug helper
  # zmodload zsh/zprof
fi
# ==============================================================


# ===
# === preset
# ===
# set the affix .zsh files can be sourced
# unsetopt nomatch

# ===
# === machine specific
# ===
[[ -e ~/.zshrc.localhost.pre ]] && source ~/.zshrc.localhost.pre

# ===
# === source all
# ===
for item in "${MYZSH}"/main/**/*.zsh; do
  source $item
done

# ===
# === machine specific
# ===
[[ -e ~/.zshrc.localhost.post ]] && source ~/.zshrc.localhost.post


# ==============================================================
if [[ -e "${MYLOCK}"/debug.flag ]]; then
  # Another zsh debug helper
  # zprof
  unsetopt XTRACE
  exec 2>&3 3>&-
fi
