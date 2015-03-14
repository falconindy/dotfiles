#
# .profile
#
# Suitable for any bourne compatible shell
#

export EDITOR=${VISUAL:=vim}
export PAGER=less
export XDG_CONFIG_HOME=$HOME/.config

extra_PATH=$HOME/.local/bin

# golang
export GOPATH=$HOME/.local/lib/go
extra_PATH=$extra_PATH:$GOPATH/bin

CDPATH=.:/mnt/Gluttony:/mnt/Haven
PATH=$extra_PATH:$PATH
unset extra_PATH

# initialize bash if we're running bash
if [ -n "$BASH" ]; then
  [ -r "$HOME/.bashrc" ] && . ~/.bashrc
fi


# allow host-specific overrides to override anything
[ -r "$HOME/.profile.$HOSTNAME" ] && . ~/.profile."$HOSTNAME"

: ignore errors
