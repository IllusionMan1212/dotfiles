# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# cargo stuff. auto added by rustup
#. "$HOME/.cargo/env"

export VITASDK=/usr/local/vitasdk
export PATH=$VITASDK/bin:$PATH
export PATH=$HOME/android-studio/bin:$PATH
export PATH=$HOME/Downloads/blender:$PATH
export DENO_INSTALL="/home/illusion/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# golang stuff
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:~/go/bin
export PATH=$PATH:/usr/local/go/bin

# react native exports
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
# needed for some(?) java programs when using DWM
export _JAVA_AWT_WM_NONREPARENTING=1

# bin dir for repo
export PATH=$PATH:~/bin

# adding LIBDIR (/usr/local/lib) to PATH so we can link against it (this is for libxft2.3.3 which is used for colored emojis in dwm)
export LD_LIBRARY_PATH=/usr/local/lib

# export ~/.local/bin
export PATH=$PATH:~/.local/bin

# add flutter and dart bins to PATH
export PATH=$PATH:~/flutter/bin
export PATH=$PATH:~/.pub-cache/bin

# add dotnet to PATH
export PATH=$PATH:~/.dotnet/tools

# add language servers to PATH
export PATH=$PATH:~/Desktop/repos/kotlin-language-server/bin # kotlin
export PATH=$PATH:~/Desktop/repos/lua-language-server/bin # lua
export PATH=$PATH:~/Desktop/repos/ols # Odin

# add gradle to PATH
export PATH=$PATH:/opt/gradle/gradle-8.1.1/bin

# some weird needed export for RPCSX
export VK_INSTANCE_LAYERS=VK_LAYER_KHRONOS_shader_object

# Odin root
export ODIN_ROOT=~/Desktop/repos/Odin

# aliases
alias repos='cd ~/Desktop/repos'
alias work='cd ~/Desktop/repos/work'
alias vpn-connect='openvpn3 session-start --config'
alias vpn-disconnect='openvpn3 session-manage --disconnect --config'
alias freeze='bash ~/scripts/freeze.sh' # puts the computer to sleep
alias satania='/home/illusion/Desktop/repos/SataniaBuddy/satania'
alias yt-dlp-all='yt-dlp --write-subs --sub-langs "en,ja,live_chat" --sub-format "vtt/json/best" --add-metadata --write-description --write-thumbnail --embed-thumbnail --write-comments --write-info-json --embed-chapters --merge-output-format mkv -o "[%(upload_date)s] [%(id)s] %(title).180B.%(ext)s" -f bestvideo+bestaudio'
alias yt-dlp-no-subs='yt-dlp --add-metadata --write-description --write-thumbnail --embed-thumbnail --write-info-json --embed-chapters --merge-output-format mkv -o "[%(upload_date)s] [%(id)s] %(title).180B.%(ext)s" -f bestvideo+bestaudio'
alias gpu-run='__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia'
alias watch-cpu='watch -n 1 "(cat /proc/cpuinfo | grep MHz)"'
alias udev-watch='udevadm monitor --property --udev'
alias hdd-off='udisksctl unmount --block-device /dev/sda2 && sleep 1 && udisksctl power-off --block-device /dev/sda'

yt-dlp-get-flat-channel-ids() {
    yt-dlp --print '{"id":%(id)j,"thumbnail":%(thumbnail)j,"title":%(title)j,"upload_date":%(upload_date)j,"webpage_url":%(webpage_url)j,"playlist_title":%(playlist_title)j}' $1 > all-videos-ids-with-date-minimal.json
}

yt-dlp-get-channel-ids-with-category() {
    yt-dlp --print '{"id":%(id)j,"thumbnail":%(thumbnail)j,"title":%(title)j,"upload_date":%(upload_date)j,"webpage_url":%(webpage_url)j,"playlist_title":%(playlist_title)j}' --cookies ~/cookies.txt $1 > all-videos-ids-with-date-minimal.json
}


# export xauthority env var (needed for root user to connect to the display)
export XAUTHORITY=~/.Xauthority

# fcitx env vars
export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx



alias luamake=/home/illusion/Desktop/repos/lua-language-server/3rd/luamake/luamake

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH
