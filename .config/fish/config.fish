set fish_greeting ""
set -gx TERM xterm-256color

# Path additions
set -gx PATH /Users/luw28/bin $PATH
set -gx PATH /opt/homebrew/bin $PATH
set -gx PATH /usr/local/texlive/2023/bin/universal-darwin $PATH
set -gx PATH /Users/luw28/.nextmv $PATH
set -gx PATH $PATH /opt/homebrew/opt/llvm/bin 
set -gx PATH $PATH $HOME/.docker/bin

# Environment Variables
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
set -gx PYTHON3 $HOME/anaconda3/bin/python3
set -gx NODEJS /opt/homebrew/bin/node
set -gx SMOD04 luw28@smod04.ie.pitt.edu
set -gx IESUMS1 luw28@iesums1.ie.pitt.edu
set -gx IESUMS9 luw28@iesums9.ie.pitt.edu
set -gx IESUMS10 luw28@iesums10.ie.pitt.edu
set -gx IESUMS11 luw28@iesums11.ie.pitt.edu
set -gx GIGI_B_IP 50.116.44.198
set -gx GIGI_B luca@$GIGI_B_IP

# Nextmv environment variable
if type nextmv > /dev/null
    set tok (nextmv token 2>/dev/null)
    if test $status -eq 0
        set -x NEXTMV_TOKEN $tok
    end
end

# Gurobi
set -gx PATH $GUROBI_HOME/bin $PATH

# Aliases
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
alias gwt 'git worktree'
alias gwta 'git worktree add'
alias gwtls 'git worktree list'
alias gwtmv 'git worktree move'
alias gwtrm 'git worktree remove'
alias g git
alias ga 'git add'
alias gaa 'git add --all'
alias gam 'git am'
alias gama 'git am --abort'
alias gamc 'git am --continue'
alias gams 'git am --skip'
alias gamscp 'git am --show-current-patch'
alias gap 'git apply'
alias gapa 'git add --patch'
alias gapt 'git apply --3way'
alias gau 'git add --update'
alias gav 'git add --verbose'
alias gb 'git branch'
alias gbD 'git branch --delete --force'
alias gba 'git branch --all'
alias gbd 'git branch --delete'
alias gbg 'LANG=C git branch -vv | grep ": gone\]"'
alias gbgD 'LANG=C git branch --no-color -vv | grep ": gone\]" | awk '\''{print $1}'\'' | xargs git branch -D'
alias gbgd 'LANG=C git branch --no-color -vv | grep ": gone\]" | awk '\''{print $1}'\'' | xargs git branch -d'
alias gbl 'git blame -w'
alias gbm 'git branch --move'
alias gbnm 'git branch --no-merged'
alias gbr 'git branch --remote'
alias gbs 'git bisect'
alias gbsb 'git bisect bad'
alias gbsg 'git bisect good'
alias gbsn 'git bisect new'
alias gbso 'git bisect old'
alias gbsr 'git bisect reset'
alias gbss 'git bisect start'
alias gc 'git commit --verbose'
alias 'gc!' 'git commit --verbose --amend'
alias gca 'git commit --verbose --all'
alias 'gca!' 'git commit --verbose --all --amend'
alias gcam 'git commit --all --message'
alias 'gcan!' 'git commit --verbose --all --no-edit --amend'
alias 'gcans!' 'git commit --verbose --all --signoff --no-edit --amend'
alias gcas 'git commit --all --signoff'
alias gcasm 'git commit --all --signoff --message'
alias gcb 'git checkout -b'
alias gcd 'git checkout $(git_develop_branch)'
alias gcf 'git config --list'
alias gcl 'git clone --recurse-submodules'
alias gclean 'git clean --interactive -d'
alias gcm 'git checkout $(git_main_branch)'
alias gcmsg 'git commit --message'
alias 'gcn!' 'git commit --verbose --no-edit --amend'
alias gco 'git checkout'
alias gcor 'git checkout --recurse-submodules'
alias gcount 'git shortlog --summary --numbered'
alias gcp 'git cherry-pick'
alias gcpa 'git cherry-pick --abort'
alias gcpc 'git cherry-pick --continue'
alias gcs 'git commit --gpg-sign'
alias gcsm 'git commit --signoff --message'
alias gcss 'git commit --gpg-sign --signoff'
alias gcssm 'git commit --gpg-sign --signoff --message'
alias gd 'git diff'
alias gdca 'git diff --cached'
alias gdct 'git describe --tags $(git rev-list --tags --max-count=1)'
alias gdcw 'git diff --cached --word-diff'
alias gds 'git diff --staged'
alias gdt 'git diff-tree --no-commit-id --name-only -r'
alias gdup 'git diff @{upstream}'
alias gdw 'git diff --word-diff'
alias gf 'git fetch'
alias gfa 'git fetch --all --prune --jobs=10'
alias gfg 'git ls-files | grep'
alias gfo 'git fetch origin'
alias gg 'git gui citool'
alias gga 'git gui citool --amend'
alias ggpull 'git pull origin (git symbolic-ref --short HEAD)'
alias ggpur ggu
alias ggpush 'git push origin (git symbolic-ref --short HEAD)'
alias ggsup 'git branch --set-upstream-to=origin/(git symbolic-ref --short HEAD)'
alias ghh 'git help'
alias gignore 'git update-index --assume-unchanged'
alias gignored 'git ls-files -v | grep "^[[:lower:]]"'
alias git-svn-dcommit-push 'git svn dcommit && git push github $(git_main_branch):svntrunk'
alias gk '\gitk --all --branches &!'
alias gke '\gitk --all $(git log --walk-reflogs --pretty=%h) &!'
alias gl 'git pull'
alias glg 'git log --stat'
alias glgg 'git log --graph'
alias glgga 'git log --graph --decorate --all'
alias glgm 'git log --graph --max-count=10'
alias glgp 'git log --stat --patch'
alias glo 'git log --oneline --decorate'
alias globurl 'noglob urlglobber '
alias glod 'git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset"'
alias glods 'git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset" --date=short'
alias glog 'git log --oneline --decorate --graph'
alias gloga 'git log --oneline --decorate --graph --all'
alias glol 'git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset"'
alias glola 'git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --all'
alias glols 'git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --stat'
alias glp _git_log_prettily
alias gluc 'git pull upstream (git symbolic-ref --short HEAD)'
alias glum 'git pull upstream $(git_main_branch)'
alias gm 'git merge'
alias gma 'git merge --abort'
alias gmom 'git merge origin/$(git_main_branch)'
alias gms 'git merge --squash'
alias gmtl 'git mergetool --no-prompt'
alias gmtlvim 'git mergetool --no-prompt --tool=vimdiff'
alias gmum 'git merge upstream/$(git_main_branch)'
alias gp 'git push'
alias gpd 'git push --dry-run'
alias gpf 'git push --force-with-lease'
alias 'gpf!' 'git push --force'
alias gpoat 'git push origin --all && git push origin --tags'
alias gpod 'git push origin --delete'
alias gpr 'git pull --rebase'
alias gpra 'git pull --rebase --autostash'
alias gprav 'git pull --rebase --autostash -v'
alias gpristine 'git reset --hard && git clean --force -dfx'
alias gprom 'git pull --rebase origin $(git_main_branch)'
alias gpromi 'git pull --rebase=interactive origin $(git_main_branch)'
alias gprv 'git pull --rebase -v'
alias gpsup 'git push --set-upstream origin (git symbolic-ref --short HEAD)'
alias gpsupf 'git push --set-upstream origin (git symbolic-ref --short HEAD) --force-with-lease'
alias gpu 'git push upstream'
alias gpv 'git push --verbose'
alias gr 'git remote'
alias gra 'git remote add'
alias grb 'git rebase'
alias grba 'git rebase --abort'
alias grbc 'git rebase --continue'
alias grbd 'git rebase $(git_develop_branch)'
alias grbi 'git rebase --interactive'
alias grbm 'git rebase $(git_main_branch)'
alias grbo 'git rebase --onto'
alias grbo 'git rebase origin/$(git_main_branch)'
alias grbs 'git rebase --skip'
alias grep 'grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
alias grev 'git revert'
alias grh 'git reset'
alias grhh 'git reset --hard'
alias grhk 'git reset --keep'
alias grhs 'git reset --soft'
alias grm 'git rm'
alias grmc 'git rm --cached'
alias grmv 'git remote rename'
alias groh 'git reset origin/(git symbolic-ref --short HEAD) --hard'
alias grrm 'git remote remove'
alias grs 'git restore'
alias grset 'git remote set-url'
alias grss 'git restore --source'
alias grst 'git restore --staged'
alias grt 'cd "$(git rev-parse --show-toplevel || echo .)"'
alias gru 'git reset --'
alias grup 'git remote update'
alias grv 'git remote --verbose'
alias gsb 'git status --short --branch'
alias gsd 'git svn dcommit'
alias gsh 'git show'
alias gsi 'git submodule init'
alias gsps 'git show --pretty=short --show-signature'
alias gsr 'git svn rebase'
alias gss 'git status --short'
alias gst 'git status'
alias gsta 'git stash push'
alias gstaa 'git stash apply'
alias gstall 'git stash --all'
alias gstc 'git stash clear'
alias gstd 'git stash drop'
alias gstl 'git stash list'
alias gstp 'git stash pop'
alias gsts 'git stash show --patch'
alias gstu 'gsta --include-untracked'
alias gsu 'git submodule update'
alias gsw 'git switch'
alias gswc 'git switch --create'
alias gswd 'git switch $(git_develop_branch)'
alias gswm 'git switch $(git_main_branch)'
alias gta 'git tag --annotate'
alias gtl 'gtl(){ git tag --sort=-v:refname -n --list "${1}*" }; noglob gtl'
alias gts 'git tag --sign'
alias gtv 'git tag | sort -V'
alias vim nvim
alias vims "nvim -S $NVIMSESSIONFILE"
alias vrc "vim $VIMRC"
alias frc "vim $FISHRC"
alias trc "vim $TMUXRC"
alias iesums1 "ssh $IESUMS1"
alias iesums9 "ssh $IESUMS9"
alias iesums10 "ssh $IESUMS10"
alias iesums11 "ssh $IESUMS11"
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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f $HOME/anaconda3/bin/conda
    eval $HOME/anaconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

set -gx PATH $HOME/anaconda3/bin/ $PATH
set -gx PATH $HOME/anaconda3/condabin $PATH
