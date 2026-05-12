set fish_greeting ""
set -gx TERM xterm-256color

fish_add_path /opt/homebrew/bin
fish_add_path $HOME/bin
fish_add_path $HOME/.local/bin
fish_add_path /usr/local/texlive/2023/bin/universal-darwin
fish_add_path /opt/homebrew/opt/llvm/bin
fish_add_path $HOME/.docker/bin

# Environment Variables
set -gx NVIMENV $HOME/.local/share/nvim/nvim-python-env
set -gx NVIM $HOME/.config/nvim
set -gx VIMRC $NVIM/init.vim
set -gx NVIMSESSION $NVIM/sessions
set -gx NVIMSESSIONFILE $NVIM/sessions/sessionfile.vim
set -gx FISH $HOME/.config/fish
set -gx FISHRC $FISH/config.fish
set -gx TMUXRC $HOME/.tmux.conf
set -gx GUROBI_HOME /Library/gurobi1001/macos_universal2
set -gx LATEX $HOME/.latex
set -gx BIB $LATEX/main.bib
set -gx PYTHON3_NVIM $NVIMENV/bin/python
set -gx SMOD04 luw28@smod04.ie.pitt.edu
set -gx IESUMS1 luw28@iesums1.ie.pitt.edu
set -gx IESUMS9 luw28@iesums9.ie.pitt.edu
set -gx IESUMS10 luw28@iesums10.ie.pitt.edu
set -gx IESUMS11 luw28@iesums11.ie.pitt.edu

set -gx VLLC_MAC_STUDIO_TS_IP 100.118.57.101
set -gx LUCA_MBP_TS_IP 100.93.202.3

set -gx VLLC_MAC_STUDIO luca@$VLLC_MAC_STUDIO_TS_IP

set -gx GIGI_B_IP 50.116.44.198
set -gx GIGI_B luca@$GIGI_B_IP
set -gx VISUAL "nvim"
set -gx EDITOR "nvim"

# Aliases
alias zz 'fzf'
alias tt 'tmux-sessionizer'
alias c 'clear'
alias e 'exit'
alias config '/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias ta 'tmux attach -t'
alias tad 'tmux attach -d -t'
alias tds _tmux_directory_session
alias tkss 'tmux kill-session -t'
alias tksv 'tmux kill-server'
alias tl 'tmux list-sessions'
alias ts 'tmux new-session -s'
alias l 'ls -lah'
alias la 'ls -lAh'
alias ll 'ls -lh'
alias ls 'ls --color=tty'
alias lsa 'ls -lah'
alias md 'mkdir -p'
alias ggpull 'git pull origin (git symbolic-ref --short HEAD)'
alias ggpush 'git push origin (git symbolic-ref --short HEAD)'
alias gss 'git status --short'
alias gst 'git status'
alias vim nvim
alias vims "nvim -S $NVIMSESSIONFILE"
alias vrc "vim $VIMRC"
alias frc "vim $FISHRC"
alias trc "vim $TMUXRC"
alias iesums1 "ssh $IESUMS1"
alias iesums9 "ssh $IESUMS9"
alias iesums10 "ssh $IESUMS10"
alias iesums11 "ssh $IESUMS11"

alias vllcmstu "ssh $VLLC_MAC_STUDIO"
alias smod04 "ssh $SMOD04"
alias gigib "ssh $GIGI_B"
alias sums1cp "scp $IESUMS1:/home/luw28/"
alias sums10cp "scp $IESUMS10:/home/luw28/"
alias sums11cp "scp $IESUMS11:/home/luw28/"
alias nt "python nt.py -n"

# python
alias python "python3"
alias pip "pip3"

clear
