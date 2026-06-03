# Fig pre block. Keep at the top of this file.
# [[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && . "$HOME/.fig/shell/zshrc.pre.zsh"
# # Fig pre block. Keep at the top of this file.
# [[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[[ -r ~/.local/share/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.local/share/zsh-snap/
source ~/.local/share/zsh-snap/znap.zsh

# zstyle ':autocomplete:*' fzf-completion yes
# zstyle ':autocomplete:*' insert-unambiguous yes

bindkey '^P' up-line-or-search
bindkey '^N' down-line-or-select
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directorys content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
zstyle ':fzf-tab:*' switch-group ',' '.'

# znap source marlonrichert/zsh-autocomplete
znap source romkatv/powerlevel10k
znap source Aloxaf/fzf-tab

HISTFILE=~/.cache/zsh/history
HISTSIZE=100000
SAVEHIST=100000
setopt EXTENDED_HISTORY        # Save history with timestamps.
setopt INC_APPEND_HISTORY_TIME # Immediately append commands and track duration.
setopt HIST_IGNORE_ALL_DUPS    # Never add duplicate entries.
setopt HIST_EXPIRE_DUPS_FIRST	 # Prioritizes the expiration of duplicate entries when trimming history.
setopt HIST_IGNORE_SPACE       # Ignore commands that start with a space.
setopt HIST_REDUCE_BLANKS      # Remove unnecessary blank lines.
setopt SHARE_HISTORY           # Shares history across all active Zsh sessions, allowing access to commands from different terminals.

KEYTIMEOUT=1


# # Use powerline
# USE_POWERLINE="true"
# # Source manjaro-zsh-configuration
# if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
#   source /usr/share/zsh/manjaro-zsh-config
# fi
# # Use manjaro zsh prompt
# if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
#   source /usr/share/zsh/manjaro-zsh-prompt
# fi

# source <(kubectl completion zsh)

export PATH=$HOME/go/bin:$PATH

git_current_branch () {
	cat "$(git rev-parse --git-dir 2>/dev/null)/HEAD" | sed -e 's/^.*refs\/heads\///'
}

alias gpsup='git push --set-upstream origin $(git_current_branch)'
alias kjlogs='kubectl get pods --all-namespaces | fzf | tr -s " " | cut -d" " -f1,2 | xargs kubectl logs -f -n | tee >(grep -v "^{") | grep "^{" | jq .'
alias klogs='kubectl get pods --all-namespaces | fzf | tr -s " " | cut -d" " -f1,2 | xargs kubectl logs -f -n'

alias kns='kubectl get ns | fzf | cut -d" " -f1 | xargs kubectl config set-context --current --namespace'
alias kcluster='kubectl config get-contexts | fzf | tr -s " " | cut -d" " -f2 | xargs kubectl config use-context'

alias gco="git branch --remotes --format '%(refname:lstrip=3)' | fzf | xargs git checkout"
alias gcl="git branch | fzf | xargs git checkout"
alias gr="git branch --remotes --format '%(refname:lstrip=2)' | fzf | xargs git rebase"

alias yd="yarn dev"
alias qd="quarkus dev"
# alias hx="helix"

alias ls="exa"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
[ -f ~/.profile ] && source ~/.profile

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

set -o vi
autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
FCEDIT=$EDITOR

# eval "$(_PIPENV_COMPLETE=zsh_source pipenv)"

# # Fig post block. Keep at the bottom of this file.
# [[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
#
# # Fig post block. Keep at the bottom of this file.
# [[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && . "$HOME/.fig/shell/zshrc.post.zsh"

# cd $(fd --type d | fzf --height 40% --reverse)

if [[ -n $ZSH_VERSION ]]; then
    autoload -U +X bashcompinit && bashcompinit
fi

_run_script_completion() {
    local cur prev words cword
    _get_comp_words_by_ref -n : cur prev words cword

    case $cword in
        1)
            COMPREPLY=($(compgen -W "dev demo prod -h --help" -- "$cur"))
            ;;
        2)
            COMPREPLY=($(compgen -W "seed scripts databasescripts migrate" -- "$cur"))
            ;;
        3)
            case ${words[2]} in
                seed|scripts|databasescripts)
                    COMPREPLY=($(compgen -f -X '!*.ts' -- "$cur"))
                    ;;
                migrate)
                    COMPREPLY=($(compgen -W "up down create" -- "$cur"))
                    ;;
            esac
            ;;
    esac
}

complete -F _run_script_completion run-script.sh

# # Source manjaro-zsh-configuration
# if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
#   source /usr/share/zsh/manjaro-zsh-config
# fi
# # Use manjaro zsh prompt
# if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
#   source /usr/share/zsh/manjaro-zsh-prompt
# fi

# bun completions
[ -s "/home/lejon/.bun/_bun" ] && source "/home/lejon/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# opencode
export PATH=/home/lejon/.opencode/bin:$PATH
eval "$(/home/lejon/.local/bin/mise activate zsh)"
