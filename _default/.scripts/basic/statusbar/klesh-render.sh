#!/bin/sh

# symbola
#export ICON_RCD=š„
#export ICON_MSC=ā¬
#export ICON_MTD=š
#export ICON_VOL=š
#export ICON_NIC=š§
#export ICON_WFI=š”
#export ICON_MEM=š
#export ICON_TMP=š”
#export ICON_PLG=š
#export ICON_BAT=š
#export ICON_DAT=ā²

# nerdfont
export ICON_RCD='ļ©¦'
export ICON_MSC='ļ¢'
export ICON_MTD='ļ± '
export ICON_VOL='ļ '
export ICON_NIC='ļæ '
export ICON_WFI='ļ« '
export ICON_MEM='ļ '
export ICON_TMP='ļ'
export ICON_PLG='ļ¦ '
export ICON_BA0='ļ '
export ICON_BA1='ļ '
export ICON_BA2='ļ '
export ICON_BA3='ļ '
export ICON_BA4='ļ '
export ICON_DAT='ļ '

MPD=$(command -v mpc && echo yes)
CORETEMP=$(dirname "$(grep -Fl coretemp /sys/class/hwmon/hwmon*/name)")

statusbar() {

  printf " "

  # recording
  [ -f /tmp/recording.pid ] && printf "%s  " $ICON_RCD

  # mpd
  [ -n "$MPD" ] && mpc | awk '
        NR == 1 {
            SONG = $0
        }
        NR == 2 {
            PLAYING = $1
        }
        END {
            if (PLAYING == "[playing]")
                printf "%s %s  ", ENVIRON["ICON_MSC"], SONG
        }
    '

  # volume
  amixer get Master | awk 'END {
        ICO = $NF == "[off]" ? ENVIRON["ICON_MTD"] : ENVIRON["ICON_VOL"]
        match($0, / \[([0-9]+%)\] /, m)
        VOL = m[1]
        printf "%s %s  ", ICO, VOL
    }'

  # network
  for NIC in /sys/class/net/e*; do
    grep -q 'up' "$NIC/operstate" && awk '{
            printf "%s %s  ",ENVIRON["ICON_NIC"],($0 >= 1000 ? $0 / 1000 "G" : $0 "M")
        }' "$NIC/speed"
  done

  # wifi
  awk 'NR > 2 {
        printf "%s %i%%  ", ENVIRON["ICON_WFI"], $3*100/70
    }' /proc/net/wireless

  # cpu temperature
  awk '
    {
        total += $0
    }
    END {
        printf "%s %iĀ°C  ", ENVIRON["ICON_TMP"], total / NR / 1000
    }' "$CORETEMP/"temp*_input

  # memory usage
  free | awk 'NR == 2 {
        printf "%s %i%%  ", ENVIRON["ICON_MEM"], $3/$2*100
    }'

  # battery
  if [ -f /sys/class/power_supply/BAT0/capacity ]; then
    grep -q '1' /sys/class/power_supply/AC/online && export PLUGGED=yes
    awk '{
            if (ENVIRON["PLUGGED"] == "yes")
                ICON=ENVIRON["ICON_PLG"]
            else if ($0 > 90)
                ICON=ENVIRON["ICON_BA4"]
            else if ($0 > 75)
                ICON=ENVIRON["ICON_BA3"]
            else if ($0 > 50)
                ICON=ENVIRON["ICON_BA2"]
            else if ($0 > 25)
                ICON=ENVIRON["ICON_BA1"]
            else
                ICON=ENVIRON["ICON_BA0"]
            printf "%s %s%%  ", ICON, $0
        }' /sys/class/power_supply/BAT0/capacity
  fi

  # datetime
  [ ! -f /tmp/recording.pid ] && printf "%s %s " "$ICON_DAT" "$(date +'%m-%d %H:%M %a')"
}

single() {
  ! pgrep slock 1>/dev/null && xsetroot -name "$(statusbar)"
}

start() {
  while :; do
    single
    sleep 1
  done
}

restart() {
  FP=$(readlink -f "$0")
  pkill -f "$FP loop"
  $FP loop &
}

case "$1" in
once)
  single
  ;;
loop)
  start
  ;;
dryrun)
  statusbar
  ;;
*)
  restart
  ;;
esac
