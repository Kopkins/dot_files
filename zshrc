#The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**'
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' substitute 1
zstyle :compinstall filename '/home/kopkins/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# End of lines configured by zsh-newuser-install

# Keep track of directories visited
DIRSTACKFILE="$HOME/.cache/zsh/dirs"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1]
fi
chpwd() {
  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

DIRSTACKSIZE=20

setopt autopushd pushdsilent pushdtohome

## Remove duplicate entries
setopt pushdignoredups

## This reverts the +/- operators.
setopt pushdminus

# syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
autoload -U colors && colors

# keys and binds
typeset -g -A key
bindkey -v

source ~/.zkbd/$TERM-:0
autoload zkbd

[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
[[ -n ${key[Insert]} ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n ${key[PageUp]} ]] && bindkey "${key[PageUp]}" history-beginning-search-backward
[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
[[ -n ${key[PageDown]} ]] && bindkey "${key[PageDown]}" history-beginning-search-forward
[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" up-line-or-search
[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" down-line-or-search
[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char

# ENV Vars
export EDITOR="vim"

# Restore terminal state after programs exit
ttyctl -f

# Aliases
# pastebin
pb () { curl -F "c=@${1:--}" https://ptpb.pw }

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias handbrake='ghb'
alias irc='irssi'

# remote access
alias mussh='ssh -C -X klhopkin@brooks.millersville.edu'
muget () { scp -r klhopkin@brooks.millersville.edu:$1 . }
mupush () { scp -r $1 klhopkin@brooks.millersville.edu:$2 }
alias myssh='ssh -p 1222 user@10.0.0.18'

# navigation
cdmu () { dest="/Documents/Millersville/2015-16/$1"; cd ~$dest }
alias buildcp='mkdir -p ~/abs/$(pwd | cut -c10-); cp * ~/abs/$(pwd | cut -c10-)'
alias cdabs='cd /var/abs'

# miscellaneous
alias ytaudio='youtube-dl -x --audio-format wav --audio-quality 0'
alias lconfigure='./autogen.sh && ./configure --with-valhalla-baldr=../baldr --with-valhalla-loki=../loki --with-valhalla-midgard=../midgard --with-valhalla-mjolnir=../mjolnir --with-valhalla-odin=../odin --with-valhalla-thor=../thor --with-valhalla-sif=../sif --with-valhalla-skadi=../skadi'

# system info
vup () { amixer set Master $1%+ }
vdown () { amixer set Master $1%- }
vset () {amixer set Master $1% }
alias vmute='amixer set Master toggle'
alias bat='cat /sys/class/power_supply/BAT0/capacity'

# clock
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &

PROMPT="%{$fg[white]%}┌─┤%{$fg_bold[green]%}%n %{$fg_no_bold[cyan]%}%~
%{$fg[white]%}└─── > %{$reset_color%}"

