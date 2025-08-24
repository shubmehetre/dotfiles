# Sample .profile for SUSE Linux
# rewritten by Christian Steinruecken <cstein@suse.de>
#
# This file is read each time a login shell is started.
# All other interactive shells will only read .bashrc; this is particularly
# important for language settings, see below.

# test -z "$PROFILEREAD" && . /etc/profile || true

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
#export EDITOR=/usr/bin/vim
#export EDITOR=/usr/bin/mcedit

# For some news readers it makes sense to specify the NEWSSERVER variable here
#export NEWSSERVER=your.news.server

# Some people don't like fortune. If you uncomment the following lines,
# you will have a fortune each time you log in ;-)

#if [ -x /usr/bin/fortune ] ; then
#    echo
#    /usr/bin/fortune
#    echo
#fi
# profile file. Runs on login. Environmental variables are set here.

# If you don't plan on reverting to bash, you can remove the link in ~/.profile
# to clean up.

# Add all directories inside ~/.local/bin to PATH if not already present
if [ -d "$HOME/.local/bin" ]; then
  for d in "$HOME/.local/bin"/*; do
    [ -d "$d" ] || continue
    case ":$PATH:" in
      *":$d:"*) ;;                # already present
      *) PATH="$PATH:$d";;        # add to end
    esac
  done
fi
export PATH

# Adds `~/.local/bin` to $PATH and also .local/bin/'s subfolders
# THIS IS ZSH ONLY CODE
# export PATH="$PATH:${$(find ~/.local/bin -type d -printf %p:)%:*}"
# export PATH="$PATH:${$(find ~/.local/bin -type d -printf %p:)%:*}:${$(find ~/zzz/software -type d -printf %p:)%:*}"

# unsetopt PROMPT_SP

# Default programs:
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="librewolf"
export GPG_TTY=$(tty)

# ~/ Clean-up:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_SRC_HOME="$HOME/.local/src"
export XDG_CACHE_HOME="$HOME/.cache"
export XINITRC="${XDG_CONFIG_HOME:-$HOME/.config}/x11/xinitrc"
#export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority" # This line will break some DMs.
export NOTMUCH_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/notmuch-config"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
export LESSHISTFILE="-"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/shell/inputrc"
#export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export NVIM_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"
#export ALSA_CONFIG_PATH="$XDG_CONFIG_HOME/alsa/asoundrc"
#export GNUPGHOME="${XDG_DATA_HOME:-$HOME/.local/share}/gnupg"
export WINEPREFIX="${XDG_DATA_HOME:-$HOME/.local/share}/wineprefixes/default"
export KODI_DATA="${XDG_DATA_HOME:-$HOME/.local/share}/kodi"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export ANDROID_SDK_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/android"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export ANSIBLE_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/ansible/ansible.cfg"
export UNISON="${XDG_DATA_HOME:-$HOME/.local/share}/unison"
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"
export WEECHAT_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/weechat"
export MBSYNCRC="${XDG_CONFIG_HOME:-$HOME/.config}/mbsync/config"
export ELECTRUMDIR="${XDG_DATA_HOME:-$HOME/.local/share}/electrum"

# Other program settings:
export DICS="/usr/share/stardict/dic/"
export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '␛[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '␛[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '␛[0m')"
export LESS_TERMCAP_so="$(printf '%b' '␛[01;44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '␛[0m')"
export LESS_TERMCAP_us="$(printf '%b' '␛[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '␛[0m')"
export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"
export QT_QPA_PLATFORMTHEME="qt5ct"	# Have QT use gtk2 theme.
export MOZ_USE_XINPUT2="1"		# Mozilla smooth scrolling/touchpads.
export AWT_TOOLKIT="MToolkit wmname LG3D"	#May have to install wmname
export _JAVA_AWT_WM_NONREPARENTING=1	# Fix for Java applications in dwm
export W3MIMGDISPLAY_PATH=/usr/lib/w3m/w3mimgdisplay
export SPOTIPY_CLIENT_ID='f4e19a04fe3b4735ab1c0ff85dfbb4ac'
export SPOTIPY_CLIENT_SECRET='416dd07926e2435fbf5ee500bcc92181'
export CLIKAN_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/clikan"

# This is the list for lf icons:
export LF_ICONS="di=📁:\
fi=📃:\
tw=🤝:\
ow=📂:\
ln=⛓:\
or=❌:\
ex=🎯:\
*.txt=✍:\
*.mom=✍:\
*.me=✍:\
*.ms=✍:\
*.png=🖼:\
*.webp=🖼:\
*.ico=🖼:\
*.jpg=📸:\
*.jpe=📸:\
*.jpeg=📸:\
*.gif=🖼:\
*.svg=🗺:\
*.tif=🖼:\
*.tiff=🖼:\
*.xcf=🖌:\
*.html=🌎:\
*.xml=📰:\
*.gpg=🔒:\
*.css=🎨:\
*.pdf=📚:\
*.djvu=📚:\
*.epub=📚:\
*.csv=📓:\
*.xlsx=📓:\
*.tex=📜:\
*.md=📘:\
*.r=📊:\
*.R=📊:\
*.rmd=📊:\
*.Rmd=📊:\
*.m=📊:\
*.mp3=🎵:\
*.opus=🎵:\
*.ogg=🎵:\
*.m4a=🎵:\
*.flac=🎼:\
*.wav=🎼:\
*.mkv=🎥:\
*.mp4=🎥:\
*.webm=🎥:\
*.mpeg=🎥:\
*.avi=🎥:\
*.mov=🎥:\
*.mpg=🎥:\
*.wmv=🎥:\
*.m4b=🎥:\
*.flv=🎥:\
*.zip=📦:\
*.rar=📦:\
*.7z=📦:\
*.tar.gz=📦:\
*.z64=🎮:\
*.v64=🎮:\
*.n64=🎮:\
*.gba=🎮:\
*.nes=🎮:\
*.gdi=🎮:\
*.1=ℹ:\
*.nfo=ℹ:\
*.info=ℹ:\
*.log=📙:\
*.iso=📀:\
*.img=📀:\
*.bib=🎓:\
*.ged=👪:\
*.part=💔:\
*.torrent=🔽:\
*.jar=♨:\
*.java=♨:\
*.lua=:\
*.json=:\
"

# [ ! -f ${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc ] && shortcuts >/dev/null 2>&1 &
if [ ! -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc" ]; then
    shortcuts >/dev/null 2>&1 &
fi


# Start graphical server on user's current tty if not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && exec startx "$XINITRC" 2>/dev/null

# Switch escape and caps if tty and no passwd required:
sudo -n loadkeys ${XDG_DATA_HOME:-$HOME/.local/share}/larbs/ttymaps.kmap 2>/dev/null

# sometimes audio is mute at startup
# amixer -q sset Master unmute

