[[ $- != *i* ]] && return

HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/bash/history"
HISTSIZE=10000000
HISTFILESIZE=10000000
HISTCONTROL=ignoreboth:erasedups
shopt -s histappend

mkdir -p "$(dirname "$HISTFILE")"

_vpn_cache=""
_vpn_last_check=0

_vpn_update() {
  local now
  now=$(date +%s)
  if (( now - _vpn_last_check > 30 )); then
    _vpn_last_check=$now
    if mullvad status 2>/dev/null | grep -q '^Connected'; then
      _vpn_cache=$'\001\033[32m\002[VPN]\001\033[0m\002'
    else
      _vpn_cache=$'\001\033[31m\002[NO VPN]\001\033[0m\002'
    fi
  fi
}

PROMPT_COMMAND=_vpn_update
PS1='${_vpn_cache} \w $ '

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"

bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
