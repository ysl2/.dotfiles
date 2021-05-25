function ssht () {/usr/bin/ssh -t $@ "tmux attach || tmux new";}
