if [ "$(uname)" = "Darwin" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/secrets" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/secrets"

export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="librewolf"

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_RUNTIME_DIR="/run/user/$UID"

export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME"/aws/credentials
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME"/aws/config

export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export FLY_CONFIG_DIR="$XDG_STATE_HOME"/fly

export IPYTHONDIR="$XDG_CONFIG_HOME"/ipython
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export KERAS_HOME="$XDG_STATE_HOME"/keras

export LESSHISTFILE="$XDG_STATE_HOME"/less/history
export PSQL_HISTORY="$XDG_DATA_HOME"/psql_history
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history