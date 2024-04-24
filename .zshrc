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
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

# znap source marlonrichert/zsh-autocomplete
znap source romkatv/powerlevel10k
znap source Aloxaf/fzf-tab

setopt appendhistory # Immediately append history instead of overwriting
setopt histignorealldups # If a new command is a duplicate, remove the older one
HISTFILE=~/.zhistory
HISTSIZE=20000
SAVEHIST=20000

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

source <(kubectl completion zsh)

source <(flux completion zsh)

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

alias yd="yarn dev"
alias qd="quarkus dev"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.profile ] && source ~/.profile

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export VISUAL=nvim
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line

eval "$(_PIPENV_COMPLETE=zsh_source pipenv)"

# # Fig post block. Keep at the bottom of this file.
# [[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
#
# # Fig post block. Keep at the bottom of this file.
# [[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && . "$HOME/.fig/shell/zshrc.post.zsh"
