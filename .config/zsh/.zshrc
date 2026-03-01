HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=10000000
SAVEHIST=10000000

zmodload zsh/datetime
_vpn_cache=""
_vpn_last_check=0

_vpn_update() {
  local now=$EPOCHSECONDS
  if (( now - _vpn_last_check > 30 )); then
    _vpn_last_check=$now
    if mullvad status 2>/dev/null | grep -q '^Connected'; then
      _vpn_cache='%F{green}[VPN]%f'
    else
      _vpn_cache='%F{red}[NO VPN]%f'
    fi
  fi
}

precmd_functions+=(_vpn_update)

setopt PROMPT_SUBST
export PS1='$_vpn_cache %~ $ '

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"

zstyle ':completion:*' menu select
